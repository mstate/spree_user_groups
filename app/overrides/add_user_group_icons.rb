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
order_edit_user_icon = <<TEXT
<dt><%= I18n.t(:user_groups) %>:</dt>
<dd id="user_group_name">
  <% if @order.user.present? && @order.user.user_group.present? %>
    <span class='#{icon_class}'><%= @order.user.user_group.name %></span>
  <% end %>
</dd>
TEXT
Deface::Override.new(
  :virtual_path => "spree/admin/users/index",
  :name => "user_listing_user_group_icon",
  :insert_bottom => "td.user_email",
  :text => edit_star_icon,
)
Deface::Override.new(
  :virtual_path => "spree/admin/users/show",
  :name => "user_show_user_group_icon",
  :insert_after => "[erb-loud]:contains('@user.email')",
  :text => show_star_icon,
)
Deface::Override.new(
  :virtual_path   => "spree/admin/shared/_order_tabs",
  :name           => "order_edit_user_group_icon",
  :insert_before  => "dt#order_status",
  :text           => order_edit_user_icon
)
