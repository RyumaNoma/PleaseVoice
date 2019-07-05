module ApplicationHelper
  def full_title(part_title)
    base = "FeelBack"

    if part_title.nil?
      base
    else
      base + " | " + part_title
    end
  end
end
