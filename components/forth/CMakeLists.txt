idf_component_register(SRC_DIRS "."
    INCLUDE_DIRS "."
    REQUIRES "lvgl device esp_wifi esp_rom esp_timer console")

add_custom_command(OUTPUT dict.h
    COMMENT "Generating dictionaries"
    COMMAND ./regen.sh
    DEPENDS ${COMPONENT_DIR}/extend.c
    WORKING_DIRECTORY ${COMPONENT_DIR}/regen
    VERBATIM)

add_custom_target(dict DEPENDS dict.h)
add_dependencies(${COMPONENT_LIB} dict)

set_property(DIRECTORY "${COMPONENT_DIR}" APPEND PROPERTY
    ADDITIONAL_MAKE_CLEAN_FILES dict.h)

idf_build_set_property(COMPILE_OPTIONS "-DBITS32" APPEND)
idf_build_set_property(COMPILE_OPTIONS "-DFLOATING" APPEND)
idf_build_set_property(COMPILE_OPTIONS "-DMORE_FP" APPEND)
idf_build_set_property(COMPILE_OPTIONS "-DNOSYSCALL" APPEND)
idf_build_set_property(COMPILE_OPTIONS "-DTARGET" APPEND)
idf_build_set_property(COMPILE_OPTIONS "-DMAXDICT=0x8000" APPEND)