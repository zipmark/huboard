class Huboard
  class Client
    class Mimetype < Faraday::Middleware
      def initialize(app, *args)
        @app = app
      end

      def call(env)
        env[:request_headers].merge!('Accept' => "application/vnd.github.v3.full+json" )
        env[:request][:timeout] = 3
        env[:request][:open_timeout] = HuboardApplication.production? ? 1.7 : 10

        @app.call env
      end
    end
  end
end
