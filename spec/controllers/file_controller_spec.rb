# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileController, type: :controller do

    let!(:tab_file) { file_fixture("example_input.tab") }

    describe '#index' do
        subject { get :index }

        it 'Validando status HTTP sucesso' do
            expect(subject).to have_http_status(:ok)
        end
    end

    describe '#create' do
        TotalAmount.create(last_total_amount: 0.0, all_total_amount: 0.0)
        subject { post :create, params: { file: tab_file } }

        it 'Validando status HTTP sucesso' do
            expect(subject).to have_http_status(:no_content)
        end
    end

    describe '#home' do
        TotalAmount.create(last_total_amount: 95.0, all_total_amount: 190.0)
        subject { get :home }

        it 'Validando status HTTP sucesso' do
            expect(subject).to have_http_status(:ok)
        end
    end
end