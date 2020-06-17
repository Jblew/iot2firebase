#ifndef _BME280_READ_H_
#define _BME280_READ_H_

#include <Wire.h>

#define BME280_FLOAT_ENABLE

class BME280Read
{
public:
  void init(bme280_com_fptr_t user_i2c_read, bme280_com_fptr_t user_i2c_write, uint8_t i2cAddr);
  double readMoisturePercent();

private:
  TwoWire *i2cBus;
};

#endif
