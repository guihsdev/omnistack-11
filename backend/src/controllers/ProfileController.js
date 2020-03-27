const conn = require('../database/connect');
module.exports = {
  async index(req, res) {
    const ong_id = req.headers.authorization;
    if (ong_id == null || ong_id == undefined) {
      return res.status(401).json({ error: "Acesso negado!" });
    }

    const incidents = await conn('incidents')
      .where('ong_id', ong_id)
      .select('*')
    return res.json(incidents);
  }
}