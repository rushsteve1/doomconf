;;; presentation.el --- Doom conf presentation of el-secretario -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 Mayobrot
;;
;; Author: Mayobrot <https://github.com/Zetagon>
;; Maintainer: Mayobrot <git@relevant-information.com>
;; Created: January 29, 2022
;; Modified: January 29, 2022
;; Version: 0.0.1
;; Package-Requires: ((emacs "27.1") ("el-secretario" "0.1") ("el-secretario-org" "0.1") ("el-secretario-notmuch" "0.1"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;
;;
;;; Code:
(require 'el-secretario)

(defvar el-secretario-presentation-notmuch-query "piem")

(defun el-secretario-org-narrow-presentation ()
  "Narrow function for presenting"
  (save-excursion
    (let ((closest-todo-upwards (point)))
      (while (el-secretario-org-up-heading 1)
        ;; TODO Error recovery if there is no parent heading with project todo state
        (when (org-get-todo-state)
          (setq closest-todo-upwards (point))))
      (goto-char closest-todo-upwards)
      (org-narrow-to-subtree)))
  (outline-show-entry))

(setq el-secretario-org-narrow-function #'el-secretario-org-narrow-presentation)

(defvar el-secretario-presentation-notmuch-map
  (let ((km (make-sparse-keymap)))
    (define-key km
      "n" '("next" . el-secretario-next-item))
    (define-key km
      "p" '("previous" . el-secretario-previous-item))
    (define-key km
      "c" '("capture" .
            (lambda ()
              (interactive)
              (let ((org-capture-templates `(("x" "auto-generated" entry
                                              (file "~/presentation/example.org")
                                              "* TODO Deal with Email: %a "))))
                (org-capture nil "x")))))
    km))

(custom-set-faces!
  '(outline-1 :height 200)
  '(outline-2 :height 300))

(defun el-secretario-presentation ()
  (interactive)
  (el-secretario-start-session
   (list
    (el-secretario-org-make-source '(property "ID" "da8c85c0-7984-4e90-87d5-1a91e214792a")
                                   ;; Intro slide
                                   '("~/presentation/slides.org")
                                   :keymap 'el-secretario-source-default-map
                                   :next-item-hook (lambda () (org-cycle-hide-drawers 'all)))
    (el-secretario-org-make-source '(property "ID" "a2607246-6366-4327-9133-b87251a9039f")
                                   ;; two paradigms
                                   '("~/presentation/slides.org")
                                   :keymap 'el-secretario-source-default-map
                                   :next-item-hook (lambda () (org-cycle-hide-drawers 'all)))
    (el-secretario-org-make-source '(property "ID" "b63587e8-6081-4e09-9408-7c885151ebba")
                                   ;; array
                                   '("~/presentation/slides.org")
                                   :keymap 'el-secretario-source-default-map)
    (el-secretario-function-source
     :func (lambda ()
             (notmuch-search el-secretario-presentation-notmuch-query)))
    (el-secretario-org-make-source '(property "ID" "5e696318-3a9d-4e21-aa01-a970532d981f")
                                   ;; linked list
                                   '("~/presentation/slides.org")
                                   :keymap 'el-secretario-source-default-map
                                   :next-item-hook (lambda () (org-cycle-hide-drawers 'all)))
    (el-secretario-notmuch-make-source el-secretario-presentation-notmuch-query)
    (el-secretario-org-make-source '(property "ID" "6df5c558-8d8d-4c8e-9d64-cd338115ecee")
                                   ;; Advantages of lists
                                   '("~/presentation/slides.org")
                                   :keymap 'el-secretario-source-default-map
                                   :next-item-hook (lambda () (org-cycle-hide-drawers 'all)))
    (el-secretario-org-make-source '(property "ID" "9bc0dfc6-a6b7-4ff8-8f82-e9e02fd2bc69")
                                   ;; Not just Email
                                   '("~/presentation/slides.org")
                                   :keymap 'el-secretario-source-default-map
                                   :next-item-hook (lambda () (org-cycle-hide-drawers 'all)))
    (el-secretario-function-source
     :func
     (lambda ()
       (let ((org-ql-view-display-buffer-action '(display-buffer-same-window . ())))
         (org-ql-search "~/presentation/example.org"
           '(todo)))))
    (el-secretario-org-make-source '(todo)
                                   '("~/presentation/example.org")
                                   :keymap 'el-secretario-source-default-map
                                   :next-item-hook (lambda () (org-cycle-hide-drawers 'all)))
    (el-secretario-org-make-source '(property "NONEXISTANT")
                                   '("~/presentation/example.org")
                                   :ids '("3a796e3d-25e1-4f44-a12d-e7456212a96a"
                                          "1223d069-c778-40e6-b944-e56188d57c9a"
                                          "45511e43-4afd-4e0f-a1a2-5f09704140fd")
                                   :keymap 'el-secretario-source-default-map
                                   :next-item-hook (lambda () (org-cycle-hide-drawers 'all)))
    (el-secretario-notmuch-make-source el-secretario-presentation-notmuch-query
                                       'el-secretario-presentation-notmuch-map)
    (el-secretario-org-make-source '(todo)
                                   '("~/presentation/example.org")
                                   :keymap 'el-secretario-source-default-map
                                   :next-item-hook (lambda () (org-cycle-hide-drawers 'all)))
    (el-secretario-org-make-source '(property "NONEXISTANT")
                                   '("~/presentation/example.org")
                                   :ids '("ab8193ee-0175-4fb7-8792-b9d3d7e17857"
                                          "6ae3ef40-9e31-4ecd-9286-5fa5d86654d6")
                                   :keymap 'el-secretario-source-default-map
                                   :next-item-hook (lambda () (org-cycle-hide-drawers 'all)))
    (el-secretario-files-make-source '("~/presentation/presentation.el"))
    (el-secretario-org-make-source '(property "NONEXISTANT")
                                   '("~/presentation/example.org")
                                   :ids '("61683945-4d69-4eb2-8660-cd8220d299fd")
                                   :keymap 'el-secretario-source-default-map
                                   :next-item-hook (lambda () (org-cycle-hide-drawers 'all))))))

(el-secretario-start-session
 (el-secretario-org-make-source '(property "NONEXISTANT")
                                '("~/presentation/example.org")
                                :ids '("ab8193ee-0175-4fb7-8792-b9d3d7e17857"
                                       "6ae3ef40-9e31-4ecd-9286-5fa5d86654d6"
                                       "61683945-4d69-4eb2-8660-cd8220d299fd")
                                :keymap 'el-secretario-source-default-map
                                :next-item-hook (lambda () (org-cycle-hide-drawers 'all))))

(provide 'presentation)
;;; presentation.el ends here
