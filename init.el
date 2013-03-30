;; ==================================================================
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme/")
(load-theme 'firebelly)
;; ==================================================================
;; Electric pairs and indentation.
(electric-pair-mode 1) (electric-indent-mode 1)
;; interactively do!
(require 'ido) (ido-mode t)
(require 'ido-ubiquitous) (ido-ubiquitous-mode 1)
;; ==================================================================
(set-default 'indent-tabs-mode nil)
(set-default 'tab-width 4)
(setq backup-inhibited t)
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
;; ==================================================================
;; http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))
(global-set-key
 (kbd "C-x r")
 (lambda ()
   (interactive)
   (rename-file-and-buffer (ido-find-file))))
;; ==================================================================
