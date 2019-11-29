//place all mission related stuff here
//do not overwrite this file when copying framework from mission to mission

[ind_2, [true], ["GUER", "NORMAL"]] call klpq_myDac_fnc_createZone;
[ind_3, [true], ["GUER", "NORMAL"]] call klpq_myDac_fnc_createZone;
[ind_4, [true], ["GUER", "NORMAL"]] call klpq_myDac_fnc_createZone;
[ind_5, [true], ["GUER", "NORMAL"]] call klpq_myDac_fnc_createZone;
[ind_6, [true], ["GUER", "NORMAL"]] call klpq_myDac_fnc_createZone;
[ind_7, [true], ["GUER", "NORMAL"]] call klpq_myDac_fnc_createZone;
[ind_8, [true], ["GUER", "NORMAL"]] call klpq_myDac_fnc_createZone;
[ind_9, [true], ["GUER", "NORMAL"]] call klpq_myDac_fnc_createZone;


[ind_2, [2, 5, 10]] call klpq_myDac_fnc_zoneAddInf;
[ind_3, [2, 4, 10]] call klpq_myDac_fnc_zoneAddInf;
[ind_4, [2, 4, 10]] call klpq_myDac_fnc_zoneAddInf;
[ind_5, [2, 4, 10]] call klpq_myDac_fnc_zoneAddInf;
[ind_6, [2, 4, 10]] call klpq_myDac_fnc_zoneAddInf;
[ind_7, [2, 4, 10]] call klpq_myDac_fnc_zoneAddInf;
[ind_8, [2, 4, 10]] call klpq_myDac_fnc_zoneAddInf;
[ind_9, [2, 4, 10]] call klpq_myDac_fnc_zoneAddInf;

[EAST, "task_1", ["Появились хорошие новости! Рустовия хочет организовать перевозку аммуниции, благо, наш человек внутри узнал об этом. Надеюсь вы помните как пользоваться взрывчаткой? Ну та, которую вы украли в городе. ", "Выполните задание"], nil, "ASSIGNED", 0, true, "default"] call BIS_fnc_taskCreate;

