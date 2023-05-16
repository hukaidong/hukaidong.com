// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require jquery_ujs
//= require semantic.min.js
//= require dropzone

import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs"

Rails.start()
