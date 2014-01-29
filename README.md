# et_landingpages_app cookbook

Simple cookbook to set up [evertrue/scout](https://github.com/evertrue/scout).
While that’s not a Rails app, it’s a Sinatra app, and has all the same base
requirements from an instance.

# Requirements

* [et_rails_app-cookbook](https://github.com/evertrue/et_rails_app-cookbook)

# Usage

Include the `et_landingpages_app::default` recipe in your run list.

# Attributes

Overrides a few defaults from the `et_rails_app` cookbook:

* `node['nginx']['default_site_enabled']`
* `node['nginx']['socketproxy']['default_app']`
* `node['nginx']['socketproxy']['apps']`
* `node['et_rails_app']['db']['source_name']`

# Recipes

## default

Includes `et_rails_app::default`

# Author

Author:: EverTrue, Inc. (<devops@evertrue.com>)
