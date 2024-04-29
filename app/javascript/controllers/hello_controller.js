import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   connect() {
//     this.element.textContent = "Hello World!"
//   }
// }


export default class extends Controller {
  greet() {
    console.log("Hello, Stimulus!", this.element)
  }
}
