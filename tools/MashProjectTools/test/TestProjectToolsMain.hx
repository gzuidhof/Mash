package;

class TestProjectToolsMain {
    
    static function main(){
        var r = new haxe.unit.TestRunner();
		
        // Run the tests
        r.run();
	
		Sys.exit(r.result.success ? 0 : 1);
    }
}