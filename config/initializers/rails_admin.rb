RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  config.authorize_with do
      if current_user.blank?
        redirect_to main_app.root_path
      else
        redirect_to main_app.root_path unless current_user.admin?
      end
  end

  config.main_app_name = ["Administrative Management", ""]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    # all
    import do
      only ["User", "Product", "Category"]
    end
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.configure_with(:import) do |config|
    config.logging = true
  end

  config.model "User" do
    import do
      field :name
      field :email
      field :password
      field :password_confirmation
    end
  end

  config.model Product do
    import do
      field :name
      field :description
      field :price
      field :color
      field :unit_in_stock
      field :vendor
      field :category_id
    end
  end

  config.model Category do
    import do
      field :name
      field :parent_id
    end
  end

  config.model User do
    list do
      sort_by :id
      field :id do
        sort_reverse false
        column_width 80
      end
      field :name do
        column_width 200
      end
      field :email do
        column_width 200
      end
      field :role do
        column_width 80
      end
    end
  end

  config.model Product do
    list do
      sort_by :id
      field :id do
        sort_reverse false
        column_width 80
      end
      field :name do
        column_width 200
      end
      field :description do
        column_width 100
      end
      field :color do
        column_width 80
      end
      field :price, :string do
        column_width 120
      end
      field :unit_in_stock do
        column_width 80
      end
      field :vendor do
        column_width 100
      end
    end
  end

  config.model Order do
    list do
      sort_by :id
      field :id do
        sort_reverse false
        column_width 80
      end
      field :status do
        column_width 80
      end
      field :order_name do
        column_width 100
      end
      field :order_phone do
        label "Phone"
        column_width 100
      end
      field :order_address do
        label "Address"
        column_width 150
      end
      field :user do
        column_width 100
      end
      field :created_at do
        label "Checkout Date"
        column_width 100
      end
      field :order_items do
        label "Products In Order"
        column_width 100
      end
    end
  end

  config.model OrderItem do
    list do
      sort_by :order_id
      field :order_id do
        label "Order No"
        column_width 80
      end
      field :id do
        label "Order Item No"
        column_width 80
      end
      field :product_id do
        formatted_value do
          value.to_s.replace(Product.find_by(id: value).name)
        end
        column_width 100
      end
      field :color do
        column_width 60
      end
      field :quantity do
        column_width 80
      end
      field :price do
        column_width 100
      end
    end
  end

  config.model Rating do
    list do
      sort_by :id
      field :id do
        sort_reverse false
        column_width 80
      end
      field :rating do
        column_width 80
      end
      field :user do
        column_width 150
      end
      field :product do
        column_width 200
      end
      field :created_at do
        column_width 200
      end
    end
  end

  config.model Category do
    list do
      field :id do
        column_width 80
      end
      sort_by :name
      field :name do
        sort_reverse false
        column_width 200
      end
      field :parent do
        column_width 150
      end
      field :sub_categories do
        column_width 100
      end
      field :products do
        column_width 150
      end
    end
  end
end
