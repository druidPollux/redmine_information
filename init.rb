require 'redmine'
require 'redmine_information'

Redmine::Plugin.register :redmine_information do
  name 'Redmine Information Plugin'
  author 'M. Yoshida / y.yoshida'
  description 'This is a plugin for information of Redmine'
  version '1.0.3'
  requires_redmine :version_or_higher => '2.0.0'
  url 'https://github.com/yoshidayo/redmine_information'
  author_url 'http://www.ibs.inte.co.jp/'

  setmap = InfoCategory.hide_map();
  setmap[:use_dot] = false
  setmap[:dot_cmdpath] = 'dot'
  settings(:default => setmap,
           :partial => 'settings/info_settings')
  menu(:admin_menu, :redmine_info,
       { :controller => 'info', :action => 'index'},
       :if => Proc.new { User.current.logged? })

end


Redmine::MenuManager.map :redmine_info_menu do |menu|
  InfoCategory.push_menu(menu, :permissions, :html => {:class => 'roles'})
  InfoCategory.push_menu(menu, :workflows)
  InfoCategory.push_menu(menu, :settings)
  InfoCategory.push_menu(menu, :plugins)
  InfoCategory.push_menu(menu, :wiki_macros)
  InfoCategory.push_menu(menu, :rails_info)
  InfoCategory.push_menu(menu, :version, {:last => true, :html=>{:class => 'info'}})
end
