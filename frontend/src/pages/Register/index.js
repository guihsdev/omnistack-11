import React, { useState } from 'react';
import { Link, useHistory } from 'react-router-dom';
import { FiArrowLeft } from 'react-icons/fi';

import api from '../../services/api'
import logoSvg from '../../assets/logo.svg';
import './style.css';

const Register = () => {

  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [whatsapp, setWhatsapp] = useState('');
  const [city, setCity] = useState('');
  const [uf, setUf] = useState('');

  const history = useHistory();

  const handleRegister = async (e) => {
    e.preventDefault();
    const data = {
      name,
      email,
     whatsapp:"55"+whatsapp,
      city,
      uf
    };

    try {
      const res = await api.post('ongs', data);
      alert(`ID de acesso: ${res.data.id}`);
      history.push('/');
    } catch (error) {
      alert(`Erro no cadastro ${error}`);
    }
  }

  return (
    <div className="register-container">
      <div className="content">
        <section>
          <img src={logoSvg} alt="Be The Hero"></img>
          <h1>Cadastro</h1>
          <p>Faça seu cadastro, entre na plataforma e ajude pessoas a encontrar os casos da sua ONG.</p>

          <Link to="/" className="back-link">
            <FiArrowLeft size={16} color="#E02041" />
            Voltar para logon
          </Link>

        </section>
        <form onSubmit={handleRegister}>
          <input placeholder="Nome da ONG" value={name} onChange={e => setName(e.target.value)} />
          <input type="email" placeholder="E-mail" value={email} onChange={e => setEmail(e.target.value)} />
          <input placeholder="WhatsApp" value={whatsapp} onChange={e => setWhatsapp(e.target.value)} />
          <div className="input-group">
            <input placeholder="Cidade" value={city} onChange={e => setCity(e.target.value)} />
            <input placeholder="UF" maxLength="2" value={uf} onChange={e => setUf(e.target.value.toUpperCase())} style={{ width: 80 }} />
          </div>
          <button className="button" type="submit">Cadastrar</button>
        </form>
      </div>
    </div>
  );
}

export default Register;