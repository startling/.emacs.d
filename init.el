;; ==================================================================
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme/")
(load-theme 'firebelly)
(require 'package)
(add-to-list
 'package-archives
 '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;; ==================================================================
(when window-system
  ; hide the toolbar in gui mode.
  (tool-bar-mode -1)
  ; turn off visual-line-mode
  (visual-line-mode -1)
  ; hide fringes
  (fringe-mode -1)
  ; hide scroll bars.
  (scroll-bar-mode -1)
  ; set the size
  (add-to-list 'default-frame-alist
    '(width . 80))
  (add-to-list 'default-frame-alist
    '(height . 62))
  ; set the font.
  (set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 100))
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
(setq-default cursor-type 'hbar)
(setq-default cursor-in-non-selected-windows nil)
(blink-cursor-mode -1)
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
(setq erc-nick "startling") (setq erc-nick-uniquifier "'")
(setq erc-track-exclude-types
      '("JOIN" "KICK" "NICK" "PART" "QUIT" "MODE" "333" "353"
        "324" "329" "332" "447"))
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '((".*\\.freenode.net" "#python-offtopic" "#haskell"
         "#haskell-blah" "#haskell-overflow" "#idris" "#python")))
;; ==================================================================
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-hook 'markdown-mode-hook
          (lambda ()
            (turn-on-auto-fill)
            (outline-minor-mode)
            (setq tab-width 2)))
;; ==================================================================
(require 'cl) (require 'mingus)
(global-set-key
 (kbd "C-`")
 (lambda ()
   (interactive)
   (mingus-start-daemon)
   (mingus)))
(global-set-key
 (kbd "M-`")
 (lambda ()
   (interactive)
   (mingus-start-daemon)
   (mingus-browser))
;; ==================================================================
