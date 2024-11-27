import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  submit(event) {
    event.preventDefault()

    const form = event.target
    const formData = new FormData(form)

    fetch(form.action, {
      method: form.method,
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").getAttribute("content"),
        "Accept": "application/json"
      },
      body: formData
    })
    .then(response => {
      console.log("Success:", response.text())

      form.reset()
    })
    .catch((error) => {
      console.error("Error:", error)
    })
  }
}
