;; idris.el - major mode for editing idris source files
;;
;; Copyright (C) 2013 tim dixon
;;
;; Author: tim dixon <tdixon51793@gmail.com>
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(defvar idris-syntax-table
  (make-syntax-table))

;; '-' is the first and/or second character of a opening comment
;; and maybe the third of the closing comment.
(modify-syntax-entry ?- "_ 123" idris-syntax-table)
;; '\n' ends comments.
(modify-syntax-entry ?\n ">" idris-syntax-table)
;; '{' is a delimiter or possibly the beginning of a comment.
;; N.B. for now, multiline delimited comments will be highlighted
;; as if they are only one line.
(modify-syntax-entry ?{ "(}1" idris-syntax-table)
;; '}' is a delimiter or possibly the end of a comment. N.B. that
;; this means that "--"-style comments will be highlighted as if
;; it were ended by "-}" if it exists, too; I can't find a good
;; workaround for this.
(modify-syntax-entry ?} "){4" idris-syntax-table)
;; '_' and '\'' can be in names.
(modify-syntax-entry ?_ "w" idris-syntax-table)
(modify-syntax-entry ?' "w" idris-syntax-table)

;; Make the actual mode.
(define-derived-mode idris-mode fundamental-mode "Idris"
  (setq font-lock-defaults
    '(nil nil nil nil nil))
  (setq comment-start "--")
  (set-syntax-table idris-syntax-table))

;; Add the keywords.
(font-lock-add-keywords 'idris-mode
  '(("module" . font-lock-keyword-face)
     ("namespace" . font-lock-keyword-face)
     ("import" . font-lock-keyword-face)
     ("where" . font-lock-keyword-face)
     ("public" . font-lock-keyword-face)
     ("do" . font-lock-keyword-face)
     ("case" . font-lock-keyword-face)
     ("using" . font-lock-keyword-face)
     ("parameters" . font-lock-keyword-face)
     ("mutual" . font-lock-keyword-face)
     ("if" . font-lock-keyword-face)
     ("then" . font-lock-keyword-face)
     ("else" . font-lock-keyword-face)
     ("prefix" . font-lock-keyword-face)
     ("infix" . font-lock-keyword-face)
     ("infixr" . font-lock-keyword-face)
     ("infixl" . font-lock-keyword-face)
     ("pattern" . font-lock-keyword-face)
     ("term" . font-lock-keyword-face)
     ("syntax" . font-lock-keyword-face)
     ("of" . font-lock-keyword-face)
     ("intros" . font-lock-keyword-face)
     ("rewrite" . font-lock-keyword-face)
     ("exact" . font-lock-keyword-face)
     ("refine" . font-lock-keyword-face)
     ("trivial" . font-lock-keyword-face)
     ("focus" . font-lock-keyword-face)
     ("try" . font-lock-keyword-face)
     ("compute" . font-lock-keyword-face)
     ("solve" . font-lock-keyword-face)
     ("attack" . font-lock-keyword-face)
     ("with" . font-lock-keyword-face)
     ("dsl" . font-lock-keyword-face)
     ("instance" . font-lock-keyword-face)
     ("partial" . font-lock-keyword-face)
     ("total" . font-lock-keyword-face)
     ("data" . font-lock-keyword-face)
     ("class" . font-lock-keyword-face)
     ("codata" . font-lock-keyword-face)
     ("record" . font-lock-keyword-face)))

; Automatically use idris-mode for .idr files.
(push '("\\.idr$" . idris-mode) auto-mode-alist)

(provide 'idris)
