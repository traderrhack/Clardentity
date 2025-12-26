
;; Clardentity Contract
;; Decentralized Identity Management on Stacks

;; Constants
(define-constant contract-owner tx-sender)

;; Error Codes
(define-constant err-not-authorized (err u100))
(define-constant err-already-registered (err u101))
(define-constant err-not-found (err u102))
(define-constant err-invalid-name (err u103))

;; Storage
(define-map profiles
    principal
    {
        handle: (string-ascii 50),
        metadata-url: (string-utf8 256),
        active: bool
    }
)

(define-map identities
    (string-ascii 50)
    principal
)

;; Read Only Functions
(define-read-only (get-profile (user principal))
    (map-get? profiles user)
)

(define-read-only (resolve-handle (handle (string-ascii 50)))
    (map-get? identities handle)
)
