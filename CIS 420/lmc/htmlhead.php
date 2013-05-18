<?php 
// htmlhead.php
// 
// This code generates the common features in the html header section

function OpenHtmlHead()
{
    echo '
        <html>
        <head>';
}

function SendHtmlHead($title)
{
    echo '
	<link rel="stylesheet" type="text/css" href="css/menubar.css" />
	<link rel="stylesheet" type="text/css" href="css/lmc.css" />
	<title>' . $title . '</title>';
}

function CloseHtmlHead()
{
    echo '</head>';
}

?>