package org.generalrelativity.animation.grape.path
{
	import flash.geom.Point;

	public class PhysicsPath2D extends Path
	{
		
		private var X:Point;
		private var v:Point;
		private var a:Point;
		private var seconds:Number;
		
		public function PhysicsPath2D( X:Point, v:Point, a:Point, seconds:Number )
		{
			
			super();
			
			this.X = X;
			this.v = v;
			this.a = a;
			this.seconds = seconds;
			
		}
		
		override public function solve( t:Number, $solution:Vector.<Number> ) : void
		{
			
			var ts:Number = t * seconds;
			var halfTsSq:Number = ts * ts * 0.5;
			
			$solution[ 0 ] = X.x + v.x * ts + a.x * halfTsSq;
			$solution[ 1 ] = X.y + v.y * ts + a.y * halfTsSq;
		}
		
	}
}