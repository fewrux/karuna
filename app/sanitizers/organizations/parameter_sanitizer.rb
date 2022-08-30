# class Organization::ParameterSanitizer < Devise::ParameterSanitizer
#   def initialize(*)
#     super
#     permit(:sign_up, keys: %i[name address country website])
#     permit(:account_update, keys: %i[name address country website])
#   end
# end
