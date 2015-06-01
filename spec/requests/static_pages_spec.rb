require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before  { visit root_path }
    it { should have_content("Электронный журнал") }
    it { should have_title("Электронный журнал") }
    it { should have_link("Войти") }
  end

  describe "About page" do
    before { visit about_path }
    it { should have_content("О проекте") }
    it { should have_title("О проекте") }
  end

  describe "Menu" do

    describe "home active" do
      before { visit root_path }
      it { should have_selector("li.active", text: "Домашняя страница") }
    end

    describe "about active" do
      before { visit about_path }
      it { should have_selector("li.active", text: "О проекте") }
    end

  end

end
