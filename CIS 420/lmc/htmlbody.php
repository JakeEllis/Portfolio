<?php 
// htmlbody.php
//
// This code is used to help generate a lot of the html that will
// be common across the entire web portal.

function OpenHtmlBody()
{
	echo '<body>';
}

function SendPageHeader($displaymenubar, $permissionlevel)
{
    echo '
        <table style="width: 100%; background-color: #617F8A;">
        <tr>
            <td><span style="color: #FFFFFF; font-size: 20px;">Louisville Master Chorale Web Portal</span></td>
        </tr>';
		
    if ($displaymenubar)
    {
        echo '
        <tr>
            <td id="menubar" style="width: 75%">
                <ul id="menu">
                    <li><a href="">Home</a></li>
                    <li><a href="">Profiles</a>
                <ul>
                    <li><a href="">People</a></li>';

            if ($permissionlevel < 1)
                echo '<li><a href="">System Users</a></li>';

            echo '
                </ul>
                </li>
                <li><a href="">Events</a>
                    <ul>
                    <li><a href="">Board Meetings</a></li>
                    <li><a href="">Rehearsals</a></li>
                    <li><a href="">Perfomances</a></li>
                    </ul>
                </li>
                </ul>
            </td>
            <td style="width: 25%; text-align: right; padding-right: 5px;"><a href="logout.php" style="text-decoration: none; display: block; color: #FFFFFF; ">Logout</a></td>
        </tr>';
    }

    echo '</table>';
}

function CloseHtmlBody()
{
	echo '</body>';
}

?>