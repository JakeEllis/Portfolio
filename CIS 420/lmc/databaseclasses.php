<?php
// databaseclasses.php
//
// This is a class to access the database

class MySQLServer
{
   private $server;
   private $hostname;
   private $username;
   private $password;
   private $database;

   function __construct($hostname, $username, $password, $database)
    {
        $this->server = FALSE;
        $this->hostname = $hostname;
        $this->username = $username;
        $this->password = $password;
        $this->database = $database;
    }

    function isConnected()
    {
        return $this->server != FALSE;
    }

    function connect()
    {
        if (!$this->isConnected()) {
            $this->server = mysql_connect($this->hostname, $this->username, $this->password);
            if (!mysql_select_db($this->database))
                    $this->disconnect();
        }

        return $this->isConnected();
    }

    function disconnect()
    {
        if ($this->isConnected()) {
            mysql_close($this->server);
            $this->server = FALSE;
        }
    }
	
    function findSystemUser($userid)
    {
        if (!$this->isConnected())
            return FALSE;

        $result = mysql_query("SELECT * FROM SYSTEMUSER WHERE SYSTEMUSER_USERID = '$userid'");

        if (!$result || mysql_num_rows($result) != 1)
            return FALSE;

        $row = mysql_fetch_row($result);

        $systemuser = new SystemUser($row[0], $row[1], TRUE, $row[2], $row[3]);

        return $systemuser;
    }
}
        
?>
