<?PHP
	$str = file_get_contents("php://input");
	file_put_contents("../../tmp/upload".time().".jpg", pack("H*", $str));
//$v= "../../tmp/upload".time().".jpg";

// echo $v; 
?>