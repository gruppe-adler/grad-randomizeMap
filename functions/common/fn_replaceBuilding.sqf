params ["_oldBuilding", "_replacement"];

private _pos = getPos _oldBuilding;
private _dir = getDir _oldBuilding;
private _vectorDir = vectorDir _oldBuilding;
private _up = vectorUp _oldBuilding;

hideObjectGlobal _oldBuilding;
_oldBuilding allowDamage false;
_oldBuilding enableSimulationGlobal false;

private _newBuilding = _replacement createVehicle _pos;
_newBuilding setDir _dir;
_newBuilding setPos _pos;
_newBuilding setVectorDirAndUp [_vectorDir, _up];
