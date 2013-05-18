<?php 
// logout.php
//
// This page will log the user out of the sytem.

// The security stuff
session_start();

session_regenerate_id();
if(!isset($_SESSION['id'])) 
{
    header("Location: login.php");
}

require_once 'lmcclasses.php';
require_once 'databaselogin.php';
require_once 'databaseclasses.php';
require_once 'misc.php';
require_once 'htmlhead.php';
require_once 'htmlbody.php';

// Destroy the session and the data
destroy_session_and_data();

// Setup the <head><head>
OpenHtmlHead();
SendHtmlHead('LMC Web Portal');
CloseHtmlHead();

// Open the <body> and display the header without a menubar.
OpenHtmlBody();
SendPageHeader(FALSE, 999);

echo '
    <br />
    You have been logged out. Thank you for using the Louisville Master Chorale Web Portal.';
		
?>