class TestExample extends haxe.unit.TestCase {
    
    public function testBasic(){
        assertEquals( "A", "A" );
    }
	
	 public function testFail(){
        assertEquals( "A", "B" );
    }
	
    
}