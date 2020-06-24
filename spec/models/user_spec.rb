require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user input fields' do
    it 'must have a name' do
      user = User.new(email: 'examole@gmail.com').save
      expect(user).to eq(false)
    end

    it 'must have an email' do
      user = User.new(name: 'example').save
      expect(user).to eq(false)
    end

    it 'name must be unique' do
      User.new(name: 'example', email: 'example@gmail.com').save
      user2 = User.new(name: 'example', email: 'exam@gmail.com').save
      expect(user2).to eq(false)
    end

    it 'email must be unique' do
      User.new(name: 'example', email: 'example@gmail.com').save
      user2 = User.new(name: 'exam', email: 'example@gmail.com').save
      expect(user2).to eq(false)
    end
  end
end
