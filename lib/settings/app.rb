module Settings
  class App < ::Settingslogic
    source "#{Rails.root}/config/app.yml"
    namespace Rails.env
  end
end
