import { Controller } from "@hotwired/stimulus";
import { renderRoom } from "../room/index";

export default class extends Controller {
  connect() {
    renderRoom(this.roomId);
  }

  get roomId() {
    return this.element.dataset.roomId;
  }
}
