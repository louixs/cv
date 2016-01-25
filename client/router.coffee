Router.configure
  layoutTemplate: 'layout'
  yieldRegions:
      'header': to: 'header'
      'footer': to: 'footer'
###
  yieldTemplate:
    header:
      to: 'header'
    footer:
      to: 'footer'
###
Router.route '/', {
  name: 'home',
  path: '/'
  template: 'cv'
  }

Router.route 'cv', {
  name:'cv'
  path: '/cv'
  template: 'cv'
  #layoutTemplate:'cvBody'
  ###
  yieldRegions:
      'cvHeader': to: 'cvHeader'
      'cvEdit': to: 'cvEdit'
  ###
  }

###
Router.route 'cvBody', {
  name: 'cvBody',
  path: '/cvBody'
  template: 'cvBody'
  }
###

Router.route 'about', {
  name: 'about',
  path: '/about'
  template: 'about'
  }

Router.route 'myBlogIndex', {
  name: 'blog',
  path: '/blog'
  template: 'myBlogIndex'
  }
