require 'task'
require 'rspec'
require 'pg'
require 'list'

DB = PG.connect(:dbname => 'to_do_test')

RSpec.configure do |config|
	config.after(:each) do
		DB.exec("DELETE FROM tasks *;")
	end
end

describe Task do
	it 'is initialized with a name' do
		task = Task.new('learn SQL')
		task.should be_an_instance_of Task
	end

	it 'tells you its name' do
		task = Task.new('learn SQL')
		task.name.should eq 'learn SQL'
	end

	it 'starts off with no tasks' do
		Task.all.should eq []
	end

	it 'lets you save tasks to the database' do
		task = Task.new('learn SQL')
		task.save
		Task.all.should eq [task]
	end

	it 'is the same task if it has the same name' do
		task1 = Task.new('learn SQL')
		task2 = Task.new('learn SQL')
		task1.should eq task2
	end
end

RSpec.configure do |config|
	config.after(:each) do
		DB.exec("DELETE FROM lists *;")
	end
end

describe List do
	it 'is initialized with a name' do
		list = List.new('Epicodus stuff')
		list.should be_an_instance_of List

	end

	it 'tells you its name' do
		list = List.new('Epicodus stuff')
		list.name.should eq 'Epicodus stuff'
	end

	it 'is the same list if it has the same name' do
		list1 = List.new('Epicodus stuff')
		list2 = List.new('Epicodus stuff')
		list1.should eq list2
	end

	it 'starts off with no lists' do
		List.all.should eq []
	end

	it 'lets you save lists to the database' do
		list = Lit.new('learn SQL')
		list.save
		List.all.should eq [list]
	end
	
end











