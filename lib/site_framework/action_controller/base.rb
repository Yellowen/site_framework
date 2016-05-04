ActionController::Base.class_eval do

  private

  def set_template_path
    if request.respond_to?(:site) && request.site
      # We are in site namespace
      unless request.site.default_template.blank?
        prefix = SiteFramework::Engine.view_path_prefix
        prepend_view_path "#{prefix}/#{request.site.default_template}"
      end
    end
  end

end


ActionController::Base.instance_eval do
  before_action :set_template_path
end
