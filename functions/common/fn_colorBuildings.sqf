if !(isServer) exitWith {};
/*
Replacmentscript
The follwoing parameters have to be passed to the script
- _pos = the center position the script starts from working
- _distance = limits the max search range
*/

params ["_pos", "_distance", ["_building", false], ["_tree", false]];

if (_building) then {
	_housesArray = nearestTerrainObjects [_pos, ["House"], _distance, false, true];

	//sorts the building
	{
		if (isClass (missionConfigFile >> "cfgBuildingReplacement" >> (typeOf _x))) then {
			_replacement = selectRandom (getArray (missionConfigFile >> "cfgBuildingReplacement" >> (typeOf _x) >> "replacementArray"));
			[_x, _replacement] call grad_colorUp_fnc_replaceBuilding;
		};
	}forEach _housesArray;
};

if (_tree) then {
	_housesArray = nearestTerrainObjects [_pos, ["Tree"], _distance, false, true];

	//sorts the building
	{
		if (isClass (missionConfigFile >> "cfgTreeReplacement" >> (typeOf _x))) then {
			_replacement = selectRandom (getArray (missionConfigFile >> "cfgTreeReplacement" >> (typeOf _x) >> "replacementArray"));
			diag_log format ["%1 replaced with %2", (typeOf _x), _replacement];
			systemchat format ["%1 replaced with %2", (typeOf _x), _replacement];
			[_x, _replacement] call grad_colorUp_fnc_replaceBuilding;
		};
	}forEach _housesArray;
};
