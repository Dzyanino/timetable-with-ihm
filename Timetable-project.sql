--
-- PostgreSQL database dump
--

-- Dumped from database version 13.13 (Debian 13.13-0+deb11u1)
-- Dumped by pg_dump version 13.13 (Debian 13.13-0+deb11u1)

-- Started on 2024-04-21 11:39:55 EAT

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
-- TOC entry 209 (class 1259 OID 41008)
-- Name: ElementConst; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ElementConst" (
    "codeElement" integer NOT NULL,
    designation character varying(100) NOT NULL,
    appelation character varying(25) NOT NULL,
    "codeUnite" smallint NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 41006)
-- Name: Cours_codeCours_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Cours_codeCours_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 208
-- Name: Cours_codeCours_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Cours_codeCours_seq" OWNED BY public."ElementConst"."codeElement";


--
-- TOC entry 212 (class 1259 OID 41021)
-- Name: EDT; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."EDT" (
    "numeroEdt" integer NOT NULL,
    "codeElement" smallint NOT NULL,
    "idEnseignant" smallint NOT NULL,
    "numeroSalle" character(3) NOT NULL,
    niveau character(2) NOT NULL,
    "codeParcours" smallint,
    groupe character(8),
    date date NOT NULL,
    horaire smallint NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 41019)
-- Name: EDT_numeroEdt_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."EDT_numeroEdt_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 211
-- Name: EDT_numeroEdt_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."EDT_numeroEdt_seq" OWNED BY public."EDT"."numeroEdt";


--
-- TOC entry 207 (class 1259 OID 40995)
-- Name: Enseignant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Enseignant" (
    "idEnseignant" integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(150),
    appelation character varying(25) NOT NULL,
    "codeGrade" smallint NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 40993)
-- Name: Enseignant_idEnseignant_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Enseignant_idEnseignant_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 206
-- Name: Enseignant_idEnseignant_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Enseignant_idEnseignant_seq" OWNED BY public."Enseignant"."idEnseignant";


--
-- TOC entry 205 (class 1259 OID 40987)
-- Name: Grade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Grade" (
    "codeGrade" integer NOT NULL,
    titre character varying(100) NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 40985)
-- Name: Grade_codeGrade_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Grade_codeGrade_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 204
-- Name: Grade_codeGrade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Grade_codeGrade_seq" OWNED BY public."Grade"."codeGrade";


--
-- TOC entry 201 (class 1259 OID 40966)
-- Name: Mention; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Mention" (
    "codeMention" integer NOT NULL,
    designation character varying(100) NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 40964)
-- Name: Mention_codeMention_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Mention_codeMention_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 200
-- Name: Mention_codeMention_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Mention_codeMention_seq" OWNED BY public."Mention"."codeMention";


--
-- TOC entry 203 (class 1259 OID 40974)
-- Name: Parcours; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Parcours" (
    "codeParcours" integer NOT NULL,
    designation character varying(100) NOT NULL,
    abbreviation character varying(6) NOT NULL,
    "codeMention" smallint NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 40972)
-- Name: Parcours_codeParcours_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Parcours_codeParcours_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 202
-- Name: Parcours_codeParcours_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Parcours_codeParcours_seq" OWNED BY public."Parcours"."codeParcours";


--
-- TOC entry 210 (class 1259 OID 41014)
-- Name: Salle; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Salle" (
    "numeroSalle" character(3) NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 41049)
-- Name: UniteEns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."UniteEns" (
    "codeUnite" integer NOT NULL,
    designation character varying(100),
    niveau character varying(2) NOT NULL,
    "codeParcours" smallint
);


--
-- TOC entry 213 (class 1259 OID 41047)
-- Name: UniteEns_codeUnite_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."UniteEns_codeUnite_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 213
-- Name: UniteEns_codeUnite_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."UniteEns_codeUnite_seq" OWNED BY public."UniteEns"."codeUnite";


--
-- TOC entry 2898 (class 2604 OID 41024)
-- Name: EDT numeroEdt; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."EDT" ALTER COLUMN "numeroEdt" SET DEFAULT nextval('public."EDT_numeroEdt_seq"'::regclass);


--
-- TOC entry 2897 (class 2604 OID 41011)
-- Name: ElementConst codeElement; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ElementConst" ALTER COLUMN "codeElement" SET DEFAULT nextval('public."Cours_codeCours_seq"'::regclass);


--
-- TOC entry 2896 (class 2604 OID 40998)
-- Name: Enseignant idEnseignant; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Enseignant" ALTER COLUMN "idEnseignant" SET DEFAULT nextval('public."Enseignant_idEnseignant_seq"'::regclass);


