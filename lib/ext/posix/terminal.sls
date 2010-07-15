(library (ext posix terminal)
         (export 
           echo_on
           echo_off
           can_on
           can_off
           checkterminal
           winsize_x
           winsize_y)
         (import 
           (rnrs)
           (nmosh ext))
(import-c ((source "terminal.c"))
          (c-function void echo_on)
          (c-function void echo_off)
          (c-function void can_on)
          (c-function void can_off)
          (c-function int checkterminal)
          (c-function int winsize_x)
          (c-function int winsize_y))
)
