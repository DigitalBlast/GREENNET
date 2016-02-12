<?php
	//By GreenGene//
	
	$actionname = $_GET["action"]; //Get the action
	
	if($actionname == "checkdomainavalibility") {
		$dmn = $_GET["domain"];
		
		if(file_exists("domains/" . $dmn . "/" . $dmn . ".txt")) {
			echo("true");
			
			$dmn = NULL;
		} else{
			echo("false");
			
			$dmn = NULL;
		}
	} elseif($actionname == "respond") {
		$dmn = $_GET["domain"];
		
		$code = $_GET["code"];
		
		$id = $_GET["respondid"];
		
		if(file_exists("domains/" . $dmn . "/" . $id . ".txt")) {
			$file = fopen("domains/" . $dmn . "/" . $id . ".txt", "w") or die("report this issue to developers: access denied to file: domains/" . $dmn . "/" . $id . ".txt");
			
			fwrite($file, $code);
			
			fclose();
			
			echo("true");
			
			$domain = NULL;
			
			$code = NULL;
			
			$id = NULL;
		} else {
			echo("false");
		}
	} elseif($actionname == "request") {
		$dmn = $_GET["domain"];
		
		$id = $_GET["id"];
		
		$path = $_GET["path"];
		
		if(file_exists("domains/" . $dmn . "/" . $id . ".txt")) {
			$file = fopen("domains/" . $dmn . "/" . $id . ".txt", "w");
		
			fwrite($file, $path);
		
			fclose($file);
			
			echo("true");
		} else {
			echo("false");
		}
		$dmn = NULL;
		
		$id = NULL;
	} elseif($actionname == "loadrequests") {
		$dmn = $_GET["domain"];
		
		if(file_exists("domains/" . $dmn . "/")) {
			$scaned = scandir("domains/" . $dmn . "/");
			
			$imploded = implode(",", $scaned);
			
			echo( $imploded );
			
			$imploded = NULL;
			
			echo("true");
		} else {
			echo("false");
		}
		$dmn = NULL;
	} elseif($actionname == "resign") {
		$dmn = $_GET["domain"];
		
		if(file_exists("domains/" . $dmn . "/")) {
			rmdir("domains/" . $dmn . "/");
			
			echo("true");
		} else {
			echo("false");
		}
		$dmn = NULL;
	} elseif($actionname == "register") {
		$dmn = $_GET["domain"]; 
		if( file_exists("domains/" . $dmn . "/") != true) {
			mkdir("domains/" . $dmn);
			
			echo("true");
		} else {
			echo("false");
		}
	} elseif($actionname == "download")
	{
		$dmn = $_GET["domain"];
		
		$id = $_GET["id"];
		
		$path = $_GET["path"];
		
		if(file_exists("domains/" . $dmn . "/" . $id . ".txt"))
		{
			$file = fopen("domains/" . $dmn . "/" . $id . ".txt", "r");
			
			$content = fread($file, filesize("domains/" . $dmn . "/" . $id . ".txt"));
		
			fclose($file);
		
			if($content == $path)
			{
				echo("false");
			} else {
				echo($content);
			
				if(unlink("domains/" . $dmn . "/" . $id . ".txt") == false) {
					echo("report this issue to developers: failed to unlink: " . $dmn . "/" . $id . ".txt");
				}
			}
		} else {
			echo("false");
		}
		
	} elseif($actionname == "path")
	{
		$dmn = $_GET["doamin"];
		
		$id = $_GET["id"];
		
		if(file_exists("domains/" . $dmn . "/" . $id . ".txt"))
		{
			$file = fopen("domains/" . $dmn . "/" . $id . ".txt", "r");
			
			$content = fread($file, filesize("domains/" . $dmn . "/" . $id . ".txt"));
			echo($content);
		} else {
			echo("false");
		}
	}
?>
