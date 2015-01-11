#Blog config for ryw:blog
#for details see - http://github.differential.com/meteor-blog/
if Meteor.isClient
  Blog.config
    blogIndexTemplate: 'myBlogIndex' # '/blog' route
    blogShowTemplate: 'myShowBlog'   # '/blog/:slug' route

if Meteor.isServer
  adminRole: 'Ryuei'
