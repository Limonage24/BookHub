import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = { id: Number, book: Number }
    author_count = 0;

    disable_last_del_btn() {
        let last_btn = document.querySelector('.delete_author_btn');
        last_btn.setAttribute('disabled', '');
    }

    release_del_btn() {
        let del_btn = document.querySelector('.delete_author_btn[disabled]');
        del_btn.removeAttribute('disabled');
    }

    initialize() {
        this.author_count = document.querySelectorAll('.author').length;
        if (this.author_count === 1) {
            this.disable_last_del_btn();
        }
        super.connect();
    }

    add_author(event) {
        event.preventDefault();
        let book = this.data.get("bookValue");
        let id = ++this.author_count;
        let div_count = document.querySelectorAll('.author').length;
        if (div_count === 1) {
            this.release_del_btn();
        }
        let outer_div = document.querySelector('.authors');
        let div = document.createElement('div');
        div.setAttribute('class', 'author d-flex align-items-center');
        div.setAttribute('id', 'author_' + id);
        outer_div.appendChild(div);
        let author_inp = document.createElement('input');
        author_inp.setAttribute('name', 'authors_attributes[][name]');
        author_inp.setAttribute('type', 'text');
        author_inp.setAttribute('class', 'information-input form-controls');
        author_inp.setAttribute('list', 'authors-list');
        author_inp.setAttribute('placeholder', 'Начните вводить имя автора');
        div.appendChild(author_inp);
        div.innerHTML += '&nbsp;&nbsp;&nbsp;&nbsp;';
        let del_btn = document.createElement('button');
        del_btn.setAttribute('class', 'btn btn-my delete_author_btn');
        del_btn.dataset.controller = 'author';
        del_btn.dataset.action = 'author#delete_author';
        del_btn.dataset.authorIdValue = id.toString();
        del_btn.dataset.authorBookValue = book;
        del_btn.innerText = 'Удалить автора книги';
        div.appendChild(del_btn);
    }

    delete_author (event) {
        event.preventDefault();
        let id = this.data.get("idValue");
        let count = document.querySelectorAll('.author').length;
        let div_id = '#author_' + id;
        let auth_div = document.querySelector(div_id);
        auth_div.parentElement.removeChild(auth_div);
        if (count <= 2) {
            this.disable_last_del_btn();
        }
    }
}
