--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cards; Type: TABLE; Schema: public; Owner: Mike
--

CREATE TABLE public.cards (
    id integer NOT NULL,
    card_front text NOT NULL,
    card_back text NOT NULL,
    deck_id integer NOT NULL
);


ALTER TABLE public.cards OWNER TO "Mike";

--
-- Name: cards_deck_id_seq; Type: SEQUENCE; Schema: public; Owner: Mike
--

CREATE SEQUENCE public.cards_deck_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cards_deck_id_seq OWNER TO "Mike";

--
-- Name: cards_deck_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mike
--

ALTER SEQUENCE public.cards_deck_id_seq OWNED BY public.cards.deck_id;


--
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: Mike
--

CREATE SEQUENCE public.cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cards_id_seq OWNER TO "Mike";

--
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mike
--

ALTER SEQUENCE public.cards_id_seq OWNED BY public.cards.id;


--
-- Name: decks; Type: TABLE; Schema: public; Owner: Mike
--

CREATE TABLE public.decks (
    id integer NOT NULL,
    deckname text NOT NULL,
    score integer
);


ALTER TABLE public.decks OWNER TO "Mike";

--
-- Name: decks_id_seq; Type: SEQUENCE; Schema: public; Owner: Mike
--

CREATE SEQUENCE public.decks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.decks_id_seq OWNER TO "Mike";

--
-- Name: decks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mike
--

ALTER SEQUENCE public.decks_id_seq OWNED BY public.decks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Mike
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO "Mike";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Mike
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "Mike";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mike
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: cards id; Type: DEFAULT; Schema: public; Owner: Mike
--

ALTER TABLE ONLY public.cards ALTER COLUMN id SET DEFAULT nextval('public.cards_id_seq'::regclass);


--
-- Name: cards deck_id; Type: DEFAULT; Schema: public; Owner: Mike
--

ALTER TABLE ONLY public.cards ALTER COLUMN deck_id SET DEFAULT nextval('public.cards_deck_id_seq'::regclass);


--
-- Name: decks id; Type: DEFAULT; Schema: public; Owner: Mike
--

ALTER TABLE ONLY public.decks ALTER COLUMN id SET DEFAULT nextval('public.decks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: Mike
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: Mike
--

COPY public.cards (id, card_front, card_back, deck_id) FROM stdin;
5	What is your name?	Batman	1
6	Another card?	Yep	1
7	One more for deck...?	one	1
8	Second deck?	sure	2
\.


--
-- Data for Name: decks; Type: TABLE DATA; Schema: public; Owner: Mike
--

COPY public.decks (id, deckname, score) FROM stdin;
1	deck1	40
2	secondDeck	80
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Mike
--

COPY public.users (id, username, password) FROM stdin;
1	mike	1234
\.


--
-- Name: cards_deck_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mike
--

SELECT pg_catalog.setval('public.cards_deck_id_seq', 1, false);


--
-- Name: cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mike
--

SELECT pg_catalog.setval('public.cards_id_seq', 8, true);


--
-- Name: decks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mike
--

SELECT pg_catalog.setval('public.decks_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mike
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: Mike
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- Name: decks decks_pkey; Type: CONSTRAINT; Schema: public; Owner: Mike
--

ALTER TABLE ONLY public.decks
    ADD CONSTRAINT decks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Mike
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: Mike
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: cards cards_deck_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mike
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_deck_id_fkey FOREIGN KEY (deck_id) REFERENCES public.decks(id);


--
-- PostgreSQL database dump complete
--

