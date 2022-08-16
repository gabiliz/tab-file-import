class FileRepository
    
    def create_item(item_description:, item_price:)
        Item.find_or_create_by(description: item_description, price: item_price)
    end

    def create_merchant(merchant_address:, merchant_name:)
        Merchant.find_or_create_by(address: merchant_address, name: merchant_name)
    end
    
    def create_purchase(item_id:, merchant_id:, purchaser_name:, purchase_count:)
        purchase = Purchase.create(
                    item_id: item_id, 
                    merchant_id: merchant_id, 
                    purchaser_name: purchaser_name, 
                    purchase_count: purchase_count, 
                    total_purchase: calculate_total_purchase(item_id: item_id, purchase_count: purchase_count)
        )
        purchase.total_purchase
    end


    private

    def calculate_total_purchase(item_id:, purchase_count:)
        item_price = Item.find(item_id).price
        item_price * purchase_count.to_i
    end

end