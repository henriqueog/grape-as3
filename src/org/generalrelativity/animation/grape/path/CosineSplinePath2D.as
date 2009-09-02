package org.generalrelativity.animation.grape.path
{
	import flash.geom.Point;

	public class CosineSplinePath2D extends LinearSplinePath2D
	{
		
		public function CosineSplinePath2D( s:Vector.<Number> )
		{
			super( s );
		}
		
		override protected function getPoint( index:uint, t:Number, $X:Point ) : void
		{
			
			var k:Number = ( 1 - Math.cos( t * Math.PI ) ) * 0.5;
           
            $X.x = s[ index ] + ( s[ index + 2 ] - s[ index ] ) * t;
            $X.y = s[ index + 1 ] + ( s[ index + 3 ] - s[ index + 1 ] ) * k;
            
		}
		
	}
}