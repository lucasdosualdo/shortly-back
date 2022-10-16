--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    address text NOT NULL,
    "shortAddress" text NOT NULL,
    views integer DEFAULT 0 NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    email character varying(40) NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
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
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 2, 'dfd6bf5a-f22d-4ab5-a64c-28c85cf4fadc', '2022-10-15 02:44:14.238461');
INSERT INTO public.sessions VALUES (2, 2, '60d2147a-1e50-4e29-ab50-0133ddda719c', '2022-10-15 02:44:20.421138');
INSERT INTO public.sessions VALUES (3, 1, '966abfbc-453f-4991-a8cd-b84cdab7c62f', '2022-10-15 03:26:51.220882');
INSERT INTO public.sessions VALUES (4, 1, 'c848263f-4a3c-4f82-8a8f-47e9541f6d45', '2022-10-15 03:26:53.988177');
INSERT INTO public.sessions VALUES (5, 12, '5f04c22c-6491-46ad-80d3-ef2cbb2ef79e', '2022-10-16 06:32:46.906207');
INSERT INTO public.sessions VALUES (6, 12, 'ee100a2b-31ec-43f0-98a5-e919b7573d98', '2022-10-16 06:32:47.655602');
INSERT INTO public.sessions VALUES (7, 11, '338f527f-d628-415a-b898-ab93eae02617', '2022-10-16 06:33:15.630286');
INSERT INTO public.sessions VALUES (8, 10, '5c290b1d-9b49-470a-b595-609edff6dc1a', '2022-10-16 06:33:23.59006');
INSERT INTO public.sessions VALUES (9, 9, '3b9514f0-37f0-447b-ae2f-e7bc150023b2', '2022-10-16 06:33:31.5425');
INSERT INTO public.sessions VALUES (10, 8, '367998d0-60d4-478e-9188-f7059d53bebc', '2022-10-16 06:33:38.428064');
INSERT INTO public.sessions VALUES (11, 7, '611d24e5-a2d0-4480-99bf-c7e33ffe9562', '2022-10-16 06:33:43.971134');
INSERT INTO public.sessions VALUES (12, 6, '10890fb1-5994-464c-ae9b-618b996985d0', '2022-10-16 06:33:57.24603');
INSERT INTO public.sessions VALUES (13, 5, '73f34cc0-5d20-420e-b942-513f2aa54968', '2022-10-16 06:34:02.187133');
INSERT INTO public.sessions VALUES (14, 4, '8990f0e3-a610-4492-98a7-9e5ffcc046a3', '2022-10-16 06:34:17.649947');
INSERT INTO public.sessions VALUES (15, 3, '5d1e4a72-26be-419e-8adf-575a453c822b', '2022-10-16 06:34:22.943332');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (7, 'https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg', 'gaSBBTcS3p', 0, 1, '2022-10-16 01:51:27.442386');
INSERT INTO public.urls VALUES (9, 'https://preview.redd.it/03l9y4jac1b51.jpg?auto=webp&s=a760ab4a66f5a7576e0141011e197210dc63cfcd', 'D-menKLaUT', 0, 2, '2022-10-16 01:53:47.717769');
INSERT INTO public.urls VALUES (10, 'https://preview.redd.it/03l9y4jac1b51.jpg?auto=webp&s=a760ab4a66f5a7576e0141011e197210dc63cfcd', 'nRMnlJGlJ7', 0, 1, '2022-10-16 01:54:10.705901');
INSERT INTO public.urls VALUES (5, 'https://imageio.forbes.com/specials-images/imageserve/09zFfq433L08b/960x960.jpg?format=jpg&width=96000', 'Okh6EQ3--f', 173, 1, '2022-10-15 03:29:25.291631');
INSERT INTO public.urls VALUES (6, 'https://i.pinimg.com/736x/ff/fd/24/fffd24bad642469377d2ba71f89661c4.jpg', 'FGbT6kgOAy', 3, 1, '2022-10-16 01:51:16.626508');
INSERT INTO public.urls VALUES (8, 'https://i.pinimg.com/736x/df/91/02/df91027b7859de1d4e5d2684604737d5.jpg', 'afX1GFKuA6', 2, 2, '2022-10-16 01:52:00.948733');
INSERT INTO public.urls VALUES (11, 'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__340.jpg', 'opB5pbvDCj', 0, 3, '2022-10-16 06:40:59.941374');
INSERT INTO public.urls VALUES (12, 'https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554__340.jpg', 'qMdlrdQFoI', 0, 3, '2022-10-16 06:41:54.114767');
INSERT INTO public.urls VALUES (13, 'https://st.depositphotos.com/1640238/3316/i/950/depositphotos_33169083-stock-photo-two-little-kittens-sleeping.jpg', '3FGcjuknUS', 0, 3, '2022-10-16 06:42:06.848216');
INSERT INTO public.urls VALUES (14, 'https://st.depositphotos.com/1640238/3316/i/950/depositphotos_33169083-stock-photo-two-little-kittens-sleeping.jpg', 'oAKQKUqCcm', 0, 6, '2022-10-16 06:42:25.468978');
INSERT INTO public.urls VALUES (15, 'https://st.depositphotos.com/1640238/3316/i/950/depositphotos_33169083-stock-photo-two-little-kittens-sleeping.jpg', 'sceUD-Ki3p', 0, 4, '2022-10-16 06:45:20.384032');
INSERT INTO public.urls VALUES (16, 'https://st.depositphotos.com/1640238/3316/i/950/depositphotos_33169083-stock-photo-two-little-kittens-sleeping.jpg', 'aYheoPOfrW', 0, 5, '2022-10-16 06:45:34.811162');
INSERT INTO public.urls VALUES (17, 'https://st.depositphotos.com/1640238/3316/i/950/depositphotos_33169083-stock-photo-two-little-kittens-sleeping.jpg', 'q_EsZdH217', 0, 7, '2022-10-16 06:45:44.997339');
INSERT INTO public.urls VALUES (18, 'https://st.depositphotos.com/1640238/3316/i/950/depositphotos_33169083-stock-photo-two-little-kittens-sleeping.jpg', 'jzA_PDLAGg', 0, 8, '2022-10-16 06:45:55.96761');
INSERT INTO public.urls VALUES (19, 'https://st.depositphotos.com/1640238/3316/i/950/depositphotos_33169083-stock-photo-two-little-kittens-sleeping.jpg', 'NVpY_UBdhJ', 0, 9, '2022-10-16 06:46:05.339435');
INSERT INTO public.urls VALUES (20, 'https://st.depositphotos.com/1640238/3316/i/950/depositphotos_33169083-stock-photo-two-little-kittens-sleeping.jpg', '9XSqSS0z_r', 0, 10, '2022-10-16 06:46:16.515109');
INSERT INTO public.urls VALUES (21, 'https://st.depositphotos.com/1640238/3316/i/950/depositphotos_33169083-stock-photo-two-little-kittens-sleeping.jpg', 'IIoBy76B_I', 0, 11, '2022-10-16 06:46:41.779959');
INSERT INTO public.urls VALUES (22, 'https://st.depositphotos.com/1640238/3316/i/950/depositphotos_33169083-stock-photo-two-little-kittens-sleeping.jpg', 'amO2NrADI4', 0, 12, '2022-10-16 06:47:01.511004');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'lucas', 'lucasdosualdo@gmail.com', '$2b$10$xAoOwoTK25w6q3h2ZA5FdOu1/Xnfbri/X8tohr3tSf3NcTGpOlj0i', '2022-10-15 00:10:39.54341');
INSERT INTO public.users VALUES (2, 'lucas2', 'lucasdosualdo2@gmail.com', '$2b$10$VLZ8zGs4mC38iLB/KTyp0eMW6P2ZyoXxTEcIvxsQj/O/STsUC4P0C', '2022-10-15 00:29:11.684935');
INSERT INTO public.users VALUES (3, 'lucas3', 'lucasdosualdo3@gmail.com', '$2b$10$2PyP7cyTCl8MDJ7dNEzEzerju6p3x0HEk1swNCJIHPfOOs43LpFIa', '2022-10-16 06:08:58.187377');
INSERT INTO public.users VALUES (4, 'lucas4', 'lucasdosualdo4@gmail.com', '$2b$10$GyfDdpu2AAiZ48cCsO7jKesTQs1YiUvZ5AtQ3rxST0obW9xKxg5k6', '2022-10-16 06:09:40.233201');
INSERT INTO public.users VALUES (5, 'lucas5', 'lucasdosualdo5@gmail.com', '$2b$10$nfDLtuAv.JLZ4y5nzIrIl.uAe/QPss7Zav3K7XL3z5.apadJuIVDO', '2022-10-16 06:29:12.42847');
INSERT INTO public.users VALUES (6, 'lucas6', 'lucasdosualdo6@gmail.com', '$2b$10$h4.gIBesTmTDDsPgRubLXu37hGAWhMsNJp5EcA/4UeCL6hQ.6x0Hm', '2022-10-16 06:29:34.767899');
INSERT INTO public.users VALUES (7, 'lucas7', 'lucasdosualdo7@gmail.com', '$2b$10$SLrUnr5luj3w8dGwSijYmuDyDlvGSA.FSy0NXEyUr7sbA7qy84XPq', '2022-10-16 06:29:46.029168');
INSERT INTO public.users VALUES (8, 'lucas8', 'lucasdosualdo8@gmail.com', '$2b$10$kV9IWaO1sF1VQaejtGFyIOa.z8bfKCUbnsJ7SDUEs4XMc97wRMzLG', '2022-10-16 06:29:58.262359');
INSERT INTO public.users VALUES (9, 'lucas9', 'lucasdosualdo9@gmail.com', '$2b$10$nDXz8lutJkEB12UDug5aWOEh5Jy6nyMDQmXewrLf2mKg9ayCJkEuK', '2022-10-16 06:30:15.002862');
INSERT INTO public.users VALUES (10, 'lucas10', 'lucasdosualdo10@gmail.com', '$2b$10$58lwgPKtj8/9EMa3.8XunelAUtuRuAu8VWTD5pEpEHzcDDbpwF0pG', '2022-10-16 06:30:25.600897');
INSERT INTO public.users VALUES (11, 'lucas11', 'lucasdosualdo11@gmail.com', '$2b$10$3A1Z.3Eo3fza.TEXt5LRTe0ABhhtBJ0ZYQkaSbB1Ox7YeItMn56x2', '2022-10-16 06:30:35.186743');
INSERT INTO public.users VALUES (12, 'lucas12', 'lucasdosualdo12@gmail.com', '$2b$10$w08.j8P65b54WkjjhXR.J.v0WOq02z5uD4DCUwQE0toAr5Ywr30Ny', '2022-10-16 06:31:04.480359');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 15, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 22, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_password_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_password_key UNIQUE (password);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

