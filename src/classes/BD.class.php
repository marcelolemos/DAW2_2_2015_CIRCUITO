<?php

  class conexao{

    public function __construct() {
        $rConecta = @mysql_connect("localhost", "root", "") or print (mysql_error());
        mysql_select_db("circuito", $rConecta) or print(mysql_error());
        /*print "Conexão e Seleção OK!"; 
        mysql_close($rConecta);*/
    }
}