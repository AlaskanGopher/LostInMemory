tool
extends EditorImportPlugin

enum Presets { DEFAULT }

func get_importer_name():
	return "tiled.tilemap"

func get_visible_name():
	return "Tiled TileMap"

func get_recognized_extensions():
	return ["tmx"]

func get_resource_type():
	return "TileMap"

func get_save_extension():
	return "tilemap"


func get_preset_name(preset):
	match preset:
		Presets.DEFAULT:
			return "Default" # ???
		_:
			return "Unknown"

func get_import_options(preset):
	match preset:
		Presets.DEFAULT: # ???
			pass
		_:
			return []

func import(source_file, save_path, options, r_platform_variants, r_gen_files):
	var file = XMLParser.new()
	var err = file.open(source_file)
	if err != OK:
		return err
	
	while file.read() == 0:
		var attributes = file.get_attribute_count()
		var nodeType = file.get_node_type()
		if nodeType == file.NODE_TEXT:
			for i in range(attributes):
				print(file.get_attribute_name(i))
	
