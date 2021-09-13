class Application

    def call(env)
      res = Rack::Response.new
      req = Rack::Request.new(env)
  
  
  
      # Movie ROUTES
  
      # Movie Index
  
      if req.path == '/movies' && req.get?
        return [200, {'Content-Type' => 'application/json'}, [Movie.all.to_json]]
      end
   
     
  
      # Movie Create
      
  
      if req.path == ('/movies') && req.post?
        body = JSON.parse(req.body.read)
        movie = Movie.create(body)
        return [201, {'Content-Type' => 'application/json'}, [Movie.to_json]]
      end
  
      # Movie Show
  
      if req.path.match('/movies/') && req.get?
        id = req.path.split('/')[2]
        begin
          movie = Movie.find(id)
          # the include method allows us to add to the json hash
          return [200, {'Content-Type' => 'application/json'}, [Movie.to_json]]
        rescue
          return [404, {'Content-Type' => 'application/json'}, [{message: "Movie not found"}.to_json]]
        end
      end
  
      # Movie Update
  
      if req.path.match('/movies/') && req.patch?
        id = req.path.split('/')[2]
        body = JSON.parse(req.body.read)
        begin
          movie = Movie.find(id)
          movie.update(body)
          return [202, {'Content-Type' => 'application/json'}, [Movie.to_json]]
  
          # below is an example of handling multiple exceptions
          # handling exceptions this way is NOT required or recommended
          # for the phase 3 project
  
        rescue ActiveRecord::RecordNotFound
          return [404, {'Content-Type' => 'application/json'}, [{message: "Movie not found"}.to_json]]
        rescue ActiveRecord::UnknownAttributeError
          return [422, {'Content-Type' => 'application/json'}, [{message: "Could not process your update request"}.to_json]]
        end
      end
  
      # Movie Delete
  
      if req.path.match('/movies/') && req.delete?
        id = req.path.split('/')[2]
        begin
          movie = Movie.find(id)
          movie.destroy
          return [200, {'Content-Type' => 'application/json'}, [{message: "Movie Destroyed"}.to_json]]
        rescue
          return [404, {'Content-Type' => 'application/json'}, [{message: "Movie not found"}.to_json]]
        end
      end
      if req.path == '/movies' && req.get?
        return [200, {'Content-Type' => 'application/json'}, [Movie.all.to_json]]
      end
    # End of movie app
      ###
      ###
##
##
##
###
   ##
   ##
   #
   #
    #Start of Director app

    if req.path == '/directors' && req.get?
        return [200, {'Content-Type' => 'application/json'}, [Director.all.to_json]]
      end
   
     
  
      # Director Create
      
  
      if req.path == ('/directors') && req.post?
        body = JSON.parse(req.body.read)
        director = Director.create(body)
        return [201, {'Content-Type' => 'application/json'}, [Director.to_json]]
      end
  
      # Director Show
  
      if req.path.match('/directors/') && req.get?
        id = req.path.split('/')[2]
        begin
          director = Director.find(id)
          # the include method allows us to add to the json hash
          return [200, {'Content-Type' => 'application/json'}, [Director.to_json]]
        rescue
          return [404, {'Content-Type' => 'application/json'}, [{message: "Director not found"}.to_json]]
        end
      end
  
      # Director Update
  
      if req.path.match('/directors/') && req.patch?
        id = req.path.split('/')[2]
        body = JSON.parse(req.body.read)
        begin
          director = Director.find(id)
          director.update(body)
          return [202, {'Content-Type' => 'application/json'}, [Director.to_json]]
  
          # below is an example of handling multiple exceptions
          # handling exceptions this way is NOT required or recommended
          # for the phase 3 project
  
        rescue ActiveRecord::RecordNotFound
          return [404, {'Content-Type' => 'application/json'}, [{message: "Director not found"}.to_json]]
        rescue ActiveRecord::UnknownAttributeError
          return [422, {'Content-Type' => 'application/json'}, [{message: "Could not process your update request"}.to_json]]
        end
      end
  
      # Director Delete
  
      if req.path.match('/directors/') && req.delete?
        id = req.path.split('/')[2]
        begin
          director = Director.find(id)
          director.destroy
          return [200, {'Content-Type' => 'application/json'}, [{message: "Director Destroyed"}.to_json]]
        rescue
          return [404, {'Content-Type' => 'application/json'}, [{message: "Director not found"}.to_json]]
        end
      end
      if req.path == '/directors' && req.get?
        return [200, {'Content-Type' => 'application/json'}, [Director.all.to_json]]
      end




    # static route to test rack
    if req.path.match(/test/) 
        return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
  
      else
        res.write "Path Not Found"
  
      end
  
      res.finish
    end
  
  end
 