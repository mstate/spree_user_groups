star_icon = <<TEXT
<% if user.user_group.present? %>
  &nbsp; <%=link_to('', object_url(user), {:class => 'icon-star no-text'}) %>
<% end %>
TEXT
Deface::Override.new(
  :virtual_path=> "spree/admin/users/index",
  :name=> "user_listing_icon",
  :insert_bottom => "td.user_email",
  :text=> star_icon,
)
