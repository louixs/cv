#Blog config for ryw:blog
#for details see - http://github.differential.com/meteor-blog/
if Meteor.isClient
  Blog.config
    blogIndexTemplate: 'myBlogIndex' # '/blog' route
    blogShowTemplate: 'myShowBlog'   # '/blog/:slug' route
    comments:
      disqusShortname: 'ryuei'
    syntaxHighlighting: true # default is false
    syntaxHighlightingTheme: 'atelier-dune.dark' # default is 'github'

if Meteor.isServer
  adminRole: 'Ryuei'
