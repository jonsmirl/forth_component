// C Forth 2005.  Copyright (c) 2005 FirmWorks

#include "forth.h"
#include "compiler.h"
#include "esp_log.h"
#include "esp_heap_caps.h"

static const char *TAG = "rodict";

const __attribute__((aligned(32))) struct header builtin_hdr = {
#include "dicthdr.h"
};

const __attribute__((aligned(32)))  u_char romvars[] = {
#include "userarea.h"
};

cell ramvars[MAXVARS];

const __attribute__((aligned(32))) u_char romdict[] = {
#include "dict.h"
};

u_char *ramdict;

// dictmax is ignored because the dictionary is defined statically
cell *
prepare_builtin_dictionary(int dictmax)
{
    const u_char *p;
    const u_char *lastp;
    u_char *q;
    p = romvars;
    lastp = romvars + sizeof(romvars);
    q = (u_char *)ramvars;

ESP_LOGI(TAG, "romvars %p", p);
ESP_LOGI(TAG, "sizeof(romvars) %x", sizeof(romvars));
ESP_LOGI(TAG, "ramvars %p", q);
    while (p < lastp) {
        *q++ = *p++;
    }
    ramdict = heap_caps_malloc(MAXDICT, MALLOC_CAP_SPIRAM);
ESP_LOGI(TAG, "ramdict %p", ramdict);
ESP_LOGI(TAG, "sizeof(token_t) %x", sizeof(token_t));
    init_compiler(romdict, ramdict, 
                  (token_t)(sizeof(romdict) / sizeof(token_t)),
                  ramdict, ramdict + MAXDICT, ramvars);
    return ramvars;
}
