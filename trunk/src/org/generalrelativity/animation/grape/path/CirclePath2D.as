package org.generalrelativity.animation.grape.path
{
	import flash.geom.Point;

	
	public class CirclePath2D extends Path
	{
		
		public var C:Point;
		private var r:Number;
		
		private var startTheta:Number;
		private var deltaTheta:Number;
		
		public function CirclePath2D( C:Point, r:Number, startRadian:Number = 0, endRadian:Number = Math.PI * 2 )
		{
			
			super();
			
			this.C = C;
			this.r = r;
			
			startTheta = startRadian;
			deltaTheta = endRadian - startRadian;
			
		}
		
		override public function solve( t:Number, $solution:Vector.<Number> ) : void
		{
			
			var theta:Number = startTheta + deltaTheta * t;
			
			$solution[ 0 ] = C.x + Math.cos( theta ) * r;
			$solution[ 1 ] = C.y + Math.sin( theta ) * r;
			
		}
		
	}
}