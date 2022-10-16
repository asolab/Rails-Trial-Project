// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// require data-confirm-modal
// require rails-ujs

import "@hotwired/turbo-rails"

import "controllers"
data: { turbo: false }
Turbo.session.drive = false



Turborails.setConfirmMethod(() => {
 let dialog = document.getElementById("turbo-confirm")
 dialog.showModal()	

 return new Promise((resolve, reject) => {
 	dialog.addEventListener("close", () => {
 		resolve(dialog.returnValue == "confirm")  
 	}, { once: true })
 })
})






