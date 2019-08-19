<HTML>
<head>
<title> Which supplier? </title>
</head>
<body>
<?PHP
        $dsn="pgsql:host=localhost;dbname=minhtran.tran";   // data source name
        $dbuser='minhtran.tran';
        $password = 'ahihi123';

        $conn = new PDO($dsn, $dbuser, $password);

        if (!$conn)
        {
                echo "Could not connect!!!!\n";
                exit;
        }
        echo "<h2> Find the supplier who shipped order 129473 </h2> \n";
        $query = "SELECT * from suppliers where id = (select supplier_ID from shipped where order_numb = :numb)";
        echo "<h4 align=\"center\"> $query </h4> \n";

        //prepare the SQL statement
        $sqlquery=$conn->prepare($query, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        // execute the SQL statement
        $sqlquery->execute(array(':numb' => 129473));

        // get the results of the sql statement
        if ($row = $sqlquery->fetch(PDO::FETCH_ASSOC))
        {
                echo "<table border=\"1\" align=\"center\">\n";  //table
                echo "<tr>";
                foreach ($row as $key=>$value)
                        echo "<th bgcolor=\"#8B8A8A\">".strtoupper($key)."</th> ";
                echo "</tr>\n";
                do {
                        echo "<tr>";
                        foreach ($row as $key => $value)
                        {
                                //echo "$key: $value ";
                                echo "<td>" . $row["$key"] . "</td> ";
                        }
                        echo "</tr>\n";
                } while($row = $sqlquery->fetch(PDO::FETCH_ASSOC));
                echo "</table>";
        }

?>

<h3>Done!</h3>

</body>
</html>
