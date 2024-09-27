package modules;

import flixel.FlxSprite;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.group.FlxGroup.FlxTypedGroup;

function LoadObjects(Rootmap:String, ObjectsLayer:Array<String>)
{
	var ObjectsGroup:FlxTypedGroup<FlxSprite> = new FlxTypedGroup<FlxSprite>();
	final tilemap:TiledMap = new TiledMap(Rootmap);
	for (layer in ObjectsLayer)
	{
		var LayerObjects:TiledObjectLayer = cast(tilemap.getLayer(layer));
		for (object in LayerObjects.objects)
		{
			var object_sprt:FlxSprite = new FlxSprite(object.x, object.y - object.height);
			object_sprt.loadGraphic(object.properties.keys.get("ruta"));
			object_sprt.setSize(object.width, object.height);
			ObjectsGroup.add(object_sprt);
		}
	}
	return ObjectsGroup;
}
function LoadObjectsTouch(Rootmap:String, ObjectsLayer:Array<String>)
{
	var ObjectsGroup:FlxTypedGroup<FlxSprite> = new FlxTypedGroup<FlxSprite>();
	final tilemap:TiledMap = new TiledMap(Rootmap);
	for (layer in ObjectsLayer)
	{
		var LayerObjects:TiledObjectLayer = cast(tilemap.getLayer(layer));
		for (object in LayerObjects.objects)
		{
			var object_sprt:FlxSprite = new FlxSprite(object.x, object.y - object.height);
			object_sprt.loadGraphic(object.properties.keys.get("ruta"));
			object_sprt.setSize(object.width, object.height);
			object_sprt.immovable = true;
			ObjectsGroup.add(object_sprt);
		}
	}
	return ObjectsGroup;
}