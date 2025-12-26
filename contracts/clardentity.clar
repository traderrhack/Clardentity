
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

;; Public Functions
(define-public (register-identity (handle (string-ascii 50)) (metadata-url (string-utf8 256)))
    (let
        (
            (existing-profile (get-profile tx-sender))
            (existing-handle (resolve-handle handle))
        )
        (asserts! (is-none existing-profile) err-already-registered)
        (asserts! (is-none existing-handle) err-already-registered)
        (asserts! (> (len handle) u0) err-invalid-name)

        (map-set profiles tx-sender {
            handle: handle,
            metadata-url: metadata-url,
            active: true
        })
        (map-set identities handle tx-sender)
        (ok true)
    )
)
