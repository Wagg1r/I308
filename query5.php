<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Query 5</title>
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
</head>

<body>

<div class="head">
        <?php
        $conn = mysqli_connect("db.luddy.indiana.edu","i308f22_thomwagg","my+sql=i308f22_thomwagg","i308f22_thomwagg");

        
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());}
        else
            {echo " ";}

        $var_id1 = $_POST["capacity"];
        $sql1 = "SELECT p.address_str AS own_name
                from property as p
                WHERE p.address_str = '$var_id1'";

        $result = mysqli_query($conn, $sql1);
        $num_rows = mysqli_num_rows($result);

        if ($num_rows > 0){
            while ($row = mysqli_fetch_assoc($result)) {
                echo"Properties with more than 2 tenants: ". $row["own_name"]."<br>";
                
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
    {echo "";}

$var_id = $_POST['capacity'];

$sql = "SELECT p.address_str AS street_adr, p.address_zip AS zip, COUNT(*) AS num_prop
    FROM tenant AS t
    JOIN property AS p ON p.id=t.propertyid 
    WHERE p.address_str = '$var_id'
    GROUP BY p.id 
        ";



$result = mysqli_query($conn, $sql);
$num_rows = mysqli_num_rows($result);

if ($num_rows > 0){
    while ($row = mysqli_fetch_assoc($result)) {
        echo"<br> Street Address: ". $row["street_adr"]. "<br> Zip Code: ". $row["zip"]. "<br> Number of Tenants: ". $row["num_prop"]. "<br>";

        $rows = mysqli_fetch_assoc($result_albums); }
 }

 else{ echo "0 results";}
     
    
  
 mysqli_free_result();
 mysqli_close($conn);

?>
</div>   
</body>
</html>