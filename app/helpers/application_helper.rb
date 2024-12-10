module ApplicationHelper
  def bootstrap_class_for_flash(type)
    case type
    when "notice" then "alert-success"
    when "alert" then "alert-danger"
    when "error" then "alert-warning"
    else "alert-info"
    end
  end
end

