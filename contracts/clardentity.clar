
;; Clardentity Contract
;; Decentralized Identity Management on Stacks

;; Constants
(define-constant contract-owner tx-sender)

;; Error Codes
(define-constant err-not-authorized (err u100))
(define-constant err-already-registered (err u101))
(define-constant err-not-found (err u102))
(define-constant err-invalid-name (err u103))
