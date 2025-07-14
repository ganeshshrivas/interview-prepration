HTTP Verb Constraints


In general, you should use the get, post, put, patch, and delete methods to constrain a route to a particular verb. There is a match method that you could use with the :via option to match multiple verbs at once:

match "photos", to: "photos#show", via: [:get, :post]

Segment Constraints

You can use the :constraints option to enforce a format for a dynamic segment:

get "photos/:id", to: "photos#show", constraints: { id: /[A-Z]\d{5}/ }
The above route definition requires id to be 5 alphanumeric characters long. Therefore, this route would match paths 
such as /photos/A12345, but not /photos/893. You can more succinctly express the same route this way:


Request-Based Constraints

get "photos", to: "photos#index", constraints: { subdomain: "admin" }
Will match something like https://admin.example.com/photos.

Request constraints work by calling a method on the Request object with the same name as the hash key and then comparing the return value with the hash value. For example: constraints: { subdomain: 'api' } will match an api subdomain as expected. However, using a symbol constraints: { subdomain: :api } will not, 
because request.subdomain returns 'api' as a String.

Wildcard Segments
get "photos/*other", to: "photos#unknown"
Copy
Wildcard segments allow for something called "route globbing", which is a way to specify that a particular parameter (*other above) be matched to the remaining part of a route.

So the above route would match photos/12 or /photos/long/path/to/12, setting params[:other] to "12" or "long/path/to/12".

Format Segments

get "*pages", to: "pages#show"
By requesting '/foo/bar.json', your params[:pages] will be equal to 'foo/bar' with the request format of JSON in params[:format].


Redirection

You can redirect any path to any other path by using the redirect helper in your router:

get "/stories", to: redirect("/articles")
