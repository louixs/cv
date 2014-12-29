page = require("webpage").create()

clipRect = document.querySelector($('article.cv')).getBoundingClientRect()
page.clipRect =
  top: clipRect.top
  left: clipRect.left
  width: clipRect.width
  height: clipRect.height

page.render "public/cv.pdf"
phantom.exit()
