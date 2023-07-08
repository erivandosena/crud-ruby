class ApplicationController < ActionController::Base
    # To instruct Rails to handle requests without an authenticity token (Localhost development only).
    protect_from_forgery with: :null_session
end