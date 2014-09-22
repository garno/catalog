require 'yaml'
require 'shellwords'
require 'optparse'

# Core
require 'catalog/organizer'
require 'catalog/config'

# CLI
require 'catalog/cli'

# Models
require 'catalog/models/document'
require 'catalog/models/drawer'

# Services
require 'catalog/services/drawer_matcher'
require 'catalog/services/document_mover'

# Errors
require 'catalog/errors/configuration_missing'

module Catalog
end
