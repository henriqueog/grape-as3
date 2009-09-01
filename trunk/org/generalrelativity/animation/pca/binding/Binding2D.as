package org.generalrelativity.animation.pca.binding
{
	import flash.display.DisplayObject;

	public class Binding2D extends Binding
	{
		
		private var view:DisplayObject;
		
		public function Binding2D( view:DisplayObject )
		{
			super();
			this.view = view;
		}
		
		override public function bind( state:Vector.<Number> ) : void
		{
			view.x = state[ 0 ];
			view.y = state[ 1 ];
		}
		
	}
}