import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  submitForm() {
    this.element.submit(); // Отправка формы при изменении выбранной оценки
  }
}