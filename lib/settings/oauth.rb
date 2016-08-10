module Settings
  class Oauth < ::Settingslogic
    source "#{Rails.root}/config/oauth.yml"
    namespace Rails.env
  end
end
