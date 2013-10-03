# Sets the global variables we need to use with our
# gibbon class.  We could do this locally, but it's easier
# as an initializer

Gibbon::API.api_key = ENV["MAILCHIMP_API_KEY"]
Gibbon::API.timeout = 15
Gibbon::API.throws_exceptions = true
Gibbon::Export.api_key = ENV["MAILCHIMP_API_KEY"]
Gibbon::Export.timeout = 15
Gibbon::Export.throws_exceptions = true