--
-- TOC entry 2895 (class 2604 OID 40990)
-- Name: Grade codeGrade; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grade" ALTER COLUMN "codeGrade" SET DEFAULT nextval('public."Grade_codeGrade_seq"'::regclass);


--
-- TOC entry 2893 (class 2604 OID 40969)
-- Name: Mention codeMention; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Mention" ALTER COLUMN "codeMention" SET DEFAULT nextval('public."Mention_codeMention_seq"'::regclass);


--
-- TOC entry 2894 (class 2604 OID 40977)
-- Name: Parcours codeParcours; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Parcours" ALTER COLUMN "codeParcours" SET DEFAULT nextval('public."Parcours_codeParcours_seq"'::regclass);


--
-- TOC entry 2899 (class 2604 OID 41052)
-- Name: UniteEns codeUnite; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UniteEns" ALTER COLUMN "codeUnite" SET DEFAULT nextval('public."UniteEns_codeUnite_seq"'::regclass);


--
-- TOC entry 3066 (class 0 OID 41021)
-- Dependencies: 212
-- Data for Name: EDT; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."EDT" VALUES (1, 2, 2, '004', 'L1', NULL, NULL, '2024-04-22', 1);


--
-- TOC entry 3063 (class 0 OID 41008)
-- Dependencies: 209
-- Data for Name: ElementConst; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."ElementConst" VALUES (1, 'Base d"algèbre 1', 'Algèbre 1', 1);
INSERT INTO public."ElementConst" VALUES (2, 'Base d"analyse 1', 'Analyse 1', 1);
INSERT INTO public."ElementConst" VALUES (3, 'Probabilité et Statistique', 'ProbaStat', 1);
INSERT INTO public."ElementConst" VALUES (4, 'Mathématiques discrètes', 'Math Disc', 1);
INSERT INTO public."ElementConst" VALUES (5, 'Algorithme et structure de données élémentaires', 'Algo', 2);
INSERT INTO public."ElementConst" VALUES (6, 'Langage C', 'C', 2);
INSERT INTO public."ElementConst" VALUES (7, 'Initiation à la Programmation Orienté Objet', 'POO', 2);
INSERT INTO public."ElementConst" VALUES (8, 'Développement de site web en HTML/CSS', 'HTML', 2);
INSERT INTO public."ElementConst" VALUES (9, 'Technologie XML et DHTML', 'DHTML', 2);
INSERT INTO public."ElementConst" VALUES (10, 'Système d"exploitation Unix', 'UNIX', 3);
INSERT INTO public."ElementConst" VALUES (11, 'Système d"exploitation Windows', 'WIN', 3);
INSERT INTO public."ElementConst" VALUES (12, 'Théorie des réseaux', 'TRES', 3);
INSERT INTO public."ElementConst" VALUES (13, 'Architecture des ordinateurs', 'ARCHI', 3);
INSERT INTO public."ElementConst" VALUES (14, 'Technologies des réseaux', 'Tech Res', 3);
INSERT INTO public."ElementConst" VALUES (15, 'Electronique analogique', 'EA', 4);
INSERT INTO public."ElementConst" VALUES (16, 'Electronique numérique', 'EN', 4);
INSERT INTO public."ElementConst" VALUES (17, 'Introduction aux systèmes embarqués', 'Sys Emb', 4);
INSERT INTO public."ElementConst" VALUES (18, 'Base de l"Informatique', 'Base Info', 5);
INSERT INTO public."ElementConst" VALUES (19, 'Introduction aux méthodes', 'Intro Meth', 5);
INSERT INTO public."ElementConst" VALUES (20, 'Comptabilité générale', 'Compta', 5);
INSERT INTO public."ElementConst" VALUES (21, 'Anglais 1', 'Anglais', 5);
INSERT INTO public."ElementConst" VALUES (22, 'Français 1', 'Français', 5);
INSERT INTO public."ElementConst" VALUES (23, 'Analyse 2', 'Analyse 2', 6);
INSERT INTO public."ElementConst" VALUES (24, 'Algèbre 2', 'Algèbre 2', 6);
INSERT INTO public."ElementConst" VALUES (25, 'Probabilité et Statistique 2', 'ProbaStat 2', 6);
INSERT INTO public."ElementConst" VALUES (26, 'Langage Python', 'Python', 7);
INSERT INTO public."ElementConst" VALUES (27, 'Programmation objet en C++', 'C++', 7);
INSERT INTO public."ElementConst" VALUES (28, 'Services réseaux', 'ServicesRes', 8);
INSERT INTO public."ElementConst" VALUES (29, 'Base de l"administration des réseaux', 'BAR', 8);
INSERT INTO public."ElementConst" VALUES (30, 'Langage JAVA 1', 'Java', 11);
INSERT INTO public."ElementConst" VALUES (31, 'Langage Python', 'Python 2', 11);
INSERT INTO public."ElementConst" VALUES (32, 'Génie Logiciel', 'GLOG', 12);
INSERT INTO public."ElementConst" VALUES (33, 'Administration de Base de données', 'Admin BD', 12);
INSERT INTO public."ElementConst" VALUES (34, 'Administration réseaux Unix 1', 'Admin Unix', 13);
INSERT INTO public."ElementConst" VALUES (35, 'Assembleur appliqué', 'Ass App', 13);
INSERT INTO public."ElementConst" VALUES (36, 'Recherche opérationnelle', 'RO', 15);
INSERT INTO public."ElementConst" VALUES (37, 'Analyse des données', 'Anal D', 15);
INSERT INTO public."ElementConst" VALUES (38, 'Technologie avancée en Java', 'Java Av', 16);
INSERT INTO public."ElementConst" VALUES (39, 'Intégration Web-SIG', 'SIG', 16);
INSERT INTO public."ElementConst" VALUES (40, 'Intelligence artificielle', 'IA', 17);
INSERT INTO public."ElementConst" VALUES (41, 'Machine Learning et Deep Learning', 'ML-DL', 17);
INSERT INTO public."ElementConst" VALUES (42, 'Réutilisation logiciel &frameworks', 'Frameworks', 20);
INSERT INTO public."ElementConst" VALUES (43, 'Architecture Orienté Service', 'AOS', 20);
INSERT INTO public."ElementConst" VALUES (44, 'Système d’Information décisionnelle', 'SID', 21);
INSERT INTO public."ElementConst" VALUES (45, 'Interaction Homme-Machine 2', 'IHM 2', 21);
INSERT INTO public."ElementConst" VALUES (46, 'Technologie de virtualisation et SDN', 'SDN', 22);
INSERT INTO public."ElementConst" VALUES (47, 'GRID et CLUSTER', 'G-C', 22);
INSERT INTO public."ElementConst" VALUES (48, 'Python pour Machine Learning', 'Python ML', 23);
INSERT INTO public."ElementConst" VALUES (49, 'Système expert', 'Sys Exp', 23);
INSERT INTO public."ElementConst" VALUES (50, 'Base d"algebre 2', 'Algèbre 2', 25);
INSERT INTO public."ElementConst" VALUES (51, 'Programmation linéaire', 'Prog Lin', 25);
INSERT INTO public."ElementConst" VALUES (52, 'Technologie PHP', 'PHP', 26);
INSERT INTO public."ElementConst" VALUES (53, 'Algorithmique et structure de données avancés', 'Algo Av', 26);
INSERT INTO public."ElementConst" VALUES (54, 'Base de données avancées', 'BDA', 27);
INSERT INTO public."ElementConst" VALUES (55, 'SGBD MySQL et PostGreSQL', 'SGBD', 27);
INSERT INTO public."ElementConst" VALUES (56, 'Technologie Python', 'Python 2', 28);
INSERT INTO public."ElementConst" VALUES (57, 'Technologies JSP et Servlet 1', 'JSP', 28);
INSERT INTO public."ElementConst" VALUES (58, 'UML', 'UML', 29);
INSERT INTO public."ElementConst" VALUES (59, 'Patrons GRASP et GoF', 'Patrons', 29);
INSERT INTO public."ElementConst" VALUES (60, 'Développement Web API', 'Web API', 30);
INSERT INTO public."ElementConst" VALUES (61, 'Développement mobile', 'Dev Mob', 30);
INSERT INTO public."ElementConst" VALUES (62, 'Analyse numérique', 'Anal N', 31);
INSERT INTO public."ElementConst" VALUES (63, 'Réseau de Pétri et programmation multi-tâche', 'Pétri', 31);
INSERT INTO public."ElementConst" VALUES (64, 'Technologie web avancée', 'Web Av', 32);
INSERT INTO public."ElementConst" VALUES (65, 'Développement d"application Mobile 2', 'Dev Mob 2', 32);
INSERT INTO public."ElementConst" VALUES (66, 'Ingénièrie des besoins', 'Ing Bes', 33);
INSERT INTO public."ElementConst" VALUES (67, 'Génie logiciel avancé', 'GLOG Av', 33);
INSERT INTO public."ElementConst" VALUES (68, 'Architecture Orienté Service', 'AOS', 34);
INSERT INTO public."ElementConst" VALUES (69, 'BPM & Workflow', 'Workflow', 34);
INSERT INTO public."ElementConst" VALUES (70, 'DevOps', 'DevOps', 35);
INSERT INTO public."ElementConst" VALUES (71, 'Ingéniérie Dirigée par le Modèle', 'IDM', 35);
INSERT INTO public."ElementConst" VALUES (72, 'Système d’Information décisionnelle', 'SID', 36);
INSERT INTO public."ElementConst" VALUES (73, 'Système Multi-Agents', 'SMA', 36);
INSERT INTO public."ElementConst" VALUES (74, 'Probabilité et Statistique 2', 'ProbaStat 2', 37);
INSERT INTO public."ElementConst" VALUES (75, 'Programmation linéaire', 'Prog Lin', 37);
INSERT INTO public."ElementConst" VALUES (76, 'Langage Assembleur', 'Assembleur', 38);
INSERT INTO public."ElementConst" VALUES (77, 'Langage JAVA', 'Java', 38);
INSERT INTO public."ElementConst" VALUES (78, 'Technologie javascript', 'Javascript', 39);
INSERT INTO public."ElementConst" VALUES (79, 'Conception des logiciels', 'Concep Log', 39);
INSERT INTO public."ElementConst" VALUES (80, 'Technologie Python avancé', 'Python Av', 40);
INSERT INTO public."ElementConst" VALUES (81, 'Technologie NodeJs', 'NodeJS', 40);
INSERT INTO public."ElementConst" VALUES (82, 'Ingeniérie des bases de données', 'IBD', 41);
INSERT INTO public."ElementConst" VALUES (83, 'Introduction au Machine Learning', 'Intro ML', 41);
INSERT INTO public."ElementConst" VALUES (84, 'Cybersécurité', 'CyberSec', 42);
INSERT INTO public."ElementConst" VALUES (85, 'Sécurité web, Mail et réseaux sociaux', 'SWM', 42);
INSERT INTO public."ElementConst" VALUES (86, 'Recherche opérationnelle', 'RO', 43);
INSERT INTO public."ElementConst" VALUES (87, 'Analyse numérique', 'Anal N', 43);
INSERT INTO public."ElementConst" VALUES (88, 'Technologie de virtualisation et conteneurisation', 'Virt Cont', 44);
INSERT INTO public."ElementConst" VALUES (89, 'Linux pour le DevOps', 'Linux DevOps', 44);
INSERT INTO public."ElementConst" VALUES (90, 'Programmation des réseaux', 'Prog Res', 45);
INSERT INTO public."ElementConst" VALUES (91, 'Administration réseau en python', 'Res Python', 45);
INSERT INTO public."ElementConst" VALUES (92, 'nternet des Objets', 'Int Ob', 46);
INSERT INTO public."ElementConst" VALUES (93, 'Réseau mobile avancé', 'Res Mob Av', 46);
INSERT INTO public."ElementConst" VALUES (94, 'Conception des logiciels', 'Con Log', 47);
INSERT INTO public."ElementConst" VALUES (95, 'Système d’Information Décisionnelle', 'SID', 47);
INSERT INTO public."ElementConst" VALUES (96, 'Modélisation mathématique', 'Mod Math', 48);
INSERT INTO public."ElementConst" VALUES (97, 'Système multi-agents', 'SMA', 48);
INSERT INTO public."ElementConst" VALUES (98, 'Algèbre linéaire', 'Algè Lin', 49);
INSERT INTO public."ElementConst" VALUES (99, 'Initiation à l’IA', 'Init IA', 49);
INSERT INTO public."ElementConst" VALUES (100, 'Base de données SQL et NoSQL', 'SQL noSQL', 50);
INSERT INTO public."ElementConst" VALUES (101, 'Développement backend', 'Backend', 50);
INSERT INTO public."ElementConst" VALUES (102, 'Stratégie et marketing digital', 'Mark Dig', 51);
INSERT INTO public."ElementConst" VALUES (103, 'Méthodologie de recherche', 'Meth Rec', 51);
INSERT INTO public."ElementConst" VALUES (104, 'Machine Learning et Deep Learning', 'ML-DL', 52);
INSERT INTO public."ElementConst" VALUES (105, 'Modélisation de connaissance', 'Mod Conn', 52);
INSERT INTO public."ElementConst" VALUES (106, 'Big data', 'Big Data', 53);
INSERT INTO public."ElementConst" VALUES (107, 'Structure de gouvernance de données', 'Gouv Donn', 53);
INSERT INTO public."ElementConst" VALUES (108, 'Elaboraion de dossier d’architecture technique', 'DAT', 54);
INSERT INTO public."ElementConst" VALUES (109, 'Interopérabilité de modèle', 'Int Mod', 54);
INSERT INTO public."ElementConst" VALUES (110, 'Modèles et architecture IoT', 'Mod IoT', 55);
INSERT INTO public."ElementConst" VALUES (111, 'Principes de base de la cryptographie', 'Crypto', 55);
INSERT INTO public."ElementConst" VALUES (112, 'Protocoles et sécurité pour l"IoT', 'Pro IoT', 56);
INSERT INTO public."ElementConst" VALUES (113, 'Protocole de communication sécurisée pour les systèmes embarqués', 'Prot Emb', 56);
INSERT INTO public."ElementConst" VALUES (114, 'Circuits et matériels électroniques', 'Mat Elec', 57);
INSERT INTO public."ElementConst" VALUES (115, 'IoT sur microcontrôleur', 'IoT Mic', 57);
INSERT INTO public."ElementConst" VALUES (116, 'Jumeaux numériques', 'Jum Num', 58);
INSERT INTO public."ElementConst" VALUES (117, 'Virtualisation et sécurité', 'Virt Sec', 58);
INSERT INTO public."ElementConst" VALUES (118, 'Tests d’intrusion et évaluation de la sécurité', 'Pentest', 59);
INSERT INTO public."ElementConst" VALUES (119, 'Gestion de vulnérabilité, d’intrusion et correctif', 'Gest Vul', 59);
INSERT INTO public."ElementConst" VALUES (120, 'Cloud computing', 'Cloud Comp', 60);
INSERT INTO public."ElementConst" VALUES (121, 'Smart Data', 'Smart Data', 60);


