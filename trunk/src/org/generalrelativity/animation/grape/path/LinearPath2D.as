package org.generalrelativity.animation.grape.path
{
	import flash.geom.Point;

	/**
	 * Linear
	 * 
	 * Line Segment = L = AB
	 * Vector v = B - A
	 * Point on segment at t [0,1] = L(t) = A + v * t
	 * */
	public class LinearPath2D extends Path
	{
		
		protected var A:Point;
		protected var v:Point;
		
		public function LinearPath2D( A:Point, B:Point )
		{
			
			super();
			
			this.A = A;
			v = B.subtract( A );
			
		}
		
		override public function solve( t:Number, $solution:Vector.<Number> ) : void
		{
			$solution[ 0 ] = A.x + v.x * t;
			$solution[ 1 ] = A.y + v.y * t;
		}
		
	}
}