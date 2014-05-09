;;; poly-markdown.el
;;
;; Filename: poly-markdown.el
;; Author: Spinu Vitalie
;; Maintainer: Spinu Vitalie
;; Copyright (C) 2013-2014, Spinu Vitalie, all rights reserved.
;; Version: 1.0
;; URL: https://github.com/vitoshka/polymode
;; Keywords: emacs
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This file is *NOT* part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'polymode)

(defcustom pm-base/markdown
  (pm-basemode "Markdown"
               :mode 'markdown-mode)
  "Markdown base submode"
  :group 'polymode-basemodes
  :type 'object)

(defcustom  pm-chunk/markdown
  (pm-chunkmode-auto "markdown"
                     :head-reg "^[ \t]*```[{ \t]*\\w.*$"
                     :tail-reg "^[ \t]*```[ \t]*$"
                     :retriever-regexp "```[ \t]*{?\\(\\w+\\)"
                     :font-lock-narrow t)
  "Markdown typical chunk."
  :group 'polymode-chunkmodes
  :type 'object)

(defcustom pm-config/markdown
  (pm-config-multi-auto "markdown"
                        :basemode 'pm-base/markdown
                        :auto-chunkmode 'pm-chunk/markdown
                        :init-functions '(poly-markdown-remove-markdown-hooks))
  "Markdown typical configuration"
  :group 'polymode-configs
  :type 'object)

;;;###autoload 
(define-polymode poly-markdown-mode pm-config/markdown)

;;; FIXES:
(defun poly-markdown-remove-markdown-hooks ()
  ;; get rid of awfull hooks
  (remove-hook 'window-configuration-change-hook 'markdown-fontify-buffer-wiki-links t)
  (remove-hook 'after-change-functions 'markdown-check-change-for-wiki-link t))


(provide 'poly-markdown)

