import React, { Component } from "react";
import { parseJwt } from '../../services/auth';
import { Link } from 'react-router-dom';


import Axios from "axios";

class Login extends Component {
  constructor() {
    super();
    this.state = {
      email: '',
      senha: '',
      erroMensagem: ''
    }

  }

  atualizaEstadoEmail(event) {
    this.setState({ email: event.target.value });
  }

  atualizaEstadoSenha(event) {
    this.setState({ senha: event.target.value });
  }

  efetuaLogin(event) {
    event.preventDefault();

    // alert(this.state.email + " - " + this.state.senha);

    Axios.post("http://localhost:5000/api/login", {
      email: this.state.email,
      senha: this.state.senha
    })
      .then(data => {
        if (data.status === 200) {
          console.log(data);
          localStorage.setItem("usuario-sp_medical_group", data.data.token);
          //Verifica o tipo de usuário e redireciona para a página default
          console.log(parseJwt().Role);
          if (parseJwt().Role == "ADMINISTRADOR") {
            this.props.history.push("/eventos/cadastrar");
          } else {
            this.props.history.push("/eventos");
          }

        }
      })
      .catch(erro => {
        this.setState({ erroMensagem: 'Email ou senha inválido' });
      })
  }


  render() {
    return (
      <div className="App">
        <form class="box" action="login.html" method="POST">
          <h1>Sp Medical Group</h1>
          <h3>Entrar no Sistema</h3>
          <input type="text" placeholder="Diigite seu e-mail">
            <input
              className="input__login"
              placeholder="Diigite seu e-mail"
              type="text"
              value={this.state.email}
              onChange={this.atualizaEstadoEmail.bind(this)}
              name="username"
              id="login__email"
            />
          </input>
          <input type="password" name="" placeholder="Digite sua senha">
            <input
              className="input__login"
              placeholder="password"
              value={this.state.senha}
              onChange={this.atualizaEstadoSenha.bind(this)}
              type="password"
              name="password"
              id="login__password"
            />
          </input>
          <input type="submit" name="" value="Acessar"></input>
        </form>

      </div>
    );
  }
}
export default App;
