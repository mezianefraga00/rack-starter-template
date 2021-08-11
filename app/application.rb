class Application

    def call(env)
        res = Rack::Response.new
        req = Rack::Response.new(env)

        if req.path == '/movies' && req.get?
            movies = Movie.all
            return [
                200,
                { 'Content-Type' => 'application/json' },
               [ movies.to_json ]
            ]
            
        else
            res.write "Path Not Found"

        end

        res.finish
    end

end