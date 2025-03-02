extends _StateSerializer

static func serialize_full_state(state: _PropertySnapshot, _state_properties: Array[String]) -> PackedByteArray:
	var buffer := StreamPeerBuffer.new()
	for property in _state_properties:
		buffer.put_var(state.get_value(property))
	print("in: ", state.as_dictionary())
	return buffer.data_array

static func deserialize_full_state(data: PackedByteArray, _state_properties: Array[String]) -> _PropertySnapshot:
	var buffer := StreamPeerBuffer.new()
	var state := _PropertySnapshot.new()
	buffer.data_array = data
	for property in _state_properties:
		state.set_value(property, buffer.get_var())
	print("out: ", state.as_dictionary())
	return state
