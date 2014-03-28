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



class Design_15_15_JoystickMovement extends ActorScript
{          	
	
public var _Speed:Float;

public var _Slowdown:Float;

public var _Facing:Float;

public var _FixedXPosition:Float;

public var _FixedYPosition:Float;

public var _Fixed:Bool;

public var _JoystickNumber:String;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Speed", "_Speed");
_Speed = 10.0;
nameMap.set("Slowdown", "_Slowdown");
_Slowdown = 0.9;
nameMap.set("Facing", "_Facing");
_Facing = 0.0;
nameMap.set("Fixed X-Position", "_FixedXPosition");
_FixedXPosition = 50.0;
nameMap.set("Fixed Y-Position", "_FixedYPosition");
_FixedYPosition = 50.0;
nameMap.set("Fixed", "_Fixed");
_Fixed = false;
nameMap.set("Joystick Number", "_JoystickNumber");
_JoystickNumber = "";
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		            #if mobile
            if((_JoystickNumber == ("" + 1)))
{
                #if mobile JoystickController.enable(1); #end
                if(_Fixed)
{
                    #if mobile JoystickController.setStyle(1,0); #end
                    #if mobile JoystickController.setX(1,_FixedXPosition); #end
                    #if mobile JoystickController.setY(1,_FixedYPosition); #end
}

                else
{
                    #if mobile JoystickController.setStyle(1,1); #end
}

}

            else if((_JoystickNumber == ("" + 2)))
{
                #if mobile JoystickController.enable(2); #end
                if(_Fixed)
{
                    #if mobile JoystickController.setStyle(2,0); #end
                    #if mobile JoystickController.setX(2,_FixedXPosition); #end
                    #if mobile JoystickController.setY(2,_FixedYPosition); #end
}

                else
{
                    #if mobile JoystickController.setStyle(2,1); #end
}

}

#end
    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        #if mobile
            if(((_JoystickNumber == ("" + 1)) && (Math.abs(#if mobile JoystickController.getDistance(1) #else 0 #end) > 0)))
{
                actor.setAngle(Utils.RAD * ((#if mobile JoystickController.getDirection(1) #else 0 #end + (_Facing + 90))));
                actor.setXVelocity(((Math.sin(Utils.RAD * (#if mobile JoystickController.getDirection(1) #else 0 #end)) * #if mobile JoystickController.getDistance(1) #else 0 #end) * _Speed));
                actor.setYVelocity(((Math.cos(Utils.RAD * (#if mobile JoystickController.getDirection(1) #else 0 #end)) * #if mobile JoystickController.getDistance(1) #else 0 #end) * -(_Speed)));
}

            else if(((_JoystickNumber == ("" + 2)) && (Math.abs(#if mobile JoystickController.getDistance(2) #else 0 #end) > 0)))
{
                actor.setAngle(Utils.RAD * ((#if mobile JoystickController.getDirection(2) #else 0 #end + (_Facing + 90))));
                actor.setXVelocity(((Math.sin(Utils.RAD * (#if mobile JoystickController.getDirection(2) #else 0 #end)) * #if mobile JoystickController.getDistance(2) #else 0 #end) * _Speed));
                actor.setYVelocity(((Math.cos(Utils.RAD * (#if mobile JoystickController.getDirection(2) #else 0 #end)) * #if mobile JoystickController.getDistance(2) #else 0 #end) * -(_Speed)));
}

            else
{
                actor.setXVelocity((actor.getXVelocity() * _Slowdown));
                actor.setYVelocity((actor.getYVelocity() * _Slowdown));
                actor.setAngularVelocity(Utils.RAD * ((Utils.DEG * (actor.getAngularVelocity()) * _Slowdown)));
}

#end
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}