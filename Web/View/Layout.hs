module Web.View.Layout (defaultLayout, Html) where

import Generated.Types
import IHP.Controller.RequestContext
import IHP.Environment
import IHP.ViewPrelude
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Web.Routes
import Web.Types

defaultLayout :: Html -> Html
defaultLayout inner =
  H.docTypeHtml ! A.lang "en" $
    [hsx|
    <head>
      {metaTags}

      {stylesheets}
      {scripts}

      <title>IHP Live Chat</title>
    </head>
    <body>
      <div class="container mt-4">
        {renderFlashMessages}
        {inner}
      </div>
      <footer style="margin: 1rem;">
        <a href="https://github.com/s0kil/ihp-live-chat">Source Code</a>
      </footer>
    </body>
  |]

stylesheets :: Html
stylesheets =
  [hsx|
    <link rel="stylesheet" href="/vendor/bootstrap.min.css"/>
    <link rel="stylesheet" href="/vendor/flatpickr.min.css"/>
    <link rel="stylesheet" href="/app.css"/>
  |]

scripts :: Html
scripts =
  [hsx|
    <script id="livereload-script" src="/livereload.js"></script>
    <script src="/vendor/jquery-3.2.1.slim.min.js"></script>
    <script src="/vendor/timeago.js"></script>
    <script src="/vendor/popper.min.js"></script>
    <script src="/vendor/bootstrap.min.js"></script>
    <script src="/vendor/flatpickr.js"></script>
    <script src="/vendor/morphdom-umd.min.js"></script>
    <script src="/vendor/turbolinks.js"></script>
    <script src="/vendor/turbolinksInstantClick.js"></script>
    <script src="/vendor/turbolinksMorphdom.js"></script>
    <script src="/helpers.js"></script>
    <script src="/ihp-auto-refresh.js"></script>
  |]

metaTags :: Html
metaTags =
  [hsx|
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta property="og:title" content="IHP Live Chat"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="https://ihplivechat.ihpapp.com"/>
    <meta property="og:description" content="Super Chat"/>
    {autoRefreshMeta}
  |]
