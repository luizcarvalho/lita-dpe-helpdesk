require 'lita'

Lita.locale = 'pt-BR'
Lita.load_locales Dir[File.expand_path(
  File.join('..', '..', 'locales', '*.yml'), __FILE__
)]

require 'lita/handlers/dpe_helpdesk'
require 'dpe/communicator'
require 'dpe/category'

Lita::Handlers::DpeHelpdesk.template_root File.expand_path(
  File.join('..', '..', 'templates'),
  __FILE__
)
