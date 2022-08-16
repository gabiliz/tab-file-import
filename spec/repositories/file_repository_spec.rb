# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileRepository, type: :repository do

    before(:each) do
        @repository = FileRepository.new
    end

    describe 'Validando criação de item' do
        subject { @repository.create_item(item_description: 'Jogo Zelda', item_price: 10) }

        it 'Validando retorno do id do item criado' do
            expect(subject.id).to eq(Item.first.id)
        end
    end

    describe 'Validando criação de mercador' do
        subject { @repository.create_merchant(merchant_address: 'Brasil', merchant_name: 'Nuuvem') }

        it 'Validando retorno do id do mercador criado' do
            expect(subject.id).to eq(Merchant.first.id)
        end
    end

    describe 'Validando criação de mercador' do
        item = Item.create(description: 'Jogo Zelda', price: 10)
        merchant = Merchant.create(address: 'Brasil', name: 'Nuuvem')
        subject { @repository.create_purchase(item_id: item.id, merchant_id: merchant.id, purchaser_name: 'Joao', purchase_count: 2) }

        it 'Validando retorno do id do mercador criado' do
            expect(subject).to eq(20.0)
        end
    end

end