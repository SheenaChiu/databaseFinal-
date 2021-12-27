<?php	
	include "condb.php";

	if (isset($_POST["storeName"]) && !empty($_POST["storeName"]))
	{
	  $storeName = $_POST["storeName"];
	  $sql = "DELETE FROM store WHERE storeName = ?";
	  if($stmt = $db->prepare($sql)){
		try{	
			$success = $stmt->execute(array($storeName));
			header('Location:store.php');
		}catch(PDOException $e){
			echo "<script>alert('刪除失敗'); location.href = 'store.php';</script>";
		}
	  }
	}
	else 
	{
	  echo "<script>alert('刪除失敗'); location.href = 'store.php';</script>";
	}
?>