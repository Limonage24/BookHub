import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = { url: String }

    connect() {
        console.log('ffffffffff');
        super.connect();
    }

    show_liked_books(event) {
        event.preventDefault();
        console.log('dddd');
        return 'liked_books'
    }
}
