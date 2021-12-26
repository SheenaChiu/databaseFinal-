<?php	
	header("Content-type:text/html;charset=utf-8");
	include "db_conn.php";

	$storeName = $_POST["storeName"];
	$managerName = $_POST["managerName"];
	$storeAddress = $_POST["storeAddress"];
	$storePhone = $_POST["storePhone"];

	//prepared statement
	$query = ("insert into store values(?,?,?,?)");
	$stmt = $db->prepare($query);
	$stmt->execute(array($storeName,$managerName,$storeAddress,$storePhone));	
	header("Location:store.php");
?>

