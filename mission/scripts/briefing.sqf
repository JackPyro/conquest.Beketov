//0 = [] execVM "mission\scripts\briefing.sqf";

private _missionBriefing = "Брифинг
<br/><br/>
2025 год. Королевство Рустовия.
<br/>";
player createDiaryRecord ["diary", ["Mission", _missionBriefing]];
