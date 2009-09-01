package org.generalrelativity.animation.grape.path
{
	import flash.geom.Point;

	public class SpiralPath2D extends Path
	{
		
		private var startRadius:Number;
		private var deltaTheta:Number;
		private var startTheta:Number;
		private var deltaRadius:Number;
		
		private var C:Point;
		
		public function SpiralPath2D( C:Point, startRadius:Number, endRadius:Number, startTheta:Number = 0, numRotations:Number = 3.0 )
		{
			
			super();
			
			this.C = C;
			
			this.startRadius = startRadius;
			this.startTheta = startTheta;
			
			deltaTheta = Math.PI * 2 * numRotations;
			deltaRadius = endRadius - startRadius;
			
		}
		
		override public function solve( t:Number, $solution:Vector.<Number> ) : void
		{
			
			var theta:Number = startTheta + deltaTheta * t;
			var radius:Number = startRadius + deltaRadius * t;
			
			$solution[ 0 ] = C.x + Math.cos( theta ) * radius;
			$solution[ 1 ] = C.y + Math.sin( theta ) * radius;
			
		}
		
	}
}