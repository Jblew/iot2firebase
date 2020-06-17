#ifndef _MAIN_H_
#define _MAIN_H_

#include "hardware/i2c.h"
#include "BME280Read.h"

#define PUBLISH_DELAY 300
#define BME280_I2C_ADDR 0x76

HardwareI2C hardwareI2C;
BME280Read bme280Read;

const char *mqttSubfolder = "/publish/sensors/test/rows";

int8_t readI2CForBme(uint8_t dev_id, uint8_t reg_addr, uint8_t *data, uint16_t len){
    hardwareI2C.wireBusA.}

int8_t writeI2CForBme(uint8_t dev_id, uint8_t reg_addr, uint8_t *data, uint16_t len)
{
}

#endif
