module ApplicationHelper
  # ページのタイトルを返す
  def full_title(page_title)
    base_title = "healthアプリ" # アプリ名を設定する
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
