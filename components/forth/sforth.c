#include "sforth.h"
#include "forth.h"
#include "compiler.h"
#include <esp_log.h>

static const char *TAG = "sforth";

cell *callback_up;

cell *getCallback_up() {
    return callback_up;
}

// Defines startup routine for nodemcu-firmware
void forth_init(void)
{
    init_io(0, (char **)0, (cell *)callback_up);   // Perform platform-specific initialization
    callback_up = (void *)init_forth();
}

void forth_interact(void)
{
    ESP_LOGI(TAG, "forth_interact enter");
    execute_word("app", callback_up);
    ESP_LOGI(TAG, "forth_interact exit");
}


void forth_main()
{
    forth_init();
    execute_word("app", callback_up);
#ifdef JDS
        char *cmd =
R"FORTH(

see see

)FORTH";

    spush((int)cmd, getCallback_up());
    spush(strlen(cmd), getCallback_up());
    execute_word("evaluate", getCallback_up());
#endif
    /* A task should NEVER return */
    vTaskDelete(NULL);
}

void forth_task_start()
{
    uint8_t* forth_task_stack = heap_caps_calloc(4096*2, 1, MALLOC_CAP_SPIRAM);
    static StaticTask_t forth_task;
    xTaskCreateStatic(forth_main, "forth_main", 4096*2, NULL, 5, forth_task_stack, &forth_task);
}