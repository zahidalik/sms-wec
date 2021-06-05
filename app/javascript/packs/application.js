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

// /source/animate.css";

// To make Bulma dropdown work
// document.addEventListener('DOMContentLoaded', function () {
//   var dropdown = document.querySelector('.dropdown');
//   dropdown.addEventListener('click', function(event) {                      
//      dropdown.classList.toggle('is-active');
//   });
// });

// MODALS BULMA
// document.addEventListener('DOMContentLoaded', function () {

//   var rootEl = document.documentElement;
//   var allModals = getAll('.modal');
//   var modalButtons = getAll('.modal-button');
//   var modalCloses = getAll('.modal-background, .modal-close, .modal-card-head .delete, .modal-card-foot .button');

//   if (modalButtons.length > 0) {
//       modalButtons.forEach(function (el) {
//           el.addEventListener('click', function () {
//               var target = document.getElementById(el.dataset.target);
//               rootEl.classList.add('is-clipped');
//               target.classList.add('is-active');
//           });
//       });
//   }

//   if (modalCloses.length > 0) {
//       modalCloses.forEach(function (el) {
//           el.addEventListener('click', function () {
//               closeModals();
//           });
//       });
//   }

//   document.addEventListener('keydown', function (event) {
//       var e = event || window.event;
//       if (e.keyCode === 27) {
//           closeModals();
//       }
//   });

//   function closeModals() {
//       rootEl.classList.remove('is-clipped');
//       allModals.forEach(function (el) {
//           el.classList.remove('is-active');
//       });
//   }

//   // Functions

//   function getAll(selector) {
//       return Array.prototype.slice.call(document.querySelectorAll(selector), 0);
//   }
// });