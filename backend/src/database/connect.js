const knex = require('knex');
const cfg = require('../../knexfile');

const build_mode = process.env.NODE_ENV === 'test' ? cfg.test : cfg.development;

const conn = knex(build_mode);

module.exports = conn;