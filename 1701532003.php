<?php 
 	$host = 'sql303.ezyro.com';
 	$username = 'ezyro_28189150';
 	$password = '';
 	$db_name = 'ezyro_28189150_katalog';
 	$con = mysqli_connect($host,$username,$password,$db_name);
 	$resultset = mysqli_query($con,"SELECT * FROM products join variants");
 	$json_array = array();
 	while($row = mysqli_fetch_assoc($resultset))
 	{
 		$json_array[] = $row;
 	}
 	print(json_encode($json_array));


 ?>