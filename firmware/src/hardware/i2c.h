#include <Wire.h>

#ifndef _HARDWARE_I2C_H_
#define _HARDWARE_I2C_H_

#define I2C_BUSA_SDA 18
#define I2C_BUSA_SCL 23
// #define I2C_BUSB_SDA 19
// #define I2C_BUSB_SCL 18
#define I2C_FREQUENCY 400000

class HardwareI2C
{
public:
  HardwareI2C();
  void startI2C();

  TwoWire wireBusA;
  //TwoWire wireBusB;
};

#endif
