namespace :db do
  task :populate do
    Shortener.delete_all

    100.each do
      url = Faker::Internet.url
      Shortener.create(url:, visits: rand(0..100))
    end
  end
end
