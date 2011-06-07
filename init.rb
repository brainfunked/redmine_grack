require 'redmine'

Redmine::Plugin.register :redmine_grack do
  name 'Redmine Grack plugin'
  author 'Mrugesh Karnik'
  description 'Redmine authentication for Grack'
  version '0.0.1'
  url 'https://github.com/brainfunked/redmine_grack'
  author_url 'http://brainfunked.org'

  #project_module :grack do
    #permission :commit_access, :grack => :rw
  #end
  Redmine::AccessControl.permission(:commit_access).actions << 'grack/rw'
  Redmine::AccessControl.permission(:view_changesets).actions << 'grack/r'
end
