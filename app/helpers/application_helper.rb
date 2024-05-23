module ApplicationHelper

    def icon(icon_class)
        content_tag(:i, '', class: icon_class)
      end
end
