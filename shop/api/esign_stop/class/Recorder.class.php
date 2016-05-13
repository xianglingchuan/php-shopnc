<?php
class Recorder{
    private static $data;
    private $inc;
    private $error;

    public function __construct(){

        //-------读取配置文件
        $incFileContents = file_get_contents(ROOT."comm/inc.php");
		$datFileContents = file_get_contents(ROOT."comm/inc.dat");
		self::$data = json_decode($datFileContents,true);
		
		//self::$data['createAccountUrl'] = '12333333';
		//print_r(self::$data);
        // $this->inc = json_decode($incFileContents);
        // if(empty($this->inc)){
            // $this->error->showError("20001");
        // }

       // if(empty($_SESSION['QC_userData'])){
        //    self::$data = array();
       // }else{
       //     self::$data = $_SESSION['QC_userData'];
       // }
    }

    public function write($name,$value){
        self::$data[$name] = $value;
    }

    public function read($name){
        if(empty(self::$data[$name])){
            return null;
        }else{
            return self::$data[$name];
        }
    }

    public function readInc($name){
        if(empty($this->inc->$name)){
            return null;
        }else{
            return $this->inc->$name;
        }
    }

    public function delete($name){
        unset(self::$data[$name]);
    }

    function __destruct(){
        $_SESSION['QC_userData'] = self::$data;
		$this->write2file();
    }
	public function write2file()
	{
		$datFile = ROOT."comm/inc.dat";
		$myfile = fopen($datFile,"w") or die("Unable to open file!".$datFile);
		fwrite($myfile, json_encode(self::$data));
		fclose($myfile);
	}
}
