### Install Bootstrap

`gem 'bootstrap'`
`gem 'sassc-rails'`

```
# app/assets/stylesheets/application.scss
@import "bootstrap";
```

`bin/importmap pin bootstrap`

```
// app/javascript/application.js
import "@popperjs/core"
import "bootstrap"
```

```
// app/assets/config/manifest.js
//= link popper.js
//= link bootstrap.min.js
```

```
# config/importmap.rb

# replace these lines:
# pin "bootstrap" # @5.3.2
# pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8

# with this:
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
```
