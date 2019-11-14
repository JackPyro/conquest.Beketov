//place all mission related stuff here
//do not overwrite this file when copying framework from mission to mission
objs = [box_1, box_2];
_marker = "delivery";
_radius = 150;


[EAST, "task_1", ["Один из жителей Бекетова рассказал нам, что видел как Казаки (бандиты в буквальном смысле), получили ящики со взрывчаткой от Рустовии. Нам нужно найти их и доставить в назначенную точку. ", "Выполните задание"], nil, "ASSIGNED", 0, true, "default"] call BIS_fnc_taskCreate;

waitUntil {
    { _x distance getMarkerPos _marker < _radius} count objs == 2
};

["task_1", "SUCCEEDED", true] call BIS_fnc_taskSetState;