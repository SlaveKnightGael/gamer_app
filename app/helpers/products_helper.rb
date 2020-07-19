module ProductsHelper

    def product_author(product)
        user_signed_in? && current_user.id == product_user.id
    end

end
