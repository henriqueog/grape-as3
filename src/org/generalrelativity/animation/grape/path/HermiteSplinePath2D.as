package org.generalrelativity.animation.grape.path
{
	import flash.geom.Point;

	public class HermiteSplinePath2D extends LinearSplinePath2D
	{
		
		//tangents
		protected var w:Vector.<Number>;
		
		public function HermiteSplinePath2D( points:Vector.<Number>, tangents:Vector.<Number> )
		{ 
			super( points );
			w = tangents;
		}
		
		final override protected function getPoint( index:uint, t:Number, $X:Point ) : void
		{
			
			var tSq:Number = t * t;
			var tCu:Number = tSq * t;
			var tSq3:Number = 3 * tSq;
			var tCu2:Number = 2 * tCu;
			
			var h1:Number =  tCu2 - tSq3 + 1;
			var h2:Number = -tCu2 + tSq3;
			var h3:Number =  tCu - 2 * tSq + t;
			var h4:Number =  tCu - tSq;
			
			$X.x = s[ index ] * h1 + s[ index + 2 ] * h2 + w[ index ] * h3 + w[ index ] * h4;
			$X.y = s[ index + 1 ] * h1 + s[ index + 3 ] * h2 + w[ index + 1 ] * h3 + w[ index + 3 ] * h4;
			
		}
	
		
	}
}