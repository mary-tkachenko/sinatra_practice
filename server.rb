require 'rubyjokes'
require 'sinatra'

get '/' do
    p "Yay hi!"
end

get '/:type' do
   @post = find_joke(params[:type])
   pass unless @post
   @post
end

get "/*" do
    "<h1 style='color:orange;margin-left:100px;'>Ooooops, there is no '#{params[:splat]}'</h1>"
end

helpers do
    def find_joke(slug)
        if slug == "nerdy"
            joke = RubyJoke.new
            p joke.get_joke({limitTo: ['nerdy']})
        elsif slug == "danger"
            joke = RubyJoke.new
            p joke.get_joke({limitTo: ['explicit']})
        elsif slug == "surprise"
            joke = RubyJoke.new
            p joke.get_joke({limitTo: ['nerdy','explicit']})
        end
    end
end
