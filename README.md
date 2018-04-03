# settings

[![sampctl](https://shields.southcla.ws/badge/sampctl-settings-2f2f2f.svg?style=for-the-badge)](https://github.com/ScavengeSurvive/settings)

A simple ini-based settings library for loading server settings with defaults.
Supports arrays of ints, floats and strings!

## Installation

Simply install to your project:

```bash
sampctl package install ScavengeSurvive/settings
```

Include in your code and begin using the library:

```pawn
#include <settings>
```

## Usage

Since this library is designed for loading settings on initialisation, API
usability takes priority over optimisation, settings file will be opened and
closed on each call. You can avoid this by setting the optional parameter
`openfile` to false. The `*Array` functions do this by opening the file once,
calling the respective `GetSetting*` function in a loop then closing/comitting
the file.

Here's an example of loading a set of MySQL connection settings:

```pawn
new
    gMySQLHost[128],
    gMySQLPort[6],
    gMySQLUser[64],
    gMySQLPass[256]; // disclaimer: I don't actually know the max values for MySQL params!

main() {
    GetSettingString("config.ini", "mysql_host", "localhost", gMySQLHost);
    GetSettingString("config.ini", "mysql_port", "6317", gMySQLPort);
    GetSettingString("config.ini", "mysql_user", "local", gMySQLUser);
    GetSettingString("config.ini", "mysql_pass", "1234", gMySQLPass);
}
```

Here's an example of some ints and floats:

```pawn
new
    gRoundTime,
    Float:gSpawnX,
    Float:gSpawnY,
    Float:gSpawnZ;

main() {
    GetSettingInt("config.ini", "round_time", 900, gRoundTime);
    GetSettingFloat("config.ini", "spawn_x", 300.0, gSpawnX);
    GetSettingFloat("config.ini", "spawn_y", 1800.0, gSpawnY);
    GetSettingFloat("config.ini", "spawn_z", 16.0, gSpawnZ);
}
```

You can also do arrays! Under the hood, this just appends the index to the key
separated by a `/` character.

```pawn
new
    gInfoMessage[10][128], // 10 info messages, 128 chars each
    gInfoMessageCount;

main() {
    GetSettingStringArray("config.ini", "info_message", "Add new messages in config.ini!", gInfoMessage, gInfoMessageCount);
}
```

## Testing

To test, simply run the package:

```bash
sampctl package run
```

And observe y_testing output.
