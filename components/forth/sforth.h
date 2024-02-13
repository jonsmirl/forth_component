#include "freertos/FreeRTOS.h"
#include "freertos/semphr.h"
#include "lvgl.h"

#ifdef __cplusplus
extern "C" {
#endif
#include "config.h"

cell *getCallback_up();
void forth_init(void);
void forth_interact(void);

#define NUMBER_STYLES 10
struct forth_page_t {
    lv_style_t styles[NUMBER_STYLES];
};

void forth_task_start();

#ifdef __cplusplus
}
#endif
