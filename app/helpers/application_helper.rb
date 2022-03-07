module ApplicationHelper
  def icon_for(done)
    done ? icon("fas", "check-square") : icon("fas", "square")
  end
end
