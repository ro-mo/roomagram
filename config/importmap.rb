# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "three" # @0.160.0
pin "three/addons/", to: "https://unpkg.com/three@0.160.0/examples/jsm/"
pin "jquery" # @3.7.1
pin "uuid" # @9.0.1