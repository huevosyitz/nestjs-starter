const REQUIRED_ENV_VARS = ['DATABASE_URL'] as const;

export function validateRequiredEnvironment(): void {
  const missing = REQUIRED_ENV_VARS.filter((envVar) => !process.env[envVar]);
  if (missing.length > 0) {
    throw new Error(
      `Missing required environment variable(s): ${missing.join(', ')}.`,
    );
  }
}