--
-- TOC entry 3061 (class 0 OID 40995)
-- Dependencies: 207
-- Data for Name: Enseignant; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Enseignant" VALUES (1, 'RASOLOARIJAONA', 'Madison', 'Madison', 1);
INSERT INTO public."Enseignant" VALUES (2, 'RALAMBOARISOA', 'Bénédicte', 'Bénédicte', 1);
INSERT INTO public."Enseignant" VALUES (3, 'RALAIVAO', 'Jean Christian', 'Ralaivao', 2);
INSERT INTO public."Enseignant" VALUES (4, 'RABETAFIKA', 'Louis Haja', 'Haja', 2);
INSERT INTO public."Enseignant" VALUES (5, 'RAKOTASIMBAHOAKA', 'Cyprien Robert', 'Cyprien', 2);
INSERT INTO public."Enseignant" VALUES (6, 'GILANTE', 'Gesazafy', 'Gilante', 2);
INSERT INTO public."Enseignant" VALUES (7, 'RATIARISON', 'Venot', 'Venot', 3);
INSERT INTO public."Enseignant" VALUES (8, 'RAKOTASIMBAHOAKA', 'Antsa Cypriena', 'Antsa', 1);
INSERT INTO public."Enseignant" VALUES (9, 'RAFAMANTANANTSOA', 'Fontaine', 'Fontaine', 2);
INSERT INTO public."Enseignant" VALUES (10, 'SIAKA', '', 'Siaka', 2);
INSERT INTO public."Enseignant" VALUES (11, 'RANDRIANOMENJANAHARY', 'Lala Ferdinand', 'Ferdinand', 2);
INSERT INTO public."Enseignant" VALUES (12, 'RAZAFINDRANDRITSIMANIRY', 'Dieudonné Michel', 'Michel', 2);
INSERT INTO public."Enseignant" VALUES (13, 'RAFANOMEZANTSOA', 'Jean Roger', 'Roger', 3);
INSERT INTO public."Enseignant" VALUES (14, 'ANDRY', 'Bertin', 'Bertin', 3);
INSERT INTO public."Enseignant" VALUES (15, 'LIRA', '', 'Lira', 1);
INSERT INTO public."Enseignant" VALUES (16, 'RAHERINIRINA', 'Angelo', 'Angelo', 2);
INSERT INTO public."Enseignant" VALUES (17, 'RATIANANTITRA', 'Volatiana Marielle', 'Volatiana', 2);
INSERT INTO public."Enseignant" VALUES (18, 'RAZAFINDRAMONJA', 'Clément Aubert', 'Clément', 2);
INSERT INTO public."Enseignant" VALUES (19, 'RABEMANANTSOA', 'Auguste Patrice', 'Patrice', 2);
INSERT INTO public."Enseignant" VALUES (20, 'RANDRIANOMENJANAHARY', 'Lala', 'Lala', 3);
INSERT INTO public."Enseignant" VALUES (21, 'RAZAFIMAHATRATRA', 'Hajarisena', 'Hajarisena', 2);
INSERT INTO public."Enseignant" VALUES (22, 'MAHATODY', 'Thomas', 'Thomas', 3);
INSERT INTO public."Enseignant" VALUES (23, 'RAMAMONJISOA', 'Andriantiana Bertin Olivier', 'Olivier', 2);
INSERT INTO public."Enseignant" VALUES (24, 'RAZANAMAHEFA', 'Hantarisoa Solondraibe', 'Hanta', 1);


