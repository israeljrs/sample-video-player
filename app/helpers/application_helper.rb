module ApplicationHelper
  def flash_helper
    content_tag :div, class: "row justify-content-center" do
      content_tag :div, class: "col-sm-8" do
        flash.map do |key, value|
          content_tag :div, class: "alert alert-#{key} alert-dismissible animated flash slower" do
            content_tag(:span, "&times;".html_safe, class: :close, "data-dismiss" => "alert") + value
          end
        end.join().html_safe
      end
    end
  end

  def alert_helper
    content_tag :div, class: "row justify-content-center" do
      content_tag :div, class: "col-sm-8" do
        if flash[:alert]
          content_tag :div, class: "alert alert-danger alert-dismissible animated flash slower" do
            content_tag(:span, "&times;".html_safe, class: :close, "data-dismiss" => "alert") + flash[:alert]
          end
        end
      end
    end
  end
end

