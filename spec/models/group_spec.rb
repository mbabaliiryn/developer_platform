require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'group model validation' do
    it 'must have a name' do
      group = Group.new(project_id: 'project1').save
      expect(group).to eq(false)
    end

    it 'must have an project name' do
      group = Group.new(name: 'frontend devs').save
      expect(group).to eq(false)
    end
  end
end
