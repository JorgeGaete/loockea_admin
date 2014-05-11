require 'spec_helper'

describe "AdminNavegations" do
  
  subject {page}
  
  describe "Home" do
    before { visit root_path }
    
    it { should_not have_title('| Home') }
    it { should have_title('Loockea administracion') }
    it { should have_content('Bienvenido al sistema de administracion!') }
    
  end
  
  describe "help" do
    before { visit help_path }
      
    it { should have_title('Loockea administracion | Help') }
    it { should have_content('Dudas?') }
    
  end
  
  describe "campanas" do
    before { visit campanas_path }
    
    it { should have_title('Loockea administracion | Campanas') }
    it { should have_content('Administracion de Campanas') }
    
  end
  
  describe "contenidos" do
    before { visit contenidos_path }
    
    it { should have_title('Loockea administracion | Contenidos') }
    it { should have_content('Administracion de Contenidos') }

  end
  
  describe "perfiles" do
    before {visit perfiles_path}
    
    it { should have_title('Loockea administracion | Perfiles') }
    it { should have_content('Administracion de Perfiles') }
    
  end
  
end
