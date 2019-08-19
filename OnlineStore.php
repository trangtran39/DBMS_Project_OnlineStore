<HTML>
<head>
<title> Details of Suppliers </title>
</head>
<BODY>
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
        echo "<h2> List all the orders that shipped by their suppliers </h2> \n";
        $query = "SELECT * FROM HAS Natural JOIN shipped";
        echo "<h4> $query </h4> \n";

        $sqlquery=$conn->prepare($query);
        $sqlquery->execute();

while($row = $sqlquery->fetch())
{
        {
                echo "Order_numb: $row[0]  item_id: $row[1]  quantity: $row[2]  supplier_id: $row[3]" ;
                echo "<br />\n";
        }
}

$query=null;

?>

<H3>Done!</H3>

</BODY>
</HTML>
