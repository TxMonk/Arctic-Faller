package scripts;

import com.stencyl.graphics.G;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.utils.Utils;

import nme.ui.Mouse;
import nme.display.Graphics;
import nme.display.BlendMode;
import nme.events.Event;
import nme.events.TouchEvent;
import nme.net.URLLoader;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

            import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Fixture;
import box2D.collision.shapes.B2Shape;
import box2D.collision.shapes.B2CircleShape;
import box2D.collision.shapes.B2PolygonShape;


class Design_38_38_DrawTerrain extends SceneScript
{          	
	
public var _OutlineThickness:Float;

public var _OutlineColor:Int;

public var _FillColor:Int;

public var _Fill:Bool;

public var _TerrainList:Array<Dynamic>;

public var _Outline:Bool;

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Outline Thickness", "_OutlineThickness");
_OutlineThickness = 1.0;
nameMap.set("Outline Color", "_OutlineColor");
_OutlineColor = Utils.getColorRGB(153,51,0);
nameMap.set("Fill Color", "_FillColor");
_FillColor = Utils.getColorRGB(255,204,153);
nameMap.set("Fill", "_Fill");
_Fill = true;
nameMap.set("Terrain List", "_TerrainList");
_TerrainList = [];
nameMap.set("Outline", "_Outline");
_Outline = true;

	}
	
	override public function init()
	{
		    addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(_Outline)
{
            g.setFont(getFont(92));
            g.strokeSize = Std.int((_OutlineThickness * 2));
            g.strokeColor = _OutlineColor;
            for (terrain in engine.getTerrainRegions())
{
	var position:B2Vec2 = terrain.getBody().getPosition();

	var fixture:B2Fixture = terrain.getBody().getFixtureList();
	
	while(fixture != null)
	{
		var shape:B2Shape = fixture.getShape();

		if(Std.is(shape, B2CircleShape))
		{
			var circleShape:B2CircleShape = cast(shape, B2CircleShape);
			g.drawCircle(Engine.toPixelUnits(position.x), Engine.toPixelUnits(position.y), Engine.toPixelUnits(circleShape.getRadius()));
		}
		else if(Std.is(shape, B2PolygonShape))
		{
			var polygonShape:B2PolygonShape = cast(shape, B2PolygonShape);

			var vertices:Array<B2Vec2> = polygonShape.getVertices();

			g.beginDrawPolygon();
			for (vertex in vertices)
			{
				g.addPointToPolygon(Engine.toPixelUnits(position.x + vertex.x), Engine.toPixelUnits(position.y + vertex.y));
			}
			g.endDrawingPolygon();
		}

		fixture = fixture.getNext();
	}
}
}

        if(_Fill)
{
            g.fillColor = _FillColor;
            g.strokeSize = Std.int(0);
            g.strokeColor = _FillColor;
            for (terrain in engine.getTerrainRegions())
{
	var position:B2Vec2 = terrain.getBody().getPosition();

	var fixture:B2Fixture = terrain.getBody().getFixtureList();
	
	while(fixture != null)
	{
		var shape:B2Shape = fixture.getShape();

		if(Std.is(shape, B2CircleShape))
		{
			var circleShape:B2CircleShape = cast(shape, B2CircleShape);
			g.fillCircle(Engine.toPixelUnits(position.x), Engine.toPixelUnits(position.y), Engine.toPixelUnits(circleShape.getRadius()));
		}
		else if(Std.is(shape, B2PolygonShape))
		{
			var polygonShape:B2PolygonShape = cast(shape, B2PolygonShape);

			var vertices:Array<B2Vec2> = polygonShape.getVertices();

			g.beginFillPolygon();
			for (vertex in vertices)
			{
				g.addPointToPolygon(Engine.toPixelUnits(position.x + vertex.x), Engine.toPixelUnits(position.y + vertex.y));
			}
			g.endDrawingPolygon();
		}

		fixture = fixture.getNext();
	}
}
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}