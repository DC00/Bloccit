require 'rails_helper'

RSpec.describe Label, type: :model do
  it { should have_many :labelings }
  it { should have_many(:topics).through(:labelings) }
  it { should have_many(:posts).through(:labelings) }

end
