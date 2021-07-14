module.exports = ({ env }) => ({
  email: {
    provider: env('MAIL_DRIVER', 'sendmail'),
    providerOptions: {
      apiKey: env('MAILGUN_API_KEY'),
      domain: env('MAILGUN_DOMAIN'),
      host: env('MAILGUN_HOST', 'api.eu.mailgun.net'),
    },
    settings: {
      defaultFrom: env('MAIL_FROM_ADDRESS'),
    },
  },
  sentry: {
    dsn: env('SENTRY_DSN'),
    sendMetadata: true,
  },
});
