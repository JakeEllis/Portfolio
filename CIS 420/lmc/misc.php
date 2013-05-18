<?php 
// misc.php
// 
// Bunch of miscellaneous functions

// See PHP book for explanation
function mysql_entities_fix_string($string)
{
	return htmlentities(mysql_fix_string($string));
}

// See PHP book for explanation
function mysql_fix_string($string)
{
	if (get_magic_quotes_gpc())
		$string = stripslashes($string);
	
	return mysql_real_escape_string($string);
}

// See PHP book for explanation. It's actually of the PHP website,
// but is very much like the code presented in the book.
function destroy_session_and_data()
{
$_SESSION = array();

// If it's desired to kill the session, also delete the session cookie.
// Note: This will destroy the session, and not just the session data!
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// Finally, destroy the session.
session_destroy();
}

?>