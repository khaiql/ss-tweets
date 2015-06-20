module Web::Views::Registrations
  module Share
    def login_form
      form_for :sign_up, '/registrations', class: 'form-horizontal' do
        div class: 'form-group' do
          label :email, class: 'control-label col-sm-2'
          div class: 'col-sm-10' do
            text_field :email, class: 'form-control', placeholder: 'Email', type: 'email'
          end
        end

        div class: 'form-group' do
          label :name, class: 'control-label col-sm-2'
          div class: 'col-sm-10' do
            text_field :name, class: 'form-control', placeholder: 'Your name'
          end
        end

        div class: 'form-group' do
          label :password, class: 'control-label col-sm-2'
          div class: 'col-sm-10' do
            text_field :password, class: 'form-control', placeholder: 'Password', type: 'password'
          end
        end

        div class: 'form-group' do
          label :password_confirmation, class: 'control-label col-sm-2'
          div class: 'col-sm-10' do
            text_field :password_confirmation, class: 'form-control', placeholder: 'Password', type: 'password'
          end
        end

        div class: 'form-group' do
          div class: 'col-sm-offset-2 col-sm-10' do
            submit "Sign up", class: 'btn btn-success', type: 'submit'
          end
        end
      end
    end
  end
end