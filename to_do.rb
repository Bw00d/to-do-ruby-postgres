require 'pg'
require './lib/task'

DB = PG.connect(:dbname = 'to_do')

def welcome
	puts "Welcome to the TO DO list!"
	menu
end