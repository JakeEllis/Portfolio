<?php 
// webportal.php
//
// This is the web portal's home page and is as a landing site after login
// and for navigation.

// Do the security stuff
session_start();

session_regenerate_id();
if(!isset($_SESSION['id'])) 
{
    header("Location: login.php");
}

// Get the id, userid, and permission level from the session variables
$id = $_SESSION['id'];
$userid = $_SESSION['userid'];
$permissionlevel = $_SESSION['permissionlevel'];

require_once 'lmcclasses.php';
require_once 'databaselogin.php';
require_once 'databaseclasses.php';
require_once 'misc.php';
require_once 'htmlhead.php';
require_once 'htmlbody.php';

// Setup the <head></head>
OpenHtmlHead();
SendHtmlHead('LMC Web Portal');
CloseHtmlHead();

// Open the <body>, display the header, and display the menubar.
OpenHtmlBody();
SendPageHeader(TRUE, $permissionlevel);

echo '<br />UserId: ' . $userid . '<br />';
echo 'Id: ' . $id . '<br />';
echo 'Permission Level: ' . $permissionlevel;

CloseHtmlBody();

?>