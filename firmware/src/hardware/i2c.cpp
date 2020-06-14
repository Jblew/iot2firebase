#include "i2c.h"
#include "I2CScan.h"

HardwareI2C::HardwareI2C()
  :wireLeft(0)
  ,wireRight(1)
{}

void HardwareI2C::startI2C() {
    this->wireLeft.begin(I2C_LEFT_SDA, I2C_LEFT_SCL);
    this->wireLeft.setClock(I2C_FREQUENCY);
    I2CScan::scanI2CDevices(this->wireLeft, "left");
    delay(100);

    this->wireRight.begin(I2C_RIGHT_SDA, I2C_RIGHT_SCL);
    this->wireRight.setClock(I2C_FREQUENCY);
    I2CScan::scanI2CDevices(this->wireRight, "right");
    delay(100);
}
