;; Project Verification Contract
;; This contract validates the technical and financial viability of infrastructure projects

(define-data-var project-status (string-ascii 20) "pending")
(define-map projects
  { project-id: uint }
  {
    name: (string-ascii 100),
    description: (string-ascii 500),
    total-cost: uint,
    verified: bool,
    technical-score: uint,
    financial-score: uint,
    owner: principal
  }
)

(define-map verifiers principal bool)

(define-constant contract-owner tx-sender)

;; Error codes
(define-constant err-not-authorized (err u100))
(define-constant err-project-not-found (err u101))
(define-constant err-already-verified (err u102))

;; Add a verifier who can validate projects
(define-public (add-verifier (verifier principal))
  (begin
    (asserts! (is-eq tx-sender contract-owner) err-not-authorized)
    (ok (map-set verifiers verifier true))
  )
)

;; Register a new project
(define-public (register-project
    (project-id uint)
    (name (string-ascii 100))
    (description (string-ascii 500))
    (total-cost uint))
  (begin
    (asserts! (is-none (map-get? projects { project-id: project-id })) (err u103))
    (ok (map-set projects
      { project-id: project-id }
      {
        name: name,
        description: description,
        total-cost: total-cost,
        verified: false,
        technical-score: u0,
        financial-score: u0,
        owner: tx-sender
      }
    ))
  )
)

;; Verify a project's technical and financial viability
(define-public (verify-project
    (project-id uint)
    (technical-score uint)
    (financial-score uint))
  (let (
    (project (unwrap! (map-get? projects { project-id: project-id }) err-project-not-found))
    (is-verifier (default-to false (map-get? verifiers tx-sender)))
  )
    (asserts! is-verifier err-not-authorized)
    (asserts! (not (get verified project)) err-already-verified)

    (ok (map-set projects
      { project-id: project-id }
      (merge project {
        verified: (and (>= technical-score u70) (>= financial-score u70)),
        technical-score: technical-score,
        financial-score: financial-score
      })
    ))
  )
)

;; Read-only function to get project details
(define-read-only (get-project (project-id uint))
  (map-get? projects { project-id: project-id })
)

;; Read-only function to check if a project is verified
(define-read-only (is-project-verified (project-id uint))
  (default-to false (get verified (map-get? projects { project-id: project-id })))
)
