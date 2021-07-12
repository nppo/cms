module.exports = ({ env }) => ({
  defaultConnection: env('DATABASE_CONNECTION', 'mysql'),
  connections: {
    mysql: {
      connector: 'bookshelf',
      settings: {
        client: 'mysql2',
        host: env('DATABASE_HOST', 'localhost'),
        port: env.int('DATABASE_PORT', 3306),
        database: env('DATABASE_NAME', 'strapi'),
        username: env('DATABASE_USERNAME', 'strapi'),
        password: env('DATABASE_PASSWORD', 'strapi'),
      },
      options: {
      },
    },
  },
});
