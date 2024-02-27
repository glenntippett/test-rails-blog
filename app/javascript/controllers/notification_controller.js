import Notification from "stimulus-notification";

export default class extends Notification {
  connect() {
    super.connect();
    new bootstrap.Toast(this.element).show();
  }
}
