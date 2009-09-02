package org.generalrelativity.animation.grape.path
{
	import flash.display.Graphics;

	public class Path2D extends Path
	{
		public function Path2D()
		{
			super();
		}
		
		public function render( graphics:Graphics, resolution:uint = 150 ) : void
		{
			
			graphics.lineStyle( 1, 0x1199A1 );
			
			var X:Vector.<Number> = new Vector.<Number>();
			solve( 0.0, X );
			
			graphics.moveTo( X[ 0 ], X[ 1 ] );
			
			for( var i:int = 1; i <= resolution; i++ )
			{
				solve( i / resolution, X );
				graphics.lineTo( X[ 0 ], X[ 1 ] );
			}
			
		}
		
	}
}