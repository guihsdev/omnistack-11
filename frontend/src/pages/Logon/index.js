import React, { useState } from 'react';
import api from '../../services/api';
import { FiLogIn } from 'react-icons/fi'
import './styles.css';
import heroesImg from '../../assets/heroes.png';
import logoSvg from '../../assets/logo.svg';
import { Link, useHistory } from 'react-router-dom';
const Logon = () => {

  const [id, setId] = useState('');
  const history = useHistory();
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const res = await api.post('sessions', { id });
      localStorage.setItem('ongId', id);
      localStorage.setItem('ongName', res.data.name);
      history.push('/profile');
    } catch (error) {
      alert(`Falha no login ${error}, tente novamente`)
    }
  }

  return (
    <div className="logon-container">
      <section className="form">
        <img src={logoSvg} alt="Be The Hero"></img>
        <form onSubmit={handleSubmit}>
          <h1>Faça seu logon</h1>
          <input placeholder="Sua ID"
            value={id}
            onChange={e => setId(e.target.value.toUpperCase())}
          />
          <button className="button" type="submit">Entrar</button>

          <Link to="/register" className="back-link">
            <FiLogIn size={16} color="#E02041" />
            Não tenho cadastro
          </Link>
        </form>
      </section>

      <img src={heroesImg} alt="Heroes"></img>
    </div>
  );
}

export default Logon;