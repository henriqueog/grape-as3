package org.generalrelativity.animation.grape.binding
{
	public class PropertyBinding extends Binding
	{
		
		private var object:Object;
		private var properties:Vector.<String>;
		
		public function PropertyBinding( object:Object, properties:Vector.<String> )
		{
			
			this.object = object;
			this.properties = properties;
			
		}
		
		
		override public function bind( state:Vector.<Number> ) : void
		{
			
			var n:int = properties.length;
			
			while( --n >= 0 )
			{
				object[ properties[ n ] ] = state[ n ];
			}
			
		}
		
	}
}