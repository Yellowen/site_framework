ActionController::Base.class_eval do

  private

  def set_template_path
    unless request.site
      # We are in site namespace
      unless request.site.default_template.blank?
        prepend_view_path[request.site.default_template]
      end
    end
  end
end


ActionController::Base.instance_eval do
  before_action :set_template_path
end
