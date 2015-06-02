require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "show user page" do
    let (:user) { FactoryGirl.create(:user) }
    before { visit user_path user }
    it { should have_content user.name }
    it { should have_content user.login }
    it { should have_title user.name }
  end

  describe "create user page" do
    before { visit "/users/new" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button "Создать" }.not_to change(User, :count)
      end
    end

    describe "with valid information" do

      before do
        fill_in "Имя", with: "Example User"
        fill_in "Логин", with: "example"
        fill_in "Пароль", with: "foobar"
        fill_in "Подтверждение пароля", with: "foobar"
      end

      it "should create a user" do
        expect { click_button "Создать" }.to change(User, :count).by(1)
      end

        describe "after creating user" do
          before { click_button "Создать" }
          it { should have_selector("div.alert.alert-success") }

      end

    end

  end

end
