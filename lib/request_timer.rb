class RequestTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now
    status, headers, response = @app.call(env)
    end_time = Time.now

    elapsed_time = (end_time - start_time) * 1000
    Rails.logger.info "Request took #{elapsed_time}ms"

    [status, headers, response]
  end
end