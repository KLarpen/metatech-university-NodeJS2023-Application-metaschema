//@ts-check
'use strict';

/**
 * Database settings
 * @type {typeof import('config').DB}
 */
const DB = {
  host: '127.0.0.1',
  port: 5432,
  database: 'messenger',
  user: 'marcus',
  password: 'marcus',
};
/**
 * Configuration of the network servers by supported types
 * @type {typeof import('config').SERVERS}
 */
const SERVERS = {
  static: { host: '127.0.0.1', port: 8000 },
  http: { port: 8001 },
  ws: { port: 8001 },
};

module.exports = { DB, SERVERS };
