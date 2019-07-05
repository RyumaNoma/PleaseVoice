module ApplicationHelper
  def full_title(part_title)
    base = "PleaseVoice"

    if part_title == ""
      base
    else
      base + " | " + part_title
    end
  end
end
