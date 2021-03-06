package;

import snow.types.Types;

class TestEngineMain extends luxe.Game{
    
	override function config( config:AppConfig ) {
		config.has_window = false;
		return config;
	} //config
	
	override function ready() 
	{
		super.ready();
		doTests();
		
	}
	
	function doTests()
	{
		 var r = new haxe.unit.TestRunner();
        r.add(new TestScene());
		r.add(new TestSceneSerialization());
		r.add(new TestSystemSerialization());
		
        // Run the tests
        r.run();
		
		#if js
		if (r.result.success)
			untyped __js__("phantom.exit(0);");
		else
			untyped __js__("phantom.exit(1);");
		#end
		
		#if (!flash && !js)
		Sys.exit(r.result.success ? 0 : 1);
		#end
	}
	
}