package org.generalrelativity.animation.grape.path
{
	

	public class ComplexPath2D extends Path
	{
		
		private var paths:Vector.<Path>;
		private var cues:Vector.<Number>;
		
		public function ComplexPath2D( paths:Vector.<Path>, cues:Vector.<Number> )
		{
			
			super();
			
			this.paths = paths;
			this.cues = cues;
			
			cues[ 0 ] = 0.0; //has to be first
			
			var lastCue:Number;
			
			for each( var cue:Number in cues )
			{
				if( cue < 0 || cue > 1.0 )
				{
					throw new Error( "Cues must be in range of 0 to 1" );
				}
				
				if( !isNaN( lastCue ) )
				{
					if( lastCue > cue )
					{
						throw new Error( "Cues must be chronological" );
					}
				} 
				
			}
			
			if( cues.length != paths.length )
			{
				throw new Error( "Path and cue length must be the same" );
			}
			
		}
		
		override public function solve( t:Number, $solution:Vector.<Number> ) : void
		{
			
			var n:int = cues.length;
			var index:uint = n - 1;
			var weight:Number = 1.0 - cues[ index ];
			
			for( var i:int = 1; i < n; i++ )
			{
				
				if( cues[ i ] > t )
				{
					index = i - 1;
					weight = cues[ i ] - cues[ index ];
					break;
				}
				
			}
			
			paths[ index ].solve( ( t - cues[ index ] ) / weight, $solution );
			
		}
		
	}
}