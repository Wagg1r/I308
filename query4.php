<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Query 4</title>
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

        $var_id1 = $_POST["payment"];
        $sql1 = "SELECT CONCAT(t.f_name,' ',t.l_name) AS own_name
                FROM tenant as t
                WHERE CONCAT(t.f_name,' ',t.l_name) = '$var_id1'";

        $result = mysqli_query($conn, $sql1);
        $num_rows = mysqli_num_rows($result);

        if ($num_rows > 0){
            while ($row = mysqli_fetch_assoc($result)) {
                echo"Most recent rent payment for ". $row["own_name"]."<br>";
                
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

/*$sql = "SELECT t.f_name AS fname, t.l_name AS lname, MAX(p.date_paid) AS recent_rent
        FROM payment AS p
        JOIN tenant AS t ON t.id=p.tenantID 
        GROUP BY t.id
        ";*/
$var_id = $_POST["payment"];

$sql = "SELECT CONCAT(t.f_name,' ',t.l_name) AS paid_name, MAX(p.date_paid) as recent_rent
FROM payment AS p
JOIN tenant AS t ON t.id=p.tenantID
WHERE CONCAT(t.f_name,' ',t.l_name) = '$var_id'
GROUP BY t.id
";

$result = mysqli_query($conn, $sql);
$num_rows = mysqli_num_rows($result);

if ($num_rows > 0){
    while ($row = mysqli_fetch_assoc($result)) {
        echo"<br> Full Name: ". $row["paid_name"]. "<br> Date of Most Recent Payment: ". $row["recent_rent"]. "<br>";
        
        $rows = mysqli_fetch_assoc($result_albums); }
 }

 else{ echo "0 results";}
     
    
  
 mysqli_free_result();
 mysqli_close($conn);

?>
</div>
</body>
</html>