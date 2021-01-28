module Web.View.Dashboard.NewUser where

import Web.View.Partials.Header (header)
import Web.View.Prelude

data NewUserView = NewUserView

instance View NewUserView where
  html NewUserView =
    [hsx|
      {header}
      <form action={pathTo CreateUserDashboardAction} method="POST">
        <input type="text" id="user_name" name="name" placeholder="User Name">
        <button type="submit">Create User</button>
      </form>
    |]
