function projectile_reduce_durability(_projectile, _amount) {
	with (_projectile) {
		var _next_durability = durability - _amount;
		
		if (_next_durability <= 0) {
			projectile_ded();
		}
		
		durability = _next_durability;
	}
}
