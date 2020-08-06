// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "bootstrap";
import "jquery"
import "../stylesheets/application";
import 'ekko-lightbox/dist/ekko-lightbox';

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("bootstrap")
require("popper.js")

import '@fortawesome/fontawesome-free/scss/fontawesome';
import '@fortawesome/fontawesome-free/scss/solid';
import '@fortawesome/fontawesome-free/scss/regular';
import '@fortawesome/fontawesome-free/scss/brands';
import '@fortawesome/fontawesome-free/scss/v4-shims';

import "@fortawesome/fontawesome-free/js/all";
import './gallery'
import './datepicker.min'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
