# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_gist_explorer-backend_session',
                                                      domain: Settings::App.session_store_domain
