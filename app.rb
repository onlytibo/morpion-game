require 'bundler'
Bundler.require

# on importe les class
require_relative 'lib/app/board_case'
require_relative 'lib/app/board'
require_relative 'lib/app/game'
require_relative 'lib/app/player'
require_relative 'lib/app/application'
require_relative 'lib/views/show'

# on lance l'app automatiquement avec la class Application
app = Application.new

