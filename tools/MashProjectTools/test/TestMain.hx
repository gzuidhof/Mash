package;

class TestMain {
    
    static function main(){
        var r = new haxe.unit.TestRunner();
		
        // Run the tests
        r.run();
	
		Sys.exit(r.result.success ? 0 : 1);
    }
}