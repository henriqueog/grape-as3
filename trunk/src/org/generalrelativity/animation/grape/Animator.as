package org.generalrelativity.animation.grape
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.getTimer;
	
	import org.generalrelativity.animation.grape.binding.Binding2D;
	import org.generalrelativity.animation.grape.binding.PropertyBinding;
	import org.generalrelativity.animation.grape.curve.Curve;
	import org.generalrelativity.animation.grape.path.Path;
	import org.generalrelativity.animation.grape.path.Path1D;

	[Event(name="tick", type="Animator")]

	public class Animator extends EventDispatcher
	{
		
		public static const TICK:String = "tick";
		
		private static var instance:Animator;
		
		private var _poolSize:uint = 500;
		private var pool:Vector.<Vector.<Number>>;
		
		private var ticker:Sprite;
		private var animations:Vector.<Animation>;
		
		public function Animator( singletonEnforcer:SingletonEnforcer )
		{
			
			super();
			
			if( instance != null )
			{
				throw new Error( "Can't directly instantiate Animator" );
			}
			
			ticker = new Sprite();
			animations = new Vector.<Animation>();
			
			pool = new Vector.<Vector.<Number>>();
			resizePool();
			
		}
		
		public function addAnimation( animation:Animation ) : void
		{
			animations.push( animation );
			if( !ticker.hasEventListener( Event.ENTER_FRAME ) )
			{
				ticker.addEventListener( Event.ENTER_FRAME, onTick );
			}
		}
		
		public function removeAnimation( animation:Animation ) : void
		{
			var ai:int = animations.indexOf( animation );
			if( ai > -1 )
			{
				animations.splice( ai, 1 );
			}
			
			animation.destroy();
			
		}
		
		public function create2DAnimation( view:DisplayObject, path:Path, duration:uint, start:int, curve:Curve = null, loop:Boolean = false, reverse:Boolean = false, reverseOnLoop:Boolean = false, autoAdd:Boolean = true ) : Animation
		{
			
			if( start < 0 ) start = getTimer();
			
			var animation:Animation = new Animation( path, duration, start, curve, loop, reverse, reverseOnLoop );
			animation.binding = new Binding2D( view );
			
			if( autoAdd ) addAnimation( animation );
			return animation;
			
		}
		
		public function createPropertyAnimation( object:Object, properties:Vector.<String>, targets:Vector.<Number>, duration:uint, start:int, curve:Curve = null, loop:Boolean = false, reverse:Boolean = false, reverseOnLoop:Boolean = false, autoAdd:Boolean = true ) : Animation
		{
			
			if( start < 0 ) start = getTimer();
			
			var begin:Vector.<Number> = new Vector.<Number>();
			for each( var property:String in properties )
			{
				begin.push( object[ property ] );
			}
			
			var path:Path1D = new Path1D( begin, targets );
			
			var animation:Animation = new Animation( path, duration, start, curve, loop, reverse, reverseOnLoop );
			animation.binding = new PropertyBinding( object, properties );
			
			if( autoAdd ) addAnimation( animation );
			return animation;
			
		}
		
		private function onTick( event:Event ) : void
		{
			 
			var time:uint = getTimer();
			
			var n:int = animations.length;
			while( --n > -1 )
			{
				
				var animation:Animation = animations[ n ];
				
				if( time < animation.start ) continue;
				
				var t:Number = ( time - animation.start ) / animation.duration;
				var animationIsExpired:Boolean = false;
				
				if( t >= 1.0 )
				{
					
					if( animation.loop )
					{
						t -= uint( t );
						animation.start += animation.duration;
						if( animation.reverseOnLoop ) animation.reverse = !animation.reverse;
						animation.dispatchEvent( new Event( Animation.LOOP ) );
					}
					else
					{
						t = 1.0;
						animationIsExpired = true;
					}
					
				}
				
				animation.step( t );
				
				if( animationIsExpired )
				{
					animation.dispatchEvent( new Event( Event.COMPLETE ) );
					animation.destroy();
					animations.splice( n, 1 );
				}
				
			}
			
			dispatchEvent( new Event( TICK ) );
			
		}
		
		public function get pointerVector() : Vector.<Number>
		{
			if( !pool.length ) return new Vector.<Number>();
			return pool.pop();
		}
		
		public function returnToPool( pointerVector:Vector.<Number> ) : void
		{
			if( pool.length < _poolSize )
			{
				pool.push( pointerVector );
			}
		}
		
		public function set poolSize( value:uint ) : void
		{
			
			if( _poolSize != value )
			{
				_poolSize = value;
				resizePool();
			}
			
		}
		
		private function resizePool() : void
		{
			
			if( pool.length > _poolSize )
			{
				pool.splice( 0, _poolSize );
			}
			else
			{
				
				while( pool.length < _poolSize )
				{
					pool.push( new Vector.<Number>() );
				}
				
			}
			
		}
		
		public static function getInstance() : Animator
		{
			if( instance == null ) instance = new Animator( new SingletonEnforcer() );
			return instance;
		}
		
	}
}

class SingletonEnforcer{}