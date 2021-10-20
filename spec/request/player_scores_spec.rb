require 'rails_helper'

RSpec.describe 'Api::PlayerScoresController', type: :request do 
    describe 'Get #index' do
        it 'Works only with pagination' do
            get player_scores_path(page: 1, rows: 4)
            expect(response).to have_http_status(200)
        end

        it 'Works with all data' do
            get player_scores_path(page: 1, rows: 4, before: '2021-10-19 13:00:00', after:'2021-10-19 14:00:00',
                                    playernames:['Jagath Priyashantha', 'Thirsha Sanuthi', 'Nimal Perera', 'Nimal Perera',
                                        'Janith Silva', 'Amal Madahawa', 'Inoue Naoki', 'Naomi Nakamura'])
            expect(response).to have_http_status(200)
        end

        it 'Works only with time before' do
            get player_scores_path(page: 1, rows: 4, before: '2021-10-19 13:00:00')
            expect(response).to have_http_status(200)
        end

        it 'Works only with time after' do
            get player_scores_path(page: 1, rows: 4, after: '2021-10-19 14:00:00')
            expect(response).to have_http_status(200)
        end

        it 'Works only with players names' do
            get player_scores_path(page: 1, rows: 4, playernames:['Jagath Priyashantha', 'Thirsha Sanuthi', 'Nimal Perera', 'Nimal Perera',
                'Janith Silva', 'Amal Madahawa', 'Inoue Naoki', 'Naomi Nakamura'])
            expect(response).to have_http_status(200)
        end

        it 'Works only with time before and players names' do
            get player_scores_path(page: 1, rows: 4, before: '2021-10-19 13:00:00', playernames:['Jagath Priyashantha', 'Thirsha Sanuthi', 'Nimal Perera', 'Nimal Perera',
                'Janith Silva', 'Amal Madahawa', 'Inoue Naoki', 'Naomi Nakamura'])
            expect(response).to have_http_status(200)
        end

        it 'Works only with time after and players names' do
            get player_scores_path(page: 1, rows: 4, after: '2021-10-19 14:00:00', playernames:['Jagath Priyashantha', 'Thirsha Sanuthi', 'Nimal Perera', 'Nimal Perera',
                'Janith Silva', 'Amal Madahawa', 'Inoue Naoki', 'Naomi Nakamura'])
            expect(response).to have_http_status(200)
        end

        it 'Works only with time before and time after' do
            get player_scores_path(page: 1, rows: 4, before: '2021-10-19 13:00:00', after: '2021-10-19 14:00:00')
            expect(response).to have_http_status(200)
        end
    end

    describe 'Get #show' do
        it 'Works with id' do
            get player_scores_path({:id => '1'})
            expect(response).to have_http_status(200)
        end

        it 'Works with scoreid' do
            get player_scores_path({:scoreid => '1-1634646730'})
            expect(response).to have_http_status(200)
        end
    end

    describe 'Get #showbyname' do
        it 'Works with playername' do
            get playername_player_scores_path({:playername => 'Jagath Priyashantha'})
            expect(response).to have_http_status(200)
        end

        it 'Get empty result for wrong playername' do
            get playername_player_scores_path({:playername => 'Wrong name'})
            expect([]).to be_empty  
        end
    end

    describe 'Get #maxscore' do
        it 'Get result playername' do
            get maxscore_player_scores_path({:playername => 'Jagath Priyashantha'})
            expect(response).to have_http_status(200)
        end

        it 'Get empty result for wrong playername' do
            get maxscore_player_scores_path({:playername => 'Wrong name'})
            expect([]).to be_empty  
        end
    end

    describe 'Get #lowscore' do
        it 'Get result playername' do
            get lowscore_player_scores_path({:playername => 'Jagath Priyashantha'})
            expect(response).to have_http_status(200)
        end

        it 'Get empty result for wrong playername' do
            get lowscore_player_scores_path({:playername => 'Wrong name'})
            expect([]).to be_empty  
        end
    end

    describe 'Get #avascore' do
        it 'Get result with playername' do
            get avascore_player_scores_path({:playername => 'Jagath Priyashantha'})
            expect(response).to have_http_status(200)
        end

        it 'Get empty result for wrong playername' do
            get avascore_player_scores_path({:playername => 'Wrong name'})
            expect(response.body.to_i).to eq(0)
        end
    end

    describe 'POST #create' do
        it 'Create with correct data' do
            post player_scores_path({:playername => 'Marlon Silva', :score => '230'})
            expect(response).to have_http_status(201)
        end

        it '400 error for incorrect data' do
            post player_scores_path({:score => '230'})
            expect(response).to have_http_status(400)
        end
    end
end