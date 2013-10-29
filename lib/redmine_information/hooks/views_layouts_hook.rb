module RedmineInformation
  module Hooks
    class ViewsLayoutsHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        return stylesheet_link_tag(:redmine_info, :plugin => 'redmine_information')
      end
    end
  end
end
