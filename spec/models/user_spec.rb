require 'spec_helper'

describe User do

  before { @user = User.new(login: "example", name: "Example User", password: "foobar", password_confirmation: "foobar") }
  subject{ @user }

  it { should respond_to :name }
  it { should respond_to :login }
  it { should respond_to :password_digest }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :remember_token }

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

  describe "when name is not present" do
    before { @user.name = "" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a"*51 }
    it { should_not be_valid }
  end

  describe "when login is not present" do
    before { @user.login = "" }
    it { should_not be_valid }
  end

  describe "when login is too long" do
    before { @user.login = "a"*51 }
    it { should_not be_valid }
  end

  describe "when login is already taken" do
    before do
      @user_with_same_login = @user.dup
      @user_with_same_login.save
    end
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user = User.new(login: "example", name: "Example User", password: "", password_confirmation: "") }
    it { should_not be_valid }
  end

  describe "when password doesn't match the confirmation" do
    before { @user = User.new(login: "example", name: "Example User", password: "foobar", password_confirmation: "mismatch") }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user = User.new(login: "example", name: "Example User", password: "a"*3, password_confirmation: "a"*3) }
    it { should_not be_valid }
  end

  describe "authentication method result" do
    before do
      @user = User.new(login: "example", name: "Example User", password: "foobar", password_confirmation: "foobar")
      @user.save
    end

    let(:found_user) { User.find_by(login: @user.login) }

    describe "with valid information" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid information" do
      let(:user_with_invalid_password) { found_user.authenticate("invalid") }
      it { should_not eq user_with_invalid_password }
      specify { expect( user_with_invalid_password).to be_false }
    end

  end

end
