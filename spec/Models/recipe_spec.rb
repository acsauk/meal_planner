describe Recipe, type: :model do
  it { is_expected.to belong_to :user }

  it { is_expected.to have_many(:quantities) }
  it { is_expected.to have_many(:ingredients).through(:quantities) }

  it { is_expected.to have_many(:meal_recipes) }
  it { is_expected.to have_many(:meals).through(:meal_recipes) }

  it { is_expected.to have_many(:tag_recipes) }
  it { is_expected.to have_many(:tags).through(:tag_recipes) }

  it do
    is_expected.to accept_nested_attributes_for(:quantities)
      .allow_destroy(true)
  end
end
