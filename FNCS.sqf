FNC_TC = {
	params ["_Configs22"]; 
	private _A1 = [];
	{
		_A1 = _A1 + [(configfile >> "CfgWeapons" >> _x)];
	} forEach _Configs22;
	[_A1] call FNC_CC
};
FNC_CC = {
	params ["_Configs"]; 
	private _Return = [];
	private ["_y","_z"];
	if !(count _Configs > 2) then {_Return = ["More than 2 config required"]} else {
		_Return = _Return + ([_Configs,true] call FNC_CCL);
	};
	_Return
};

FNC_CCG = {
	params ["_Config"];
	private ["_Return1"];
	if (isArray _Config) then {_Return1 = getArray _Config};
	if (isNumber _Config) then {_Return1 = getNumber _Config};
	if (isText _Config) then {_Return1 = getText _Config};
	_Return1
};

FNC_CCL = {
	params ["_Configs1","_E"];
	private ["_y","_z","_b","_Back"];
	private _C1 = _Configs1 select 0;
	_Configs1 deleteAt 0;
	private _Return2 = [];
	{
		_z = str (_x) splitString "/";
		_y = _z select (count _z -1);
		_b = (_C1 >> _y) call FNC_CCG;
		_Back = [];
		{
			if ((((_x >> _y) call FNC_CCG) isEqualTo _b) isEqualTo _E) then {
				_Back = _Back + [(_x >> _y) call FNC_CCG];
			};
		} forEach _Configs1;
		if (count _Back == count _Configs1) then {
			_Return2 = _Return2 + [[_y,_b]];
		};
	} forEach configProperties [_C1];
	_Return2
};

FNC_RSVG = {
	params ["_Config"];
	private ["_Return1"];
	if (isArray _Config) then {_Return1 = getArray _Config};
	if (isNumber _Config) then {_Return1 = getNumber _Config};
	if (isText _Config) then {_Return1 = getText _Config};
	_Return1
};
FNC_RSV = {
	params ["_C","_A"];
	private ["_B","_T"];
	_Return = [];
	{
		_B = _x;
		_T = true;
		{
			_V = (_B >> (_x select 0)) call FNC_RSVG;
			if !(_V isEqualTo (_x select 1)) then {
				_T = false;
			};
		} forEach _A;
		if (_T) then {
			_Return = _Return + [_B];
		};
	} forEach ("true" configClasses _C);
	_Return
};

FNC_IMS_CreateList = {
	params ["_display","_Contains","_ListPos","_FNC"];
	
	private _Backround = _display ctrlCreate ["RscPicture", 198];
	_Backround ctrlSetTextColor [1,1,1,1];
	_Backround ctrlSetText "#(argb,8,8,3)color(0,0,0,1)";
	_Backround ctrlSetPosition _ListPos;
	_Backround ctrlCommit 0;
	
	private _List = _display ctrlCreate [ "RscControlsGroup", 199 ];
	_List ctrlSetPosition _ListPos;
	_List ctrlCommit 0;
	
	private _xp = _ListPos select 2;
	private _yp = _ListPos select 3;
	private _picHeight = _yp/20;
	
	private ["_Image","_picGrp","_pic","_btn"];
	{
		_x params ["_Name","_Image"];
		
		_picGrp = _display ctrlCreate [ "RscControlsGroup", 2000 + _forEachIndex, _List];
		_picGrp ctrlSetPosition [ 0, _picHeight * _forEachIndex, _xp, _picHeight ];
		_picGrp ctrlCommit 0;

		_pic = _display ctrlCreate [ "RscPictureKeepAspect", 4000 + _forEachIndex, _picGrp ];
		_pic ctrlSetPosition [ 0, 0, _picHeight, _picHeight ];
		_pic ctrlSetText _Image;
		_pic ctrlCommit 0;
		
		_btn = _display ctrlCreate [ "RscButton", 6000 + _forEachIndex, _picGrp ];
		_btn ctrlSetPosition [ _picHeight, 0, _xp-_picHeight, _picHeight ];
		_btn ctrlSetText (_Name);
		_btn buttonSetAction format["%1 call %2",_x,_FNC];
		
		_btn setVariable ["IMSREP",_x];
		_btn ctrlCommit 0;
	} forEach _Contains;
	
	//return
	_List
};
FNC_GiveGuns = {
	params ["_Name","_Image","_Data"];
	_Data call FNC_GWA;
	hint "Giving "+_Data;
};
FNC_GWA = {
	player addItem _this;
	private _mag = getArray(configfile >> "CfgWeapons" >> _this >> "magazines");
	if !(_mag isEqualTo []) then {
		player addMagazine (_mag select 0);
		player addMagazine (_mag select 0);
	};
};
Recreate = {
	private _Display = findDisplay 46 createDisplay "RscDisplayEmpty";
	[_Display] + RECREATEVAR call FNC_IMS_CreateList;
};