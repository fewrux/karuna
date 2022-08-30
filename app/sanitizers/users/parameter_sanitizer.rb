# class User::ParameterSanitizer < Devise::ParameterSanitizer
#   def initialize(*)
#     super
#     permit(:sign_up, keys: %i[first_name last_name age gender document country])
#     permit(:account_update, keys: %i[first_name last_name age gender document country])
#   end
# end
