<?php

$burrow=mysqli_connect("db.luddy.indiana.edu","i308f22_thomwagg","my+sql=i308f22_thomwagg", "i308f22_thomwagg");
if (!$burrow)
	{die("Failed to connect to MySQL: " . 
		mysqli_connect_error()); }

$var_fname = $_POST['ForFname'];
$var_lname = $_POST['FormLname'];
$var_DOB = $_POST['FormDOB'];
$var_hometown = $_POST['FormHometown'];
$var_gender = $_POST['FormGender'];

$sql = "INSERT INTO p_artist (fname,lname,dob,hometown,gender) VALUES ('$var_fname','$var_lname','$var_DOB','$var_hometown','$var_gender')";

if (mysqli_query($burrow,$sql)) 
	{echo "<br>Thank you! Your record has been added to the table.";} 
else{die("SQL Error: " . mysqli_error($burrow)); }
	mysqli_close($burrow);

?>

