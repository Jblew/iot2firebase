#include "universal-mqtt.h"
#include <Wire.h>
#include "hardware/i2c.h"
#include "BME280Read.h"
#include "main.h"

void messageReceived(String &topic, String &payload)
{
  Serial.println("incoming: " + topic + " - " + payload);
}

void setup()
{
  Serial.begin(115200);
  delay(3000);

  hardwareI2C.startI2C();
  Serial.println("i2c_init_done");

  bme280Read.init(readI2CForBme, writeI2CForBme, BME280_I2C_ADDR);

  setupCloudIoT();
}

unsigned long lastMillis = 0;
unsigned long loopStime = 0;
unsigned long sinceLastPublishMs = 0;
unsigned long timestampMs = 0;

void loop()
{
  loopStime = millis();

  mqttClient->loop();
  delay(5); // <- fixes some issues with WiFi stability

  if (!mqttClient->connected())
  {
    connect();
  }

  timestampMs = millis();
  sinceLastPublishMs = timestampMs - lastMillis;
  if (sinceLastPublishMs > PUBLISH_DELAY)
  {
    lastMillis = timestampMs;

    char *data = "{ \"hello\":\"world\" }";
    publishTelemetry(mqttSubfolder, data);

    Serial.println("Publish done");

    delay(4);
  }
}
