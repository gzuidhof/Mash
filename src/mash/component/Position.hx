package mash.component;

class Position
{
	public var x:Float;
	public var y:Float;

	public function new(x:Float, y:Float)
	{
		this.x = x;
		this.y = y;
	}

	public function subtract(x:Float, y:Float): Position
	{
		return add(-x, -y);
	}

	public function add(x:Float, y:Float): Position
	{
		this.x += x;
		this.y += y;
		return this;
	}

	public function clone(): Position
	{
		return new Position(x, y);
	}

	public function matches(o:Position): Bool
	{
		if(o == null)
			return false;
		return (o.x == x && o.y == y);
	}

	public static function safeClone(o:Position): Position
	{
		return (o == null ? null : o.clone());
	}

	public static function match(o1:Position, o2:Position): Bool
	{
		if(o1 == o2)
			return true;
		if(o1 == null)
			return false;
		return (o1.matches(o2));
	}	

	// Returns an angle between this point and another point, degrees, 0 north
	public function getAngleTo(pos:Position): Float
	{
	  	var theta = Math.atan2(pos.y - y, pos.x - x);
	    theta += Math.PI / 2.0;
	    var angle = theta * 180 / Math.PI;
	    return (angle < 0 ? angle + 360 : angle);
	}

	public function getDistanceTo(pos:Position): Float
	{
		var dx = pos.x - x;
		var dy = pos.y - y;
		return Math.sqrt(dx * dx + dy * dy);
	}

	public static inline function zero(): Position
	{
		return new Position(0,0);
	}


}