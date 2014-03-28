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



class SceneEvents_0 extends SceneScript
{          	
	
public var _Time:Float;

public var _I:Float;

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Time", "_Time");
_Time = 0.0;
nameMap.set("I", "_I");
_I = 0.0;

	}
	
	override public function init()
	{
		            createRecycledActor(getActorType(2), 320, 320, Script.FRONT);
    addSceneCollisionListener(getActorType(2).ID, getActorType(0).ID, function(event:Collision, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        recycleActor(event.otherActor);
        switchScene(1, null,createCrossfadeTransition((2)));
}
});
    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        showMobileAd();
}
});
    runPeriodically(1000 * 1.5, function(timeTask:TimedTask):Void {
if(wrapper.enabled){
        createRecycledActor(getActorType(2), randomInt(Math.floor(0), Math.floor((320 - getLastCreatedActor().getWidth()))), (getScreenHeight() - 1), Script.FRONT);
}
}, null);

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}