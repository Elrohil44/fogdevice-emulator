import time
from upm import pyupm_lm35 as sensorObj
import mraa

sensor = sensorObj.LM35(0)

led1 = mraa.Gpio(0)
led1.dir(mraa.DIR_OUT)

while True:
    led1.write(1)
    temp = sensor.getTemperature()
    print("Temperature:", temp, "C")
    time.sleep(5)

