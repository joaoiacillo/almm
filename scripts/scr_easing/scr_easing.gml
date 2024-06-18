function ease_out_back(_inputvalue, _outputmin, _outputmax, _inputmax)
{
	var _s = 1.70158;

	_inputvalue /= _inputmax - 1;
	return _outputmax * (_inputvalue * _inputvalue * ((_s + 1) * _inputvalue + _s) + 1) + _outputmin;
}
