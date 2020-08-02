#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

#define MAX_MAPS 64

char Path[PLATFORM_MAX_PATH], MapName[MAX_MAPS][128], LightValue[MAX_MAPS][128];

int loadedMaps;

public Plugin myinfo = 
{
	name = "Map Lighting Changer", 
	author = "Nocky", 
	version = "1.0", 
	url = "https://github.com/NockyCZ"
};

public void OnMapStart()
{
	CreateTimer(1.0, ChangeLight);
}

public void OnConfigsExecuted()
{
	LoadConfig();
}

void LoadConfig()
{
	BuildPath(Path_SM, Path, sizeof(Path), "configs/map_lighting_changer.cfg");
	
	KeyValues kv = new KeyValues("MapLightingChanger");
	kv.ImportFromFile(Path);
	
	if (!FileExists(Path))
	{
		SetFailState("Configuration file %s is not found", Path);
		return;
	}
	if (!kv.GotoFirstSubKey())
	{
		SetFailState("In configuration file %s is errors", Path);
		return;
	}
	
	int i = 0;
	
	do
	{
		kv.GetSectionName(MapName[i], sizeof(MapName[]));
		kv.GetString("light", LightValue[i], sizeof(LightValue[]));
		
		i++;
		
	} while (kv.GotoNextKey());
	
	loadedMaps = i;
	
	delete kv;
	return;
}

public Action ChangeLight(Handle timer)
{
	char CurrentMap[PLATFORM_MAX_PATH];
	
	GetCurrentMap(CurrentMap, sizeof(CurrentMap));
	for (int i = 0; i <= loadedMaps; i++)
	if (StrEqual(MapName[i], CurrentMap))
	{
		SetLightStyle(0, LightValue[i]);
	}
}