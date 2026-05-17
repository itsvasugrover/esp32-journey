#pragma once
#include <stdint.h>
#include "soc/gpio_reg.h"
#include "soc/io_mux_reg.h"

class GpioPort {
    private:
        const uint32_t _pin;
        const uint32_t _pinMask;

    public:
        constexpr GpioPort(uint32_t pin) : _pin(pin), _pinMask(1 << pin) {}

        void setAsOutput() const {
            REG_WRITE(GPIO_ENABLE_W1TS_REG, _pinMask);
        }

        inline void setHigh() const {
            REG_WRITE(GPIO_OUT_W1TS_REG, _pinMask);
        }

        inline void setLow() const {
            REG_WRITE(GPIO_OUT_W1TC_REG, _pinMask);
        }
};