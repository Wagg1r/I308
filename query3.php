<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Query 3</title>
</head>
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
 
</style>


<body>
<div class="head">
        <?php
        $conn = mysqli_connect("db.luddy.indiana.edu","i308f22_thomwagg","my+sql=i308f22_thomwagg","i308f22_thomwagg");

        
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());}
        else
            {echo " ";}

        $var_id1 = $_POST["property"];
        $sql1 = "SELECT CONCAT(o.f_name,' ',o.l_name) AS own_name
                FROM owner as o
                WHERE CONCAT(o.f_name,' ',o.l_name) = '$var_id1'";

        $result = mysqli_query($conn, $sql1);
        $num_rows = mysqli_num_rows($result);

        if ($num_rows > 0){
            while ($row = mysqli_fetch_assoc($result)) {
                echo"Owners with multiple properties: ". $row["own_name"]."<br>";
                
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

/*$sql = "SELECT o.f_name AS fname, o.l_name AS lname, num_properties
        FROM property AS p
        JOIN owner AS o ON o.id=p.ownerid 
        GROUP BY o.id
        HAVING num_properties>1;";*/

$var_id = $_POST["property"];

$sql = "SELECT CONCAT(o.f_name,' ',o.l_name) AS own_name, num_properties 
    FROM property AS p
    JOIN owner AS o ON o.id=p.ownerid
    WHERE CONCAT(o.f_name,' ',o.l_name) = '$var_id'
    GROUP BY o.id
    ";

$result = mysqli_query($conn, $sql);
$num_rows = mysqli_num_rows($result);

if ($num_rows > 0){
    while ($row = mysqli_fetch_assoc($result)) {
        echo"<br> Full Name: ". $row["own_name"]. "<br> Number of Properties: ". $row["num_properties"]. "<br>";
        
        $rows = mysqli_fetch_assoc($result_albums); }
 }

 else{ echo "0 results";}
     
    
  
 mysqli_free_result();
 mysqli_close($conn);

?>
</div>
</body>
</html>