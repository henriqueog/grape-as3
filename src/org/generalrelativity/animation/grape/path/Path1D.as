package org.generalrelativity.animation.grape.path
{
	

	public class Path1D extends Path
	{
		
		private var begin:Vector.<Number>;
		private var end:Vector.<Number>;
		
		public function Path1D( begin:Vector.<Number>, end:Vector.<Number> )
		{
			
			super();
			
			this.begin = begin;
			this.end = end;
			
		}
		
		override public function solve( t:Number, $solution:Vector.<Number> ) : void
		{
			
			var n:int = begin.length;
			var i:int = -1;
			
			while( ++i < n )
			{
				$solution[ i ] = begin[ i ] + ( end[ i ] - begin[ i ] ) * t;
			}
			
		}
		
	}
}