require "rails_helper"

RSpec.describe User, type: :model do

  let(:user){FactoryGirl.create :user}
  subject{user}

  context "should pass validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of(:email).case_insensitive()}
    it {should allow_value(subject.email).for :email}
    it {should validate_presence_of :phone}
    it {should allow_value(subject.phone).for :phone} # validate format of phone
    it {should validate_presence_of :address}
    it {should validate_length_of :address}
    it {should allow_value(subject.address).for :address} # validate format of address
    it {should define_enum_for(:role).with(%i(customer admin))}
    it {should validate_presence_of :password}
  end

  context "should have associations" do
    it {should have_many(:orders).dependent(:destroy)}
    it {should have_many(:ratings).dependent(:destroy)}
    it {should have_many :rating_product}
    it {should have_many :comments}
  end

  context "should have columns in specific types" do
    it {should have_db_column(:id).of_type(:integer).with_options(null: false)}
    it {should have_db_column(:name).of_type(:string).with_options(null: false)}
    it {should have_db_column(:email).of_type(:string).with_options(null: false)}
    it {should have_db_column(:phone).of_type :string}
    it {should have_db_column(:address).of_type :text}
    it {should have_db_column(:role).of_type(:integer).with_options(default: :customer, null: false)}
  end

  context "should have index" do
    it {should have_db_index(:email).unique}
  end
end
