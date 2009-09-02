package org.generalrelativity.animation.grape.path
{
	

	public class CatmullRomSplinePath2D extends HermiteSplinePath2D
	{
		
		public function CatmullRomSplinePath2D( points:Vector.<Number> )
		{
			
			var n:int = points.length;
			
			var dpx:Number = points[ n - 2 ] - points[ 0 ];
			var dpy:Number = points[ n - 1 ] - points[ 1 ];
			
			var tangents:Vector.<Number> = new Vector.<Number>( points.length );
			
			for( var i:int = 0; i < n - 1; i += 2 )
			{
				
				var p0x:Number, p0y:Number, p1x:Number, p1y:Number;
				
				if( i == 0 )
				{
					p0x = points[ 0 ] - dpx;
					p0y = points[ 1 ] - dpy;
				}
				else
				{
					p0x = points[ i - 2 ];
					p0y = points[ i - 1 ];
				}
				
				if( i == n - 2 )
				{
					p1x = points[ n - 2 ] + dpx;
					p1y = points[ n - 1 ] + dpy;
				}
				else
				{
					p1x = points[ i + 2 ];
					p1y = points[ i + 1 ];
				}
				
				tangents[ i ] = ( p1x - p0x ) * 0.5;
				tangents[ i + 1 ] = ( p1y - p0y ) * 0.5;
				
				
			}
			
			super( points, tangents );
			
		}
	}
}