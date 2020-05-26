import time
from upm import pyupm_lm35 as sensorObj
from upm import pyupm_bmp280 as sensorB
import mraa

sensor = sensorObj.LM35(0)
sensor2 = sensorB.BME280(0)

led1 = mraa.Gpio(0)
led1.dir(mraa.DIR_OUT)

while True:
    led1.write(1)
    sensor2.update()
    temp = sensor.getTemperature()
    print("Temperature: %f, Humidity: %f, Pressure: %f" % (sensor2.getTemperature(), sensor2.getHumidity(), sensor2.getPressure()))
    print("Temperature:", temp, "C")
    time.sleep(5)

