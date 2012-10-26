# Buildybuild

Buildybuild is generator that allows you to quickly generate things like:

- static pages with either markup or a provided cms.
- an awesome active link helper

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

**Note:** There are runtime dependencies in Buildybuild so you'll have to add
the following if buildybuild is not in your Gemfile:

```ruby
gem 'decent_exposure'
gem 'haml-rails'
gem 'formal'
gem 'rdiscount'
```

# Usage

## For static pages (the CMS)

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
$ rake db:migrate
```

And you're set. Now you can go to ```http://localhost:3000/pages/new``` and see
your new Content Management System in action!

Or you can create static pages and stick them in ```app/views/pages/```. Then
you will automatically have access to the page in your routes.

Observe:

Create a static page called ```app/views/pages/about_us.html.haml```

Then automatically have access to ```http://localhost:3000/about-us```.

Notice the difference between the underscore "_" in the file name and the dash
"-" in the url.

## For the active link helper
This is so you can replace your ```link_to``` helper with ```active_link_to```
which will add a class of "active" to the link when you're on that page. i.e:

```ruby
= active_link_to "/about-us", "About"
```
returns the following when the current page is ```/about-us```"
```html
<a class="active" href="/about-us">About</a>
```
### Run

```bash
$ rails g buildybuild:active_link
```

This appends the following to the bottom of your ApplicationHelper:

```ruby
def active_link_to(text, path, options={})
  if /^#{url_for(path)}/ =~ request.path
    options[:class] = "#{options[:class]} active"
  end
  link_to text, path, options
end
```

It's kinda small. But cool!


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
