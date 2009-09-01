package org.generalrelativity.animation.pca
{
	import flash.events.EventDispatcher;
	
	import org.generalrelativity.animation.pca.binding.Binding;
	import org.generalrelativity.animation.pca.curve.Curve;
	import org.generalrelativity.animation.pca.path.Path;

	[Event(name="complete", type="flash.events.Event")]
	[Event(name="loop", type="Animation")]

	final public class Animation extends EventDispatcher
	{
		
		public static const LOOP:String = "loop";
		
		public var start:uint;
		public var duration:uint;
		
		public var loop:Boolean;
		public var reverse:Boolean;
		public var reverseOnLoop:Boolean;
		
		public var curve:Curve;
		public var path:Path;
		
		public var binding:Binding;
		
		public var state:Vector.<Number>;
		
		public function Animation( path:Path, duration:uint, start:uint, curve:Curve = null, loop:Boolean = false, reverse:Boolean = false, reverseOnLoop:Boolean = false )
		{
			
			super();
			
			this.start = start;
			this.duration = duration;
			this.path = path;
			this.curve = curve || new Curve();
			this.loop = loop;
			this.reverse = reverse;
			this.reverseOnLoop = reverseOnLoop;
			
			state = Animator.getInstance().pointerVector;
			
		}
		
		final internal function step( t:Number ) : void
		{
			
			if( reverse ) t = 1.0 - t;
			
			t = curve.getT( t );
			path.solve( t, state );
			
			if( binding ) binding.bind( state );
			
		}
		
		final internal function destroy() : void
		{
			binding = null;
			path = null;
			curve = null;
			Animator.getInstance().returnToPool( state );
			state = null;
		}
		
	}
}