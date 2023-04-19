// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require jquery_ujs
//= require semantic.min.js

import "@hotwired/turbo-rails"
import "controllers"

$(document)
    .ready(function() {
        $('.ui.menu .ui.dropdown').dropdown({
            on: 'hover'
        });
        $('.ui.menu a.item')
            .on('click', function() {
                $(this)
                    .addClass('active')
                    .siblings()
                    .removeClass('active')
                ;
            })
        ;
    })
;
