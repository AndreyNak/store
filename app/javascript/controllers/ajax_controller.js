import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  sendRequest(event) {
    event.preventDefault();

    const url = this.urlValue

    fetch(url, {
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
      }
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.text();
    })
    .then(data => {
      this.element.closest('.d-flex').querySelector('span').innerText = data;
    })
    .catch(error => {
      console.error('Error during POST-PATCH request:', error);
    });
  }
}
