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



class Design_39_39_ScoreManager extends SceneScript
{          	
	
public var _ScoreFont:Font;

public var _XOffset:Float;

public var _YOffset:Float;

public var _MinimumDigits:Float;

public var _CurrentScore:Float;

public var _GameAttribute:String;

public var _FormattedScore:String;

public var _CurrentLength:Float;

public var _Persistent:Bool;
    public function _customEvent_FormatScore():Void
{
        _FormattedScore = ("" + _CurrentScore);
propertyChanged("_FormattedScore", _FormattedScore);
        _CurrentLength = asNumber((_MinimumDigits - ("" + _FormattedScore).length));
propertyChanged("_CurrentLength", _CurrentLength);
        for(index0 in 0...Std.int(_CurrentLength))
{
            _FormattedScore = (("" + "0") + ("" + _FormattedScore));
propertyChanged("_FormattedScore", _FormattedScore);
}

}

    public function _customEvent_UpdateGlobalScore():Void
{
        if(_Persistent)
{
            setGameAttribute(_GameAttribute, _CurrentScore);
}

}

    

/* Params are:__Amount */
public function _customBlock_IncrementScore(__Amount:Float):Void
{
        _CurrentScore += __Amount;
propertyChanged("_CurrentScore", _CurrentScore);
        _customEvent_UpdateGlobalScore();
}
    

/* Params are:__Amount */
public function _customBlock_DecrementScore(__Amount:Float):Void
{
        _CurrentScore -= __Amount;
propertyChanged("_CurrentScore", _CurrentScore);
        _customEvent_UpdateGlobalScore();
}
    

/* Params are:__Font */
public function _customBlock_SetScoreFont(__Font:Font):Void
{
        _ScoreFont = __Font;
propertyChanged("_ScoreFont", _ScoreFont);
}
    

/* Params are:__Horizontal __Vertical */
public function _customBlock_SetDrawOffset(__Horizontal:Float, __Vertical:Float):Void
{
        _XOffset = asNumber(__Horizontal);
propertyChanged("_XOffset", _XOffset);
        _YOffset = asNumber(__Vertical);
propertyChanged("_YOffset", _YOffset);
}
    

/* Params are:*/
public function _customBlock_GetXOffset():Float
{
        return _XOffset;
}
    

/* Params are:*/
public function _customBlock_GetYOffset():Float
{
        return _YOffset;
}
    

/* Params are:*/
public function _customBlock_GetScore():Float
{
        return _CurrentScore;
}
    

/* Params are:__Score */
public function _customBlock_SetScore(__Score:Float):Void
{
        _CurrentScore = asNumber(__Score);
propertyChanged("_CurrentScore", _CurrentScore);
        _customEvent_UpdateGlobalScore();
}
    

/* Params are:*/
public function _customBlock_GetFont():Font
{
        return _ScoreFont;
}

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Score Font", "_ScoreFont");
nameMap.set("X Offset", "_XOffset");
_XOffset = 0.0;
nameMap.set("Y Offset", "_YOffset");
_YOffset = 0.0;
nameMap.set("Minimum Digits", "_MinimumDigits");
_MinimumDigits = 0.0;
nameMap.set("Current Score", "_CurrentScore");
_CurrentScore = 0.0;
nameMap.set("Game Attribute", "_GameAttribute");
_GameAttribute = "";
nameMap.set("Formatted Score", "_FormattedScore");
_FormattedScore = "";
nameMap.set("Current Length", "_CurrentLength");
_CurrentLength = 0.0;
nameMap.set("Persistent?", "_Persistent");
_Persistent = false;

	}
	
	override public function init()
	{
		            _CurrentScore = asNumber(0);
propertyChanged("_CurrentScore", _CurrentScore);
        _GameAttribute = "INTERNALGLOBALSCORE";
propertyChanged("_GameAttribute", _GameAttribute);
        if(_Persistent)
{
            if(!(((asNumber((getGameAttribute(_GameAttribute))) <= 0) || (asNumber((getGameAttribute(_GameAttribute))) >= 0))))
{
                setGameAttribute(_GameAttribute, _CurrentScore);
}

            else
{
                _CurrentScore = asNumber(asNumber((getGameAttribute(_GameAttribute))));
propertyChanged("_CurrentScore", _CurrentScore);
}

}

    addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        _customEvent_FormatScore();
        if((hasValue(_ScoreFont) != false))
{
            g.setFont(_ScoreFont);
}

        g.drawString("" + _FormattedScore, _XOffset, _YOffset);
}
});
    runPeriodically(1000 * 1, function(timeTask:TimedTask):Void {
if(wrapper.enabled){
        sayToScene("Score Manager", "_customBlock_IncrementScore", [10]);
}
}, null);

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}