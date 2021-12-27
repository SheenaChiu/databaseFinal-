<?php	
	include "condb.php";

	if (isset($_POST["name"]) && !empty($_POST["name"]))
	{
	  $storeName = $_POST["name"];
	  $sql = "DELETE FROM employee WHERE name = ?";
	  if($stmt = $db->prepare($sql)){
		try{	
			$success = $stmt->execute(array($name));
			header('Location:employee.php');
		}catch(PDOException $e){
			echo "<script>alert('刪除失敗'); location.href = 'employee.php';</script>";
		}
	  }
	}
	else 
	{
	  echo "<script>alert('刪除失敗'); location.href = 'employee.php';</script>";
	}
?>