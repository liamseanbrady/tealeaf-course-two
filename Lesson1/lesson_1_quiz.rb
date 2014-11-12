# Quiz from lesson one materials. You can do this yourself, or create a new gist or blog entry, answer the quiz, and post the link to the forums and others can take a look.

# Why do they call it a relational database?

# A relational database is called relational because 'relations' can be made between two or more tables. Examples of this are foreign keys which reference primary keys in another table, as well as joins between tables based on a particular relationship.

# What is SQL?

# SQL is Structured Query Language. It allows us to create and configure SQL databases using a formal language.

# There are two predominant views into a relational database. What are they, and how are they different?

# Schema view reveals the structure of the database and the types of values which certain columns within tables will allow.

# Data view reveals the data stored within each row of a table.

# In a table, what do we call the column that serves as the main identifier for a row of data? We're looking for the general database term, not the column name.

# This is called the Primary Key. It is usually only guaranteed unique identifer in a table row.

# What is a foreign key, and how is it used?

# A Foreign Key is used to reference a Primary Key within another table. This allows data from one table to be associated with data in another table.

# At a high level, describe the ActiveRecord pattern. This has nothing to do with Rails, but the actual pattern that ActiveRecord uses to perform its ORM duties.

# Active Record pattern is used to abstract database manipulation away from the database itself. The key concepts of an ORM is that an object is matched to one row in a table, and each column in a table can usually be accessed as a proprty of a row object. Essentially it allows for mapping between a database table and an instance of an object.

# If there's an ActiveRecord model called "CrazyMonkey", what should the table name be?

# crazy_monkeys

# If I'm building a 1:M association between Project and Issue, what will the model associations and foreign key be?

# The Project has_many Issues. An Issue belongs_to a Project. The Foreign Key will be project_id.

# Given this code

# class Zoo < ActiveRecord::Base
#   has_many :animals
# end
# What do you expect the other model to be and what does database schema look like?

# class Animal < ActiveRecord::Base
#   belongs_to :zoo
# end

# zoos table

# id (integer)  |  name (string)  |  created_at (datetime) |  updated_at (datetime)

# create_table "zoos", force: true do |t|
#     t.string   "name"
#     t.datetime "created_at"
#     t.datetime "updated_at"
# end

# animals tables

# id (integer)  |  name (string)  |  zoo_id (integer)  |  created_at (datetime) |  updated_at (datetime)

# create_table "animals", force: true do |t|
#     t.string   "name"
#     t.integer   "zoo_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"
# end

# What are the methods that are now available to a zoo to call related to animals?

# zoo = Zoo.create(name: "London Zoo")
# zoo.animals   =>  Returns a CollectionProxy object.

# How do I create an animal called "jumpster" in a zoo called "San Diego Zoo"?

# zoo = Zoo.create(name: "San Diego Zoo")

# animal = Animal.create(name: "jumpster", zoo: zoo)

# What is mass assignment? What's the non-mass assignment way of setting values?

# Mass assignment is creating an instance of an object, where passing in multiple values for multiple attributes ia permissible. An example of non-mass assignment is:

# animal = Animal.new
# animal.name = "jumpster"
# animal.zoo = zoo

# What does this code do? Animal.first

# This code queries the database for all rows in the animals table, but limites the results returned to 1.

# If I have a table called "animals" with columns called "name", and a model called Animal, how do I instantiate an animal object with name set to "Joe". Which methods makes sure it saves to the database?

# You can use the #create method to make sure it saves to the database upon instantiation, otherwise, you must used new or build and follow it with object.save.

# animal = Animal.create(name: "Joe")

# How does a M:M association work at the database level?

# At a database level, a M:M association works with a join table. This is where there is an intermediary table which contains to foregin keys, which point to two different primary keys from two different tables.

# What are the two ways to support a M:M association at the ActiveRecord model level? Pros and cons of each approach?

# HABTM has_and_belongs_to_many

# The benefits of this is that you don't have to have a join model. The join model is just inferred. However, this creates inflexibility because you can't add any extra attributes onto the the join model.

# HMT has_many_through

# The benefits of this is its flexibility. The only con is the extra effort of creating a join model.

# Suppose we have a User model and a Group model, and we have a M:M association all set up. How do we associate the two?

# class User < ActiveRecord::Base
#   has_many :user_groups
#   has_many :groups, through: :user_groups
# end

# class Group < ActiveRecord::Base
#   has_many :user_groups
#   has_many :users, through: :user_groups
# end





