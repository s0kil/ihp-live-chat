module Web.View.Partials.Events (showEvents) where

import Web.View.Prelude

showEvents :: [Event] -> Html
showEvents events =
  [hsx|
    <h4 class="text-center">History</h4>
    <ul class="list-unstyled list-group list-group-flush" style="overflow-x: auto; height: 70vh">
      {forEach events showEvent}
    </ul>
  |]

showEvent :: Event -> Html
showEvent event =
  [hsx|
    <li class="list-group-item" style="font-size: 12px;">{get #body event}</li>
  |]
