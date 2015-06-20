require_relative 'share'
module Web::Views::Registrations
  class New
    include Web::View
    include Web::Views::Registrations::Share
  end
end
