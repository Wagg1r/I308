<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    $user_name = $_POST['user_name'];
    $fear = $_POST['fear'];
    $favorite = $_POST['favorite'];

    echo "<p>Your user name is " . $user_name .".".
     "<br><br>Your biggest fear is " . $fear . ".".
     "<br><br>Your favorite animal is " . $favorite . "."."</p>";

    ?>
</body>
</html>


