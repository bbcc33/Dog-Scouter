RSpec.describe DogSighting, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:city) }

  it { should validate_presence_of(:dog_description) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:city) }
end
