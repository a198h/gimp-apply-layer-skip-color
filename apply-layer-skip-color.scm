;; apply-layer-skip-color.scm
;; Author: a198h
;; Repository: https://github.com/a198h/gimp-apply-layer-skip-color
;; Applique le calque "logo-layer" sur tous les calques,
;; sauf ceux tagués avec la couleur choisie

(define (apply-layer-skip-color image logo-layer skip-color)
  (let* (
         (layers-info (gimp-image-get-layers image))
         (layers-array (cadr layers-info))
         (num-layers (car layers-info))
         (i 0)
         ;; Correspondance des couleurs avec les valeurs GIMP 2.10
         (color-values (list 0 6 1 2 3 4 5 7 8)) ; Aucune, Rouge, Orange, Jaune, Vert, Bleu, Violet, Gris, Noir
         (skip-tag (list-ref color-values skip-color))
        )
    (gimp-image-undo-group-start image)
    ;; Copie unique du contenu du calque logo
    (gimp-edit-copy logo-layer)
    (while (< i num-layers)
      (let* ((current-layer (aref layers-array i))
             ;; Selon le PDB, ceci renvoie un entier; (car ...) est sûr si une liste est renvoyée
             (tag (let ((t (gimp-item-get-color-tag current-layer)))
                    (if (list? t) (car t) t))))
        (if (and
             (not (= current-layer logo-layer)) ; ne pas traiter le logo lui-même
             (not (= tag skip-tag)))            ; ignorer les calques avec la couleur choisie
            (begin
              (gimp-image-set-active-layer image current-layer)
              (gimp-floating-sel-anchor (car (gimp-edit-paste current-layer 0))))))
      (set! i (+ i 1)))
    (gimp-image-undo-group-end image)
    (gimp-displays-flush)
    (gimp-message "Calque appliqué partout (calques marqués ignorés).")
  )
)

(script-fu-register 
  "apply-layer-skip-color"
  "Apply Layer (skip color)"
  "Applies the active layer to all other layers except those with the chosen color tag."
  "a198h"
  "Copyright (C) 2025 a198h - GPL v3"
  "2025"
  "RGB*, GRAY*"
  SF-IMAGE "Image" 0
  SF-DRAWABLE "Layer" 0
  SF-OPTION "Skip" '("None" "Red" "Orange" "Yellow" "Green" "Blue" "Violet" "Gray" "Black"))

(script-fu-menu-register "apply-layer-skip-color" "<Image>/Filters/Mes scripts")
