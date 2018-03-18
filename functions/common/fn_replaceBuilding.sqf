params ["_oldBuilding", "_replacement"];

private _pos = getPos _oldBuilding;
private _dir = vectorDir _oldBuilding;
private _up = vectorUp _oldBuilding;

hideObjectGlobal _oldBuilding;
_oldBuilding allowDamage false;

private _newBuilding = _replacement createVehicle _pos;
_newBuilding setVectorDirAndUp [_dir, _up];
_newBuilding setPos _pos;
