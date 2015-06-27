module Web::Views::Home
  class Index
    include Web::View

    def create_post_form
      form_for :post, '/posts' do
        div class: 'form-group' do
          text_area :content, nil, {class: 'form-control', id: 'post_content', placeholder: 'What do you think?', rows: '5'}
        end

        div class: 'text-right' do
          submit 'Submit', class: 'btn btn-success'
        end
      end
    end
  end
end
