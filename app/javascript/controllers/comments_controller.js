import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {}
  connect() {}

  toggleForm(event) {

    event.preventDefault();   // jakub: Cancel the link event
    event.stopPropagation();  // jakub: Stop scrolling
    document.activeElement?.blur();  // jakub: Automatically remove focus from the toggle button

    const formId = event.params["form"];
    const form = document.getElementById(formId);
    form.classList.toggle("d-none");

    const commentBodyId = event.params["body"];
    const commentBody = document.getElementById(commentBodyId);
    commentBody.classList.toggle("d-none");

    const editButtonId = event.params["edit"];
    const editButton = document.getElementById(editButtonId);
    this.toggleEditButton(editButton);

    
  }

  toggleEditButton(editButton) {
    if (editButton.innerText === "Edit") {
      editButton.innerText = "Cancel";
      this.toggleEditButtonClass(editButton);
    } else {
      editButton.innerText = "Edit";
      this.toggleEditButtonClass(editButton);
    }
  }

  toggleEditButtonClass(editButton) {
    editButton.classList.toggle("btn-secondary");
    editButton.classList.toggle("btn-warning");
  }
}
