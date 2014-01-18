module SiteFramework
  class Middleware

    def initialize(app)
      @app = app
    end

    def call(env)
      # Create a method called domain which will return the current domain
      # name
      Rails.application.class.send :define_method, "domain" do
        env["SERVER_NAME"]
      end

      @app.call(env)
    end
  end
end
