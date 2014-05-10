require 'spec_helper'

describe "AdminNavegations" do
  describe "Home" do
    it "Should have the content 'Bienvenido al sistema de administracion!'" do
      visit '/admin_navegation/home'
      expect(page).to have_title('Loockea administracion | Home')
      expect(page).to have_content('Bienvenido al sistema de administracion!')
    end
  end
  
  describe "help" do
    it "Should have the content 'Dudas'?'" do
      visit '/admin_navegation/help'
      expect(page).to have_title('Loockea administracion | Help')
      expect(page).to have_content('Dudas?')
    end
  end
  
  describe "campanas" do
    it "Should have the content 'Campanas'" do
      visit '/admin_navegation/campanas'
      expect(page).to have_title('Loockea administracion | Campanas')
      expect(page).to have_content('Administracion de Campanas')
    end
  end
  
  describe "contenidos" do
    it "Should have the content 'Contenidos'" do
      visit '/admin_navegation/contenidos'
      expect(page).to have_title('Loockea administracion | Contenidos')
      expect(page).to have_content('Administracion de Contenidos')
    end
  end
  
  describe "perfiles" do
    it "Should have the content 'Perfiles'" do
      visit '/admin_navegation/perfiles'
      expect(page).to have_title('Loockea administracion | Perfiles')
      expect(page).to have_content('Administracion de Perfiles')
    end
  end
  
end
