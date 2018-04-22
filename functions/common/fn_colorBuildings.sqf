if !(isServer) exitWith {};
/*
Replacmentscript
The follwoing parameters have to be passed to the script
- _pos = the center position the script starts from working
- _distance = limits the max search range
*/

_pos = [(worldSize /2), (worldSize /2), 0];
_distance = worldSize;

_housesArray = nearestTerrainObjects [_pos, ["House"], _distance, false, true];
Grad_replacedBuildings = [];

//sorts the building
{
	if (isClass (missionConfigFile >> "cfgBuildingReplacement" >> (typeOf _x))) then {
		_replacement = selectRandom (getArray (missionConfigFile >> "cfgBuildingReplacement" >> (typeOf _x) >> "replacementArray"));
		if ((typeOf _X) != _replacement) then {
			[_x, _replacement] call grad_randomizeMap_fnc_replaceBuilding;
			Grad_replacedBuildings pushback _x;
		};
	};
}forEach _housesArray;

publicVariable "Grad_replacedBuildings";
[] remoteExecCall ["grad_randomizeMap_fnc_clientCheck", -2, true];
