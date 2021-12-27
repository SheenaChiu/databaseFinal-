<?php	
	include "condb.php";
	if (isset($_POST["name"]) && !empty($_POST["name"]))
	{
	  $name = $_POST["name"];
	  $sql = "DELETE FROM employee WHERE name = ?";
	  if($stmt = $db->prepare($sql)){
		try{	
			$success = $stmt->execute(array($name));
			header('Location:employee.php');
		}catch(PDOException $e){
			echo "<script>alert('使用到相關資料，刪除失敗'); location.href = 'employee.php';</script>";
		}
	  }
	}
	else 
	{
	  echo "<script>alert('無此員工，刪除失敗'); location.href = 'employee.php';</script>";
	}
?>