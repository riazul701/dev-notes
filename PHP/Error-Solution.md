1. Upload CodeIgniter 3 project to php 7.4 server
Problem: php - Session are lost after redirect in CodeIgniter 3

Guide: https://stackoverflow.com/questions/48485129/php-session-are-lost-after-redirect-in-codeigniter-3

Solution:
Go to
	system/libraries/Session/session.php
at Line no 281 and replace
	ini_set('session.name', $params['cookie_name']); 
by
	ini_set('session.id', $params['cookie_name']);

This problem occurs normally while upgrading PHP later version to 7.3 +
