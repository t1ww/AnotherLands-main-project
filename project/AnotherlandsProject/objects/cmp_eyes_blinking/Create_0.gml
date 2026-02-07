// cmp_eyes_blinking
persistent = true; // Component stay alive
visible = false; // Component stay hidden

// variables
is_open = true;
blink_frequency = .7; // second

// logic
ts_start_blink = time_source_create(time_source_game, blink_frequency, time_source_units_seconds, function() {
	is_open = false;
	time_source_start(ts_stop_blink);
});
ts_stop_blink = time_source_create(time_source_game, (blink_frequency*.25), time_source_units_seconds, function() {
	is_open = true;
	time_source_start(ts_start_blink);
});
time_source_start(ts_start_blink);