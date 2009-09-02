package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Point;
	
	import org.generalrelativity.animation.grape.Grape;
	import org.generalrelativity.animation.grape.path.CatmullRomSplinePath2D;
	import org.generalrelativity.animation.grape.path.CosineSplinePath2D;
	import org.generalrelativity.animation.grape.path.CubicBezierPath2D;
	import org.generalrelativity.animation.grape.path.LinearSplinePath2D;

	[SWF(backgroundColor="#ECECEC", frameRate=60)]
	public class GRAPE extends Sprite
	{
		public function GRAPE()
		{
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill( 0, 0.8 );
			shape.graphics.drawRect( -20, -20, 40, 40 );
			addChild( shape );
			
			
			var shape2:Shape = new Shape();
			shape2.graphics.beginFill( 0xFF0000, 0.8 );
			shape2.graphics.drawRect( -20, -20, 40, 40 );
			addChild( shape2 );
			
			var lp:LinearSplinePath2D = new LinearSplinePath2D( Vector.<Number>( [ 100, 100, 300, 300, 400, 50, 500, 600 ] ) );
			var sp:CosineSplinePath2D = new CosineSplinePath2D( Vector.<Number>( [ 100, 100, 300, 300, 400, 50, 500, 600 ] ) );
			var cp:CatmullRomSplinePath2D = new CatmullRomSplinePath2D( Vector.<Number>( [ 100, 100, 200, 200, 300, 100, 400, 300 ] ) );
			
			var bezierPath:CubicBezierPath2D = new CubicBezierPath2D( new Point( 100, 100 ), new Point( 400, 100 ), new Point( 1400, 600 ), new Point( 400, 600 ), true );
			var bezierPath2:CubicBezierPath2D = new CubicBezierPath2D( new Point( 100, 100 ), new Point( 400, 100 ), new Point( 1400, 600 ), new Point( 400, 600 ) );
			
			sp.render( graphics );
			lp.render( graphics );
			cp.render( graphics );
			
			var animator:Grape = Grape.getInstance();
			animator.create2DAnimation( shape, cp, 3000, -1, null, true, false, true );
			//animator.create2DAnimation( shape2, bezierPath2, 3000, -1, null, true, false, true );
			
			
		}
	}
}