module Web.View.Partials.Rooms (showRooms) where

import Web.View.Prelude

showRooms :: [Room] -> Html
showRooms rooms =
  [hsx|
    <h4 class="text-center">Rooms</h4>
    <ul class="list-unstyled list-group list-group-flush" style="overflow-x: auto; height: 70vh;">
      {forEach rooms showRoom}
    </ul>
    {createRoom}
  |]

showRoom :: Room -> Html
showRoom room =
  [hsx|
    <li class="list-group-item" style="font-size: 12px;">
      <a href={roomPath room}>{get #title room}</a>
    </li>
  |]
  where
    roomPath room =
      let id :: Id Room = get #id room
       in RoomDashboardAction {roomId = id}

createRoom :: Html
createRoom =
  [hsx|
    <form action={pathTo CreateRoomDashboardAction} method="POST">
      <input type="text" id="room_title" name="title" placeholder="Create Room">
    </form>
  |]
