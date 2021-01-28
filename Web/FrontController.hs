module Web.FrontController where

import IHP.RouterPrelude
-- Controller Imports
import Web.Controller.Dashboard
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

instance FrontController WebApplication where
  controllers =
    [ startPage DashboardAction,
      parseRoute @DashboardController
      -- Generator Marker
    ]

instance InitControllerContext WebApplication where
  initContext = do
    setLayout defaultLayout
    initAutoRefresh
