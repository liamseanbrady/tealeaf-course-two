What's the difference between rendering and redirecting? What's the impact with regards to instance variables, view templates?

Rendering is done within the response to the request. THis means that any instance variables created during that request are
available within any templatwe which is rendered.

Redirecting is when another request is issued. That redirect, which leads to another request and therefore another response, will either
lead to another redirect or a render. Instance variables are not available after a redirect because a new request is made.

If I need to display a message on the view template, and I'm redirecting, what's the easiest way to accomplish this?

Using Rails' built-in in flash message.

If I need to display a message on the view template, and I'm rendering, what's the easiest way to accomplish this?

Save the message to an instance variable and display it within the template using embedded Ruby.

Explain how we should save passwords to the database.

Passwords should be saved to the database using a one-way hash, where passwords are converted from a string to a hash or a 'digest'. This digest
cannot be converted back to a string but can be compared for equality with other digests. If two digests are equal, then the passwords they represent
are equal.

These one way hashes use a salt, which is usually a separate string tagged on to the password string to make the eventual hash even more
difficult to discern. In Rails, the salt is automatically added to the hash within the password_digest column.

What should we do if we have a method that is used in both controllers and views?

A method which is used in both controllers and views should be declared as a helper_method. Example:

helper_method :something_in_view_and_controller

What is memoization? How is it a performance optimization?

Memoization means that before a method is called to retrieve something from somewhere within an app or a database, a check will be done to
see if this information already exists in memory. This is a performance optimization because it leads to less method calls and less
hits on the database. Example syntax:

@some_var ||= hit_database_for_info      # this is short for @some_var = @some_var || hit_database_for_info

If we want to prevent unauthenticated users from creating a new comment on a post, what should we do?

We first have to stop the user from being able to click on links for creating a new comment or post on the UI. Then, we need to lock
down all routes which could lead to the creation of a comment or post within the app. This can be done by doing something like this:

def require_user
  if !logged_in
    flash[:error] = 'You have to be logged in to do that'
    redirect_to root_path
  end
end

This redirects the user away from the ability to create posts or comments.

Suppose we have the following table for tracking "likes" in our application. How can we make this table polymorphic? Note that the "user_id" foreign key is tracking who created the like.

id  user_id  photo_id  video_id  post_id
1     4                   12  
2     7                             3
3     2        6   


How do we set up polymorphic associations at the model layer? Give example for the polymorphic model (eg, Vote) as well as an example parent model (the model on the 1 side, eg, Post).

We set up a polymorphic association at the model layer for Vote by doing:

class Vote < ActiveRecord::base
  belongs_to :voteable, polymorphic: true
end

We set up polymorphic associations at the model layer for Post by doing:

class Post < ActiveRecord::Base
  has_many :votes, as: voteable
end

What is an ERD diagram, and why do we need it?

An ERD diagram is an Entity Relationship Diagram. It is used to map out the domain models for the application and show relations between entities. It also
helps map out tables and attributes which each domain model requires.







