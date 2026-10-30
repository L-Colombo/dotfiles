;;; -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6
      inhibit-startup-screen t
      frame-inhibit-implied-resize t
      inhibit-compacting-font-caches t
      inhibit-message nil
      inhibit-redisplay nil
      display-line-numbers-type 'visual)

(auto-save-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode 1)
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(repeat-mode 1)
(delete-selection-mode 1)
(put 'donwcase-region 'disabled nil)

(load-theme  'modus-vivendi-tritanopia t)
;; (set-face-attribute 'default nil :height 200)
