require 'sinatra'

get '/' do
    erb :index 
end

get '/register' do
    @name = params[:name]
    
    File.open("list.txt", "a+") do |f|
        f.write("#{@name}" + "\n")
    end
    erb :register 
end

get '/vote' do
    erb :vote 
end

get '/voted' do
    @pick = params[:girls]
    @girls = {
        "sm" =>"소미",
        "sj" =>"세정",
        "cy" =>"채연",
        "sh" =>"소혜",
        "yj" =>"유정"
    }
    
    File.open("vote.txt", "a+") do |f|
        f.write("#{@pick}" + "\n")
    end
    erb :voted 
end

get '/result' do
    @result = {
        "sm" => 0,
        "sj" => 0,
        "cy" => 0,
        "sh" => 0,
        "yj" => 0
    }
    
    File.open("vote.txt", "r") do |f|
        f.each_line do |l|
             @result[l.chomp] +=1                           
        end                                    
    end                                        
    erb :result 
end