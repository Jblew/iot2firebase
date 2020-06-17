#include "universal-mqtt.h"
#include <Wire.h>
#include "hardware/i2c.h"
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

  initBME();

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

    publishSensors();

    unsigned long tookMs = millis() - timestampMs;
    Serial.printf("Publish done, took %lu ms\n", tookMs);

    delay(4);
  }
}

void initBME()
{
  unsigned status = bme.begin(BME280_I2C_ADDR, &hardwareI2C.wireBusA);
  if (!status)
  {
    Serial.println("Could not find a valid BME280 sensor, check wiring, address, sensor ID!");
    Serial.print("SensorID was: 0x");
    Serial.println(bme.sensorID(), 16);
  }
}

char publishBuf[120];
void publishSensors()
{
  time_t timestamp = time(nullptr);
  float temperatureC = bme.readTemperature();
  float pressureHPa = bme.readPressure() / 100.0F;
  float humidityPercent = bme.readHumidity();
  char *format = "{"
                 "\"timestamp\":%lu,"
                 "\"temperatureC\":%f,"
                 "\"pressureHPa\":%f,"
                 "\"humidityPercent\":%f"
                 "}";
  sprintf(publishBuf, format, timestamp, temperatureC, pressureHPa, humidityPercent);

  publishTelemetry(mqttSubfolder, publishBuf);
  Serial.println(publishBuf);
}
