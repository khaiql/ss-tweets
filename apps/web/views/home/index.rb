module Web::Views::Home
  class Index
    include Web::View

    def create_post_form
      form_for :post, '/posts' do
        div class: 'form-group' do
          text_field 'content', class: 'form-control', id: 'post_content', placeholder: 'What do you think?'
        end

        submit 'Submit'
      end
    end
  end
end
