(lang dune 3.17)

(name serde_list_repro)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name <author@example.com>")

(maintainers "Maintainer Name <maintainer@example.com>")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name serde_list_repro)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends
   ocaml
   dune
   serde
   serde_json
   serde_derive
   yojson
   ppx_yojson_conv
   ppx_deriving
   )
 (tags
  ("add topics" "to describe" your project)))



(pin (package (name serde)) (url "git+https://github.com/serde-ml/serde"))
(pin (package (name serde_json)) (url "git+https://github.com/serde-ml/serde"))
(pin (package (name serde_derive)) (url "git+https://github.com/serde-ml/serde"))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
