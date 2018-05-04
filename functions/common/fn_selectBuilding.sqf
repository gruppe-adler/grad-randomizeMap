params ["_original"];

_replacement = nil;
if (isClass (missionConfigFile >> "cfgBuildingReplacement" >> _original)) then {
    _replacement = selectRandom (getArray (missionConfigFile >> "cfgBuildingReplacement" >> _original >> "replacementArray"));
};
_replacement
