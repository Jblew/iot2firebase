#include "I2CScan.h"
#include <Wire.h>
#include <Arduino.h>

void I2CScan::scanI2CDevices(TwoWire &bus, char *busName)
{
    byte error, address;
    int nDevices;

    Serial.printf("I2CBusScan(%s): scanning \n", busName);

    nDevices = 0;
    for (address = 1; address < 127; address++)
    {
        // Serial.printf("I2CBusScan(%s): scanning addr %d\n", busName, address);
        // The i2c_scanner uses the return value of
        // the Write.endTransmisstion to see if
        // a device did acknowledge to the address.
        bus.beginTransmission(address);
        error = bus.endTransmission();

        if (error == 0)
        {
            Serial.printf("I2CBusScan(%s): I2C device found at address 0x", busName);
            if (address < 16)
                Serial.print("0");
            Serial.print(address, HEX);
            Serial.println("  !");

            nDevices++;
        }
        else if (error == 4)
        {
            Serial.printf("I2CBusScan(%s): Unknown error at address 0x", busName);
            if (address < 16)
                Serial.print("0");
            Serial.println(address, HEX);
        }
        delay(3);
    }
    if (nDevices == 0)
        Serial.printf("I2CBusScan(%s): No I2C devices found\n\n", busName);
    else
        Serial.printf("I2CBusScan(%s): done\n\n", busName);
}