--
-- TOC entry 3059 (class 0 OID 40987)
-- Dependencies: 205
-- Data for Name: Grade; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Grade" VALUES (1, 'Premier titre');
INSERT INTO public."Grade" VALUES (2, 'Deuxième Titre');
INSERT INTO public."Grade" VALUES (3, 'Troisième titre');
INSERT INTO public."Grade" VALUES (4, 'Quatrième titre');


--
-- TOC entry 3055 (class 0 OID 40966)
-- Dependencies: 201
-- Data for Name: Mention; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Mention" VALUES (1, 'Informatique');
INSERT INTO public."Mention" VALUES (2, 'Intelligence Artificielle');


--
-- TOC entry 3057 (class 0 OID 40974)
-- Dependencies: 203
-- Data for Name: Parcours; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Parcours" VALUES (3, 'Informatique Générale', 'IG', 1);
INSERT INTO public."Parcours" VALUES (1, 'Administration des Systèmes et Réseaux', 'ASR', 1);
INSERT INTO public."Parcours" VALUES (2, 'Génie logiciel et Base de données', 'GB', 1);
INSERT INTO public."Parcours" VALUES (4, 'Gouvernance et Ingénieurie de Données', 'GID', 2);
INSERT INTO public."Parcours" VALUES (5, 'Objets Connectés et Cybersécurités', 'OCC', 2);


