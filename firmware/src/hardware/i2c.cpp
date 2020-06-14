#include "i2c.h"
#include "I2CScan.h"

HardwareI2C::HardwareI2C()
    : wireBusA(0)
// ,wireBusB(1)
{
}

void HardwareI2C::startI2C()
{
  this->wireBusA.begin(I2C_BUSA_SDA, I2C_BUSA_SCL);
  this->wireBusA.setClock(I2C_FREQUENCY);
  I2CScan::scanI2CDevices(this->wireBusA, "busA");
  delay(100);

  // this->wireBusB.begin(I2C_BUSB_SDA, I2C_BUSB_SCL);
  // this->wireBusB.setClock(I2C_FREQUENCY);
  // I2CScan::scanI2CDevices(this->wireBusB, "busB");
  // delay(100);
}
