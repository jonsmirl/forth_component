\ Load file for application-specific Forth extensions

fl misc.fth
fl dl.fth
fl random.fth
fl ilog2.fth
fl tek.fth

warning @ warning off
: bye standalone?  if  restart  then  bye  ;
warning !

: .commit  ( -- )  'version cscount type  ;

: .built  ( -- )  'build-date cscount type  ;

: banner  ( -- )
   cr ." CForth built " .built
   ."  from " .commit
   cr
;

\ m-emit is defined in textend.c
alias m-key  key
alias m-init noop

: m-avail?  ( -- false | char true )
   key?  if  key true exit  then
   false
;
alias get-ticks get-msecs
: ms>ticks  ( ms -- ticks )  ;

fl wifi.fth

fl xmifce.fth
fl crc16.fth
fl xmodem.fth
also modem
: rx  ( -- )  pad  unused pad here - -  (receive)  #100 ms  ;
previous

fl files.fth

fl server.fth

\ Replace 'quit' to make CForth auto-run some application code
\ instead of just going interactive.
\ : app  banner  hex init-i2c  showstack  quit  ;
: interrupt?  ( -- flag )
   ." Type a key within 2 seconds to interact" cr
   #20 0  do  key?  if  key drop  true unloop exit  then  #100 ms  loop
   false
;
: load-startup-file  ( -- )  " start" included   ;

: app
   banner  hex
   interrupt?  if  quit  then
   ['] load-startup-file catch drop
   quit
;

alias id: \

" app.dic" save
