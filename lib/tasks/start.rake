namespace :db do
  desc 'Resetea la base y la carga con los datos iniciales.'
  task(:restart => :environment) do
    RAILS_ENV = "development"

    Vendedor.destroy_all
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end
