;;--------------------------------------------------------------------------
;; Global Flags.
;;--------------------------------------------------------------------------
(defconst *is-ubuntu* (eq system-type 'gnu/linux)) ;;is ubuntu or not
(defconst *trace-start-time* t) ;;whether trace start time or not

;;--------------------------------------------------------------------------
;; Additional LISP dirs to load
;;--------------------------------------------------------------------------
(add-to-list 'load-path (expand-file-name "zlisp" user-emacs-directory)) ;; lisps of zhousz

;;--------------------------------------------------------------------------
;;Timer tracing utils
;;--------------------------------------------------------------------------
(if *trace-start-time*
    (require 'init-benchmarking)) 

;;--------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;--------------------------------------------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold normal-gc-cons-threshold)
  (add-hook 'after-init-hook
	    (lambda () (setq gc-cons-threshold (* 128 1024 1024)))))

;;--------------------------------------------------------------------------
;; Bootstrap config
;;--------------------------------------------------------------------------
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa) 
(require 'init-exec-path)

;;--------------------------------------------------------------------------
;; Load configs for specific feature and modes
;;--------------------------------------------------------------------------
(require-package 'wgrep)
(require-package 'project-local-variables)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'command-log-mode)


;;--------------------------------------------------------------------------
;; Theme
;;--------------------------------------------------------------------------
(require 'init-themes)

;;--------------------------------------------------------------------------
;; Show line and col number
;;--------------------------------------------------------------------------
(global-linum-mode t)
(display-time-mode 1)
(column-number-mode t)

;;--------------------------------------------------------------------------
;; Load configs for specific feature and modes
;;--------------------------------------------------------------------------

;; Auto expand
(require 'init-hippie-expand)

(provide 'init)
