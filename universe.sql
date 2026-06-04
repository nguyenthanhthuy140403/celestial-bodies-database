--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    location text,
    type character varying(100),
    origin text,
    number_of_main_stars integer,
    shape text
);


ALTER TABLE public.constellation OWNER TO postgres;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO postgres;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_billion_years numeric(10,2),
    type character varying(50),
    diameter_in_light_years integer,
    mass_in_kg numeric,
    structure text,
    messier_catalog integer
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
    name character varying(100) NOT NULL,
    planet_id integer,
    distance_from_its_planet_in_km integer,
    diameter_in_km integer,
    mass_in_kg numeric,
    orbit_and_rotation text
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
    name character varying(100) NOT NULL,
    star_id integer,
    type character varying(100),
    mean_radius_in_km integer,
    mass_in_kg numeric,
    surface_temperature_in_kelvin integer,
    potentially_habitable boolean,
    exoplanet boolean
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    surface_temperature_in_kelvin integer,
    radius_in_km numeric,
    visible boolean,
    age_in_million_years integer,
    galaxy_id integer,
    constellation_id integer,
    type character varying(100),
    luminosity_in_watts numeric,
    mass_in_kg numeric
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.constellation VALUES (1, 'Orion (The Hunter)', 'on the celestial equator', 'seasonal constellation', 'a famous tale of divine birth, boastfulnees, and an eternal chase in the night sky', 7, 'a giant hourglass');
INSERT INTO public.constellation VALUES (2, 'Ursa Major (the Great Bear)', 'the second quadrant of the northern celestial hemisphere (NQ2)', 'circumpolar constellation', 'roots dating back to prehistoric times and ancient civilizations across the globe', 7, 'a massive, sprawling bear shape');
INSERT INTO public.constellation VALUES (3, 'Ursa Minor (the Little Bear)', 'Northern Celestial Hemisphere', 'cirumpolar constellation', 'a Greek tragedy of the gods and an ancient Phoenician navigational discovery', 7, 'a ladle or scoop');
INSERT INTO public.constellation VALUES (4, 'Cassiopia', 'northern celestial hemisphere', 'circumpolar constellation', 'deeply rooted in ancient Greek mythology', 5, 'W or M shape');
INSERT INTO public.constellation VALUES (5, 'Scorpius (The Scorpion)', 'sourthern celestial hemisphere, stretching across the ecliptic plane', 'Zodiac constellation', 'originates primarily from Greek mythology, where it represents the giant scorpion sent to defeat the boastful hunter Orion', 18, 'J-shape or fishhook');
INSERT INTO public.constellation VALUES (6, 'Leo', 'northern celestial hemisphere, along the zodiac band', 'Zodiac constellation', 'ancient Greek mythology, representing the fearsome Nemean Lion that the hero Heracles (Hercules) defeated during his famous twelve labors', 9, 'a crouching lion');
INSERT INTO public.constellation VALUES (7, 'Aries', 'northern celestial hemisphere along the ecliptic plane', 'Zodiac constellation', 'origianted from the ancient Greek legend of the flying golden ram, Chrysomallos, which rescued the siblings Phrixus and Helle from their evil stepmother', 4, 'a bent line or a curved walking stick');
INSERT INTO public.constellation VALUES (8, 'Canis Major (the Greater Dog)', 'sourthern celestial hemisphere', 'seasonal constellation', 'from ancient Greek and Roman mythology as one of the faithful hunting hounds of Orion the giant, tracking Lepus the Hare across the sky', 8, 'stick-figure shape of a dog standing on its hind legs or viewed in profile');
INSERT INTO public.constellation VALUES (9, 'Centaurus', 'the third quadrant of the southern celestial hemisphere', 'circumpolar constellation', 'from ancient Greek mythology, where it typically represents Chiron, the wise and immortal centaur known for mentoring legendary heroes like Hercules, Achilles, and Jason', 11, 'large, elongated, four-sided shape');
INSERT INTO public.constellation VALUES (10, 'Andromeda', 'northern celestial hemisphere', 'circumpolar constellation', 'named after the tragic yet heroic figure in Greek mythology', 16, 'a sprawling V-shape or an ''A'' shape with long, outstretched arms');
INSERT INTO public.constellation VALUES (11, 'Cancer (the Crab)', 'the second quadrant of the Northern Hemisphere', 'Zodiac constellation', 'originates from a giant crab (Karkinos) sent by the goddess Hera to distract Heracles (Hercules) during his battle with the multi-headed Hydra', 5, 'a faint, upside-down ''Y''');
INSERT INTO public.constellation VALUES (12, 'Cygnus (the Swan)', 'along the plane of the Milky Way galaxy in ther Northern Celestial Hemisphere', 'circumpolar constellation', 'primarily stems from Greek mythology, where it is most famously associated with Zeus, who disguised himself as a majestic swan to seduce the Spartan Queen Leda', 9, 'a graceful, flying swan with its wings spread wide');
INSERT INTO public.constellation VALUES (13, 'Virgo', 'the Southern Hemisphers''s third quadrant', 'Zodiac constellation', 'origin span several cultures, deeply rooted in ancient agricultural calendars and rich mythological tales', 9, 'sprawling ''Y'' shape');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', 13.60, 'barred spiral galaxy', 100000, 3000000000000000000000000000000000000000000, 'a bright central bar and bulge, a vast rotating disk of stars and gas, prominent priral arms, and an invisible dark matter halo', NULL);
INSERT INTO public.galaxy VALUES (6, 'Hoag''s Object', NULL, 'non-typical ring galaxy', 148000, 1390000000000000000000000000000000000000000, 'a nearly perfect ring of young hot blue stars circles the older yellow nucleus of this ring galaxy c. 600 million light-years away in the constellation Serpens', NULL);
INSERT INTO public.galaxy VALUES (8, 'NGC 1300', 13.00, 'barred spiral galaxy', 130000, 400000000000000000000000000000000000000000, 'a classic barred spiral galaxy', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 3.00, 'barred spiral galaxy', 152000, 2000000000000000000000000000000000000000000, NULL, 31);
INSERT INTO public.galaxy VALUES (3, 'The Whirpool Galaxy', 0.40, 'spiral galaxy', 76900, 320000000000000000000000000000000000000000, 'two sweeping, symmetrical spiral arms, a bright central core housing a supermassive black hole, and a smaller, interacting dwarf companion galaxy, NGC 5195', 51);
INSERT INTO public.galaxy VALUES (4, 'The Cigar Galaxy', 1.00, 'irregular galaxy', 40800, 100000000000000000000000000000000000000000, 'heavily disrupted by gravitaional interactions with its neighbor, M81', 82);
INSERT INTO public.galaxy VALUES (5, 'The Black Eye Galaxy', 1.00, 'spiral galaxy', 53800, 60000000000000000000000000000000000000000, 'a chaotic internal structure featuring two massive, counter-rotating disks of gas', 64);
INSERT INTO public.galaxy VALUES (7, 'The Pinwheel Galaxy', 11.00, 'spiral galaxy', 252000, 3000000000000000000000000000000000000000000, 'a face-on counterclockwise intermediate spiral galaxy', 101);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'the Moon', 1, 384400, 3476, 73480000000000000000000, 'takes approximately 27.3 days to both complete one orbit around Earth and to rotate once on its axis');
INSERT INTO public.moon VALUES (2, 'Ganymede', 3, 1070400, 5268, 148000000000000000000000, 'orbits Jupiter once every 7.15 days and rotates at the same rate, so the same side always faces Jupiter');
INSERT INTO public.moon VALUES (3, 'Callisto', 3, 1882700, 4821, 107600000000000000000000, 'orbits Jupiter every 16.7 days and rotates at the same rate, keeping the same face permanently pointed toward Jupiter');
INSERT INTO public.moon VALUES (4, 'Io', 3, 421700, 3643, 89300000000000000000000, 'orbits Jupiter every 1.77 days and rotates at the same rate, so the same side always faces Jupiter');
INSERT INTO public.moon VALUES (5, 'Europa', 3, 676938, 3122, 47998400000000000000000, 'orbits Jupiter every 3.55 days and rotates at the same rate, the same side always faces Jupiter');
INSERT INTO public.moon VALUES (6, 'Titan', 2, 1221870, 5150, 134500000000000000000000, 'orbits Saturn every 15.95 days and rotates at the same rate, so the same side always faces Saturn');
INSERT INTO public.moon VALUES (7, 'Enceladus', 2, 238037, 504, 108000000000000000000, 'orbits Saturn every 1.37 days and rotates at the same rate, keeping the same face permanently pointed toward Saturn');
INSERT INTO public.moon VALUES (8, 'Mimas', 2, 185539, 396, 37500000000000000000, 'orbits Saturn every 0.94 days and rotates at the same rate, so the same side always faces Saturn');
INSERT INTO public.moon VALUES (9, 'Iapetus', 2, 3561300, 1469, 1810000000000000000000, 'orbits Saturns every 79.3 days and rotates at the same rate, keeping the same face permanently pointed toward Saturn');
INSERT INTO public.moon VALUES (10, 'Hyperion', 2, 1481100, 270, 5551000000000000000, 'orbits Saturn 21.3 days, chaotic tumbling rotation, and erratic orbit');
INSERT INTO public.moon VALUES (11, 'Phoebe', 2, 12952000, 213, 8292000000000000000, 'orbits Saturn every 550 days in a retrograde orbit (opposite Saturn''s rotation) and rotates once every 9.3 hours, so it is not tidally locked to Saturn');
INSERT INTO public.moon VALUES (12, 'Phobos', 4, 9377, 22, 10660000000000000, 'orbits Mars every 7.65 hours and rotates at the same rate, so the same siade always faces Mars');
INSERT INTO public.moon VALUES (13, 'Deimos', 4, 23460, 12, 1500000000000000, 'orbits Mars every 30.3 hours and rotates at the same rate');
INSERT INTO public.moon VALUES (14, 'Charon', 6, 19596, 1212, 1589700000000000000000, 'orbits Pluto every 6.39 days and roates at the same rate, so Charon and Pluto are mutually tidally locked, always showing the same face to each other');
INSERT INTO public.moon VALUES (15, 'Nix', 6, 48694, 37, 27000000000000000, 'orbits Pluto every 24.9 days and has a chaotic rotation, meaning its spin changes unpredictably due to the gravitational influence of Pluto and Charon');
INSERT INTO public.moon VALUES (16, 'Hydra', 6, 64700, 51, 30000000000000000, 'orbits Pluto every 38.2 days and has a chaotic rotation, meaning its spin rate and orientation change unpredictably rather than being tidally locked');
INSERT INTO public.moon VALUES (17, 'Tethys', 2, 294660, 1062, 617000000000000000000, 'orbits Saturn every 1.89 days and rotates at the same rate');
INSERT INTO public.moon VALUES (18, 'Triton', 15, 354800, 2710, 21400000000000000000000, 'orbits Neptune every 5.88 days in a retrograde orbit (opposite Neptune''s rotation) and rotates at the same rate, so the same side always faces Neptune');
INSERT INTO public.moon VALUES (19, 'Titania', 16, 435900, 1578, 3500000000000000000000, 'orbits Uranus every 8.71 days and rotates at the same rate');
INSERT INTO public.moon VALUES (20, 'Umbirel', 16, 266000, 1169, 1270000000000000000000, 'orbits Uranus every 4.14 days and rotates at the same rate');
INSERT INTO public.moon VALUES (21, 'Proteus', 15, 117647, 420, 44000000000000000000, 'orbits Neptune every 1.12 days and rotates at the same rate');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'the Earth', 1, 'terrestrial planet (rocky or telluric planet)', 6371, 5972200000000000000000000, 288, true, false);
INSERT INTO public.planet VALUES (2, 'Saturn', 1, 'gas giant', 58232, 568000000000000000000000000, 134, false, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'gas giant', 69911, 1898000000000000000000000000, 163, false, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'terrestrial planet', 3390, 641710000000000000000000, 209, false, false);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 'terrestrial planet', 6052, 4868000000000000000000000, 872, true, false);
INSERT INTO public.planet VALUES (6, 'Pluto', 1, 'dwarf planet', 1188, 13100000000000000000000, 44, false, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 6, 'super-Earth exoplanet', 6371, 7580000000000000000000000, 234, true, true);
INSERT INTO public.planet VALUES (10, '55 Cancri e', 9, 'super-Earth', 11960, 47700000000000000000000000, 4400, false, true);
INSERT INTO public.planet VALUES (7, 'Kepler-452 b', 10, 'super-Earth exoplanet', 10396, 29900000000000000000000000, 295, true, true);
INSERT INTO public.planet VALUES (8, 'Kepler-16 b', 11, 'cold gas giant exoplanet', 53896, 199000000000000000000000000, 188, false, true);
INSERT INTO public.planet VALUES (11, 'TrES-2 b', 12, 'Hot Jupiter exoplanet', 95000, 2280000000000000000000000000, 1885, false, true);
INSERT INTO public.planet VALUES (12, 'HD 110067 e', 13, 'sub-Neptune', 12360, 23100000000000000000000000, 533, false, true);
INSERT INTO public.planet VALUES (13, 'WASP-107 b', 14, 'gas giant and super-Neptune', 67200, 182000000000000000000000000, 750, false, true);
INSERT INTO public.planet VALUES (14, 'Wolf 1069 b', 15, 'terrestrial super-Earth exoplanet', 6882, NULL, 250, true, true);
INSERT INTO public.planet VALUES (15, 'Neptune', 1, 'ice giant', 24622, 102400000000000000000000000, 72, false, false);
INSERT INTO public.planet VALUES (16, 'Uranus', 1, 'ice giant', 25362, 86810000000000000000000000, 76, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 5778, 695700, true, 4600, 1, NULL, 'yellow dwarf', 383000000000000000000000000, 2000000000000000000000000000000);
INSERT INTO public.star VALUES (3, 'Sirius B', 25200, 5635, false, 126, 1, NULL, 'white dwarf', 930000000000000000000000, 1989000000000000000000000000000);
INSERT INTO public.star VALUES (4, 'Polaris (the North Star)', 7200, 35000000, true, 67, 1, 3, 'yellow supergiant', 480000000000000000000000000000, 10200000000000000000000000000000);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3590, 617000000, true, 10, 1, 1, 'red supergiant star', 48450000000000000000000000000000, 38600000000000000000000000000000);
INSERT INTO public.star VALUES (2, 'Sirius A', 9845, 1190000, true, 300, 1, 8, 'A-type main-sequence star', 9500000000000000000000000000, 4100000000000000000000000000000);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 5753, NULL, true, 6520, 1, 9, 'triple star system: G2 V, K1 V, M5.5 V', NULL, NULL);
INSERT INTO public.star VALUES (7, 'SN 1885A (S Andromedae)', 7228, NULL, false, NULL, 2, 10, 'supernova', 1500000000000000000000000000000000000, 2000000000000000000000000000000000000000000);
INSERT INTO public.star VALUES (8, 'Hamal', 4553, 10570000, true, 3400, 1, 7, 'orange giant (class K2-III)', 35000000000000000000000000000, 2980000000000000000000000000000);
INSERT INTO public.star VALUES (9, '55 Cancri', 5196, 682000, true, 7400, 1, 11, 'binary star system', 230000000000000000000000000, 1800000000000000000000000000000);
INSERT INTO public.star VALUES (12, 'Kepler-1', 5850, 694000, false, 5100, 1, NULL, 'binary star system', 406000000000000000000000000, 1330000000000000000000000000000);
INSERT INTO public.star VALUES (13, 'HD 110067', 5266, 548500, true, 2500, 1, NULL, 'K-type main-sequence star', 156000000000000000000000000, 1580000000000000000000000000000);
INSERT INTO public.star VALUES (10, 'Kepler-452', 5757, 772900, true, 6000, 1, 12, 'G-type main-sequence star', 461000000000000000000000000, 2060000000000000000000000000000);
INSERT INTO public.star VALUES (11, 'Kepler-16', NULL, NULL, true, 2000, 1, 12, 'binary star system', 56700000000000000000000000, NULL);
INSERT INTO public.star VALUES (15, 'Wolf 1069', 3158, 126170, false, NULL, 1, 12, 'red dwarf', 115000000000000000000000, 332000000000000000000000000000);
INSERT INTO public.star VALUES (14, 'WASP-107', 4425, 458000, false, 3400, 1, 13, 'orange dwarf star of spectral type K6V', 50500000000000000000000000, 1350000000000000000000000000000);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 13, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: constellation constellation_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_id_key UNIQUE (constellation_id);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: TABLE constellation; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.constellation TO freecodecamp;


--
-- Name: SEQUENCE constellation_constellation_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.constellation_constellation_id_seq TO freecodecamp;


--
-- PostgreSQL database dump complete
--

