# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"


# the future of popperjs, which is part of why bootstrap is broken.
pin "@floating-ui/dom", to: "@floating-ui--dom.js" # @1.6.5
pin "@floating-ui/core", to: "@floating-ui--core.js" # @1.6.2
pin "@floating-ui/utils", to: "@floating-ui--utils.js" # @0.2.2
pin "@floating-ui/utils/dom", to: "@floating-ui--utils--dom.js" # @0.2.2
# floating end

pin "bootstrap" # @5.1.3
pin "@popperjs/core", to:  "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js" # @2.11.8
