

class TestMain {
    
    static function main(){
        var r = new haxe.unit.TestRunner();
        r.add(new TestExample());
		

        // Run the tests
        r.run();
		
		#if js
		untyped __js__("phantom.exit();");
		#end
    }
}