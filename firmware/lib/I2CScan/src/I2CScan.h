#include "Wire.h"

#ifndef I2CSCAN_H
#define I2CSCAN_H

class I2CScan
{
public:
    static void scanI2CDevices(TwoWire &bus, char *busName);
};

#endif //I2CSCAN_H