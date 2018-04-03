#include "settings"

#define RUN_TESTS
#include <YSI\y_testing>


main() {
	//
}


Test:GetSettingInt() {
	new output;

	fremove("GetSettingInt.ini");

	GetSettingInt("GetSettingInt.ini", "key", 10, output);
	ASSERT(output == 10);

	GetSettingInt("GetSettingInt.ini", "key", 15, output);
	ASSERT(output == 10);
}

Test:GetSettingFloat() {
	new Float:output;

	fremove("GetSettingFloat.ini");

	GetSettingFloat("GetSettingFloat.ini", "key", 10.5, output);
	ASSERT(output == 10.5);

	GetSettingFloat("GetSettingFloat.ini", "key", 15.5, output);
	ASSERT(output == 10.5);
}

Test:GetSettingString() {
	new output[128];

	fremove("GetSettingString.ini");

	GetSettingString("GetSettingString.ini", "key", "hello world", output);
	ASSERT(!strcmp(output, "hello world"));

	GetSettingString("GetSettingString.ini", "key", "hello world 2", output);
	ASSERT(!strcmp(output, "hello world"));
}



Test:GetSettingIntArray() {
	new output[3], outputTotal;

	fremove("GetSettingIntArray.ini");

	GetSettingIntArray("GetSettingIntArray.ini", "key", 10, output, outputTotal);
	ASSERT(output[0] == 10);

	GetSettingIntArray("GetSettingIntArray.ini", "key", 15, output, outputTotal);
	ASSERT(output[0] == 10);
}

Test:GetSettingFloatArray() {
	new Float:output[3], outputTotal;

	fremove("GetSettingFloatArray.ini");

	GetSettingFloatArray("GetSettingFloatArray.ini", "key", 10.5, output, outputTotal);
	ASSERT(output[0] == 10.5);

	GetSettingFloatArray("GetSettingFloatArray.ini", "key", 15.5, output, outputTotal);
	ASSERT(output[0] == 10.5);
}

Test:GetSettingStringArray() {
	new output[3][128], outputTotal;

	fremove("GetSettingStringArray.ini");

	GetSettingStringArray("GetSettingStringArray.ini", "key", "hello world", output, outputTotal);
	ASSERT(!strcmp(output[0], "hello world"));

	GetSettingStringArray("GetSettingStringArray.ini", "key", "hello world 2", output, outputTotal);
	ASSERT(!strcmp(output[0], "hello world"));
}


Test:UpdateSettingInt() {
	new output;

	fremove("UpdateSettingInt.ini");

	GetSettingInt("UpdateSettingInt.ini", "key", 10, output);
	ASSERT(output == 10);

	UpdateSettingInt("UpdateSettingInt.ini", "key", 15);

	GetSettingInt("UpdateSettingInt.ini", "key", 10, output);
	ASSERT(output == 15);
}

Test:UpdateSettingFloat() {
	new Float:output;

	fremove("UpdateSettingFloat.ini");

	GetSettingFloat("UpdateSettingFloat.ini", "key", 10.5, output);
	ASSERT(output == 10.5);

	UpdateSettingFloat("UpdateSettingFloat.ini", "key", 15.5);

	GetSettingFloat("UpdateSettingFloat.ini", "key", 10.5, output);
	ASSERT(output == 15.5);
}

Test:UpdateSettingString() {
	new output[128];

	fremove("UpdateSettingString.ini");

	GetSettingString("UpdateSettingString.ini", "key", "hello world", output);
	ASSERT(!strcmp(output, "hello world"));

	UpdateSettingString("UpdateSettingString.ini", "key", "hello world 2");

	GetSettingString("UpdateSettingString.ini", "key", "hello world", output);
	ASSERT(!strcmp(output, "hello world 2"));
}


Test:UpdateSettingIntArray() {
	new output[3], outputTotal;

	fremove("UpdateSettingIntArray.ini");

	ini_open("UpdateSettingIntArray.ini");
	ini_setInt("key/0", 10);
	ini_setInt("key/1", 20);
	ini_setInt("key/2", 30);
	ini_commit();
	ini_close();

	GetSettingIntArray("UpdateSettingIntArray.ini", "key", 15, output, outputTotal);
	ASSERT(output[0] == 10);
	ASSERT(output[1] == 20);
	ASSERT(output[2] == 30);
}

Test:UpdateSettingFloatArray() {
	new Float:output[3], outputTotal;

	fremove("UpdateSettingFloatArray.ini");

	ini_open("UpdateSettingFloatArray.ini");
	ini_setFloat("key/0", 10.5);
	ini_setFloat("key/1", 20.5);
	ini_setFloat("key/2", 30.5);
	ini_commit();
	ini_close();

	GetSettingFloatArray("UpdateSettingFloatArray.ini", "key", 15.5, output, outputTotal);
	ASSERT(output[0] == 10.5);
	ASSERT(output[1] == 20.5);
	ASSERT(output[2] == 30.5);
}

Test:UpdateSettingStringArray() {
	new output[3][128], outputTotal;

	fremove("UpdateSettingStringArray.ini");

	ini_open("UpdateSettingStringArray.ini");
	ini_setString("key/0", "one");
	ini_setString("key/1", "two");
	ini_setString("key/2", "three");
	ini_commit();
	ini_close();

	GetSettingStringArray("UpdateSettingStringArray.ini", "key", "test", output, outputTotal);
	ASSERT(!strcmp(output[0], "one"));
	ASSERT(!strcmp(output[1], "two"));
	ASSERT(!strcmp(output[2], "three"));
}
