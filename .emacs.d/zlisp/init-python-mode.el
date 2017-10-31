(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

(when (maybe-require-package 'anaconda-mode)
  (require 'f)
  (defcustom anaconda-mode-installation-directory
    (f-parent (locate-library "anaconda-mode"))
    "Installation directory for anaconda-mode server."
    :group 'anaconda-mode
    :type 'directory)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
    ;set interpreter to ipython, as everybook recommended
    (setq python-shell-interpreter "ipython"
	  python-shell-interpreter-args "-i"))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (add-hook 'python-mode-hook
                (lambda () (sanityinc/local-push-company-backend '(company-anaconda :with company-yasnippet)))))))


(provide 'init-python-mode)
