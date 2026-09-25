// This function takes in an array of instances or object_index and destroy all of them
function instance_destroy_from_array(_array){
	for (var i = 0; i < array_length(_array); i++) {
		with (_array[i]) {
			instance_destroy();
		}
	}
}
