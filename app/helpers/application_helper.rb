module ApplicationHelper
  def user_avatar(user)
    # TODO: upload avatar option
    asset_path('user2.png')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
