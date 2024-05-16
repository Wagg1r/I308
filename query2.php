<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Query 2</title>
   <style>
.container{
    border: double #1F3541 15px;
    text-align:center;
    padding-top: 50px;
    padding-bottom: 50px;
    padding-left:15px;
    padding-right:15px;
    margin:50px;
    color:#EDF2F3;
    font-size: 30px;
}
html{
    background-color: #5289B5;

}
.head{
    border: double #1F3541 15px;
    text-align: center;
    color:#EDF2F3;
    margin:50px;
    padding-top:10px;
    padding-bottom:10px;
    font-size: 40px;
}
label{
    color:#EDF2F3;
}
</style> 
</head>

<body>
<div class="head">
        <?php
        $conn = mysqli_connect("db.luddy.indiana.edu","i308f22_thomwagg","my+sql=i308f22_thomwagg","i308f22_thomwagg");

        
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());}
        else
            {echo " ";}

        $var_id1 = $_POST["damages"];
        $sql1 = "SELECT CONCAT(t.f_name,' ',t.l_name) AS own_name
                FROM tenant as t
                WHERE CONCAT(t.f_name,' ',t.l_name) = '$var_id1'";

        $result = mysqli_query($conn, $sql1);
        $num_rows = mysqli_num_rows($result);

        if ($num_rows > 0){
            while ($row = mysqli_fetch_assoc($result)) {
                echo"Damages for tenants with no pets: ". $row["own_name"]."<br>";
                
                $rows = mysqli_fetch_assoc($result_albums); }
         }
        
         else{ echo "0 results";}
             
         mysqli_free_result();
         mysqli_close($conn);
        ?>

</div>


    <div class="container">
<?php
$conn = mysqli_connect("db.luddy.indiana.edu","i308f22_thomwagg","my+sql=i308f22_thomwagg","i308f22_thomwagg");

 
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());}
  else
    {echo " ";}

/*$sql = "SELECT SUM(c.damages) AS damages
    FROM charges AS c
    WHERE NOT EXISTS (
        SELECT *
        FROM tenant AS t
        JOIN pet AS p ON p.tenantID=t.id
        WHERE c.tenantID=t.id)";*/
$var_id = $_POST["damages"];

$sql = "SELECT CONCAT(t.f_name,' ',t.l_name) AS fullname, SUM(c.damages) AS damages
    FROM charges AS c
    JOIN tenant AS t ON t.id = c.tenantID
    WHERE CONCAT(t.f_name,' ',t.l_name) = '$var_id'";

$result = mysqli_query($conn, $sql);
$num_rows = mysqli_num_rows($result);

if ($num_rows > 0){
    while ($row = mysqli_fetch_assoc($result)) {
        echo"<br> Full Name: ". $row["fullname"]. "<br> Damages: $". $row["damages"];
        $rows = mysqli_fetch_assoc($result_albums); }
 }

 else{ echo "0 results";}
     
    
  
 mysqli_free_result();
 mysqli_close($conn);

?>
</div>
</body>
</html>