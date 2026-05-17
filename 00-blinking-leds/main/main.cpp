#include "GpioPort.hpp"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

constexpr GpioPort led(2);

extern "C" void app_main() {
    led.setAsOutput();

    while (true) {
        led.setHigh();
        vTaskDelay(1000 / portTICK_PERIOD_MS);
        led.setLow();
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}