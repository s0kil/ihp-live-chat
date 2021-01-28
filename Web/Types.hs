module Web.Types where

import Generated.Types
import IHP.ModelSupport
import IHP.Prelude

data WebApplication
  = WebApplication
  deriving (Eq, Show)

data DashboardController
  = DashboardAction
  | RoomDashboardAction {roomId :: Id Room}
  | NewUserDashboardAction
  | CreateUserDashboardAction
  | CreateRoomDashboardAction
  | CreateMessageDashboardAction {roomId :: Id Room}
  deriving (Eq, Show, Data)
