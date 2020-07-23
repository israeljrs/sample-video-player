Rails.application.configure do

    # Do not generate specs for views and requests. Also, do not generate assets.
    config.generators do |g|
      g.helper false
      g.assets false
      g.test_framework :rspec
      g.orm :active_record, primary_key_type: :uuid
    end

end
