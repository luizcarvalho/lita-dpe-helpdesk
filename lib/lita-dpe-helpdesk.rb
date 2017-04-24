require 'lita'

Lita.locale = 'pt-BR'
Lita.load_locales Dir[File.expand_path(
  File.join('..', '..', 'locales', '*.yml'), __FILE__
)]

require 'lita/handlers/helpers/dpe_helpdesk_helper'
require 'lita/handlers/dpe_helpdesk'
require 'dpe/communicator'
require 'dpe/category'
require 'telegram/bot/api'

include DpeHelpdeskHelper

Lita::Handlers::DpeHelpdesk.template_root File.expand_path(
  File.join('..', '..', 'templates'),
  __FILE__
)
