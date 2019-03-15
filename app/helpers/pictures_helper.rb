module PicturesHelper
  def choose_new_or_edit
    if action_name == "new" || action_name == "confirm"
      confirm_pictures_path
    else
      picture_path
    end
  end
end
