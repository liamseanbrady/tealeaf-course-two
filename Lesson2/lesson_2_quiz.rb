Name all the 7 (or 8) routes exposed by the resources keyword in the routes.rb file. Also name the 4 named routes, and how the request is routed to the controller/action.

root      GET       /posts            #root
posts     GET       /posts            posts#index
          POST      /posts            posts#create
new_post  GET       /posts/new        posts#new
edit_post GET       /posts/:id/edit   posts#edit
post      GET       /posts/:id        posts#show  
          PATCH     /posts/:id        posts#update
          DELETE    /posts/:id        posts#destroy


What is REST and how does it relate to the resources routes?

REST is GET POST PATCH DELETE and it essentially equates to the CRUD actions.

What's the major difference between model backed and non-model backed form helpers?

Model-backed know about the state of the object and takes the information from it. With
a non-model backed form, you have to enter more of the details yourself which usually includes a lot of if statements.
Model-backed also knows whether the object is a new_record? or not, and decides whether to make the method post
or patch based on that information.

How does form_for know how to build the <form> element?

It partly knows how to build it based on convention and partly knows how to build it from the input it recieves.

What's the general pattern we use in the actions that handle submission of model-backed forms (ie, the create and update actions)?

create is:

def create
  @comment = Comment.new(params.require(:comment).permit(:body))

  if @comment.save
    flash[:notice] = "You comment was saved"
    redirect_to comments_path
  else  
    render :new
  end

end

update is:

def create
  @comment = Comment.find(params[:id])

  if @comment.update(params.require(:comment).permit(:body))
    flash[:notice] = "You comment was updated"
    redirect_to comments_path
  else  
    render :edit
  end

end

How exactly do Rails validations get triggered? Where are the errors saved? How do we show the validation messages on the user interface?

Rails validations get triggered on the model itself. The errors are saved on the ActiveRecord object. We show the validation
messages on the UI by populating a template with the information by using @ar_object.errors.full_messages

What are Rails helpers?

Rails helpers are used to hold view 'logic'. If too much html is included in a helper then a partial is better suited.

What are Rails partials?

Rails partials are templates (prefixed with an _) that allow common HTML to be re-used in multiple views.

When do we use partials vs helpers?

Partials contain primarily HTML. Helpers contain logic which in some way changes how things appear on the UI, such as formatting.

When do we use non-model backed forms?

Non-model backed forms can be useful when we're not performing a CRUD action which matches up nicely with our resourceful routes.
It is useful for forms where details entered don't match perfectly to attributes of an AR object.

