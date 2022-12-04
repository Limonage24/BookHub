import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = { id: Number, book: Number, url: String }

    reply_to() {
        let id = this.data.get("idValue");
        let book_id = this.data.get("bookValue");
        let url = this.data.get("urlValue");
        let div_id = "#reply_to_" + id + '_div';
        let div = document.querySelector(div_id);
        let form = document.createElement('form');
        form.setAttribute('action', url);
        form.setAttribute('method', 'post');
        div.appendChild(form);
        let comment_txt = document.createElement('textarea');
        comment_txt.setAttribute('name', 'comment[content]');
        comment_txt.setAttribute('id', ('reply_to_'+ id + '_comment_content'));
        form.appendChild(comment_txt);
        let book_input = document.createElement('input');
        book_input.setAttribute('type', 'hidden');
        book_input.setAttribute('name', 'comment[book_id]');
        book_input.setAttribute('value', book_id);
        form.appendChild(book_input);
        let reply_input = document.createElement('input');
        reply_input.setAttribute('type', 'hidden');
        reply_input.setAttribute('name', 'comment[reply_to_id]');
        reply_input.setAttribute('value', id);
        form.appendChild(reply_input);
        let div2 = document.createElement('div');
        form.appendChild(div2);
        let button = document.createElement('input');
        button.setAttribute('type', 'submit');
        button.setAttribute('value', 'Отправить');
        button.setAttribute('name', 'commit');
        div2.appendChild(button);
        this.element.setAttribute('hidden', 'hidden');
    }
}
