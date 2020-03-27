const request = require('supertest');
const app = require('../../src/app');
const conn = require('../../src/database/connect');
describe('ONG', () => {
  beforeEach(async () => {
    await conn.migrate.rollback();
    await conn.migrate.latest();
  });
  it('Should be able to create a new ONG', async () => {
    const res = await request(app)
      .post('/ongs')
      .send({
        name: "Test",
        email: "contato@test.com.br",
        whatsapp: "5514997796633",
        city: "Brumadinho",
        uf: "ms"
      });
    expect(res.body).toHaveProperty('id');
    expect(res.body.id).toHaveLength(8);
  });
  afterAll(async () => {
    await conn.destroy();
  })
})