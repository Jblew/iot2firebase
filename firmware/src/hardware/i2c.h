#include <Wire.h>

#ifndef _HARDWARE_I2C_H_
#define _HARDWARE_I2C_H_


#define I2C_LEFT_SDA 21
#define I2C_LEFT_SCL 22
#define I2C_RIGHT_SDA 19
#define I2C_RIGHT_SCL 18
#define I2C_FREQUENCY 400000

class HardwareI2C {
  public:
    HardwareI2C();
    void startI2C();

    TwoWire wireLeft;
    TwoWire wireRight;
};

#endif