require 'rails_helper'

describe PeopleController do
	it 'should have a passing test' do
		expect('a').to eq 'a'
	end

	xit 'should have a failing test' do
		expect('b').to eq 'c'
	end
end