class FileService
    def create_data(data:)
        @upload_total_value = 0
        data.map do |buy| 
            item_id = create_item(item_description: buy["item description"], item_price: buy["item price"])
            merchant_id = create_merchant(merchant_address: buy["merchant address"], merchant_name: buy["merchant name"])
            total_purchase = create_purchase(item_id: item_id, merchant_id: merchant_id, purchaser_name: buy["purchaser name"], purchase_count: buy["purchase count"])
            @upload_total_value += total_purchase
        end

        update_total_amount

    end

    def create_item(item_description:, item_price:)
        item = repository.create_item(item_description: item_description, item_price: item_price)
        item.id
    end

    def create_merchant(merchant_address:, merchant_name:)
        merchant = repository.create_merchant(merchant_address: merchant_address, merchant_name: merchant_name)
        merchant.id
    end
    
    def create_purchase(item_id:, merchant_id:, purchaser_name:, purchase_count:)
        total_purchase = repository.create_purchase(item_id: item_id, merchant_id: merchant_id, purchaser_name: purchaser_name, purchase_count: purchase_count)
        total_purchase
    end

    private

    def update_total_amount
        TotalAmount.first.update(last_total_amount: @upload_total_value)
        TotalAmount.first.increment!(:all_total_amount, @upload_total_value)
    end

    def repository
        @repository = FileRepository.new
    end
end