if !(hasInterface) exitWith {};

{
    if !(isObjectHidden _x) then {
        hideObject _x;
    };
}forEach Grad_replacedBuildings;
