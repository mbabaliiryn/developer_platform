require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:groups) }
  end
  context 'group model validation' do
    it 'must have a name' do
      group = Group.new(project_id: 'project1').save
      expect(group).to eq(false)
    end
  end
end
