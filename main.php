<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Step: 6</title>
<style>
.container{
    border: double #1F3541 15px;
    text-align:center;
    padding-top: 50px;
    padding-bottom: 50px;
    padding-left:15px;
    padding-right:15px;
    margin:50px;

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
}
label{
    color:#EDF2F3;
}
</style>
</head>

<body>

<?php
$conn = mysqli_connect("db.luddy.indiana.edu","i308f22_ynallamo","my+sql=i308f22_ynallamo","i308f22_ynallamo");
    if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());}
    else
        {echo "";}

                
        $sql = "SELECT CONCAT(t.f_name,' ',t.l_name) AS names, p.address_str,p.address_zip 
        FROM tenant AS t
        JOIN lease AS l ON l.tenantID=t.id
        JOIN property AS p ON p.id = t.propertyID
        WHERE l.end_date BETWEEN '2023-05-01'
        AND '2023-05-31'";

        $sql1 = "SELECT SUM(c.damages), CONCAT(t.f_name,' ',t.l_name) AS dam_name
        FROM charges AS c
        JOIN tenant AS t ON t.id = c.tenantID
        WHERE NOT EXISTS (
            SELECT *
            FROM tenant AS t 
            JOIN pet as p ON p.tenantID = t.id
            WHERE c.tenantID=t.id)";

        $sql2 = "SELECT CONCAT(o.f_name,' ',o.l_name) AS own_name, num_properties 
        FROM property AS p
        JOIN owner AS o ON o.id=p.ownerid
        GROUP BY o.id
        HAVING num_properties > 1";

        $sql3 = "SELECT CONCAT(t.f_name,' ',t.l_name) AS paid_name, MAX(p.date_paid)
        FROM payment AS p
        JOIN tenant AS t ON t.id=p.tenantID
        GROUP BY t.id";
        
        $sql4 = "SELECT p.address_str AS addy, p.address_zip, COUNT(*)
        FROM tenant AS t
        JOIN property AS p 
            ON p.id=t.propertyid
        GROUP BY p.id
        HAVING COUNT(*) > 2";
         
        
        

        $result = mysqli_query($conn, $sql);
        $result1 = mysqli_query($conn, $sql1);
        $result2 = mysqli_query($conn, $sql2);
        $result3 = mysqli_query($conn, $sql3);
        $result4 = mysqli_query($conn, $sql4);
        $num_rows = mysqli_num_rows($result);
        $num_rows1 = mysqli_num_rows($result1);
        $num_rows2 = mysqli_num_rows($result2);
        $num_rows3 = mysqli_num_rows($result3);
        $num_rows4 = mysqli_num_rows($result4);

        $lease = mysqli_query($conn, $sql);
        $damages = mysqli_query($conn, $sql1);
        $properties = mysqli_query($conn, $sql2);
        $payments = mysqli_query($conn, $sql3);
        $capacity = mysqli_query($conn, $sql4);
        $queryResults = mysqli_fetch_array($lease);
        $queryResults1 = mysqli_fetch_array($damages);
        $queryResults2 = mysqli_fetch_array($properties);
        $queryResults3 = mysqli_fetch_array($payments);
        $queryResults4 = mysqli_fetch_array($capacity);

?>
<h1 class="head"> Peter & Polly's Properties! <h1>
<div class="container">
 <form action ="query1.php" method="POST" >
        <label for="end_date">Leases Ending in May 2023:</label>
        <select name ="end_date">    
        <?php
            while ($row = mysqli_fetch_assoc($result)):;
        ?>
        <option value="<?php echo $row["names"]?>";>
         <?php echo $row["names"]; ?> 
        
        </option>
        <?php endwhile; ?>
        </select>
        <input type="submit" value="submit" name="submit">
    </form>

     <form action ="query2.php" method="POST">
        <label for="damages">Damages For Tenants With No Pets: </label>
        <select name ="damages">    
        <?php
            while ($row = mysqli_fetch_assoc($result1)):;
        ?>
        <option value="<?php echo $row["dam_name"]?>";>
         <?php echo $row["dam_name"]; ?> 
        
        </option>
        <?php endwhile; ?>
        </select>
        <input type="submit" value="submit" name="submit">
    </form>

     <form action ="query3.php" method="POST">
        <label for="property">Owners With Multiple Properties: </label>
        <select name ="property">    
        <?php
            while ($row = mysqli_fetch_assoc($result2)):;
        ?>
        <option value="<?php echo $row["own_name"]?>";>
         <?php echo $row["own_name"]; ?> 
        
        </option>
        <?php endwhile; ?>
        </select>
        <input type="submit" value="submit" name="submit">
    </form>

     <form action ="query4.php" method="POST">
        <label for="payment">Most Recent Rent Payment:</label>
        <select name ="payment">    
        <?php
            while ($row = mysqli_fetch_assoc($result3)):;
        ?>
        <option value="<?php echo $row["paid_name"]?>";>
         <?php echo $row["paid_name"]; ?> 
        
        </option>
        <?php endwhile; ?>
        </select>
        <input type="submit" value="submit" name="submit">
    </form>

     <form action ="query5.php" method="POST">
        <label for="capacity">Properties With More Than 2 Tenants:</label>
        <select name ="capacity">    
        <?php
            while ($row = mysqli_fetch_assoc($result4)):;
        ?>
        <option value="<?php echo $row["addy"]?>";>
         <?php echo $row["addy"]; ?> 
        
        </option>
        <?php endwhile; ?>
        </select>
        <input type="submit" value="submit" name="submit">
    </form>
</div>
<?php
mysqli_close($conn);?>
</body>
</html>