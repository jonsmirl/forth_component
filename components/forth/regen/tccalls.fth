#0 ccall: lvscr-act		{ -- i.screen }
#1 ccall: 'build-date     { -- a.value }
#2 ccall: 'version        { -- a.value }
#3 ccall: ms              { i.ms -- }
#4 ccall: get-msecs       { -- i.ms }
#5 ccall: restart         { -- }
#6 ccall: adc-width!  { i.width -- }
#7 ccall: adc-atten!  { i.attenuation i.channel# -- }
#8 ccall: adc@        { i.channel# -- i.voltage }
#9 ccall: hall@       { -- i.voltage }
#10 ccall: i2c-open  { i.scl i.sda -- i.error? }
#11 ccall: i2c-close  { -- }
#12 ccall: i2c-write-read { a.wbuf i.wsize a.rbuf i.rsize i.slave i.stop -- i.err? }
#13 ccall: i2c-b@     { i.reg i.slave i.stop -- i.b }
#14 ccall: i2c-b!     { i.value i.reg i.slave -- i.error? }
#15 ccall: i2c-be-w@  { i.reg i.slave i.stop -- i.w }
#16 ccall: i2c-le-w@  { i.reg i.slave i.stop -- i.w }
#17 ccall: i2c-be-w!  { i.value i.reg i.slave -- i.error? }
#18 ccall: i2c-le-w!  { i.value i.reg i.slave -- i.error? }
#19 ccall: gpio-pin@  { i.gpio# -- i.flag }
#20 ccall: gpio-pin!  { i.level i.gpio# -- }
#21 ccall: gpio-toggle { i.gpio# -- }
#22 ccall: gpio-is-output { i.gpio# -- }
#23 ccall: gpio-is-output-open-drain { i.gpio# -- }
#24 ccall: gpio-is-input { i.gpio# -- }
#25 ccall: gpio-is-input-pullup { i.gpio# -- }
#26 ccall: gpio-is-input-pulldown { i.gpio# -- }
#27 ccall: gpio-mode { i.pullup? i.direction i.gpio# -- }
#28 ccall: wifi-mode@ { -- i.mode }
#29 ccall: wifi-open { $ssid $password i.timeout -- i.error? }
#30 ccall: log-level! { i.level $component -- }
#31 ccall: socket         { i.proto i.type i.family -- i.handle }
#32 ccall: bind           { i.len a.addr i.handle -- i.error }
#33 ccall: setsockopt     { i.len a.addr i.optname i.level i.handle -- i.error }
#34 ccall: getsockopt     { i.len a.addr i.optname i.level i.handle -- i.error }
#35 ccall: connect        { i.len a.adr i.handle -- i.error }
#36 ccall: stream-connect { i.timeout $.portname $.hostname -- i.handle }
#37 ccall: lwip-write     { a.buf i.size i.handle -- i.count }
#38 ccall: lwip-read      { a.buf i.size i.handle -- i.count }
#39 ccall: lwip-close     { i.handle -- }
#40 ccall: lwip-listen    { i.backlog i.handle -- i.handle }
#41 ccall: lwip-accept    { a.addrlen a.addr i.handle -- i.error }
#42 ccall: start-server   { i.port -- i.error }
#43 ccall: dhcp-status    { -- i.status }
#44 ccall: ip-info        { a.info -- }
#45 ccall: lwip-select    { i.sec a.exc a.wr a.rd i.n -- i.cnt }
#46 ccall: ip-info@  { a.buf i.adapter# -- i.error }
#47 ccall: open-dir       { -- a.dir }
#48 ccall: close-dir      { a.dir -- }
#49 ccall: next-file      { a.dir -- a.dirent }
#50 ccall: file-bytes     { a.dir -- i.size }
#51 ccall: file-name      { a.dir -- a.name }
#52 ccall: rename-file    { $.old $.new -- }
#53 ccall: delete-file    { $.name -- }
#54 ccall: fs-avail       { -- i.bytes }
#55 ccall: m-emit         { i.char -- }
#56 ccall: errno          { -- i.errno }
#57 ccall: strerror       { i.errno -- $.msg }
#58 ccall: gpio-matrix-out { i.inven i.invout i.fun i.pin -- }
#59 ccall: gpio-matrix-in  { i.invert i.fun i.pin -- }
#60 ccall: mcpwm_gpio_init  { i.gpio# i.io_signal i.pwm# -- e.err? }
#61 ccall: mcpwm_init  { a.conf i.timer# i.pwm# -- e.err? }
#62 ccall: mcpwm_set_frequency  { i.freq i.timer# i.pwm# -- e.err? }
#63 ccall: mcpwm_set_duty_in_us  { i.duty i.op# i.timer# i.pwm# -- e.err? }
#64 ccall: mcpwm_set_duty_type { i.duty# i.op# i.timer# i.pwm# -- i.err? }
#65 ccall: mcpwm_get_frequency { i.timer# i.pwm# -- i.freq }
#66 ccall: mcpwm_set_signal_high { i.op# i.timer# i.pwm# -- i.err? }
#67 ccall: mcpwm_set_signal_low { i.op# i.timer# i.pwm# -- i.err? }
#68 ccall: mcpwm_start { i.timer# i.pwm# -- i.err? }
#69 ccall: mcpwm_stop { i.timer# i.pwm# -- i.err? }
#70 ccall: set-alarm   { i.xt i.ms -- }
#71 ccall: repeat-alarm   { i.xt i.ms -- }
#72 ccall: set-alarm-us   { i.xt i.us -- }
#73 ccall: repeat-alarm-us   { i.xt i.us -- }
#74 ccall: us { i.us -- }
