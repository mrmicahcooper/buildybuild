# Buildybuild

Buildybuild is generator that allows you to quickly generate static pages with either markup or a provided cms.

## Installation

Add this line to your application's Gemfile:

```bash
$ gem 'buildybuild'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install buildybuild
```

**Note:** There are runtime dependencies in Buildybuild so you'll have to add the following if buildybuild is not in your Gemfile:

```ruby
  gem 'decent_exposure', '2.0.0.rc1'
  gem 'haml-rails'
  gem 'formal'
  gem 'rdiscount'
```

## Usage

This is a rails generator so run:

```bash
$ rails generate buildybuild:cms 

# you can pass a name for the generated resource. Default is "page" i.e.:

$ rails generate buildybuild:cms static_page
```


This will create the following files:

- app/models/page.rb
- db/migrate/[timestamp]\_create\_pages.rb
- app/controllers/pages\_controller.rb
- app/views/pages/new.html.haml
- app/views/pages/edit.html.haml
- app/views/pages/show.html.haml
- app/views/pages/\_form.html.haml

and appends the following to the bottom of your routes file:

```ruby
    resources :pages, only: [:new, :create]

    #keep these at the bottom of your file. They should be the last routes.
    get "/:slug", to: "pages#show", as: :slug
    get "/:slug/edit", to: "pages#edit", as: :edit_slug
    put "/:slug", to: "pages#update", as: :slug
    post "/:slug", to: "pages#destroy", as: :slug
```

### Next

run the migration

```bash
rake db:migrate
```

And you're set. Now you can go to ```http://localhost:3000/pages/new``` and see your new Content Management System in action!

Or you can create static pages and stick them in ```app/views/pages/```. Then you will automatically have access to the page in your routes.

Observe:

Create a static page called ```app/views/pages/about_us.html.haml```

Then automatically have access to ```http://localhost:3000/about-us```.

      
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
