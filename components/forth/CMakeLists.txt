idf_component_register(SRC_DIRS "."
    INCLUDE_DIRS "."
    REQUIRES "nvs_flash fatfs spiffs lvgl")

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