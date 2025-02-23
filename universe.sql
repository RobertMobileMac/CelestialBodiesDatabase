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
    name character varying(30) NOT NULL,
    type_id integer NOT NULL,
    size_id integer NOT NULL,
    description text,
    earth_dist_lt_yr integer,
    pict_name character varying(40)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    hi_temp numeric(4,1),
    lo_temp numeric(4,1),
    size_km integer,
    has_life boolean,
    pict_name character varying(40)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    description text,
    hi_temp numeric(4,1),
    lo_temp numeric(4,1),
    size_km integer,
    star_dist_million_km integer,
    has_life boolean,
    pict_name character varying(40)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: size; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.size (
    size_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    pict_name character varying(40)
);


ALTER TABLE public.size OWNER TO freecodecamp;

--
-- Name: size_size_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.size_size_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.size_size_id_seq OWNER TO freecodecamp;

--
-- Name: size_size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.size_size_id_seq OWNED BY public.size.size_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    size_km integer,
    pict_name character varying(40)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.type (
    type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    pict_name character varying(40)
);


ALTER TABLE public.type OWNER TO freecodecamp;

--
-- Name: type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.type_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_type_id_seq OWNER TO freecodecamp;

--
-- Name: type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.type_type_id_seq OWNED BY public.type.type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: size size_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.size ALTER COLUMN size_id SET DEFAULT nextval('public.size_size_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: type type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type ALTER COLUMN type_id SET DEFAULT nextval('public.type_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 3, 2, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 3, 2, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Draco II', 6, 1, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 2, 2, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 1, 2, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 2, 3, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Phobos', 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Deimos', 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Io', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'Europa', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'Ganymede', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'Callisto', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (28, 'Amalthea', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (29, 'Himalia', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (30, 'Elara', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (31, 'Pasiphae', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (32, 'Sinope', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (33, 'Lysithea', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (34, 'Carme', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (35, 'Ananke', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (36, 'Leda', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (37, 'Thebe', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (38, 'Adrastea', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (39, 'Metis', 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (40, 'Callirrhoe', 32, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (28, 'Mercury', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (29, 'Venus', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (30, 'Earth', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (31, 'Mars', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (32, 'Jupiter', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (33, 'Saturn', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (34, 'Uranus', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (35, 'Neptune', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (36, 'Pluto', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (37, 'Ceres', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (38, 'Haumea', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (39, 'Makemake', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (40, 'Eris', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: size; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.size VALUES (1, 'dwarf', NULL, NULL);
INSERT INTO public.size VALUES (2, 'large', NULL, NULL);
INSERT INTO public.size VALUES (3, 'giant', NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sun', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (8, 'Alnitak', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (9, 'Alnilam', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (10, 'Antares', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (11, 'UY Scuti', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (12, 'VY Canis Majoris', 1, NULL, NULL, NULL);


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.type VALUES (1, 'elliptical', NULL, NULL);
INSERT INTO public.type VALUES (2, 'spiral', NULL, NULL);
INSERT INTO public.type VALUES (3, 'barred spiral', NULL, NULL);
INSERT INTO public.type VALUES (4, 'peculiar', NULL, NULL);
INSERT INTO public.type VALUES (5, 'irregular', NULL, NULL);
INSERT INTO public.type VALUES (6, 'spheroidal', NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 40, true);


--
-- Name: size_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.size_size_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.type_type_id_seq', 1, false);


--
-- Name: galaxy galaxy_pict_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pict_name_key UNIQUE (pict_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pict_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pict_name_key UNIQUE (pict_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pict_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pict_name_key UNIQUE (pict_name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: size size_pict_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.size
    ADD CONSTRAINT size_pict_name_key UNIQUE (pict_name);


--
-- Name: size size_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.size
    ADD CONSTRAINT size_pkey PRIMARY KEY (size_id);


--
-- Name: star star_pict_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pict_name_key UNIQUE (pict_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: type type_pict_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pict_name_key UNIQUE (pict_name);


--
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (type_id);


--
-- Name: galaxy galaxy_size_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_size_id_fkey FOREIGN KEY (size_id) REFERENCES public.size(size_id);


--
-- Name: galaxy galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

