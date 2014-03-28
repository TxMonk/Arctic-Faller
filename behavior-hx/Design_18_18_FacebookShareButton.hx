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



class Design_18_18_FacebookShareButton extends ActorScript
{          	
	
public var _URL:String;

public var _URLtoShare:String;

public var _NormalAnimation:String;

public var _PressedAnimation:String;

public var _Down:Bool;

public var _HoverAnimation:String;
    public function _customEvent_Action():Void
{
        _URL = (("" + "https://www.facebook.com/sharer.php?u=") + ("" + StringTools.urlEncode(_URLtoShare)));
propertyChanged("_URL", _URL);
        openURLInBrowser(_URL);
}


 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("URL", "_URL");
_URL = "";
nameMap.set("URL to Share", "_URLtoShare");
_URLtoShare = "http://www.stencyl.com";
nameMap.set("Normal Animation", "_NormalAnimation");
nameMap.set("Pressed Animation", "_PressedAnimation");
nameMap.set("Down", "_Down");
_Down = false;
nameMap.set("Hover Animation", "_HoverAnimation");
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		            actor.anchorToScreen();
    addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void {
if(wrapper.enabled && 3 == mouseState){
        actor.setAnimation("" + _PressedAnimation);
        _Down = true;
propertyChanged("_Down", _Down);
}
});
    addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void {
if(wrapper.enabled && 5 == mouseState){
        if(_Down)
{
            _customEvent_Action();
}

        if(#if mobile true #else false #end)
{
            actor.setAnimation("" + _NormalAnimation);
}

        else
{
            actor.setAnimation("" + _HoverAnimation);
}

        _Down = false;
propertyChanged("_Down", _Down);
}
});
    addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void {
if(wrapper.enabled && 1 == mouseState){
        actor.setAnimation("" + _HoverAnimation);
}
});
    addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void {
if(wrapper.enabled && -1 == mouseState){
        actor.setAnimation("" + _NormalAnimation);
        _Down = false;
propertyChanged("_Down", _Down);
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}