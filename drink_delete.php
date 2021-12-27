<?php	
	include "condb.php";
	
	if (!empty($_POST["productName"]) && !empty($_POST["storeName"])){

	  $sql = "DELETE FROM drink WHERE productName = ? and storeName = ?";
	  if($stmt = $db->prepare($sql)){
		try{	
			$success = $stmt->execute(array($productName,$storeName));
			header('Location:drink.php');
		}catch(PDOException $e){
			echo "<script>alert('刪除失敗1'); location.href = 'drink.php';</script>";
		}
	  }
	}
	else if(!empty($_POST["storeName"])){
	 
	  $storeName = $_POST["storeName"];
	  $sql = "DELETE FROM drink WHERE storeName = ?";
	  if($stmt = $db->prepare($sql)){
		try{	
			$success = $stmt->execute(array($storeName));
			header('Location:drink.php');
		}catch(PDOException $e){
			echo "<script>alert('刪除失敗2'); location.href = 'drink.php';</script>";
		}
	  }
	  
	}
	else if(!empty($_POST["productName"])){

	  $productName = $_POST["productName"];
	  $sql = "DELETE FROM drink WHERE productName = ?";
	  if($stmt = $db->prepare($sql)){
		try{	
			$success = $stmt->execute(array($productName));
			header('Location:drink.php');
		}catch(PDOException $e){
			echo "<script>alert('刪除失敗3'); location.href = 'drink.php';</script>";
		}
	  }

	}
?>