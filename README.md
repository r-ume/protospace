## Protospace

### Description
A webplatform where users can display prototypes of new technology, ideas, and even objects that they would like to present. 

![protospace1](forreadme/prototype#index.png)

### Environment
  - Ruby version: 2.3.1
  - Rails version: 5.1.1

### Installation
	1. git clone git@github.com:r-ume/Protospace.git
	2. bundle install
	3. bundle exec rails s

### Tables and their Associations:
#### User
##### Association
  - has_many :comments
  - has_many :prototypes
  - has_many :likes

##### Table Structure
  - name
  - email
  - password
  - profile
  - position
  - occupation
  - avatar

#### Prototype
##### Association
  - has_many :prototype_images
  - has_many :comments
  - has_many :likes
  - belongs_to :user

##### Table Structure
  - title
  - catchcopy
  - concept
  - user_id

#### Prototype_image
##### Association
  - belong_to :prototype

##### Table Structure
  - content
  - status

#### Like
##### Association
  - belong_to :user
  - belong_to :like

##### Table Structure
  - user_id
  - prototype_id

#### Comment
##### Association
  - belong_to :prototype
  - belong_to :user

##### Table Structure
  - user_id
  - prototype_id
