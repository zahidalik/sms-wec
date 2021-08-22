// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require('jquery');
require('popper.js');
// require('bootstrap');
// import 'popper.js/core';
//import 'bootstrap/dist/js/bootstrap'
//import 'bootstrap/dist/css/bootstrap'
import 'bulma'
import "@fortawesome/fontawesome-free/css/all"
require("stylesheets/application.scss")
import "animate.css"

// To make delete button work in bulma notification -- from bulma site
document.addEventListener('DOMContentLoaded', () => {
  (document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
    const $notification = $delete.parentNode;

    $delete.addEventListener('click', () => {
      $notification.parentNode.removeChild($notification);
    });
  });
});

// /source/animate.css";

// To make Bulma dropdown work
// document.addEventListener('DOMContentLoaded', function () {
//   var dropdown = document.querySelector('.dropdown');
//   dropdown.addEventListener('click', function(event) {                      
//      dropdown.classList.toggle('is-active');
//   });
// });