--
-- TOC entry 3064 (class 0 OID 41014)
-- Dependencies: 210
-- Data for Name: Salle; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Salle" VALUES ('001');
INSERT INTO public."Salle" VALUES ('004');
INSERT INTO public."Salle" VALUES ('007');
INSERT INTO public."Salle" VALUES ('008');
INSERT INTO public."Salle" VALUES ('009');
INSERT INTO public."Salle" VALUES ('012');
INSERT INTO public."Salle" VALUES ('102');
INSERT INTO public."Salle" VALUES ('106');
INSERT INTO public."Salle" VALUES ('112');
INSERT INTO public."Salle" VALUES ('210');


--
-- TOC entry 3068 (class 0 OID 41049)
-- Dependencies: 214
-- Data for Name: UniteEns; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."UniteEns" VALUES (1, 'Mathématiques pour l''informatique', 'L1', NULL);
INSERT INTO public."UniteEns" VALUES (2, 'Langage de programmation et Technologie web', 'L1', NULL);
INSERT INTO public."UniteEns" VALUES (3, 'Systèmes et Réseaux', 'L1', NULL);
INSERT INTO public."UniteEns" VALUES (4, 'Electroniques', 'L1', NULL);
INSERT INTO public."UniteEns" VALUES (5, 'Communication et Transversale', 'L1', NULL);
INSERT INTO public."UniteEns" VALUES (7, 'Conception et Programmation', 'L2', 3);
INSERT INTO public."UniteEns" VALUES (8, 'Systèmes et Réseaux', 'L2', 3);
INSERT INTO public."UniteEns" VALUES (9, 'Electroniques et Systèmes embarqués', 'L2', 3);
INSERT INTO public."UniteEns" VALUES (10, 'Communication 2', 'L2', 3);
INSERT INTO public."UniteEns" VALUES (11, 'Langage de programmation et Technologie web', 'L3', 3);
INSERT INTO public."UniteEns" VALUES (12, 'Génie logiciel et Base de données', 'L3', 3);
INSERT INTO public."UniteEns" VALUES (13, 'Réseaux et Télécommunication', 'L3', 3);
INSERT INTO public."UniteEns" VALUES (14, 'Transversales', 'L3', 3);
INSERT INTO public."UniteEns" VALUES (15, 'Mathématiques pour l"ingénieur', 'M1', 3);
INSERT INTO public."UniteEns" VALUES (16, 'Technologies web avancées', 'M1', 3);
INSERT INTO public."UniteEns" VALUES (17, 'Génie logiciel et Intelligence artificielle', 'M1', 3);
INSERT INTO public."UniteEns" VALUES (18, 'Réseaux avancés et Systèmes embarqués', 'M1', 3);
INSERT INTO public."UniteEns" VALUES (19, 'Transversales', 'M1', 3);
INSERT INTO public."UniteEns" VALUES (20, 'Conception et Développement des systèmes', 'M2', 3);
INSERT INTO public."UniteEns" VALUES (21, 'Aide à la décision', 'M2', 3);
INSERT INTO public."UniteEns" VALUES (22, 'Réseaux et Sécurité', 'M2', 3);
INSERT INTO public."UniteEns" VALUES (23, 'Modélisation', 'M2', 3);
INSERT INTO public."UniteEns" VALUES (24, 'Transversales', 'M2', 3);
INSERT INTO public."UniteEns" VALUES (6, 'Mathématiques pour l''informatique 2', 'L2', 3);
INSERT INTO public."UniteEns" VALUES (25, 'Mathématiques pour l"informatique 2', 'L2', 2);
INSERT INTO public."UniteEns" VALUES (26, 'Algorithmique et langages de programmation', 'L2', 2);
INSERT INTO public."UniteEns" VALUES (27, 'Base de données', 'L2', 2);
INSERT INTO public."UniteEns" VALUES (28, 'Langages de programmation et Technologie web ', 'L3', 2);
INSERT INTO public."UniteEns" VALUES (29, 'Génie Logiciel et base de données', 'L3', 2);
INSERT INTO public."UniteEns" VALUES (30, 'Développement web et mobile', 'L3', 2);
INSERT INTO public."UniteEns" VALUES (31, 'Mathématiques pour l"ingénieur', 'M1', 2);
INSERT INTO public."UniteEns" VALUES (32, 'Technologies web avancées', 'M1', 2);
INSERT INTO public."UniteEns" VALUES (33, 'Génie logiciel et Intelligence artificielle', 'M1', 2);
INSERT INTO public."UniteEns" VALUES (34, 'Développement d"application', 'M2', 2);
INSERT INTO public."UniteEns" VALUES (35, 'Architecture logicielle et Sciences des données', 'M2', 2);
INSERT INTO public."UniteEns" VALUES (36, 'Méthode de gestion de projet et modélisation mathématique', 'M2', 2);
INSERT INTO public."UniteEns" VALUES (37, 'Mathématiques pour l"informatique 2', 'L2', 1);
INSERT INTO public."UniteEns" VALUES (38, 'Algorithmique et Langages de programmation', 'L2', 1);
INSERT INTO public."UniteEns" VALUES (39, 'Développement d"application', 'L2', 1);
INSERT INTO public."UniteEns" VALUES (40, 'Développement d"application web', 'L3', 1);
INSERT INTO public."UniteEns" VALUES (41, 'Développement d"application mobile et Intelligence artificielle', 'L3', 1);
INSERT INTO public."UniteEns" VALUES (42, 'Administration Systèmes et sécurité', 'L3', 1);
INSERT INTO public."UniteEns" VALUES (43, 'Mathématiques pour l"ingénieur', 'M1', 1);
INSERT INTO public."UniteEns" VALUES (44, 'Programmarion et Intelligence artificielle', 'M1', 1);
INSERT INTO public."UniteEns" VALUES (45, 'Réseaux avancés et Systèmes Embarqués', 'M1', 1);
INSERT INTO public."UniteEns" VALUES (46, 'Réseaux et Sécurité avancés', 'M2', 1);
INSERT INTO public."UniteEns" VALUES (47, 'Développement d"application et Intelligence artificielle', 'M2', 1);
INSERT INTO public."UniteEns" VALUES (48, 'Modélisation', 'M2', 1);
INSERT INTO public."UniteEns" VALUES (49, 'Mathématique et Data science', 'M1', 4);
INSERT INTO public."UniteEns" VALUES (50, 'Technologie de l"information et Ingénierie de données', 'M1', 4);
INSERT INTO public."UniteEns" VALUES (51, 'Langues et Communication', 'M1', 4);
INSERT INTO public."UniteEns" VALUES (52, 'Mathématiqueset IA', 'M2', 4);
INSERT INTO public."UniteEns" VALUES (53, 'Gouvernance et Ingénierie de données', 'M2', 4);
INSERT INTO public."UniteEns" VALUES (54, 'Gestion de projet agile', 'M2', 4);
INSERT INTO public."UniteEns" VALUES (55, 'Initiation et Concept IoT', 'M1', 5);
INSERT INTO public."UniteEns" VALUES (56, 'Technologies et Protocoles IoT', 'M1', 5);
INSERT INTO public."UniteEns" VALUES (57, 'Matériels IoT', 'M1', 5);
INSERT INTO public."UniteEns" VALUES (58, 'Connectivité IoT', 'M2', 5);
INSERT INTO public."UniteEns" VALUES (59, 'Risque et Vulnérabilité', 'M2', 5);
INSERT INTO public."UniteEns" VALUES (60, 'Veille cartographique', 'M2', 5);


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 208
-- Name: Cours_codeCours_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Cours_codeCours_seq"', 121, true);


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 211
-- Name: EDT_numeroEdt_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."EDT_numeroEdt_seq"', 1, true);


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 206
-- Name: Enseignant_idEnseignant_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Enseignant_idEnseignant_seq"', 24, true);


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 204
-- Name: Grade_codeGrade_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Grade_codeGrade_seq"', 4, true);


