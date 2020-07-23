Rails.application.configure do 

    config.i18n.enforce_available_locales = true
    config.i18n.available_locales = [:en, :"pt-BR"]
    config.i18n.default_locale = :"pt-BR"
    config.i18n.locale = :"pt-BR"

end
