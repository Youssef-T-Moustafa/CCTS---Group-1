// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import "Chart.bundle"

document.addEventListener('DOMContentLoaded', function() {
    var form = document.getElementById('edit_form_capacity_5'); // Replace with the actual form ID
    var scrollPosition;
  
    if (form) {
      form.addEventListener('submit', function() {
        scrollPosition = window.scrollY;
      });
    }
  
    // After the form is processed and the page is reloaded
    if (scrollPosition !== undefined) {
      window.scrollTo(0, scrollPosition);
    }
  });