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



class Design_36_36_PauseButton extends ActorScript
{          	
	
public var _NormalAnimation:String;

public var _PressedAnimation:String;

public var _Down:Bool;

public var _HoverAnimation:String;

public var _ActivatedNormalAnimation:String;

public var _Activated:Bool;

public var _ActivatedPressedAnimation:String;

public var _ActivatedHoverAnimation:String;
    public function _customEvent_Toggle():Void
{
        if(scene.isPaused())
{
            scene.unpause();
}

        else
{
            scene.pause();
}

}

    public function _customEvent_UpdateState():Void
{
        if(actor.isMouseOver())
{
            if(_Activated)
{
                actor.setAnimation("" + _ActivatedHoverAnimation);
}

            else
{
                actor.setAnimation("" + _HoverAnimation);
}

}

        else
{
            if(_Activated)
{
                actor.setAnimation("" + _ActivatedNormalAnimation);
}

            else
{
                actor.setAnimation("" + _NormalAnimation);
}

}

}


 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Normal Animation", "_NormalAnimation");
nameMap.set("Pressed Animation", "_PressedAnimation");
nameMap.set("Down", "_Down");
_Down = false;
nameMap.set("Hover Animation", "_HoverAnimation");
nameMap.set("Activated Normal Animation", "_ActivatedNormalAnimation");
nameMap.set("Activated", "_Activated");
_Activated = false;
nameMap.set("Activated Pressed Animation", "_ActivatedPressedAnimation");
nameMap.set("Activated Hover Animation", "_ActivatedHoverAnimation");
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		            actor.anchorToScreen();
    addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void {
if(wrapper.enabled && 3 == mouseState){
        if(_Activated)
{
            actor.setAnimation("" + _ActivatedPressedAnimation);
}

        else
{
            actor.setAnimation("" + _PressedAnimation);
}

        _Down = true;
propertyChanged("_Down", _Down);
}
});
    addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void {
if(wrapper.enabled && 5 == mouseState){
        if(_Down)
{
            _customEvent_Toggle();
}

        if(#if mobile true #else false #end)
{
            if(_Activated)
{
                actor.setAnimation("" + _ActivatedNormalAnimation);
}

            else
{
                actor.setAnimation("" + _NormalAnimation);
}

}

        else
{
            if(_Activated)
{
                actor.setAnimation("" + _ActivatedHoverAnimation);
}

            else
{
                actor.setAnimation("" + _HoverAnimation);
}

}

        _Down = false;
propertyChanged("_Down", _Down);
}
});
    addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void {
if(wrapper.enabled && 1 == mouseState){
        if(_Activated)
{
            actor.setAnimation("" + _ActivatedHoverAnimation);
}

        else
{
            actor.setAnimation("" + _HoverAnimation);
}

}
});
    addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void {
if(wrapper.enabled && -1 == mouseState){
        if(_Activated)
{
            actor.setAnimation("" + _ActivatedNormalAnimation);
}

        else
{
            actor.setAnimation("" + _NormalAnimation);
}

        _Down = false;
propertyChanged("_Down", _Down);
}
});
    addPauseListener(function(paused:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && paused){
        _Activated = true;
propertyChanged("_Activated", _Activated);
        _customEvent_UpdateState();
}
});
    addPauseListener(function(paused:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && !paused){
        _Activated = false;
propertyChanged("_Activated", _Activated);
        _customEvent_UpdateState();
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}