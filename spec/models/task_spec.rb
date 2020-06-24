require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'group model validation' do
    it 'must have a name' do
      group = Group.new(user_id: 'Iryn').save
      expect(group).to eq(false)
    end

    it 'must have an group name' do
      group = Group.new(name: 'User Interface').save
      expect(group).to eq(false)
    end
  end
end
