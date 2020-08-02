# Map Lighting Changer

### Installation
1. Download files
2. Put the MapLightingChanger.smx file into your servers \addons\sourcemod\plugins\
3. Put the map_lighting_changer.cfg file into your servers \addons\sourcemod\configs\
4. Edit config (map_lighting_changer.cfg)
5. Restart your server

### Configuration
```
// b - darkest
// m - normal (Default)
// z - brightest

// !!! DONT USE "a" value, because this value making surfaces completely black !!!

"MapLightingChanger"
{
	"de_dust2" // Map Name
	{
		"light"		"b" // Lightning value (Use the alphabet "b" being the darkest, "z" being the brightest) 
	}
        "de_train"
	{
		"light"		"z"
	}
        "de_nuke"
	{
		"light"		"m"
	}
}
```