--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 200
-- Name: Mention_codeMention_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Mention_codeMention_seq"', 2, true);


--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 202
-- Name: Parcours_codeParcours_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Parcours_codeParcours_seq"', 5, true);


--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 213
-- Name: UniteEns_codeUnite_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."UniteEns_codeUnite_seq"', 60, true);


--
-- TOC entry 2909 (class 2606 OID 41013)
-- Name: ElementConst Cours_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ElementConst"
    ADD CONSTRAINT "Cours_pkey" PRIMARY KEY ("codeElement");


--
-- TOC entry 2913 (class 2606 OID 41026)
-- Name: EDT EDT_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."EDT"
    ADD CONSTRAINT "EDT_pkey" PRIMARY KEY ("numeroEdt");


--
-- TOC entry 2907 (class 2606 OID 41000)
-- Name: Enseignant Enseignant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Enseignant"
    ADD CONSTRAINT "Enseignant_pkey" PRIMARY KEY ("idEnseignant");


--
-- TOC entry 2905 (class 2606 OID 40992)
-- Name: Grade Grade_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_pkey" PRIMARY KEY ("codeGrade");


--
-- TOC entry 2901 (class 2606 OID 40971)
-- Name: Mention Mention_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Mention"
    ADD CONSTRAINT "Mention_pkey" PRIMARY KEY ("codeMention");


