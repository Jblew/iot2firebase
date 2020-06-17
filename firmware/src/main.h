#ifndef _MAIN_H_
#define _MAIN_H_

#include "hardware/i2c.h"
#include <Adafruit_BME280.h>

#define PUBLISH_DELAY 30000
#define BME280_I2C_ADDR 0x76

HardwareI2C hardwareI2C;
Adafruit_BME280 bme;

const char *mqttSubfolder = "/publish/sensors/environmental/rows";

void initBME();
void publishSensors();

#endif
