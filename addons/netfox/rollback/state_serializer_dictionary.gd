extends _StateSerializer

static func serialize_full_state(state: _PropertySnapshot, _state_properties: Array[String]) -> PackedByteArray:
	var buffer := StreamPeerBuffer.new()
	buffer.put_var(state.as_dictionary())
	return buffer.data_array

static func deserialize_full_state(data: PackedByteArray, _state_properties: Array[String]) -> _PropertySnapshot:
	var buffer := StreamPeerBuffer.new()
	buffer.data_array = data
	var state = buffer.get_var()
	if not state is Dictionary:
		return _PropertySnapshot.new()
	return _PropertySnapshot.from_dictionary(state)