--
-- TOC entry 2903 (class 2606 OID 40979)
-- Name: Parcours Parcours_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Parcours"
    ADD CONSTRAINT "Parcours_pkey" PRIMARY KEY ("codeParcours");


--
-- TOC entry 2911 (class 2606 OID 41018)
-- Name: Salle Salle_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Salle"
    ADD CONSTRAINT "Salle_pkey" PRIMARY KEY ("numeroSalle");


--
-- TOC entry 2915 (class 2606 OID 41054)
-- Name: UniteEns UniteEns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UniteEns"
    ADD CONSTRAINT "UniteEns_pkey" PRIMARY KEY ("codeUnite");


--
-- TOC entry 2921 (class 2606 OID 41060)
-- Name: EDT EDT_to_ElementConst; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."EDT"
    ADD CONSTRAINT "EDT_to_ElementConst" FOREIGN KEY ("codeElement") REFERENCES public."ElementConst"("codeElement") NOT VALID;


--
-- TOC entry 2922 (class 2606 OID 41065)
-- Name: EDT EDT_to_Enseignant; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."EDT"
    ADD CONSTRAINT "EDT_to_Enseignant" FOREIGN KEY ("idEnseignant") REFERENCES public."Enseignant"("idEnseignant") NOT VALID;


--
-- TOC entry 2920 (class 2606 OID 41042)
-- Name: EDT EDT_to_Parcours; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."EDT"
    ADD CONSTRAINT "EDT_to_Parcours" FOREIGN KEY ("codeParcours") REFERENCES public."Parcours"("codeParcours");


