### Stimulus notifications

[Stimulus Components](https://www.stimulus-components.com/docs/stimulus-notification)

install notification stimulus component

```sh
bin/importmap pin stimulus-character-counter
```

Create notification stimulus controller

```sh
rails generate stimulus notification
```

Add controller boilerplate

```js
import Notification from "stimulus-notification";

export default class extends Notification {
  connect() {
    super.connect(); // extend base stimulus controller
    new bootstrap.Toast(this.element).show(); // required for the Bootstrap Toast element
  }
}
```

Ensure flashes are rendered in the home html file

```html
<body>
  <%= render "shared/flashes" %> <%= yield %>
</body>
```

In `app/views/shared_flashes.html.erb` add the flash html

```ruby
<% flash.each do |key, message| %>
  <div aria-live="polite" aria-atomic="true" class="notification position-absolute">
    <div
    class="alert position-relative <%= flash_class(key) %>"
    role="alert" aria-live="assertive" aria-atomic="true"
    data-controller="notification"
    data-notification-delay-value="3000"
    data-transition-enter-from="opacity-0 translate-x-6"
    data-transition-enter-to="opacity-100 translate-x-0"
    data-transition-leave-from="opacity-100 translate-x-0"
    data-transition-leave-to="opacity-0 translate-x-6"
  >
      <div class="d-flex justify-content-between">
        <p><%= message %></p>
        <div type="button" class="close" aria-label="Close" data-action="click->notification#hide">
          <span aria-hidden="true">&times;</span>
        </div>
      </div>
    </div>
  </div>
<% end %>
```

The `flash_class` method is used to render different styles based on the flash type, create it in `app/helpers/application_helper.rb`

```ruby
module ApplicationHelper
  def flash_class(level)
    bootstrap_alert_class = {
      'success' => 'alert-success',
      'error' => 'alert-danger',
      'notice' => 'alert-info',
      'alert' => 'alert-danger',
      'warn' => 'alert-warning'
    }
    bootstrap_alert_class[level]
  end
end
```

Render a flash whereever you need it

```ruby
class PagesController < ApplicationController
  def index
    flash.notice = "Hey there - I'm a notification"
    redirect_back_or_to({ action: 'index' })
  end
end
```
