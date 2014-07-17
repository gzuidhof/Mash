

class TestMain {
    
    static function main(){
        var r = new haxe.unit.TestRunner();
        r.add(new TestExample());
		

        // Run the tests
        r.run();
    }
}