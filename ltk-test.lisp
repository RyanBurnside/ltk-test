;;;; ltk-template.lisp

(in-package #:ltk-test)

;;; "ltk-test" goes here. Hacks and glory await!

;; Special symbols to hold width and height
;; parameters can reload variables can't

(defparameter *window-width* 320)
(defparameter *window-height* 240)
(defparameter *across* 10)
(defparameter *down* 10)


;; Build a box of buttons in a scrolled frame

(defun make-button-callback (x y)
  "Creates a closure for a Button's callback without adding baggage to the
   Button itself"
  (lambda ()
    (let ((msg (format nil
                       "~&You clicked Button (~a, ~a)"
                       x
                       y)))
      (print msg)
      (do-msg msg))))


(defun run-demo ()
  (with-ltk ()
    (wm-title *tk* (format nil "~ax~a Button Tray" *across* *down*))
    (set-geometry *tk* *window-width* *window-height* 0 0)

    (let* ((sw (make-instance 'scrolled-frame :master *tk*))
           (l (make-instance 'label
                             :text "Click a button and it'll echo to REPL")))
      (pack l)

      (dotimes (row *down*)
        (dotimes (column *across*)
          (let* ((b (make-instance 'button
                                   :master  (ltk:interior sw)
                                   :text (format nil "(~a,~a)" column row)
                                   :command (make-button-callback column row))))

            (grid b column row))))
      (pack sw :fill :both :expand t))))
