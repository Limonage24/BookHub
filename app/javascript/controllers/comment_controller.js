import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = { id: Number, book: Number, url: String, reply: Number, content: String, user: Number }

    comment_form_create(action_name, method, reply_to_id, content, div) {
        let id = this.data.get("idValue");
        let book_id = this.data.get("bookValue");
        let url = this.data.get("urlValue");
        let user = this.data.get("userValue");
        let form = document.createElement('form');
        form.setAttribute('action', url);
        form.setAttribute('method', method);
        div.appendChild(form);
        let header = document.createElement('h5');
        header.innerText = 'Ваш комментарий:'
        form.appendChild(header);
        let comment_txt = document.createElement('textarea');
        comment_txt.setAttribute('name', 'comment[content]');
        comment_txt.setAttribute('class', 'form-control');
        comment_txt.innerText = content;
        comment_txt.setAttribute('id', (action_name + id + '_comment_content'));
        form.appendChild(comment_txt);
        let book_input = document.createElement('input');
        book_input.setAttribute('type', 'hidden');
        book_input.setAttribute('name', 'comment[book_id]');
        book_input.setAttribute('value', book_id);
        if (user !== null) {
            let user_input = document.createElement('input');
            user_input.setAttribute('type', 'hidden');
            user_input.setAttribute('name', 'user[id]');
            user_input.setAttribute('value', user);
            form.appendChild(user_input);
        }
        form.appendChild(book_input);
        let reply_input = document.createElement('input');
        reply_input.setAttribute('type', 'hidden');
        reply_input.setAttribute('name', 'comment[reply_to_id]');
        reply_input.setAttribute('value', reply_to_id);
        form.appendChild(reply_input);
        let div2 = document.createElement('div');
        form.appendChild(div2);
        let button = document.createElement('input');
        button.setAttribute('type', 'submit');
        button.setAttribute('value', 'Отправить');
        button.setAttribute('name', 'commit');
        button.setAttribute('class', 'btn btn-my');
        div2.appendChild(button);
        this.element.setAttribute('hidden', 'hidden');
    }

    reply_to() {
        let id = this.data.get("idValue");
        let div_id = "#reply_to_" + id + '_div';
        let div = document.querySelector(div_id);
        div.removeAttribute('hidden')
        this.comment_form_create('reply_to', 'post', id, '', div);
    }

    edit() {
        let id = this.data.get("idValue");
        let reply_to = this.data.get("replyValue");
        let content = this.data.get("contentValue");
        let div_com_id = "#comment_" + id;
        let div = document.querySelector(div_com_id).querySelector(".update_comment_div");
        let div_txt = document.querySelector(div_com_id).querySelector(".comment-content");
        div_txt.hidden = true;
        this.comment_form_create('edit', 'put', reply_to, content, div);
    }


}
