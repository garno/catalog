require 'yaml'
require 'hashie'
require 'shellwords'

# Core
require 'catalog/organizer'
require 'catalog/config'

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
