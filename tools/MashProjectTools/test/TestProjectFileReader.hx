package;

import util.ProjectFileReader;

import util.BuildTarget;


class TestProjectFileReader extends haxe.unit.TestCase
{
	public function testProjectFileReader()
	{
		var pfReader = new ProjectFileReader("TestProject/project.yml");

		pfReader.setBuildTarget( Target.iOS);
		pfReader.read();

		assertEquals( "Test Project" , pfReader.get("name") );
		assertEquals( 480 , pfReader.get("width") );
		assertEquals( 500 , pfReader.get("height") );



	}
}