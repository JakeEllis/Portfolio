<?php

// systemuser.php
//
// A class to wrap around the SYSTEMUSER database objects
//
// Passwords use MD5. See the book for an explanation.

class SystemUser
{
    private $id;
    private $userid;
    private $password;
    private $permissionlevel;

    function __construct($id, $userid, $ispasswordencoded, $password, $permissionlevel)
    {
        $this->setId($id);
        $this->setUserId($userid);

        if ($ispasswordencoded)
            $this->setPasswordEncoded($password);
        else
            $this->setPasswordUnencoded($password);

        $this->setPermissionLevel($permissionlevel);
    }

    function getId()
    {
        return $this->id;
    }

    function setId($value)
    {
        $this->id = $value;
    }

    function getUserId()
    {
        return $this->userid;
    }

    function setUserId($value)
    {
        $this->userid = $value;
    }

    function getPassword()
    {
        return $this->password;
    }

    function setPasswordUnencoded($value)
    {
        $this->password = md5('@123!' . $value . '^5AS');
    }
	
    function setPasswordEncoded($value)
    {
        $this->password = $value;
    }

    function checkPassword($password)
    {
        return $this->getPassword() == md5('@123!' . $password . '^5AS');
    }

    function getPermissionLevel()
    {
        return $this->permissionlevel;
    }

    function setPermissionLevel($value)
    {
        $this->permissionlevel = $value;
    }
}

?>
