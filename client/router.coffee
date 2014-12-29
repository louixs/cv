Router.configure
  layoutTemplate: 'layout'
  yieldTemplate:
    header:
      to: 'header'
    footer:
      to: 'footer'

Router.route 'home', {
  name: 'home',
  path: '/'
  template: 'cv'
  }

Router.route 'cv', {
  name: 'cv',
  path: '/cv'
  template: 'cv'
  }

Router.route 'about', {
  name: 'about',
  path: '/about'
  template: 'about'
  }
