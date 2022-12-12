import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = { id: Number, book: Number }
    genre_count = 0;

    disable_last_del_btn() {
        let last_btn = document.querySelector('.delete_genre_btn');
        last_btn.setAttribute('disabled', '');
    }

    release_del_btn() {
        let del_btn = document.querySelector('.delete_genre_btn[disabled]');
        del_btn.removeAttribute('disabled');
    }

    initialize() {
        this.genre_count = document.querySelectorAll('.genre').length;
        if (this.genre_count === 1) {
            this.disable_last_del_btn();
        }
        super.connect();
    }

    add_genre(event) {
        event.preventDefault();
        let book = this.data.get("bookValue");
        let id = ++this.genre_count;
        let div_count = document.querySelectorAll('.genre').length;
        if (div_count === 1) {
            this.release_del_btn();
        }
        let outer_div = document.querySelector('.genres');
        let div = document.createElement('div');
        div.setAttribute('class', 'genre d-flex align-items-center');
        div.setAttribute('id', 'genre_' + id);
        outer_div.appendChild(div);
        let genre_inp = document.createElement('input');
        genre_inp.setAttribute('name', 'genres_attributes[][name]');
        genre_inp.setAttribute('type', 'text');
        genre_inp.setAttribute('class', 'information-input form-controls');
        genre_inp.setAttribute('list', 'genres-list');
        genre_inp.setAttribute('placeholder', 'Начните вводить название жанра');
        div.appendChild(genre_inp);
        div.innerHTML += '&nbsp;&nbsp;&nbsp;&nbsp;';
        let del_btn = document.createElement('button');
        del_btn.setAttribute('class', 'btn btn-my delete_genre_btn');
        del_btn.dataset.controller = 'genre';
        del_btn.dataset.action = 'genre#delete_genre';
        del_btn.dataset.genreIdValue = id.toString();
        del_btn.dataset.genreBookValue = book;
        del_btn.innerText = 'Удалить жанр книги';
        div.appendChild(del_btn);
    }

    delete_genre (event) {
        event.preventDefault();
        let id = this.data.get("idValue");
        let count = document.querySelectorAll('.genre').length;
        let div_id = '#genre_' + id;
        let gen_div = document.querySelector(div_id);
        gen_div.parentElement.removeChild(gen_div);
        if (count <= 2) {
            this.disable_last_del_btn();
        }
    }
}
