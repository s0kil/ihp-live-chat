module Web.View.Partials.Header (header) where

import Web.View.Prelude

header :: Html
header =
  [hsx|
    <h1>
      <a href="/">IHP Live Chat</a>
    </h1>
    <script>
      // Resets All Forms To Clean State
      document.addEventListener('turbolinks:load', () => [...document.querySelectorAll("form")].forEach((form) => form.reset()));
    </script>
    <hr>
  |]
