module Web.Controller.Dashboard where

import Web.Controller.Prelude
import Web.View.Dashboard.Index
import Web.View.Dashboard.NewUser

instance Controller DashboardController where
  action DashboardAction = autoRefresh do
    userName <- getSession "userName"
    case userName of
      Nothing -> do
        redirectTo NewUserDashboardAction
      Just _ -> do
        rooms <- query @Room |> fetch
        events <- query @Event |> orderByDesc #createdAt |> fetch
        let selectedRoom = Nothing

        render IndexView {..}
  action RoomDashboardAction {roomId} = autoRefresh do
    rooms <- query @Room |> fetch
    events <- query @Event |> orderByDesc #createdAt |> fetch

    room <-
      fetch roomId
        >>= fetchRelated #messages

    let selectedRoom = Just room

    render IndexView {..}
  action NewUserDashboardAction = do
    render NewUserView
  action CreateUserDashboardAction = do
    let userName :: Text = param "name"
    setSession "userName" userName
    createEvent $ userName ++ " has joined"
    redirectTo DashboardAction
  action CreateRoomDashboardAction = do
    let room = newRecord @Room
    room
      |> fill @'["title"]
      |> validateField #title nonEmpty
      |> ifValid \case
        Left _ -> do
          createEvent "Failed To Create Room"
          redirectTo DashboardAction
        Right room -> do
          room |> createRecord
          createEvent $ "created room " ++ get #title room
          redirectTo DashboardAction
  action CreateMessageDashboardAction {roomId} = do
    room <- fetch roomId
    Just userName <-
      getSession "userName"

    let messageBody :: Text = param "body"

    message <-
      newRecord @Message
        |> set #roomId roomId
        |> set #body messageBody
        |> set #userName userName
        |> createRecord

    createEvent $ userName ++ " messaged in " ++ get #title room

    redirectTo RoomDashboardAction {..}

createEvent message = do
  newRecord @Event
    |> set #body message
    |> createRecord
