
Note:
Be sure you clone this project to your ~/quicklisp/local-projects/ directory.

This way it'll be found when quicklisp looks for projects.

Loading (Assumes you have installed quicklisp and made it auto start with SBCL)
You will probably do this after SLIME starts.
```
(ql:quickload "ltk-test")
(in-package :ltk-test)
(run-demo)
```

Building an executable:

Note, this needs to be done outside emacs from a terminal.
1. start sbcl in a terminal

```
(ql:quickload "ltk-test")
(save-lisp-and-die "ltk-test"
                   :toplevel #'ltk-test:run-demo
                   :executable t)
```
This will build a binary called ltk-test wherever your terminal was called from.
You will still need to add the OS libraries required by LTK.
