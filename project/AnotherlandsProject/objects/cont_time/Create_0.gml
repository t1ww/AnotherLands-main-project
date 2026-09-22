/// @description cont_time Create event
// Variables
ticks_per_second = 60;

tick = 0;
second = 0;
minute = 0;
hour = 0;
day = 0;
month = 0;
year = 2024;

absolute_tick = 0;
inst_string = "";

// Helper functions
refresh_absolute_tick = function() {
	var _tick_part   = tick;
	var _second_part = second * 60;
	var _minute_part = minute * 3600;
	var _hour_part   = hour * 216000;
	var _day_part    = day * 5184000;
	var _month_part  = month * 155520000;
	var _year_part   = year * 1866240000;

	absolute_tick = _tick_part
		+ _second_part
		+ _minute_part
		+ _hour_part
		+ _day_part
		+ _month_part
		+ _year_part;
};

to_string = function() {
	return $"absolute_tick : {absolute_tick},\n"
		+ $"tick        : {tick},\n"
		+ $"second      : {second},\n"
		+ $"minute      : {minute},\n"
		+ $"hour        : {hour},\n"
		+ $"day         : {day + 1},\n"
		+ $"month       : {month + 1},\n"
		+ $"year        : {year}\n";
};

increment = function() {
	var _dt = delta_time / 1_000_000;

	absolute_tick += ticks_per_second * _dt;

	tick   = absolute_tick mod 60;
	second = (absolute_tick div 60) mod 60;
	minute = (absolute_tick div 3600) mod 60;
	hour   = (absolute_tick div 216000) mod 24;
	day    = (absolute_tick div 5184000) mod 30;
	month  = (absolute_tick div 155520000) mod 12;
	year   = absolute_tick div 1866240000;

	inst_string = to_string();
};

// TIME SOURCE
ts_time = time_source_create(
	time_source_game,
	1,
	time_source_units_frames,
	increment,
	[],
	-1
);

// Initialization
refresh_absolute_tick();
time_source_start(ts_time);
