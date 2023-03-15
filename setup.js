'use strict';

const fsp = require('node:fs').promises;
const path = require('node:path');
const vm = require('node:vm');
const pg = require('pg');
const metasql = require('metasql');

/**
 * Default PostgreSQL main user with permissions to DROP/CREATE database & user
 * Host and port are commented because in real environment they might be modified
 * what will be represented in application config.
 */
const GENERIC_CONNECTION = {
  // host: '127.0.0.1',
  // port: 5432,
  database: 'postgres',
  user: 'postgres',
  password: 'postgres',
};

const DB_DIR = path.join(process.cwd(), './db');
const SCHEMAS_DIR = path.join(process.cwd(), './schemas');
const CONFIG_PATH = path.join(process.cwd(), './config/database.js');

const read = (name) => fsp.readFile(path.join(DB_DIR, name), 'utf8');

const execute = async (client, sql) => {
  try {
    await client.query(sql);
  } catch (err) {
    console.error(err);
  }
};

const notEmpty = (s) => s.trim() !== '';

const executeFile = async (client, name) => {
  console.log(`Execute file: ${name}`);
  const sql = await read(name);
  const commands = sql.split(';\n').filter(notEmpty);
  for (const command of commands) {
    await execute(client, command);
  }
};

(async () => {
  await metasql.create(SCHEMAS_DIR, DB_DIR);
  // Rename generated files
  const databaseFile = path.join(DB_DIR, 'database.sql');
  const structureFile = path.join(DB_DIR, 'structure.sql');
  await fsp.rename(databaseFile, structureFile);
  console.log('Generate typings domain.d.ts');
  const typesFile = path.join(DB_DIR, 'database.d.ts');
  const domainTypes = path.join(DB_DIR, 'domain.d.ts');
  await fsp.rename(typesFile, domainTypes);

  const configSrc = await fsp.readFile(CONFIG_PATH, 'utf8');
  const config = await vm.runInThisContext(configSrc);

  const inst = new pg.Client({ ...config, ...GENERIC_CONNECTION });
  await inst.connect();
  console.log('(Re)Create database & user');
  await executeFile(inst, 'install.sql');
  await inst.end();

  const db = new pg.Client(config);
  await db.connect();
  console.log('Setup database structure');
  await executeFile(db, 'structure.sql');
  console.log('Database seeding');
  await executeFile(db, 'data.sql');
  await db.end();

  console.log('Environment is ready');
})().catch((err) => {
  console.error(err);
});
