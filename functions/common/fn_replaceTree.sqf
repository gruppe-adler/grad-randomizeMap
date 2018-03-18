params ["_oldTree", "_replacement"];

private _replacetree = ([_replacement] call BIS_fnc_simpleObjectData) select 1;

private _position = getPosWorld _oldTree;
private _vectorDirUp = [vectorDir _oldTree, vectorUp _oldTree];

hideObjectGlobal  _oldTree;
private _simpletree = createSimpleObject [_replacetree, _position];
_simpletree setVectorDirAndUp _vectorDirUp;
_simpletree setDir (getdir _simpletree);
_simpletree enableSimulationGlobal false;
