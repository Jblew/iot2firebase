#include "BME280Read.h"
#include "bme280.h"

void BME280Read::init(bme280_com_fptr_t user_i2c_read, bme280_com_fptr_t user_i2c_write, uint8_t i2cAddr)
{
  struct bme280_dev dev;
  int8_t rslt = BME280_OK;

  dev.dev_id = i2cAddr;
  dev.intf = BME280_I2C_INTF;
  dev.read = user_i2c_read;
  dev.write = user_i2c_write;
  dev.delay_ms = delay;

  rslt = bme280_init(&dev);
}

double BME280Read::readMoisturePercent()
{
  return 0;
}
