module ApplicationHelper
  def authentication_menu
    # Build a list of links depending on the user's permissions.
    links = ""
    if @authenticated.present?
      links += "<li>#{ link_to('New Post', new_post_path)}</li>"
      links += "<li>#{ link_to('Edit Account', edit_users_path(@authenticated))}</li>"
      links += "<li>#{ link_to('Logout ' + @authenticated.name, login_path, :method => 'delete') }</li>"
    else
      links += "<li>#{ link_to('Login', login_path) }</li>"
    end

    links
  end
end