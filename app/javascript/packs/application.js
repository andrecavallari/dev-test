// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener('turbolinks:load', () => {
  Array.from(document.querySelectorAll('.freight-by-zipcode')).map(element => {
    element.addEventListener('ajax:success', event => {
      const [response] = event.detail
      const responseBody = [
        `Frete para <strong>${response.city} - ${response.state}</strong> na rua ${response.address}`,
        `<strong>Valor do frete:</strong> ${response.freight_cost}`,
        `<strong>Valor total:</strong> ${response.total_cost}`,
      ]
      element.parentNode.querySelector('.zipcode-result').style.visibility = 'visible'
      element.parentNode.querySelector('.zipcode-result').innerHTML = responseBody.map(item => `<div>${item}</div>`).join('')
    })
  })
})
