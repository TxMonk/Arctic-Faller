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



class Design_13_13_2WayHorizontalMovement extends ActorScript
{          	
	
public var _RightControl:String;

public var _LeftControl:String;

public var _UseControls:Bool;

public var _PreventVerticalMovement:Bool;

public var _MoveX:Float;

public var _LeftAnimation:String;

public var _RightAnimationIdle:String;

public var _StartY:Float;

public var _Speed:Float;

public var _LeftAnimationIdle:String;

public var _StopTurning:Bool;

public var _RightAnimation:String;

public var _UseAnimations:Bool;
    public function _customEvent_MoveLeft():Void
{
        _MoveX = asNumber(-1);
propertyChanged("_MoveX", _MoveX);
}

    public function _customEvent_MoveRight():Void
{
        _MoveX = asNumber(1);
propertyChanged("_MoveX", _MoveX);
}


 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Right Control", "_RightControl");
nameMap.set("Left Control", "_LeftControl");
nameMap.set("Use Controls", "_UseControls");
_UseControls = true;
nameMap.set("Prevent Vertical Movement", "_PreventVerticalMovement");
_PreventVerticalMovement = false;
nameMap.set("Move X", "_MoveX");
_MoveX = 0.0;
nameMap.set("Left Animation", "_LeftAnimation");
nameMap.set("Right Animation (Idle)", "_RightAnimationIdle");
nameMap.set("Start Y", "_StartY");
_StartY = 0.0;
nameMap.set("Speed", "_Speed");
_Speed = 30.0;
nameMap.set("Left Animation (Idle)", "_LeftAnimationIdle");
nameMap.set("Stop Turning", "_StopTurning");
_StopTurning = true;
nameMap.set("Right Animation", "_RightAnimation");
nameMap.set("Use Animations", "_UseAnimations");
_UseAnimations = true;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		            _StartY = asNumber(actor.getY());
propertyChanged("_StartY", _StartY);
    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(_UseControls)
{
            _MoveX = asNumber((asNumber(isKeyDown(_RightControl)) - asNumber(isKeyDown(_LeftControl))));
propertyChanged("_MoveX", _MoveX);
}

        actor.setXVelocity((_MoveX * _Speed));
        if(_PreventVerticalMovement)
{
            actor.setY(_StartY);
            actor.setYVelocity(0);
}

        if((_StopTurning && !(_MoveX == 0)))
{
            actor.setAngularVelocity(Utils.RAD * (0));
}

        _MoveX = asNumber(0);
propertyChanged("_MoveX", _MoveX);
        if(_UseAnimations)
{
            if((actor.getXVelocity() == 0))
{
                if((actor.getAnimation() == _LeftAnimation))
{
                    actor.setAnimation("" + _LeftAnimationIdle);
}

                else if((actor.getAnimation() == _RightAnimation))
{
                    actor.setAnimation("" + _RightAnimationIdle);
}

}

            else if((actor.getXVelocity() < 0))
{
                actor.setAnimation("" + _LeftAnimation);
}

            else if((actor.getXVelocity() > 0))
{
                actor.setAnimation("" + _RightAnimation);
}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}