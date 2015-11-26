_unit = (_this select 0);
_side = _this select 1;

_loadoutArray = [];

waituntil {!isNil "loadoutArray" or !isNil "loadoutArray_west" or !isNil "loadoutArray_east" or !isNil "loadoutArray_guer" or !isNil "loadoutArray_civ"};

if (!isNil "_side") then {
switch (_side) do {
	case "WEST": {
	if (!isNil "loadoutArray_west") then
	{
	_loadoutArray = loadoutArray_west;
	}
	else
	{
	_loadoutArray = loadoutArray;
	};
	};
	
	case "EAST": {
	if (!isNil "loadoutArray_east") then
	{
	_loadoutArray = loadoutArray_east;
	}
	else
	{
	_loadoutArray = loadoutArray;
	};
	};
	
	case "GUER": {
	if (!isNil "loadoutArray_guer") then
	{
	_loadoutArray = loadoutArray_guer;
	}
	else
	{
	_loadoutArray = loadoutArray;
	};
	};
	
	case "CIV": {
	if (!isNil "loadoutArray_civ") then
	{
	_loadoutArray = loadoutArray_civ;
	}
	else
	{
	_loadoutArray = loadoutArray;
	};
	};
	
	default {
	_loadoutArray = loadoutArray;
	};
};
}
else
{
_side = str (side _unit);

switch (_side) do {
	case "WEST": {
	if (!isNil "loadoutArray_west") then
	{
	_loadoutArray = loadoutArray_west;
	}
	else
	{
	_loadoutArray = loadoutArray;
	};
	};
	
	case "EAST": {
	if (!isNil "loadoutArray_east") then
	{
	_loadoutArray = loadoutArray_east;
	}
	else
	{
	_loadoutArray = loadoutArray;
	};
	};
	
	case "GUER": {
	if (!isNil "loadoutArray_guer") then
	{
	_loadoutArray = loadoutArray_guer;
	}
	else
	{
	_loadoutArray = loadoutArray;
	};
	};
	
	case "CIV": {
	if (!isNil "loadoutArray_civ") then
	{
	_loadoutArray = loadoutArray_civ;
	}
	else
	{
	_loadoutArray = loadoutArray;
	};
	};
	
	default {
	_loadoutArray = loadoutArray;
	};
};
};

if (!isServer) exitWith {};
clearMagazineCargoGlobal _unit;
clearWeaponCargoGlobal _unit;
clearitemcargoGlobal _unit;
clearBackpackCargoGlobal _unit;

_unit setvariable ["ALiVE_SYS_GC_IGNORE",true];

if (count _loadoutArray == 0) exitWith {};

_rifleArray = ((_loadoutArray select 8) call BIS_fnc_selectRandom);
_rifle = _rifleArray select 0;
_rifleMags = _rifleArray select 1;
_rifleDevices = _rifleArray select 2;

_glRifleArray = (_loadoutArray select 9);
_glRifle = _glRifleArray select 0;
_glRifleMags = _glRifleArray select 1;
_glGrenade = _glRifleArray select 2;
_glRifleDevices = _glRifleArray select 3;

_allRifleMags = [];

_riflesArray = (_loadoutArray select 8);
{
_allRifleMags = _allRifleMags + [_x select 1];
} foreach _riflesArray;

_allRifleMags = _allRifleMags + [_glRifleMags];

_MGArray = (_loadoutArray select 10);
_MG = _MGArray select 0;
_MGMags = _MGArray select 1;
_MGDevices = _MGArray select 2;

_marksmanRifleArray = (_loadoutArray select 11);
_marksmanRifle = _marksmanRifleArray select 0;
_marksmanMags = _marksmanRifleArray select 1;
_marksmanDevices = _marksmanRifleArray select 2;

_atSingleShot = (_loadoutArray select 12);

_atReloadableArray = (_loadoutArray select 13);
_atReloadable = _atReloadableArray select 0;
_atMags = _atReloadableArray select 1;
_atDevices = _atReloadableArray select 2;

_aaArray = (_loadoutArray select 14);
_aa = _aaArray select 0;
_aaMags = _aaArray select 1;

_grenadesArray = (_loadoutArray select 15);
_lethalGrenades = _grenadesArray select 0;
_nonLethalGrenades = _grenadesArray select 1;

_handgunArray = (_loadoutArray select 16);
_handgun = _handgunArray select 0;
_handgunMags = _handgunArray select 1;
_handgunDevices = _handgunArray select 2;

_unit addItemCargoGlobal ["ToolKit", 1];

_unit addItemCargoGlobal ["ACE_elasticBandage", 100];
_unit addItemCargoGlobal ["ACE_quikclot", 100];
_unit addItemCargoGlobal ["ACE_morphine", 25];
_unit addItemCargoGlobal ["ACE_epinephrine", 25];
_unit addItemCargoGlobal ["ACE_atropine", 25];
_unit addItemCargoGlobal ["ACE_tourniquet", 10];
_unit addItemCargoGlobal ["ACE_salineIV_500", 5];
_unit addItemCargoGlobal ["ACE_personalAidKit", 10];

if (!(_atSingleShot isEqualTo "")) then {
_unit addWeaponCargoGlobal [_atSingleShot, 2];
};

{
if (!(_x isEqualTo "")) then {
_unit addMagazineCargoGlobal [_x, 10];
};
} foreach _allRifleMags;

if (!(_MGMags isEqualTo "")) then {
_unit addMagazineCargoGlobal [_MGMags, 10];
};

if (!(_marksmanMags isEqualTo "")) then {
_unit addMagazineCargoGlobal [_marksmanMags, 5];
};

if (!(_glGrenade isEqualTo "")) then {
_unit addMagazineCargoGlobal [_glGrenade, 10];
};

if (!(_handgunMags isEqualTo "")) then {
_unit addMagazineCargoGlobal [_handgunMags, 5];
};

if (!(_atMags isEqualTo "")) then {
_unit addMagazineCargoGlobal [_atMags, 2];
};

if (!(_aaMags isEqualTo "")) then {
_unit addMagazineCargoGlobal [_aaMags, 2];
};

{
_unit addItemCargoGlobal [_x, 5];
} foreach _lethalGrenades;
{
_unit addItemCargoGlobal [_x, 20];
} foreach _nonLethalGrenades;
_unit addItemCargoGlobal ["DemoCharge_Remote_Mag", 3];
_unit addItemCargoGlobal ["SatchelCharge_Remote_Mag", 1];

_unit addItemCargoGlobal ["ACE_wirecutter", 1];
_unit addItemCargoGlobal ["ACE_SpareBarrel", 1];
_unit addItemCargoGlobal ["ACE_CableTie", 10];
//_unit addItemCargoGlobal ["EWK_Cig1", 20];

if (_unit isKindOf "car") then {
[_unit, 3] call ace_repair_fnc_addSpareParts;
};

if (_unit isKindOf "tank") then {
[_unit, 3] call ace_repair_fnc_addSpareParts;
};

if (_unit isKindOf "air") then {
_unit addBackpackCargoGlobal ["B_Parachute", 6];
};
