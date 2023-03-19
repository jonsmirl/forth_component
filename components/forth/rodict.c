// C Forth 2005.  Copyright (c) 2005 FirmWorks

#include "forth.h"
#include "compiler.h"
#include "esp_heap_caps.h"

const struct header builtin_hdr = {
#include "dicthdr.h"
};

const u_char romvars[] = {
#include "userarea.h"
};

cell ramvars[MAXVARS];

const u_char romdict[] = {
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
    while (p < lastp) {
        *q++ = *p++;
    }
    ramdict = heap_caps_malloc(MAXDICT, MALLOC_CAP_SPIRAM);
    init_compiler(romdict, ramdict, 
                  (token_t)(sizeof(romdict) / sizeof(token_t)),
                  ramdict, ramdict + MAXDICT, ramvars);
    return ramvars;
}
