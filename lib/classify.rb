require 'yaml'
require 'hashie'
require 'shellwords'

# Core
require 'classify/organizer'
require 'classify/config'

# Models
require 'classify/models/document'
require 'classify/models/drawer'

# Services
require 'classify/services/drawer_matcher'
require 'classify/services/document_mover'

# Errors
require 'classify/errors/configuration_missing'

module Classify
end
