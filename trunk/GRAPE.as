package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Point;
	
	import org.generalrelativity.animation.pca.Animator;
	import org.generalrelativity.animation.pca.curve.PennerCurve;
	import org.generalrelativity.animation.pca.path.CirclePath2D;
	import org.generalrelativity.animation.pca.path.ComplexPath2D;
	import org.generalrelativity.animation.pca.path.CubicBezierPath2D;
	import org.generalrelativity.animation.pca.path.LinearPath2D;
	import org.generalrelativity.animation.pca.path.Path;
	import org.generalrelativity.animation.pca.path.PhysicsPath2D;
	import org.generalrelativity.animation.pca.path.SineWavePath2D;
	import org.generalrelativity.animation.pca.path.SpiralPath2D;

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
			
			var cp1:CirclePath2D = new CirclePath2D( new Point( 300, 300 ), 100 );
			var cp2:CirclePath2D = new CirclePath2D( new Point( 500, 300 ), 100, Math.PI * 3, Math.PI );
			var cp3:CirclePath2D = new CirclePath2D( new Point( 600, 300 ), 200, Math.PI * 3, Math.PI );
			var curve:PennerCurve = new PennerCurve( PennerCurve.easeInExpo );
			var complexPath:ComplexPath2D = new ComplexPath2D( Vector.<Path>( [ cp1, cp2, cp3 ] ), Vector.<Number>( [ 0, 0.25, 0.5 ] ) );
			
			var swp:SineWavePath2D = new SineWavePath2D( new Point( 100, 100 ), new Point( 100, 100 ), 3, 50 );
			var spiralPath:SpiralPath2D = new SpiralPath2D( new Point( 200, 300 ), 200, 0, 0 );
			var sp2:SpiralPath2D = new SpiralPath2D( new Point( 200, 300 ), 0, 200, 0 );
			var l:LinearPath2D = new LinearPath2D( new Point( 600, 600 ), new Point( 400, 300 ) );
			complexPath = new ComplexPath2D( Vector.<Path>( [ spiralPath, sp2, complexPath, l ] ), Vector.<Number>( [ 0, 0.25, 0.5, 0.9 ] ) );
			
			var bezierPath:CubicBezierPath2D = new CubicBezierPath2D( new Point( 100, 100 ), new Point( 400, 100 ), new Point( 1400, 600 ), new Point( 400, 600 ), true );
			var bezierPath2:CubicBezierPath2D = new CubicBezierPath2D( new Point( 100, 100 ), new Point( 400, 100 ), new Point( 1400, 600 ), new Point( 400, 600 ) );
			
			var animator:Animator = Animator.getInstance();
			animator.create2DAnimation( shape, bezierPath, 3000, -1, curve, true, false, true );
			animator.createPropertyAnimation( shape2, Vector.<String>( [ "x" ] ), Vector.<Number>( [ 700 ] ), 3000, -1, null, true, false, true );
			
			var path:PhysicsPath2D = new PhysicsPath2D( new Point( 100, 300 ), new Point( 120, -250 ), new Point( 0, 120 ), 5 );
			
			
		}
	}
}