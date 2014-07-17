

class TestMain {
    
    static function main(){
        var r = new haxe.unit.TestRunner();
        
		
        // Run the tests
        r.run();
		
		#if js
		if (r.result.success)
			untyped __js__("phantom.exit(0);");
		else
			untyped __js__("phantom.exit(1);");
		#end
    }
}