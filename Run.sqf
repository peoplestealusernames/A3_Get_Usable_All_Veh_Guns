private _sss = [["missiles_DAGR","CarHorn","Bomb_04_Plane_CAS_01_F","missiles_titan","rockets_Skyfire","missiles_ASRAAM","missiles_SCALPEL","missiles_titan_AA","missiles_titan_static","missiles_Zephyr","GBU12BombLauncher"]] call FNC_TC;
private _Guns = [(configfile >> "CfgWeapons"),_sss] call FNC_RSV;
private _ListPos = [-.4,-.25,1,1.5];
private _Name = [];
private _Names = [];
private ["_y","_z"];
{
	_z = str (_x) splitString "/";
	_y = _z select (count _z -1);
	_Name = getText(configfile >> "CfgWeapons" >> _y >> "displayName")+"          "+_y;
	_Image = getText(configfile >> "CfgWeapons" >> _y >> "picture");
	_Names = _Names + [[_Name,_Image,_y]];
} forEach _Guns;
RECREATEVAR = [_Names,_ListPos,"FNC_GiveGuns"];
call Recreate;