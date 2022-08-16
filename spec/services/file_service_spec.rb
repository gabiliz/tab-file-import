# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileService, type: :service do

    let!(:parsed_file) { [{"purchaser name"=>"João Silva", "item description"=>"R$10 off R$20 of food", "item price"=>"10.0", "purchase count"=>"2", "merchant address"=>"987 Fake St", "merchant name"=>"Bob's Pizza"}, {"purchaser name"=>"Amy Pond", "item description"=>"R$30 of awesome for R$10", "item price"=>"10.0", "purchase count"=>"5", "merchant address"=>"456 Unreal Rd", "merchant name"=>"Tom's Awesome Shop"}, {"purchaser name"=>"Marty McFly", "item description"=>"R$20 Sneakers for R$5", "item price"=>"5.0", "purchase count"=>"1", "merchant address"=>"123 Fake St", "merchant name"=>"Sneaker Store Emporium"}, {"purchaser name"=>"Snake Plissken", "item description"=>"R$20 Sneakers for R$5", "item price"=>"5.0", "purchase count"=>"4", "merchant address"=>"123 Fake St", "merchant name"=>"Sneaker Store Emporium"}] }

    before(:each) do
        @service = FileService.new
    end

    describe 'Validando a criação da compra' do
        it 'Validando criação de item' do
            @service.create_data(data: parsed_file)
            expect(Item.first.description).to eq('Jogo Zelda')
        end

        it 'Validando criação de mercador' do
            @service.create_data(data: parsed_file)
            expect(Merchant.first.name).to eq('Nuuvem')
        end
        
        it 'Validando criação de compra' do
            @service.create_data(data: parsed_file)
            expect(Purchase.count).to eq(4)
        end
    end

    describe 'Validando criação de item' do
        subject { @service.create_item(item_description: 'Jogo Zelda', item_price: 10) }

        it 'Validando retorno do id do item criado' do
            expect(subject).to eq(Item.first.id)
        end
    end

    describe 'Validando criação de mercador' do
        subject { @service.create_merchant(merchant_address: 'Brasil', merchant_name: 'Nuuvem') }

        it 'Validando retorno do id do mercador criado' do
            expect(subject).to eq(Merchant.first.id)
        end
    end
end