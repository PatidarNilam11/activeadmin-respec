require 'rails_helper'

   .describe SchoolsController, type: :controller do
  before(:each) do
      @school = FactoryBot.create(:school)
  end

    describe 'GET #index school list' do
        it 'display all school' do
            get 'index'
            expect(response.status).to eq 200
        end

        it 'display with id' do
            get 'index' , params: { id: @school.id} 
            expect(response.status).to eq 200
        end

        it '#index  it is nil id' do
          get 'index' , params: { id: nil} 
          expect(response.status).to eq 200
        end
    end

    describe "GET  show profile" do
      it 'display other student profile' do  
        get 'show', params: { id: @school.id} 
        expect(response).to have_http_status :ok 
      end
    end

    describe "#create,#create school#post " do
      it 'school create with school_id' do 
        post 'create', params: { data:  { school_name: 'sdps', school_address: 'Dalauda',  school_id: 1001} } 
        expect(response.status).to eq 200
      end

      it 'school not create without school id' do 
        post 'create', params: { data:  { school_name: 'sdps', school_address: 'Dalauda', school_id: 1001} } 
        expect(response.status).to eq 200
      end
    end

    describe 'update' do
      it 'school update with id' do
        put :update, params:{id: @school.id}
        expect(response).to have_http_status :success
      end
    end
    
    describe 'destroy' do 
      it 'school delete with id' do 
        delete :destroy, params:{id: @school.id}
        expect(response).to have_http_status :success
      end
    end
 end