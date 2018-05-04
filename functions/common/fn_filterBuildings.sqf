if !(isServer) exitWith {};
//Replacmentscript

_housesArray = nearestTerrainObjects [[(worldSize /2), (worldSize /2), 0], [
		"BUILDING",
		"HOUSE",
		"FENCE",
		"WALL",
		"RUIN"
	],
	 worldSize, false];
Grad_replacedBuildings = [];

//sorts the building
{
	_typeX = (typeOf _x);
	//if () then {
		_replacement = [_typeX] call grad_randomizeMap_fnc_selectBuilding;
		if (!isNil "_replacement" && _typeX != _replacement) then {
	        [_x, _replacement] call grad_randomizeMap_fnc_replaceBuilding;
	        Grad_replacedBuildings pushback _x;
	    };
	//};

	if (isClass (missionConfigFile >> "cfgRuinsList" >> _typeX)) then {
		_replacement = selectRandom (getArray (missionConfigFile >> "cfgRuinsList" >> _typeX >> "replacementArray"));
		if (!isNil "_replacement") then {
	        [_x, _replacement] call grad_randomizeMap_fnc_replaceBuilding;
			Grad_replacedBuildings pushback _x;
		}else{
			diag_log format ["No replacement: %1 - %2 ", _typeX, (getPos _x)];
		};
	};

	if (isClass (missionConfigFile >> "cfgWrecksList" >> _typeX)) then {
		deleteVehicle _x;
	};
}forEach _housesArray;

publicVariable "Grad_replacedBuildings";
[] remoteExecCall ["grad_randomizeMap_fnc_clientCheck", -2, true];