--
-- TOC entry 2919 (class 2606 OID 41037)
-- Name: EDT EDT_to_Salle; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."EDT"
    ADD CONSTRAINT "EDT_to_Salle" FOREIGN KEY ("numeroSalle") REFERENCES public."Salle"("numeroSalle");


--
-- TOC entry 2918 (class 2606 OID 41055)
-- Name: ElementConst ElementConst_to_UniteEns; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ElementConst"
    ADD CONSTRAINT "ElementConst_to_UniteEns" FOREIGN KEY ("codeUnite") REFERENCES public."UniteEns"("codeUnite") NOT VALID;


--
-- TOC entry 2917 (class 2606 OID 41001)
-- Name: Enseignant Enseignant_to_codeGrade; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Enseignant"
    ADD CONSTRAINT "Enseignant_to_codeGrade" FOREIGN KEY ("codeGrade") REFERENCES public."Grade"("codeGrade");


--
-- TOC entry 2916 (class 2606 OID 40980)
-- Name: Parcours Parcpurs_to_codeMention; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Parcours"
    ADD CONSTRAINT "Parcpurs_to_codeMention" FOREIGN KEY ("codeMention") REFERENCES public."Mention"("codeMention");


--
-- TOC entry 2923 (class 2606 OID 49239)
-- Name: UniteEns UniteEns_to_Parcours; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UniteEns"
    ADD CONSTRAINT "UniteEns_to_Parcours" FOREIGN KEY ("codeParcours") REFERENCES public."Parcours"("codeParcours") NOT VALID;


-- Completed on 2024-04-21 11:39:59 EAT

--
-- PostgreSQL database dump complete
--

