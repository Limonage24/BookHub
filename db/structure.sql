SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authors (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description text
);


--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.books (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    cover text
);


--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    user_id bigint,
    book_id bigint NOT NULL,
    reply_to_id bigint,
    content text NOT NULL,
    deleted boolean NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description text
);


--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: listbookauthors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.listbookauthors (
    id bigint NOT NULL,
    book_id bigint NOT NULL,
    author_id bigint NOT NULL
);


--
-- Name: listbookauthors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.listbookauthors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listbookauthors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.listbookauthors_id_seq OWNED BY public.listbookauthors.id;


--
-- Name: listbookgenres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.listbookgenres (
    id bigint NOT NULL,
    book_id bigint NOT NULL,
    genre_id bigint NOT NULL
);


--
-- Name: listbookgenres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.listbookgenres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listbookgenres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.listbookgenres_id_seq OWNED BY public.listbookgenres.id;


--
-- Name: listuserlikedbooks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.listuserlikedbooks (
    id bigint NOT NULL,
    book_id bigint NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: listuserlikedbooks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.listuserlikedbooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listuserlikedbooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.listuserlikedbooks_id_seq OWNED BY public.listuserlikedbooks.id;


--
-- Name: listuserreadbooks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.listuserreadbooks (
    id bigint NOT NULL,
    book_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: listuserreadbooks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.listuserreadbooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listuserreadbooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.listuserreadbooks_id_seq OWNED BY public.listuserreadbooks.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying NOT NULL,
    password_digest character varying NOT NULL,
    description text,
    role character varying,
    avatar text
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: listbookauthors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listbookauthors ALTER COLUMN id SET DEFAULT nextval('public.listbookauthors_id_seq'::regclass);


--
-- Name: listbookgenres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listbookgenres ALTER COLUMN id SET DEFAULT nextval('public.listbookgenres_id_seq'::regclass);


--
-- Name: listuserlikedbooks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listuserlikedbooks ALTER COLUMN id SET DEFAULT nextval('public.listuserlikedbooks_id_seq'::regclass);


--
-- Name: listuserreadbooks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listuserreadbooks ALTER COLUMN id SET DEFAULT nextval('public.listuserreadbooks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: listbookauthors listbookauthors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listbookauthors
    ADD CONSTRAINT listbookauthors_pkey PRIMARY KEY (id);


--
-- Name: listbookgenres listbookgenres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listbookgenres
    ADD CONSTRAINT listbookgenres_pkey PRIMARY KEY (id);


--
-- Name: listuserlikedbooks listuserlikedbooks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listuserlikedbooks
    ADD CONSTRAINT listuserlikedbooks_pkey PRIMARY KEY (id);


--
-- Name: listuserreadbooks listuserreadbooks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listuserreadbooks
    ADD CONSTRAINT listuserreadbooks_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_listbookauthors_on_book_id_and_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_listbookauthors_on_book_id_and_author_id ON public.listbookauthors USING btree (book_id, author_id);


--
-- Name: index_listbookgenres_on_book_id_and_genre_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_listbookgenres_on_book_id_and_genre_id ON public.listbookgenres USING btree (book_id, genre_id);


--
-- Name: index_listuserlikedbooks_on_book_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_listuserlikedbooks_on_book_id_and_user_id ON public.listuserlikedbooks USING btree (book_id, user_id);


--
-- Name: index_listuserreadbooks_on_book_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_listuserreadbooks_on_book_id_and_user_id ON public.listuserreadbooks USING btree (book_id, user_id);


--
-- Name: comments fk_rails_00bb977e40; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_00bb977e40 FOREIGN KEY (reply_to_id) REFERENCES public.comments(id);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: listbookauthors fk_rails_06273f2e61; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listbookauthors
    ADD CONSTRAINT fk_rails_06273f2e61 FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- Name: listbookauthors fk_rails_0badc16a50; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listbookauthors
    ADD CONSTRAINT fk_rails_0badc16a50 FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: listbookgenres fk_rails_2714bf56ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listbookgenres
    ADD CONSTRAINT fk_rails_2714bf56ac FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: listuserreadbooks fk_rails_56dcbb6464; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listuserreadbooks
    ADD CONSTRAINT fk_rails_56dcbb6464 FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: listuserlikedbooks fk_rails_76f301350f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listuserlikedbooks
    ADD CONSTRAINT fk_rails_76f301350f FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: listuserlikedbooks fk_rails_8e420a3f45; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listuserlikedbooks
    ADD CONSTRAINT fk_rails_8e420a3f45 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: listuserreadbooks fk_rails_a34c276659; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listuserreadbooks
    ADD CONSTRAINT fk_rails_a34c276659 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comments fk_rails_a98e86e5b9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_a98e86e5b9 FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: listbookgenres fk_rails_b88c2ee7d5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listbookgenres
    ADD CONSTRAINT fk_rails_b88c2ee7d5 FOREIGN KEY (genre_id) REFERENCES public.genres(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20221023224607'),
('20221024183151'),
('20221024213334'),
('20221024213459'),
('20221024213460'),
('20221024213461'),
('20221024213462'),
('20221024213463'),
('20221205142121'),
('20221207180619'),
('20221207181934'),
('20221207182057'),
('20221207182110'),
('20221209234852');


