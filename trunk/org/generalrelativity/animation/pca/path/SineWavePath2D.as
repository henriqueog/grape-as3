package org.generalrelativity.animation.pca.path
{
	import flash.geom.Point;

	/**
	 * Value on sine wave S at t [0,1] = S(t) = sin( freq * t ) * amplitude 
	 * Point on sine wave S at t [0,1] deviating from the line segment, L and normal vector (to L) w:
	 * S(t) = L(t) + sin( freq * t ) * amplitude * w
	 * */
	public class SineWavePath2D extends LinearPath2D
	{
		
		protected var frequency:Number;
		protected var amplitude:Number;
		
		protected var normal:Point;
		
		//frequency is # of wavelenghths traversed
		public function SineWavePath2D( A:Point, B:Point, frequency:Number = 1.0, amplitude:Number = 20.0 )
		{
			
			super( A, B );
			
			this.frequency = frequency * Math.PI * 2;
			this.amplitude = amplitude;
			
			normal = new Point( -v.y, v.x );
			if( normal.x == 0 && normal.y == 0 )
			{
				normal.y = 1.0;
			}
			else normal.normalize( 1 );
			
		}
		
		override public function solve( t:Number, $solution:Vector.<Number> ) : void
		{
			
			var sine:Number = Math.sin( frequency * t ) * amplitude;
			
			$solution[ 0 ] = A.x + v.x * t + normal.x * sine;
			$solution[ 1 ] = A.y + v.y * t + normal.y * sine;
			
		}
		
		
	}
}