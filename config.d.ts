import type { RunningScriptOptions } from 'node:vm';
import type { PoolConfig } from 'pg';

declare namespace config {
  export interface ServerSettings {
    host?: string;
    port: number;
  }
}

/** Database settings */
export const DB: PoolConfig;
/** Configuration of the network servers by supported types */
export const SERVERS: {
  static: config.ServerSettings;
  http: config.ServerSettings;
  ws: config.ServerSettings;
  [apiTransportKey: string]: config.ServerSettings;
};
