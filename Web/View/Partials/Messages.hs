module Web.View.Partials.Messages (showMessages) where

import Web.View.Prelude

showMessages :: Include "messages" Room -> Html
showMessages room =
  [hsx|
    <h4 class="text-center">Chat</h4>
    <ul class="list-unstyled list-group list-group-flush" style="overflow-x: auto; height: 70vh">
      {forEach (get #messages room) showMessage}
    </ul>
    {createMessage room}
  |]

showMessage :: Message -> Html
showMessage message =
  [hsx|
    <li class="list-group-item" style="font-size: 12px;">
      <span style="padding-right: 1rem; color: tomato;">{get #userName message}</span>
      <p style="display: inline;">{get #body message}</p>
    </li>
  |]

createMessage :: Include "messages" Room -> Html
createMessage room =
  [hsx|
    <form action={createMessagePath} method="POST">
      <textarea id="message_body" name="body" placeholder="Message" class="col"></textarea>
      <button type="submit">Send Message</button>
    </form>
  |]
  where
    createMessagePath :: Text
    createMessagePath = pathTo CreateMessageDashboardAction {roomId = get #id room}
