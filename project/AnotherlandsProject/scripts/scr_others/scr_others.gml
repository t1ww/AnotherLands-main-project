// Taken from others :

// sine waves function from > https://gm48.net/resource/33/sine-waves-make-your-game-prettier
function sine_wave(_time, _period, _amplitude, _midpoint) {
    return sin(_time * 2 * pi / _period) * _amplitude + _midpoint;
}