<?php 
    ini_set('max_execution_time',30000);

    require_once('curl.php');

	$apiCall = new Curl();

	$noCache = $_GET['noCache'];
	$top = $_GET["top"];

	$url = "http://ec2-18-221-115-67.us-east-2.compute.amazonaws.com:3100/images/mejores/$noCache";
	
	//$json = $apiCall->send($url,"GET",null);
	$json = file_get_contents($url);

	echo $json;

?>