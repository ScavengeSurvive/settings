// built-in include guard removal
// just in case the user has a local dependency with the same file name
#if defined _inc_settings
	#undef _inc_settings
#endif
// custom include-guard to ensure we don't duplicate
#if defined _settings_included
	#endinput
#endif
#define _settings_included


#include <a_samp>
#include <logger>
#include <ini>


stock GetSettingInt(file[], key[], defaultValue, &output, logged = true, openfile = true) {
	if(openfile) {
		ini_open(file);
	}

	if(!ini_isKey(key)) {
		ini_setInt(key, defaultValue);
		output = defaultValue;
		ini_commit();

		if(logged) {
			log("setting default",
				_s("key", key),
				_i("value", output));
		}
	} else {
		ini_getInt(key, output);

		if(logged) {
			log("setting read",
				_s("key", key),
				_i("value", output));
		}
	}

	if(openfile) {
		ini_close();
	}
}

stock GetSettingFloat(file[], key[], Float:defaultValue, &Float:output, logged = true, openfile = true) {
	if(openfile) {
		ini_open(file);
	}

	if(!ini_isKey(key)) {
		ini_setFloat(key, defaultValue);
		output = defaultValue;
		ini_commit();

		if(logged) {
			log("setting default",
				_s("key", key),
				_f("value", output));
		}
	} else {
		ini_getFloat(key, output);

		if(logged) {
			log("setting read",
				_s("key", key),
				_f("value", output));
		}
	}

	if(openfile) {
		ini_close();
	}
}

stock GetSettingString(file[], key[], defaultValue[], output[], maxsize = sizeof(output), logged = true, openfile = true) {
	if(openfile) {
		ini_open(file);
	}

	if(!ini_isKey(key)) {
		ini_setString(key, defaultValue);
		output[0] = EOS;
		strcat(output, defaultValue, maxsize);
		ini_commit();

		if(logged) {
			log("setting default",
				_s("key", key),
				_s("value", output));
		}
	} else {
		ini_getString(key, output, maxsize);

		if(logged) {
			log("setting read",
				_s("key", key),
				_s("value", output));
		}
	}

	if(openfile) {
		ini_close();
	}
}

stock GetSettingIntArray(file[], key[], defaultValue, output[], &outputTotal, len = sizeof(output), logged = true) {
	ini_open(file);

	new tmpkey[MAX_KEY_LENGTH];

	while(outputTotal < len) {
		format(tmpkey, sizeof(tmpkey), "%s/%d", key, outputTotal);

		if(!ini_isKey(tmpkey)) {
			if(outputTotal == 0) {
				ini_setInt(tmpkey, defaultValue);
				ini_commit();
				output[0] = defaultValue;

				if(logged) {
					log("setting default",
						_s("key", key),
						_i("value", output[0]));
				}
			}

			break;
		}

		GetSettingInt(file, tmpkey, defaultValue, output[outputTotal], logged, false);

		outputTotal++;
	}

	ini_close();
}

stock GetSettingFloatArray(file[], key[], Float:defaultValue, Float:output[], &outputTotal, len = sizeof(output), logged = true) {
	ini_open(file);

	new tmpkey[MAX_KEY_LENGTH];

	while(outputTotal < len) {
		format(tmpkey, sizeof(tmpkey), "%s/%d", key, outputTotal);

		if(!ini_isKey(tmpkey)) {
			if(outputTotal == 0) {
				ini_setFloat(tmpkey, defaultValue);
				ini_commit();
				output[0] = defaultValue;

				if(logged) {
					log("setting default",
						_s("key", key),
						_f("value", output[0]));
				}
			}

			break;
		}

		GetSettingFloat(file, tmpkey, defaultValue, output[outputTotal], logged, false);

		outputTotal++;
	}

	ini_close();
}

stock GetSettingStringArray(file[], key[], defaultValue[], output[][], &outputTotal, lenDefault = sizeof(defaultValue), len = sizeof(output), lenInner = sizeof(output[]), logged = true) {
	ini_open(file);

	new tmpkey[MAX_KEY_LENGTH];

	while(outputTotal < len) {
		format(tmpkey, sizeof(tmpkey), "%s/%d", key, outputTotal);

		if(!ini_isKey(tmpkey)) {
			if(outputTotal == 0) {
				ini_setString(tmpkey, defaultValue);
				ini_commit();
				output[0][0] = EOS;
				strcat(output[0], defaultValue, lenDefault);

				if(logged) {
					log("setting default",
						_s("key", key),
						_s("value", output[0]));
				}
			}

			break;
		}

		GetSettingString(file, tmpkey, defaultValue, output[outputTotal], lenInner, logged, false);

		outputTotal++;
	}

	ini_close();
}

stock UpdateSettingInt(file[], key[], value) {
	ini_open(file);
	ini_setInt(key, value);
	ini_commit();
	ini_close();
}

stock UpdateSettingFloat(file[], key[], Float:value) {
	ini_open(file);
	ini_setFloat(key, value);
	ini_commit();
	ini_close();
}

stock UpdateSettingString(file[], key[], value[]) {
	ini_open(file);
	ini_setString(key, value);
	ini_commit();
	ini_close();
}
