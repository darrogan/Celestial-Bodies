--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(32) NOT NULL,
    diameter integer,
    description text,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(32) NOT NULL,
    diameter integer,
    description text,
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(32) NOT NULL,
    diameter integer,
    has_life boolean,
    description text,
    age_in_millions numeric(3,2),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(32) NOT NULL,
    diameter integer,
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_relation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_galaxy_relation (
    star_galaxy_relation_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(32) NOT NULL,
    description text
);


ALTER TABLE public.star_galaxy_relation OWNER TO freecodecamp;

--
-- Name: star_galaxy_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_relation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_relation_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_relation_id_seq OWNED BY public.star_galaxy_relation.star_galaxy_relation_id;


--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: star_galaxy_relation star_galaxy_relation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_galaxy_relation ALTER COLUMN star_galaxy_relation_id SET DEFAULT nextval('public.star_galaxy_relation_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 10000000, 'Galaxia terrestre', NULL);
INSERT INTO public.galaxy VALUES (2, 'Galaxia 2', 20000000, 'Arbitrario 2', NULL);
INSERT INTO public.galaxy VALUES (3, 'Galaxia 3', 30000000, 'Arbitrario 3', NULL);
INSERT INTO public.galaxy VALUES (4, 'Galaxia 4', 40000000, 'Arbitrario 4', NULL);
INSERT INTO public.galaxy VALUES (5, 'Galaxia 5', 50000000, 'Arbitrario 5', NULL);
INSERT INTO public.galaxy VALUES (6, 'Galaxia 6', 60000000, 'Arbitrario 6', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', NULL, 'Luna Terrestre', NULL, 1);
INSERT INTO public.moon VALUES (2, 'Moon 2_1-1', NULL, 'Moon Arbitrario 2_1-1', NULL, 2);
INSERT INTO public.moon VALUES (3, 'Moon 2_1-2', NULL, 'Moon Arbitrario 2_1-2', NULL, 2);
INSERT INTO public.moon VALUES (4, 'Moon 2_1-3', NULL, 'Moon Arbitrario 2_1-3', NULL, 2);
INSERT INTO public.moon VALUES (5, 'Moon 2_1-4', NULL, 'Moon Arbitrario 2_1-4', NULL, 2);
INSERT INTO public.moon VALUES (6, 'Moon 2_2-1', NULL, 'Moon Arbitrario 2_2-1', NULL, 3);
INSERT INTO public.moon VALUES (7, 'Moon 2_2-2', NULL, 'Moon Arbitrario 2_2-2', NULL, 3);
INSERT INTO public.moon VALUES (8, 'Moon 2_2-3', NULL, 'Moon Arbitrario 2_2-3', NULL, 3);
INSERT INTO public.moon VALUES (9, 'Moon 2_2-4', NULL, 'Moon Arbitrario 2_2-4', NULL, 3);
INSERT INTO public.moon VALUES (10, 'Moon 2_2-5', NULL, 'Moon Arbitrario 2_2-5', NULL, 3);
INSERT INTO public.moon VALUES (11, 'Moon 2_3-1', NULL, 'Moon Arbitrario 2_3-1', NULL, 4);
INSERT INTO public.moon VALUES (12, 'Moon 3_1-1', NULL, 'Moon Arbitrario 3_1-1', NULL, 5);
INSERT INTO public.moon VALUES (13, 'Moon 3_2-1', NULL, 'Moon Arbitrario 3_2-1', NULL, 6);
INSERT INTO public.moon VALUES (14, 'Moon 3_3-1', NULL, 'Moon Arbitrario 3_3-1', NULL, 7);
INSERT INTO public.moon VALUES (15, 'Moon 3_4-1', NULL, 'Moon Arbitrario 3_4-1', NULL, 8);
INSERT INTO public.moon VALUES (16, 'Moon 4_1-1', NULL, 'Moon Arbitrario 4_1-1', NULL, 9);
INSERT INTO public.moon VALUES (17, 'Moon 4_2-1', NULL, 'Moon Arbitrario 4_2-1', NULL, 10);
INSERT INTO public.moon VALUES (18, 'Moon 4_3-1', NULL, 'Moon Arbitrario 4_3-1', NULL, 11);
INSERT INTO public.moon VALUES (19, 'Moon 4_4-1', NULL, 'Moon Arbitrario 4_4-1', NULL, 12);
INSERT INTO public.moon VALUES (20, 'Moon 4_4-2', NULL, 'Moon Arbitrario 4_4-2', NULL, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', NULL, true, 'Tierra', NULL, 1);
INSERT INTO public.planet VALUES (2, 'Planet 2_1', NULL, false, 'Planet Arbitrario 2_1', NULL, 2);
INSERT INTO public.planet VALUES (3, 'Planet 2_2', NULL, false, 'Planet Arbitrario 2_2', NULL, 2);
INSERT INTO public.planet VALUES (4, 'Planet 2_3', NULL, false, 'Planet Arbitrario 2_3', NULL, 2);
INSERT INTO public.planet VALUES (5, 'Planet 3_1', NULL, false, 'Planet Arbitrario 3_1', NULL, 3);
INSERT INTO public.planet VALUES (6, 'Planet 3_2', NULL, false, 'Planet Arbitrario 3_2', NULL, 3);
INSERT INTO public.planet VALUES (7, 'Planet 3_3', NULL, true, 'Planet Arbitrario 3_3', NULL, 3);
INSERT INTO public.planet VALUES (8, 'Planet 3_4', NULL, false, 'Planet Arbitrario 3_4', NULL, 3);
INSERT INTO public.planet VALUES (9, 'Planet 4_1', NULL, false, 'Planet Arbitrario 4_1', NULL, 4);
INSERT INTO public.planet VALUES (10, 'Planet 4_2', NULL, false, 'Planet Arbitrario 4_2', NULL, 4);
INSERT INTO public.planet VALUES (11, 'Planet 4_3', NULL, true, 'Planet Arbitrario 4_3', NULL, 4);
INSERT INTO public.planet VALUES (12, 'Planet 4_4', NULL, false, 'Planet Arbitrario 4_4', NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 100000, 'Sol terrestre', 1);
INSERT INTO public.star VALUES (2, 'Star 2', 200000, 'Star Arbitrario 2', 2);
INSERT INTO public.star VALUES (3, 'Star 3', 300000, 'Star Arbitrario 3', 3);
INSERT INTO public.star VALUES (4, 'Star 4', 400000, 'Star Arbitrario 4', 4);
INSERT INTO public.star VALUES (5, 'Star 5', 500000, 'Star Arbitrario 5', 5);
INSERT INTO public.star VALUES (6, 'Star 6', 600000, 'Star Arbitrario 6', 6);


--
-- Data for Name: star_galaxy_relation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_galaxy_relation VALUES (1, 1, 1, 'Sun-Milky Way', 'Sol terrestre - Galaxia terrestre');
INSERT INTO public.star_galaxy_relation VALUES (2, 2, 2, 'Star 2 - Galaxy 2', 'Star Arbitrario 2 - Arbitrario 2');
INSERT INTO public.star_galaxy_relation VALUES (3, 3, 3, 'Star 3 - Galaxy 3', 'Star Arbitrario 3 - Arbitrario 3');
INSERT INTO public.star_galaxy_relation VALUES (4, 4, 4, 'Star 4 - Galaxy 4', 'Star Arbitrario 4 - Arbitrario 4');
INSERT INTO public.star_galaxy_relation VALUES (5, 5, 5, 'Star 5 - Galaxy 5', 'Star Arbitrario 5 - Arbitrario 5');
INSERT INTO public.star_galaxy_relation VALUES (6, 6, 6, 'Star 6 - - Galaxy', 'Star Arbitrario 6 - Arbitrario 6');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_galaxy_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_relation_id_seq', 6, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_galaxy_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_galaxy_uniq UNIQUE (name);


--
-- Name: planet name_planet_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_planet_uniq UNIQUE (name);


--
-- Name: star_galaxy_relation name_star_galaxy_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_galaxy_relation
    ADD CONSTRAINT name_star_galaxy_uniq UNIQUE (name);


--
-- Name: star name_star_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_star_uniq UNIQUE (name);


--
-- Name: moon name_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_uniq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star_galaxy_relation star_galaxy_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_galaxy_relation
    ADD CONSTRAINT star_galaxy_relation_pkey PRIMARY KEY (star_galaxy_relation_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star_galaxy_relation star_galaxy_relation_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_galaxy_relation
    ADD CONSTRAINT star_galaxy_relation_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star_galaxy_relation star_galaxy_relation_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_galaxy_relation
    ADD CONSTRAINT star_galaxy_relation_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

