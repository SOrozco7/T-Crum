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


--
-- Name: enum_Users_department_major; Type: TYPE; Schema: public; Owner: salvador
--

CREATE TYPE public."enum_Users_department_major" AS ENUM (
    'ITC',
    'ISD',
    'INT',
    'Departamento de Tecnologias de Informacion'
);


ALTER TYPE public."enum_Users_department_major" OWNER TO salvador;

--
-- Name: enum_Users_system_role; Type: TYPE; Schema: public; Owner: salvador
--

CREATE TYPE public."enum_Users_system_role" AS ENUM (
    'root',
    'user'
);


ALTER TYPE public."enum_Users_system_role" OWNER TO salvador;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Acceptance_criteria; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public."Acceptance_criteria" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    user_story_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Acceptance_criteria" OWNER TO salvador;

--
-- Name: Acceptance_criteria_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public."Acceptance_criteria_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Acceptance_criteria_id_seq" OWNER TO salvador;

--
-- Name: Acceptance_criteria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public."Acceptance_criteria_id_seq" OWNED BY public."Acceptance_criteria".id;


--
-- Name: Logs; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public."Logs" (
    id integer NOT NULL,
    query character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public."Logs" OWNER TO salvador;

--
-- Name: Logs_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public."Logs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Logs_id_seq" OWNER TO salvador;

--
-- Name: Logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public."Logs_id_seq" OWNED BY public."Logs".id;


--
-- Name: Project_technologies; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public."Project_technologies" (
    id integer NOT NULL,
    project_id integer NOT NULL,
    technology_id integer NOT NULL,
    version text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Project_technologies" OWNER TO salvador;

--
-- Name: Project_technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public."Project_technologies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Project_technologies_id_seq" OWNER TO salvador;

--
-- Name: Project_technologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public."Project_technologies_id_seq" OWNED BY public."Project_technologies".id;


--
-- Name: Projects; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public."Projects" (
    id integer NOT NULL,
    vision text NOT NULL,
    name text NOT NULL,
    begin_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    background text NOT NULL,
    risks text NOT NULL,
    reach text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    scrum_master_id character varying(255) NOT NULL
);


ALTER TABLE public."Projects" OWNER TO salvador;

--
-- Name: Projects_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public."Projects_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Projects_id_seq" OWNER TO salvador;

--
-- Name: Projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public."Projects_id_seq" OWNED BY public."Projects".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO salvador;

--
-- Name: Sprints; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public."Sprints" (
    id integer NOT NULL,
    days integer,
    comment text,
    project_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Sprints" OWNER TO salvador;

--
-- Name: Sprints_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public."Sprints_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sprints_id_seq" OWNER TO salvador;

--
-- Name: Sprints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public."Sprints_id_seq" OWNED BY public."Sprints".id;


--
-- Name: Tasks; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public."Tasks" (
    id integer NOT NULL,
    duration integer,
    name text,
    completed boolean,
    user_story_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Tasks" OWNER TO salvador;

--
-- Name: Tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public."Tasks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tasks_id_seq" OWNER TO salvador;

--
-- Name: Tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public."Tasks_id_seq" OWNED BY public."Tasks".id;


--
-- Name: Technologies; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public."Technologies" (
    id integer NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Technologies" OWNER TO salvador;

--
-- Name: Technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public."Technologies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Technologies_id_seq" OWNER TO salvador;

--
-- Name: Technologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public."Technologies_id_seq" OWNED BY public."Technologies".id;


--
-- Name: User_projects; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public."User_projects" (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    project_role character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."User_projects" OWNER TO salvador;

--
-- Name: User_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public."User_projects_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_projects_id_seq" OWNER TO salvador;

--
-- Name: User_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public."User_projects_id_seq" OWNED BY public."User_projects".id;


--
-- Name: User_stories; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public."User_stories" (
    id integer NOT NULL,
    weight integer NOT NULL,
    scrum_board_status integer NOT NULL,
    description text NOT NULL,
    priority integer NOT NULL,
    sprint_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."User_stories" OWNER TO salvador;

--
-- Name: User_stories_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public."User_stories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_stories_id_seq" OWNER TO salvador;

--
-- Name: User_stories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public."User_stories_id_seq" OWNED BY public."User_stories".id;


--
-- Name: User_tasks; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public."User_tasks" (
    id integer NOT NULL,
    task_id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."User_tasks" OWNER TO salvador;

--
-- Name: User_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public."User_tasks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_tasks_id_seq" OWNER TO salvador;

--
-- Name: User_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public."User_tasks_id_seq" OWNED BY public."User_tasks".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public."Users" (
    id character varying(255) NOT NULL,
    department_major public."enum_Users_department_major" NOT NULL,
    name character varying(255) NOT NULL,
    "photo_URL" character varying(255),
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    system_role public."enum_Users_system_role" NOT NULL,
    uuid uuid,
    confirmed boolean
);


ALTER TABLE public."Users" OWNER TO salvador;

--
-- Name: Acceptance_criteria id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Acceptance_criteria" ALTER COLUMN id SET DEFAULT nextval('public."Acceptance_criteria_id_seq"'::regclass);


--
-- Name: Logs id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Logs" ALTER COLUMN id SET DEFAULT nextval('public."Logs_id_seq"'::regclass);


--
-- Name: Project_technologies id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Project_technologies" ALTER COLUMN id SET DEFAULT nextval('public."Project_technologies_id_seq"'::regclass);


--
-- Name: Projects id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Projects" ALTER COLUMN id SET DEFAULT nextval('public."Projects_id_seq"'::regclass);


--
-- Name: Sprints id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Sprints" ALTER COLUMN id SET DEFAULT nextval('public."Sprints_id_seq"'::regclass);


--
-- Name: Tasks id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Tasks" ALTER COLUMN id SET DEFAULT nextval('public."Tasks_id_seq"'::regclass);


--
-- Name: Technologies id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Technologies" ALTER COLUMN id SET DEFAULT nextval('public."Technologies_id_seq"'::regclass);


--
-- Name: User_projects id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."User_projects" ALTER COLUMN id SET DEFAULT nextval('public."User_projects_id_seq"'::regclass);


--
-- Name: User_stories id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."User_stories" ALTER COLUMN id SET DEFAULT nextval('public."User_stories_id_seq"'::regclass);


--
-- Name: User_tasks id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."User_tasks" ALTER COLUMN id SET DEFAULT nextval('public."User_tasks_id_seq"'::regclass);


--
-- Data for Name: Acceptance_criteria; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public."Acceptance_criteria" (id, name, type, user_story_id, "createdAt", "updatedAt") FROM stdin;
1	Criterion 1	Ac type 1	1	2018-05-07 18:19:22.161797-05	2018-05-07 18:19:22.161797-05
2	Criterion 2	Ac type 2	2	2018-05-07 18:19:22.161797-05	2018-05-07 18:19:22.161797-05
3	Completion	Delivery	3	2018-05-07 18:19:22.161797-05	2018-05-07 18:19:22.161797-05
4	Easy to read	Aesthetics	4	2018-05-07 18:19:22.161797-05	2018-05-07 18:19:22.161797-05
5	Original	Legal	5	2018-05-07 18:19:22.161797-05	2018-05-07 18:19:22.161797-05
\.


--
-- Data for Name: Logs; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public."Logs" (id, query, "createdAt", "updatedAt", user_id) FROM stdin;
1	CREATE project	2018-05-07 18:19:22.125855-05	2018-05-07 18:19:22.125855-05	a00000000
2	CREATE acceptance_criteria	2018-05-07 18:19:22.125855-05	2018-05-07 18:19:22.125855-05	a11111111
3	DELETE project	2018-05-07 18:19:22.125855-05	2018-05-07 18:19:22.125855-05	a00000000
4	UPDATE project	2018-05-07 18:19:22.125855-05	2018-05-07 18:19:22.125855-05	a22222222
5	CREATE sprint	2018-05-07 18:19:22.125855-05	2018-05-07 18:19:22.125855-05	a33333333
\.


--
-- Data for Name: Project_technologies; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public."Project_technologies" (id, project_id, technology_id, version, "createdAt", "updatedAt") FROM stdin;
1	1	1	1.0	2018-05-07 18:19:22.143154-05	2018-05-07 18:19:22.143154-05
2	2	2	1.0	2018-05-07 18:19:22.143154-05	2018-05-07 18:19:22.143154-05
3	3	3	1.0	2018-05-07 18:19:22.143154-05	2018-05-07 18:19:22.143154-05
4	4	3	1.0	2018-05-07 18:19:22.143154-05	2018-05-07 18:19:22.143154-05
5	5	2	1.0	2018-05-07 18:19:22.143154-05	2018-05-07 18:19:22.143154-05
\.


--
-- Data for Name: Projects; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public."Projects" (id, vision, name, begin_date, end_date, background, risks, reach, "createdAt", "updatedAt", scrum_master_id) FROM stdin;
1	Test vision	Test name	2017-12-31 19:01:01-06	2018-12-31 19:01:01-06	Test background	Test risks	Test reach	2018-05-07 18:19:22.131467-05	2018-05-07 18:19:22.131467-05	a00000000
2	Test vision 2	Test name 2	2017-12-31 19:01:01-06	2018-12-31 19:01:01-06	Test background 2	Test risks 2	Test reach 2	2018-05-07 18:19:22.131467-05	2018-05-07 18:19:22.131467-05	a00000000
3	Test vision 3	Test name 3	2017-12-31 19:01:01-06	2018-12-31 19:01:01-06	Test background 3	Test risks 3	Test reach 3	2018-05-07 18:19:22.131467-05	2018-05-07 18:19:22.131467-05	a00000000
4	Test vision 4	Test name 4	2017-12-31 19:01:01-06	2018-12-31 19:01:01-06	Test background 4	Test risks 4	Test reach 4	2018-05-07 18:19:22.131467-05	2018-05-07 18:19:22.131467-05	a00000000
5	Test vision 5	Test name 5	2017-12-31 19:01:01-06	2018-12-31 19:01:01-06	Test background 5	Test risks 5	Test reach 5	2018-05-07 18:19:22.131467-05	2018-05-07 18:19:22.131467-05	a00000000
\.


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public."SequelizeMeta" (name) FROM stdin;
0001-create-user.js
0002-create-log.js
0003-create-project.js
0004-create-user-project.js
0005-create-technology.js
0006-create-project-technology.js
0007-create-sprints.js
0008-create-user-story.js
0009-create-tasks.js
0010-create-acceptance-criteria.js
0011-create-user-task.js
\.


--
-- Data for Name: Sprints; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public."Sprints" (id, days, comment, project_id, "createdAt", "updatedAt") FROM stdin;
1	1	Test comment	1	2018-05-07 18:19:22.148574-05	2018-05-07 18:19:22.148574-05
2	2	Test comment	2	2018-05-07 18:19:22.148574-05	2018-05-07 18:19:22.148574-05
3	3	Test comment	3	2018-05-07 18:19:22.148574-05	2018-05-07 18:19:22.148574-05
4	4	Test comment	4	2018-05-07 18:19:22.148574-05	2018-05-07 18:19:22.148574-05
5	5	Test comment	5	2018-05-07 18:19:22.148574-05	2018-05-07 18:19:22.148574-05
\.


--
-- Data for Name: Tasks; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public."Tasks" (id, duration, name, completed, user_story_id, "createdAt", "updatedAt") FROM stdin;
1	10	Discutir proyecto :v	f	1	2018-05-07 18:19:22.156458-05	2018-05-07 18:19:22.156458-05
2	5	Crear mockups	f	2	2018-05-07 18:19:22.156458-05	2018-05-07 18:19:22.156458-05
3	7	Repartir responsabilidades	t	4	2018-05-07 18:19:22.156458-05	2018-05-07 18:19:22.156458-05
4	1	Ir por cafe	f	4	2018-05-07 18:19:22.156458-05	2018-05-07 18:19:22.156458-05
5	5	Dar retro	f	5	2018-05-07 18:19:22.156458-05	2018-05-07 18:19:22.156458-05
\.


--
-- Data for Name: Technologies; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public."Technologies" (id, name, "createdAt", "updatedAt") FROM stdin;
1	JAVA	2018-05-07 18:19:22.139445-05	2018-05-07 18:19:22.139445-05
2	JAVASCRIPT	2018-05-07 18:19:22.139445-05	2018-05-07 18:19:22.139445-05
3	HTML	2018-05-07 18:19:22.139445-05	2018-05-07 18:19:22.139445-05
\.


--
-- Data for Name: User_projects; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public."User_projects" (id, project_id, user_id, project_role, "createdAt", "updatedAt") FROM stdin;
1	1	a00000000	scrum_master	2018-05-07 18:19:22.135233-05	2018-05-07 18:19:22.135233-05
2	2	a00000000	scrum_master	2018-05-07 18:19:22.135233-05	2018-05-07 18:19:22.135233-05
3	3	a00000000	scrum_master	2018-05-07 18:19:22.135233-05	2018-05-07 18:19:22.135233-05
4	4	a00000000	scrum_master	2018-05-07 18:19:22.135233-05	2018-05-07 18:19:22.135233-05
5	5	a00000000	scrum_master	2018-05-07 18:19:22.135233-05	2018-05-07 18:19:22.135233-05
6	2	a11111111	product_owner	2018-05-07 18:19:22.135233-05	2018-05-07 18:19:22.135233-05
7	3	a22222222	developer	2018-05-07 18:19:22.135233-05	2018-05-07 18:19:22.135233-05
\.


--
-- Data for Name: User_stories; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public."User_stories" (id, weight, scrum_board_status, description, priority, sprint_id, "createdAt", "updatedAt") FROM stdin;
1	10	1	Description of the story...	5	1	2018-05-07 18:19:22.151811-05	2018-05-07 18:19:22.151811-05
2	7	0	Description of the story...	4	2	2018-05-07 18:19:22.151811-05	2018-05-07 18:19:22.151811-05
3	3	1	Description of the story...	2	3	2018-05-07 18:19:22.151811-05	2018-05-07 18:19:22.151811-05
4	7	1	Description of the story...	9	4	2018-05-07 18:19:22.151811-05	2018-05-07 18:19:22.151811-05
5	10	0	Description of the story...	9	5	2018-05-07 18:19:22.151811-05	2018-05-07 18:19:22.151811-05
\.


--
-- Data for Name: User_tasks; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public."User_tasks" (id, task_id, user_id, "createdAt", "updatedAt") FROM stdin;
1	1	a00000000	2018-05-07 18:19:22.165096-05	2018-05-07 18:19:22.165096-05
2	2	a00000000	2018-05-07 18:19:22.165096-05	2018-05-07 18:19:22.165096-05
3	3	a11111111	2018-05-07 18:19:22.165096-05	2018-05-07 18:19:22.165096-05
4	4	a00000000	2018-05-07 18:19:22.165096-05	2018-05-07 18:19:22.165096-05
5	5	a33333333	2018-05-07 18:19:22.165096-05	2018-05-07 18:19:22.165096-05
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public."Users" (id, department_major, name, "photo_URL", password, "createdAt", "updatedAt", system_role, uuid, confirmed) FROM stdin;
l00000000	ITC	Dan Perez	test_url	$2a$10$Ke6Aa11a.k2fu3UZ1zEL9.UqM63U720h/EwJ.DZMoXIA8ZRMNPY6y	2018-05-07 18:19:22.121645-05	2018-05-07 18:19:22.121645-05	root	cf8e17a0-518b-11e8-a3d8-3be89ca651f0	t
a00000000	ITC	John Doe	test_url	$2a$10$Ke6Aa11a.k2fu3UZ1zEL9.UqM63U720h/EwJ.DZMoXIA8ZRMNPY6y	2018-05-07 18:19:22.121645-05	2018-05-07 18:19:22.121645-05	user	cf8e17a0-518b-11e8-a3d8-3be89ca651f1	t
a11111111	INT	Billy Joel	test_url	$2a$10$Ke6Aa11a.k2fu3UZ1zEL9.UqM63U720h/EwJ.DZMoXIA8ZRMNPY6y	2018-05-07 18:19:22.121645-05	2018-05-07 18:19:22.121645-05	user	cf8e17a0-518b-11e8-a3d8-3be89ca651f2	t
a22222222	ITC	Billy Joel	test_url	$2a$10$Ke6Aa11a.k2fu3UZ1zEL9.UqM63U720h/EwJ.DZMoXIA8ZRMNPY6y	2018-05-07 18:19:22.121645-05	2018-05-07 18:19:22.121645-05	user	cf8e17a0-518b-11e8-a3d8-3be89ca651f3	t
a33333333	ISD	Juanito Banana	test_url	$2a$10$Ke6Aa11a.k2fu3UZ1zEL9.UqM63U720h/EwJ.DZMoXIA8ZRMNPY6y	2018-05-07 18:19:22.121645-05	2018-05-07 18:19:22.121645-05	user	cf8e17a0-518b-11e8-a3d8-3be89ca651f4	t
a44444444	INT	Mary Vargas	test_url	$2a$10$Ke6Aa11a.k2fu3UZ1zEL9.UqM63U720h/EwJ.DZMoXIA8ZRMNPY6y	2018-05-07 18:19:22.121645-05	2018-05-07 18:19:22.121645-05	user	cf8e17a0-518b-11e8-a3d8-3be89ca651f5	t
a07104218	ITC	Salvador Orozco Villalever		$2a$10$jYmyjh2YC6C3lda.Ur3rKu6Zn91t9phzV7RLOJqG0mvWVItaLS9Su	2018-05-07 18:20:32.374-05	2018-05-07 18:20:51.768-05	user	3cf94a50-524d-11e8-9007-5546c03ef951	t
\.


--
-- Name: Acceptance_criteria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public."Acceptance_criteria_id_seq"', 5, true);


--
-- Name: Logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public."Logs_id_seq"', 5, true);


--
-- Name: Project_technologies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public."Project_technologies_id_seq"', 5, true);


--
-- Name: Projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public."Projects_id_seq"', 5, true);


--
-- Name: Sprints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public."Sprints_id_seq"', 5, true);


--
-- Name: Tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public."Tasks_id_seq"', 5, true);


--
-- Name: Technologies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public."Technologies_id_seq"', 3, true);


--
-- Name: User_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public."User_projects_id_seq"', 7, true);


--
-- Name: User_stories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public."User_stories_id_seq"', 5, true);


--
-- Name: User_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public."User_tasks_id_seq"', 5, true);


--
-- Name: Acceptance_criteria Acceptance_criteria_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Acceptance_criteria"
    ADD CONSTRAINT "Acceptance_criteria_pkey" PRIMARY KEY (id);


--
-- Name: Logs Logs_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Logs"
    ADD CONSTRAINT "Logs_pkey" PRIMARY KEY (id);


--
-- Name: Project_technologies Project_technologies_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Project_technologies"
    ADD CONSTRAINT "Project_technologies_pkey" PRIMARY KEY (id);


--
-- Name: Projects Projects_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Projects"
    ADD CONSTRAINT "Projects_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Sprints Sprints_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Sprints"
    ADD CONSTRAINT "Sprints_pkey" PRIMARY KEY (id);


--
-- Name: Tasks Tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Tasks"
    ADD CONSTRAINT "Tasks_pkey" PRIMARY KEY (id);


--
-- Name: Technologies Technologies_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Technologies"
    ADD CONSTRAINT "Technologies_pkey" PRIMARY KEY (id);


--
-- Name: User_projects User_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."User_projects"
    ADD CONSTRAINT "User_projects_pkey" PRIMARY KEY (id);


--
-- Name: User_stories User_stories_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."User_stories"
    ADD CONSTRAINT "User_stories_pkey" PRIMARY KEY (id);


--
-- Name: User_tasks User_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."User_tasks"
    ADD CONSTRAINT "User_tasks_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Acceptance_criteria Acceptance_criteria_user_story_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Acceptance_criteria"
    ADD CONSTRAINT "Acceptance_criteria_user_story_id_fkey" FOREIGN KEY (user_story_id) REFERENCES public."User_stories"(id) ON DELETE CASCADE;


--
-- Name: Logs Logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Logs"
    ADD CONSTRAINT "Logs_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id) ON DELETE CASCADE;


--
-- Name: Project_technologies Project_technologies_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Project_technologies"
    ADD CONSTRAINT "Project_technologies_project_id_fkey" FOREIGN KEY (project_id) REFERENCES public."Projects"(id) ON DELETE CASCADE;


--
-- Name: Project_technologies Project_technologies_technology_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Project_technologies"
    ADD CONSTRAINT "Project_technologies_technology_id_fkey" FOREIGN KEY (technology_id) REFERENCES public."Technologies"(id) ON DELETE CASCADE;


--
-- Name: Projects Projects_scrum_master_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Projects"
    ADD CONSTRAINT "Projects_scrum_master_id_fkey" FOREIGN KEY (scrum_master_id) REFERENCES public."Users"(id) ON DELETE CASCADE;


--
-- Name: Sprints Sprints_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Sprints"
    ADD CONSTRAINT "Sprints_project_id_fkey" FOREIGN KEY (project_id) REFERENCES public."Projects"(id) ON DELETE CASCADE;


--
-- Name: Tasks Tasks_user_story_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."Tasks"
    ADD CONSTRAINT "Tasks_user_story_id_fkey" FOREIGN KEY (user_story_id) REFERENCES public."User_stories"(id) ON DELETE CASCADE;


--
-- Name: User_projects User_projects_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."User_projects"
    ADD CONSTRAINT "User_projects_project_id_fkey" FOREIGN KEY (project_id) REFERENCES public."Projects"(id) ON DELETE CASCADE;


--
-- Name: User_projects User_projects_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."User_projects"
    ADD CONSTRAINT "User_projects_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id) ON DELETE CASCADE;


--
-- Name: User_stories User_stories_sprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."User_stories"
    ADD CONSTRAINT "User_stories_sprint_id_fkey" FOREIGN KEY (sprint_id) REFERENCES public."Sprints"(id) ON DELETE CASCADE;


--
-- Name: User_tasks User_tasks_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."User_tasks"
    ADD CONSTRAINT "User_tasks_task_id_fkey" FOREIGN KEY (task_id) REFERENCES public."Tasks"(id) ON DELETE CASCADE;


--
-- Name: User_tasks User_tasks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public."User_tasks"
    ADD CONSTRAINT "User_tasks_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

