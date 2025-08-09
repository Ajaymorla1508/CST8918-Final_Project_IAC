import { createClient } from 'redis';

const url = process.env.REDIS_URL || "redis://redis.default.svc.cluster.local:6379";

export const redis = await createClient({ url })
  .on('error', (err: unknown) => console.error('Redis client connection error', err))
  .connect();
