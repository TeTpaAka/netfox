extends Node
class_name _StateSerializer

static func serialize_full_state(state: _PropertySnapshot, _state_properties: Array[String]) -> PackedByteArray:
	return PackedByteArray([])

static func deserialize_full_state(data: PackedByteArray, _state_properties: Array[String]) -> _PropertySnapshot:
	return _PropertySnapshot.new()
