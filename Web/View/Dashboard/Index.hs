module Web.View.Dashboard.Index where

import Web.View.Partials.Events (showEvents)
import Web.View.Partials.Header (header)
import Web.View.Partials.Messages (showMessages)
import Web.View.Partials.Rooms (showRooms)
import Web.View.Prelude

data IndexView = IndexView
  { selectedRoom :: Maybe (Include "messages" Room),
    rooms :: [Room],
    events :: [Event]
  }

instance View IndexView where
  html IndexView {..} =
    [hsx|
      {header}

      <div class="container">
        <div class="row">
          <div class="col-3">
            {showRooms rooms}
          </div>

          {showRoom selectedRoom}

          <div class="col-3">
            {showEvents events}
          </div>
        </div>
      </div>
    |]

showRoom :: Maybe (Include "messages" Room) -> Html
showRoom Nothing = [hsx||]
showRoom (Just room) =
  [hsx|
    <div class="col-6">
      {showMessages room}
    </div>
  |]
