import 'reflect-metadata';
import { DataSource } from 'typeorm';
import { User } from '../users/user.entity.js';

const databaseUrl = process.env.DATABASE_URL;

if (!databaseUrl) {
  throw new Error('DATABASE_URL is required to run TypeORM migrations.');
}

export default new DataSource({
  type: 'postgres',
  url: databaseUrl,
  ssl: process.env.DB_SSL === 'true' ? { rejectUnauthorized: false } : false,
  entities: [User],
  migrations: ['dist/database/migrations/*.js'],
  synchronize: false,
});

