<?php

class Usuario{

  private $id;
  private $login;
  private $senha;
  private $nome;
  private $alterar;
  private $excluir;
  private $direcao;
  private $telefone;
  private $rg;
  private $datacad;
  
  //VARIÁVEIS INTERNAS
  private $rConexao;      //FAZ A CONEXÃO COM O DB
  
  public function __construct() {
      $this->rConexao = new conexao();
  }
  
  public function __get($rKey) {
      return $this->$rKey;
  }
  
  public function __set($rKey, $rValor) {
      $this->$rKey= $rValor;
  }
  
  public function insert(){
      $rSql="INSERT INTO usuario(login)
			VALUES('{$this->login}')";
      
      $rRetorno = mysql_query($rSql) or die(mysql_error());

      return $rRetorno;
  }
}
?>