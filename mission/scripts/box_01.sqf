//0 = [this] execVM "mission\scripts\box_01.sqf";
params ["_box"];

if (!isServer) exitWith {};

waitUntil {time > 0};

clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addItemCargoGlobal ["DemoCharge_Remote_Mag", 4];
_box addItemCargoGlobal ["ACE_Clacker", 1];