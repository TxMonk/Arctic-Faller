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



class Design_33_33_EmphasiseOnMouseOver extends ActorScript
{          	
	
public var _TypeOfEmphasis:String;

public var _EmphasisTime:Float;

public var _EmphasisAmount:Float;

public var _TintingColour:Int;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Type Of Emphasis", "_TypeOfEmphasis");
_TypeOfEmphasis = "";
nameMap.set("Emphasis Time", "_EmphasisTime");
_EmphasisTime = 1.0;
nameMap.set("Emphasis Amount", "_EmphasisAmount");
_EmphasisAmount = 50.0;
nameMap.set("Tinting Colour", "_TintingColour");
_TintingColour = Utils.getColorRGB(255,0,0);
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void {
if(wrapper.enabled && 1 == mouseState){
        if((_TypeOfEmphasis == "Fade"))
{
            actor.fadeTo((100 - _EmphasisAmount) / 100, _EmphasisTime, Linear.easeNone);
}

        else if((_TypeOfEmphasis == "Grow"))
{
            actor.growTo((100 + _EmphasisAmount)/100, (100 + _EmphasisAmount)/100, _EmphasisTime, Linear.easeNone);
}

        else if((_TypeOfEmphasis == "Shrink"))
{
            actor.growTo((100 - _EmphasisAmount)/100, (100 - _EmphasisAmount)/100, _EmphasisTime, Linear.easeNone);
}

        else if((_TypeOfEmphasis == "Turn Clockwise"))
{
            actor.setAngle(Utils.RAD * ((360 * (_EmphasisAmount / 100))));
}

        else if((_TypeOfEmphasis == "Turn Anti-Clockwise"))
{
            actor.setAngle(Utils.RAD * (-((360 * (_EmphasisAmount / 100)))));
}

        else if((_TypeOfEmphasis == "Brighten"))
{
            actor.setFilter([createBrightnessFilter(_EmphasisAmount)]);
}

        else if((_TypeOfEmphasis == "Darken"))
{
            actor.setFilter([createBrightnessFilter(-(_EmphasisAmount))]);
}

        else if((_TypeOfEmphasis == "Tint"))
{
            actor.setFilter([createTintFilter(_TintingColour, _EmphasisAmount/100)]);
}

        else if((_TypeOfEmphasis == "Grayscale"))
{
            actor.setFilter([createGrayscaleFilter()]);
}

        else if((_TypeOfEmphasis == "Negative"))
{
            actor.setFilter([createNegativeFilter()]);
}

        else if((_TypeOfEmphasis == "Sepia"))
{
            actor.setFilter([createSepiaFilter()]);
}

}
});
    addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void {
if(wrapper.enabled && -1 == mouseState){
        if((_TypeOfEmphasis == "Fade"))
{
            actor.fadeTo(100 / 100, _EmphasisTime, Linear.easeNone);
}

        else if((_TypeOfEmphasis == "Grow"))
{
            actor.growTo(100/100, 100/100, _EmphasisTime, Linear.easeNone);
}

        else if((_TypeOfEmphasis == "Shrink"))
{
            actor.growTo(100/100, 100/100, _EmphasisTime, Linear.easeNone);
}

        else if((_TypeOfEmphasis == "Turn Clockwise"))
{
            actor.setAngle(Utils.RAD * (0));
}

        else if((_TypeOfEmphasis == "Turn Anti-Clockwise"))
{
            actor.setAngle(Utils.RAD * (0));
}

        else if((_TypeOfEmphasis == "Brighten"))
{
            actor.clearFilters();
}

        else if((_TypeOfEmphasis == "Darken"))
{
            actor.clearFilters();
}

        else if((_TypeOfEmphasis == "Tint"))
{
            actor.clearFilters();
}

        else if((_TypeOfEmphasis == "Grayscale"))
{
            actor.clearFilters();
}

        else if((_TypeOfEmphasis == "Negative"))
{
            actor.clearFilters();
}

        else if((_TypeOfEmphasis == "Sepia"))
{
            actor.clearFilters();
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}