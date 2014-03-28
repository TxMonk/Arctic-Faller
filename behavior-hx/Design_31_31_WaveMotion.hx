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



class Design_31_31_WaveMotion extends ActorScript
{          	
	
public var _StartX:Float;

public var _Wavelength:Float;

public var _Amplitude:Float;

public var _Direction:String;

public var _StartY:Float;

public var _StartingSpeed:Float;

public var _Wavenumber:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Start X", "_StartX");
_StartX = 0.0;
nameMap.set("Wavelength", "_Wavelength");
_Wavelength = 128.0;
nameMap.set("Amplitude", "_Amplitude");
_Amplitude = 64.0;
nameMap.set("Direction", "_Direction");
_Direction = "Horizontal";
nameMap.set("Start Y", "_StartY");
_StartY = 0.0;
nameMap.set("Starting Speed", "_StartingSpeed");
_StartingSpeed = 5.0;
nameMap.set("Wavenumber", "_Wavenumber");
_Wavenumber = 0.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		            actor.makeAlwaysSimulate();
        _Wavenumber = asNumber(((2 * Math.PI) / _Wavelength));
propertyChanged("_Wavenumber", _Wavenumber);
        _StartX = asNumber(actor.getXCenter());
propertyChanged("_StartX", _StartX);
        _StartY = asNumber(actor.getYCenter());
propertyChanged("_StartY", _StartY);
        if((_Direction == "Horizontal"))
{
            actor.setXVelocity(_StartingSpeed);
}

        else
{
            actor.setYVelocity(_StartingSpeed);
}

    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((_Direction == "Horizontal"))
{
            actor.setY((_StartY + ((_Amplitude * Math.sin((_Wavenumber * (_StartX - actor.getXCenter())))) - actor.getHeight()/2)));
}

        else if((_Direction == "Vertical"))
{
            actor.setX((_StartX + ((_Amplitude * Math.sin((_Wavenumber * (_StartY - actor.getYCenter())))) - actor.getWidth()/2)));
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}