require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }
    it { should have_title "Войти" }
    it { should have_content "Войти" }

    describe "with invalid information" do
      before { click_button "Войти" }
      it { should have_selector("div.alert.alert-danger", text: "Неверная пара логин-пароль") }
      it { should have_title "Войти" }
    end

    describe "with valid information" do

      let(:user) { FactoryGirl.create(:user) }

      before do
        fill_in "Логин", with: user.login
        fill_in "Пароль", with: user.password
        click_button "Войти"
      end

      it { should have_link("Выйти", href: signout_path) }
      it { should_not have_link("Войти", href: signin_path) }

      describe "signout" do
        before { click_link "Выйти" }
        it { should have_link("Войти", href: signin_path) }
        it { should_not have_link("Выйти", href: signout_path) }
      end

    end

  end

end
