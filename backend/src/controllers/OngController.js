const express = require('express');
const generateUniqueId = require('../utils/generateUniqueId');
const conn = require('../database/connect');
module.exports = {

  async index(req, res) {
    const ongs = await conn('ongs').select('*');
    return res.json(ongs);
  },

  async create(req, res) {
    const { name, email, whatsapp, city } = req.body;
    const uf = req.body.uf.toUpperCase()

    const id = generateUniqueId();
    await conn('ongs').insert({ id, name, email, whatsapp, city, uf });

    return res.json({ id });
  }
}