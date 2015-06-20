require_relative 'share'
module Web::Views::Registrations
  class Create
    include Web::View
    include Web::Views::Registrations::Share
    template 'registrations/new'

  end
end