icon_class = 'icon-star no-text distro-star-icon'
edit_star_icon = <<TEXT
<% if user.user_group.present? %>
  &nbsp; <%= link_to('', object_url(user), {:class => '#{icon_class}'}) %>
<% end %>
TEXT
show_star_icon = <<TEXT
<% if @user.user_group.present? %>
  &nbsp; <span class='#{icon_class}'>&nbsp;</span>
<% end %>
TEXT
Deface::Override.new(
  :virtual_path => "spree/admin/users/index",
  :name => "user_listing_icon",
  :insert_bottom => "td.user_email",
  :text => edit_star_icon,
)
Deface::Override.new(
  :virtual_path => "spree/admin/users/show",
  :name => "user_show_icon",
  :insert_after => "[erb-loud]:contains('@user.email')",
  :text => show_star_icon,
)
