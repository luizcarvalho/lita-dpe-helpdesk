require 'simplecov'
require 'coveralls'
require 'pry'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [SimpleCov::Formatter::HTMLFormatter,
   Coveralls::SimpleCov::Formatter]
)
SimpleCov.start { add_filter '/spec/' }

require 'lita_dpe_helpdesk'
require 'lita/rspec'

Coveralls.wear!

# A compatibility mode is provided for older plugins upgrading from Lita 3. Since this plugin
# was generated with Lita 4, the compatibility mode should be left disabled.
Lita.version_3_compatibility_mode = false
