//place all mission related stuff here
//do not overwrite this file when copying framework from mission to mission

[west_1, [true], ["WEST", "HIGH"]] call klpq_myDac_fnc_createZone;
[west_2, [true], ["WEST", "HIGH"]] call klpq_myDac_fnc_createZone;
[ind_1, [true], ["GUER", "NORMAL"]] call klpq_myDac_fnc_createZone;
[ind_2, [true], ["GUER", "NORMAL"]] call klpq_myDac_fnc_createZone;
[ind_3, [true], ["GUER", "NORMAL"]] call klpq_myDac_fnc_createZone;
[ind_4, [true], ["GUER", "NORMAL"]] call klpq_myDac_fnc_createZone;


[west_1, [2, 4, 10]] call klpq_myDac_fnc_zoneAddInf;
[west_2, [5, 4, 10]] call klpq_myDac_fnc_zoneAddInf;
[ind_1, [1, 4, 10]] call klpq_myDac_fnc_zoneAddInf;
[ind_2, [4, 5, 10]] call klpq_myDac_fnc_zoneAddInf;
[ind_3, [2, 4, 10]] call klpq_myDac_fnc_zoneAddInf;
[ind_4, [2, 4, 10]] call klpq_myDac_fnc_zoneAddInf;


objs = [box_1, box_2];
_marker = "delivery";
_radius = 150;
[getMarkerPos "rustovia_end", "GUER", 50, 10] call kf_fnc_ai_infantryBunker;

[EAST, "task_1", ["Один из жителей Бекетова рассказал нам, что видел как Казаки (бандиты в буквальном смысле), получили ящики со взрывчаткой от Рустовии. Нам нужно найти их и доставить в назначенную точку. ", "Выполните задание"], nil, "ASSIGNED", 0, true, "default"] call BIS_fnc_taskCreate;

waitUntil {
    {_x distance getMarkerPos "rustovia_end" < 50 && vehicle _x == _x} count allPlayers > 0
};

_grp1 = [getMarkerPos "rustovia_start", "WEST", 10, "HIGH"] call kf_fnc_ai_createGroup;
[_grp1,  getMarkerPos "rustovia_end", 20] call kf_fnc_ai_infantryAttack;
_veh = [getMarkerPos "rustovia_start", "WEST", "HIGH"] call kf_fnc_ai_createWheeledVehicleGroup;
[_veh, getMarkerPos "rustovia_end", 20] call kf_fnc_ai_vehicleAttack;

waitUntil {
    { _x distance getMarkerPos _marker < _radius} count objs == 2
};

["task_1", "SUCCEEDED", true] call BIS_fnc_taskSetState;