<?php 
// login.php
//
// The page allows the user to log into the web portal system.
session_start();

require_once 'lmcclasses.php';
require_once 'databaselogin.php';
require_once 'databaseclasses.php';
require_once 'misc.php';
require_once 'htmlhead.php';
require_once 'htmlbody.php';

$incorrectuseridorpassword = FALSE;

// If the is being called due to a POST action, do this
if(isset($_POST['userid']) || isset($_POST['password']))
{
    // Connect to the database
    $db_server = new MySQLServer($db_hostname, $db_username, $db_password, $db_database);
    $db_server->connect();
	
    // Initialize the variables with the POSTed response
    $userid = mysql_entities_fix_string($_POST['userid']);
    $password = mysql_entities_fix_string($_POST['password']);
	
    // Try to find the userid in the SYSTEMUSER database
    $systemuser = $db_server->findSystemUser($userid);
	
    // Disconnect from the database
    if ($db_server->isConnected()) 
        $db_server->disconnect();

    // If the user was found in the database...
    if ($systemuser) 
    {
        // If the user's password checks out...
        if ($systemuser->checkPassword($password))
        {
            // Save the id, userid, and permissionlevel as session variables
            $_SESSION['id'] = $systemuser->getId();
            $_SESSION['userid'] = $userid;
            $_SESSION['permissionlevel'] = $systemuser->getPermissionLevel();

            // Send the user to the main web portal page
            header("Location: webportal.php");
        }
    }
	
    // Oops! Invalid user or password doesn't check.
    $incorrectuseridorpassword = TRUE;
}

	
// Setup the <head></head>
OpenHtmlHead();
SendHtmlHead('LMC Web Portal');
CloseHtmlHead();

// Open the <body> and display the header without a menubar.
OpenHtmlBody();
SendPageHeader(FALSE, 999);

echo '<br />';

// Display incorrect userid/password message if necessary.
if ($incorrectuseridorpassword)
	echo '<span style="color: red">Incorrect UserId or Password!</span><br /><br />';

// The log in form
echo 'Please log in:
	<br /><br />
	
	<form  method="post" action="login.php">
	<table style="font-size: 14px">
		<tr>
			<td>UserId:</td>
			<td><input type="text" name="userid" maxlength="10" /></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="password" name="password" maxlength="10" /></td>
		</tr>
	</table>
	<br />
	<input type="submit" value="Log In" />
	</form>';

CloseHtmlBody();

?>