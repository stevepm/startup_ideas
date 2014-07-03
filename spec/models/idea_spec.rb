require 'rails_helper'

describe Idea do
  it 'no idea present' do
    idea = Idea.create(title: nil)
    expect(idea.valid?).to eq(false)
  end

  it 'creates an idea correctly' do
    idea = Idea.create(title: 'this is the idea')
    expect(idea.valid?).to eq(true)
  end
end