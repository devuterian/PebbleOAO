"""Compile the real driver against call-order fakes; no watch is required."""

import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DRIVER = ROOT / "src/fw/drivers/speaker/sf32lb52/audio.c"
HEADER = """#pragma once
#include <stdint.h>
#include <stdbool.h>
typedef void (*AudioTransCB)(uint32_t *);
typedef struct { void (*power_up)(void); void (*power_down)(void); } PowerOps;
typedef struct { int pa_ctrl; PowerOps *power_ops; } AudioDevice;
#define GPIO_OType_PP 0
void gpio_output_init(int *, int);
void gpio_output_set(int *, bool);
void delay_us(uint32_t);
void audec_init(AudioDevice *);
void audec_start(AudioDevice *, AudioTransCB);
uint32_t audec_write(AudioDevice *,void *,uint32_t);
void audec_set_vol(AudioDevice *,int);
void audec_stop(AudioDevice *);
"""
HARNESS = """
#include <assert.h>
#include "driver.c"
static bool amp, dac, powered;
static unsigned pulses;
void gpio_output_init(int *pin,int kind) {}
void gpio_output_set(int *pin,bool on) { amp=on; if(on) { assert(dac); ++pulses; } }
void delay_us(uint32_t us) {}
void audec_init(AudioDevice *dev) { assert(!amp); }
void audec_start(AudioDevice *dev,AudioTransCB cb) { assert(!amp && powered); dac=true; }
void audec_stop(AudioDevice *dev) { assert(!amp); dac=false; }
uint32_t audec_write(AudioDevice *dev,void *buf,uint32_t size) { return 0; }
void audec_set_vol(AudioDevice *dev,int vol) {}
static void up(void) { powered=true; }
static void down(void) { assert(!amp && !dac); powered=false; }
int main(void) {
 PowerOps ops={up,down}; AudioDevice device={0,&ops};
 for(int i=0;i<3;i++) { audio_init(&device); audio_start(&device,0);
 assert(amp && dac); audio_stop(&device); assert(!amp && !dac && !powered); }
 assert(pulses==6);
}
"""
with tempfile.TemporaryDirectory() as tmp:
    root = Path(tmp)
    for name in [
        "pbl/drivers/speaker/sf32lb52/audio_definitions.h",
        "pbl/drivers/gpio.h",
        "kernel/util/delay.h",
        "pbl/drivers/audio.h",
        "pbl/drivers/speaker/sf32lb52/sf32lb_audio.h",
    ]:
        p = root / name
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text('#include "mock.h"\n')
    (root / "mock.h").write_text(HEADER)
    (root / "driver.c").write_text(DRIVER.read_text())
    (root / "test.c").write_text(HARNESS)
    subprocess.run(
        ["cc", "-I", tmp, str(root / "test.c"), "-o", str(root / "test")], check=True
    )
    subprocess.run([str(root / "test")], check=True)
print(
    "PASS: DAC starts before PA enable; PA disables before DAC stop; mode pulses preserved"
)
