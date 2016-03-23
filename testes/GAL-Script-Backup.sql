--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acervodocumento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE acervodocumento (
    id_ad integer NOT NULL,
    arquivo bytea,
    extensao character varying(255),
    finalperidodelta date,
    inicioperidodelta date,
    id_usuario integer
);


ALTER TABLE public.acervodocumento OWNER TO postgres;

--
-- Name: acervodocumento_id_ad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE acervodocumento_id_ad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acervodocumento_id_ad_seq OWNER TO postgres;

--
-- Name: acervodocumento_id_ad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE acervodocumento_id_ad_seq OWNED BY acervodocumento.id_ad;


--
-- Name: bibliografias; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bibliografias (
    tipo_bibliografia character varying(255),
    id_titulo integer NOT NULL,
    id_componente integer NOT NULL
);


ALTER TABLE public.bibliografias OWNER TO postgres;

--
-- Name: curriculo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE curriculo (
    id_c integer NOT NULL,
    ch_comp_opt_livres integer NOT NULL,
    ch_opt_minima integer NOT NULL,
    ch_periodo_maxima integer NOT NULL,
    ch_periodo_media integer NOT NULL,
    ch_periodo_minima integer NOT NULL,
    codigo character varying(255) NOT NULL,
    matriz_curricular character varying(255) NOT NULL,
    municipio character varying(255) NOT NULL,
    prazo_conclusao_maximo integer NOT NULL,
    prazo_conclusao_medio integer NOT NULL,
    prazo_conclusao_minimo integer NOT NULL,
    semestre_vigor character varying(255) NOT NULL,
    unidade_vinculacao character varying(255) NOT NULL,
    id_curso integer
);


ALTER TABLE public.curriculo OWNER TO postgres;

--
-- Name: curriculo_id_c_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE curriculo_id_c_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curriculo_id_c_seq OWNER TO postgres;

--
-- Name: curriculo_id_c_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE curriculo_id_c_seq OWNED BY curriculo.id_c;


--
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE curso (
    id_crs integer NOT NULL,
    cod_c integer NOT NULL,
    nome_c character varying(255) NOT NULL,
    sigla character varying(3) NOT NULL
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- Name: curso_id_crs_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE curso_id_crs_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curso_id_crs_seq OWNER TO postgres;

--
-- Name: curso_id_crs_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE curso_id_crs_seq OWNED BY curso.id_crs;


--
-- Name: componentes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE componentes (
    id_c integer NOT NULL,
    ch_pratica integer NOT NULL,
    ch_teorica integer NOT NULL,
    cod_d character varying(12) NOT NULL,
    nome character varying(255) NOT NULL,
    tipo character varying(255)
);


ALTER TABLE public.componentes OWNER TO postgres;

--
-- Name: componentes_id_c_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE componentes_id_c_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.componentes_id_c_seq OWNER TO postgres;

--
-- Name: componentes_id_c_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE componentes_id_c_seq OWNED BY componentes.id_c;


--
-- Name: exemplarconflitante; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE exemplarconflitante (
    id_ef integer NOT NULL,
    autor character varying(255),
    cod_ef character varying(255),
    discricao_erro character varying(255),
    edicao character varying(255),
    isbn character varying(255),
    linhaerro integer,
    pagina character varying(255),
    publicador character varying(255),
    ref_artigo character varying(255),
    sub_titulo character varying(255),
    tipo character varying(255),
    titulo character varying(255),
    titulo_revista character varying(255),
    titulo_n character varying(255)
);


ALTER TABLE public.exemplarconflitante OWNER TO postgres;

--
-- Name: exemplarconflitante_id_ef_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE exemplarconflitante_id_ef_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exemplarconflitante_id_ef_seq OWNER TO postgres;

--
-- Name: exemplarconflitante_id_ef_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE exemplarconflitante_id_ef_seq OWNED BY exemplarconflitante.id_ef;


--
-- Name: exemplares; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE exemplares (
    id_e integer NOT NULL,
    cod_e character varying(255),
    id_titulo integer
);


ALTER TABLE public.exemplares OWNER TO postgres;

--
-- Name: exemplares_id_e_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE exemplares_id_e_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exemplares_id_e_seq OWNER TO postgres;

--
-- Name: exemplares_id_e_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE exemplares_id_e_seq OWNED BY exemplares.id_e;


--
-- Name: integracao_curricular; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE integracao_curricular (
    natureza character varying(255),
    qtd_alunos integer,
    semestre_oferta integer,
    id_curriculo integer NOT NULL,
    id_componente integer NOT NULL
);


ALTER TABLE public.integracao_curricular OWNER TO postgres;

--
-- Name: meta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE meta (
    id_mt integer NOT NULL,
    indicecalculobasica double precision NOT NULL,
    indicecalculocomplementar double precision NOT NULL,
    nome character varying(255)
);


ALTER TABLE public.meta OWNER TO postgres;

--
-- Name: meta_id_mt_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE meta_id_mt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meta_id_mt_seq OWNER TO postgres;

--
-- Name: meta_id_mt_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE meta_id_mt_seq OWNED BY meta.id_mt;


--
-- Name: titulos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE titulos (
    id_t integer NOT NULL,
    isbn character varying(255) NOT NULL,
    nome_titulo character varying(1000) NOT NULL,
    tipo_titulo character varying(255) NOT NULL
);


ALTER TABLE public.titulos OWNER TO postgres;

--
-- Name: titulos_id_t_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE titulos_id_t_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.titulos_id_t_seq OWNER TO postgres;

--
-- Name: titulos_id_t_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE titulos_id_t_seq OWNED BY titulos.id_t;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id integer NOT NULL,
    cpf character varying(255) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- Name: id_ad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acervodocumento ALTER COLUMN id_ad SET DEFAULT nextval('acervodocumento_id_ad_seq'::regclass);


--
-- Name: id_c; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curriculo ALTER COLUMN id_c SET DEFAULT nextval('curriculo_id_c_seq'::regclass);


--
-- Name: id_crs; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curso ALTER COLUMN id_crs SET DEFAULT nextval('curso_id_crs_seq'::regclass);


--
-- Name: id_c; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY componentes ALTER COLUMN id_c SET DEFAULT nextval('componentes_id_c_seq'::regclass);


--
-- Name: id_ef; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exemplarconflitante ALTER COLUMN id_ef SET DEFAULT nextval('exemplarconflitante_id_ef_seq'::regclass);


--
-- Name: id_e; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exemplares ALTER COLUMN id_e SET DEFAULT nextval('exemplares_id_e_seq'::regclass);


--
-- Name: id_mt; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meta ALTER COLUMN id_mt SET DEFAULT nextval('meta_id_mt_seq'::regclass);


--
-- Name: id_t; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY titulos ALTER COLUMN id_t SET DEFAULT nextval('titulos_id_t_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- Data for Name: acervodocumento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY acervodocumento (id_ad, arquivo, extensao, finalperidodelta, inicioperidodelta, id_usuario) FROM stdin;
\.


--
-- Name: acervodocumento_id_ad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('acervodocumento_id_ad_seq', 1, false);


--
-- Data for Name: bibliografias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bibliografias ( id_componente , id_titulo,tipo_bibliografia) FROM stdin;
6	44	Complementar
6	36	Complementar
6	42	Complementar
6	652	Complementar
6	43	Básica
6	145	Básica
10	432	Complementar
38	309	Básica
38	593	Complementar
38	307	Complementar
39	248	Complementar
40	528	Complementar
41	387	Básica
41	386	Complementar
41	783	Complementar
22	61	Complementar
34	92	Básica
34	842	Complementar
102	619	Básica
103	631	Básica
44	237	Complementar
38	310	Básica
39	34	Básica
40	313	Básica
40	579	Complementar
22	53	Complementar
105	918	Complementar
44	223	Básica
44	97	Complementar
89	587	Complementar
89	444	Complementar
89	20	Básica
89	1	Básica
89	2	Básica
93	475	Básica
97	444	Complementar
97	328	Complementar
97	20	Básica
97	587	Complementar
97	1	Básica
97	323	Complementar
102	618	Básica
103	673	Básica
105	913	Básica
104	118	Complementar
104	120	Complementar
104	172	Complementar
104	161	Básica
104	225	Básica
104	167	Básica
112	870	Complementar
120	868	Complementar
86	7	Complementar
86	718	Complementar
1	637	Básica
1	44	Complementar
42	381	Complementar
111	45	Básica
111	405	Básica
111	813	Complementar
111	838	Complementar
111	397	Complementar
111	803	Básica
69	609	Básica
69	653	Complementar
65	167	Complementar
65	661	Complementar
28	525	Básica
28	445	Complementar
28	468	Complementar
48	622	Complementar
112	868	Básica
112	781	Complementar
120	821	Complementar
86	82	Complementar
1	43	Básica
1	36	Complementar
42	112	Básica
42	785	Complementar
69	120	Complementar
65	651	Básica
28	521	Básica
28	440	Complementar
48	856	Complementar
48	857	Complementar
130	885	Básica
130	887	Complementar
43	159	Básica
43	596	Complementar
43	235	Complementar
43	234	Complementar
43	107	Complementar
2	37	Básica
2	114	Básica
2	207	Complementar
2	208	Complementar
2	177	Complementar
2	693	Complementar
2	139	Complementar
7	377	Básica
7	396	Básica
7	810	Complementar
2	142	Básica
7	376	Complementar
7	394	Complementar
93	517	Complementar
7	395	Complementar
8	221	Básica
8	210	Básica
8	936	Básica
8	207	Complementar
8	624	Complementar
8	233	Complementar
8	170	Complementar
9	30	Básica
9	381	Básica
9	371	Complementar
9	370	Complementar
9	380	Complementar
9	608	Complementar
10	689	Complementar
38	311	Básica
38	312	Complementar
39	31	Básica
11	605	Básica
11	621	Básica
11	146	Básica
11	138	Complementar
11	37	Complementar
11	113	Complementar
11	137	Complementar
11	139	Complementar
41	198	Básica
41	19	Complementar
12	295	Básica
12	294	Básica
12	606	Complementar
12	622	Complementar
12	299	Complementar
13	415	Básica
13	413	Básica
13	416	Complementar
13	423	Complementar
13	404	Complementar
14	270	Básica
14	252	Complementar
14	38	Complementar
14	230	Complementar
14	268	Complementar
15	167	Básica
15	172	Básica
15	173	Básica
15	176	Complementar
15	120	Complementar
17	182	Básica
17	191	Básica
17	639	Básica
17	280	Complementar
17	170	Complementar
17	207	Complementar
17	387	Complementar
17	199	Complementar
17	229	Complementar
18	640	Básica
18	390	Básica
18	40	Complementar
18	391	Complementar
18	41	Complementar
18	604	Complementar
18	385	Complementar
18	30	Complementar
18	586	Complementar
20	176	Básica
20	119	Básica
20	126	Básica
20	234	Complementar
20	160	Complementar
20	244	Complementar
20	107	Complementar
20	108	Complementar
20	164	Complementar
21	225	Básica
21	610	Básica
21	242	Complementar
21	296	Complementar
21	241	Complementar
21	188	Complementar
21	214	Complementar
21	229	Complementar
23	646	Básica
23	909	Básica
23	516	Básica
23	434	Básica
23	304	Básica
23	302	Complementar
23	303	Complementar
23	306	Complementar
23	732	Complementar
24	502	Básica
24	504	Básica
24	505	Complementar
24	592	Complementar
22	79	Básica
22	59	Complementar
102	620	Básica
103	632	Básica
44	304	Complementar
24	493	Complementar
24	633	Complementar
24	503	Complementar
25	31	Básica
25	486	Básica
25	446	Básica
25	34	Complementar
25	471	Complementar
25	236	Complementar
26	280	Básica
26	275	Básica
26	801	Básica
26	209	Complementar
26	816	Complementar
26	800	Complementar
26	835	Complementar
26	786	Complementar
30	514	Básica
15	174	Complementar
25	282	Complementar
30	447	Básica
30	507	Complementar
24	118	Básica
40	317	Básica
40	316	Complementar
13	417	Básica
13	418	Complementar
14	267	Básica
14	261	Complementar
30	506	Complementar
30	468	Complementar
30	330	Complementar
30	440	Complementar
112	869	Básica
112	873	Complementar
120	869	Complementar
86	720	Básica
86	719	Complementar
35	495	Básica
35	109	Básica
35	503	Básica
35	493	Complementar
35	633	Complementar
35	125	Complementar
35	494	Complementar
10	435	Complementar
38	345	Complementar
38	406	Complementar
39	806	Básica
40	314	Complementar
41	280	Complementar
41	191	Complementar
34	62	Básica
34	281	Complementar
102	600	Complementar
103	666	Complementar
105	779	Complementar
44	274	Básica
44	269	Complementar
47	28	Básica
47	19	Básica
47	325	Complementar
47	385	Complementar
47	392	Complementar
47	783	Complementar
49	697	Básica
49	49	Básica
49	56	Complementar
49	741	Complementar
49	105	Complementar
49	8	Complementar
56	126	Básica
56	16	Complementar
56	42	Complementar
56	128	Complementar
56	18	Complementar
56	637	Complementar
57	30	Básica
57	608	Básica
57	394	Complementar
57	370	Complementar
57	589	Complementar
57	381	Complementar
57	380	Complementar
58	128	Básica
58	126	Básica
58	159	Complementar
58	21	Complementar
58	672	Complementar
58	151	Complementar
58	150	Complementar
59	165	Básica
59	176	Básica
59	168	Básica
59	153	Complementar
59	166	Complementar
59	160	Complementar
59	115	Complementar
59	163	Complementar
60	62	Básica
60	274	Básica
60	79	Complementar
60	97	Complementar
60	614	Complementar
60	615	Complementar
61	650	Básica
61	159	Básica
61	141	Básica
61	422	Complementar
61	656	Complementar
61	21	Complementar
61	126	Complementar
61	612	Complementar
62	155	Básica
62	630	Básica
62	126	Básica
62	130	Complementar
62	141	Complementar
62	628	Complementar
62	672	Complementar
62	660	Complementar
62	151	Complementar
62	150	Complementar
63	239	Básica
63	196	Básica
63	160	Básica
63	115	Complementar
64	603	Básica
64	107	Básica
64	596	Complementar
64	235	Complementar
64	234	Complementar
67	647	Básica
67	12	Básica
67	244	Básica
67	607	Complementar
67	642	Complementar
67	670	Complementar
67	671	Complementar
68	635	Básica
68	116	Básica
68	636	Básica
68	157	Complementar
68	196	Complementar
68	144	Complementar
68	115	Complementar
70	479	Básica
70	434	Básica
70	306	Básica
70	646	Complementar
70	909	Complementar
70	303	Complementar
70	62	Complementar
70	304	Complementar
47	387	Básica
47	386	Complementar
70	249	Complementar
70	305	Complementar
71	649	Básica
71	221	Básica
71	222	Básica
71	51	Complementar
71	613	Complementar
72	472	Básica
72	515	Básica
72	626	Básica
72	594	Complementar
72	601	Complementar
72	602	Complementar
72	585	Complementar
72	659	Complementar
72	625	Complementar
73	173	Básica
73	307	Básica
73	221	Complementar
73	657	Complementar
73	624	Complementar
74	145	Básica
74	731	Básica
74	637	Básica
74	55	Complementar
74	44	Complementar
74	46	Complementar
74	730	Complementar
74	36	Complementar
74	729	Complementar
75	30	Básica
75	113	Complementar
75	380	Complementar
75	385	Complementar
75	372	Complementar
75	898	Complementar
102	617	Complementar
103	665	Complementar
105	919	Complementar
77	261	Básica
77	738	Básica
77	106	Básica
77	262	Complementar
77	736	Complementar
77	737	Complementar
77	247	Complementar
77	251	Complementar
78	273	Básica
78	271	Básica
78	746	Básica
78	255	Complementar
78	260	Complementar
78	259	Complementar
78	272	Complementar
78	743	Complementar
78	250	Complementar
79	53	Básica
79	79	Básica
79	62	Básica
79	84	Complementar
79	61	Complementar
79	96	Complementar
79	95	Complementar
80	427	Básica
80	697	Complementar
80	428	Complementar
84	733	Básica
84	516	Básica
84	434	Básica
84	302	Complementar
84	304	Complementar
84	306	Complementar
84	732	Complementar
85	895	Básica
85	262	Básica
85	707	Básica
85	266	Complementar
85	271	Complementar
85	738	Complementar
85	106	Complementar
87	473	Básica
87	517	Básica
87	475	Básica
87	462	Complementar
87	735	Complementar
87	680	Complementar
87	480	Complementar
87	437	Complementar
88	427	Básica
88	847	Básica
88	83	Básica
88	99	Complementar
88	56	Complementar
88	60	Complementar
88	428	Complementar
90	663	Básica
90	591	Complementar
90	291	Complementar
90	237	Complementar
96	374	Básica
96	790	Complementar
96	819	Complementar
98	948	Básica
98	949	Básica
98	950	Básica
98	951	Básica
98	953	Básica
98	954	Complementar
98	955	Complementar
98	956	Complementar
98	957	Complementar
98	958	Complementar
98	959	Complementar
98	960	Complementar
98	961	Complementar
99	125	Básica
100	320	Básica
100	97	Básica
100	283	Básica
100	599	Complementar
90	297	Básica
96	608	Complementar
100	98	Complementar
100	644	Complementar
100	643	Complementar
101	235	Básica
101	144	Básica
88	747	Complementar
99	118	Complementar
99	161	Complementar
99	120	Complementar
96	394	Básica
101	648	Complementar
101	294	Complementar
101	161	Complementar
101	244	Complementar
105	915	Básica
112	867	Básica
120	822	Básica
120	839	Complementar
86	38	Complementar
1	16	Complementar
42	30	Complementar
42	146	Complementar
69	645	Complementar
108	938	Básica
108	937	Básica
108	939	Básica
108	962	Complementar
108	964	Complementar
108	963	Complementar
108	227	Complementar
108	965	Complementar
109	911	Básica
109	910	Básica
109	799	Básica
109	37	Complementar
109	112	Complementar
109	287	Complementar
109	912	Complementar
109	381	Complementar
110	907	Básica
110	906	Básica
110	908	Básica
110	113	Complementar
113	874	Básica
113	875	Básica
113	876	Básica
113	880	Complementar
113	877	Complementar
113	613	Complementar
113	879	Complementar
113	878	Complementar
114	802	Básica
114	306	Básica
115	825	Básica
115	788	Complementar
116	885	Básica
117	804	Básica
118	889	Básica
118	818	Básica
118	890	Básica
118	394	Complementar
118	377	Complementar
118	396	Complementar
121	813	Básica
121	45	Básica
121	397	Básica
121	405	Complementar
121	838	Complementar
122	947	Complementar
122	946	Complementar
122	9	Complementar
123	945	Básica
123	9	Básica
123	946	Complementar
123	942	Complementar
124	940	Básica
124	923	Básica
125	934	Básica
126	932	Básica
126	931	Básica
127	778	Básica
127	928	Básica
129	921	Básica
129	920	Básica
129	967	Básica
129	923	Complementar
119	891	Básica
119	40	Complementar
119	893	Complementar
36	356	Básica
36	357	Básica
36	465	Complementar
36	353	Complementar
36	354	Complementar
37	356	Básica
37	357	Básica
37	465	Complementar
37	353	Complementar
37	354	Complementar
3	16	Básica
3	39	Básica
3	637	Básica
3	42	Complementar
3	481	Complementar
3	36	Complementar
19	291	Básica
19	294	Complementar
19	256	Complementar
19	298	Complementar
92	327	Básica
92	326	Básica
92	342	Básica
92	344	Complementar
92	343	Complementar
92	341	Complementar
31	327	Básica
31	326	Básica
31	344	Complementar
31	343	Complementar
31	341	Complementar
45	528	Básica
45	837	Básica
45	529	Básica
45	344	Complementar
45	104	Complementar
45	530	Complementar
45	527	Complementar
45	318	Complementar
112	830	Complementar
27	767	Básica
116	887	Complementar
117	805	Complementar
37	355	Complementar
119	41	Básica
119	604	Complementar
119	892	Complementar
125	935	Complementar
125	933	Complementar
127	927	Complementar
27	768	Básica
27	451	Básica
27	433	Básica
27	450	Básica
27	763	Complementar
27	373	Complementar
27	455	Complementar
27	765	Complementar
27	432	Complementar
27	766	Complementar
81	246	Complementar
81	710	Complementar
81	229	Complementar
83	426	Básica
83	681	Básica
83	424	Básica
83	723	Complementar
83	722	Complementar
83	351	Complementar
83	425	Complementar
83	264	Complementar
83	724	Complementar
120	873	Complementar
86	845	Básica
86	688	Complementar
1	42	Complementar
42	110	Básica
42	589	Complementar
69	165	Complementar
69	125	Complementar
65	662	Básica
65	236	Complementar
28	522	Básica
28	436	Complementar
48	289	Básica
48	858	Complementar
48	606	Complementar
130	9	Complementar
15	175	Complementar
39	282	Complementar
110	112	Complementar
110	110	Complementar
110	405	Complementar
111	413	Complementar
111	417	Complementar
111	1200	Complementar
111	414	Complementar
86	1102	Básica
134	831	Básica
134	832	Básica
134	784	Básica
134	827	Complementar
134	812	Complementar
134	375	Complementar
134	815	Complementar
134	1201	Complementar
112	413	Complementar
1	974	Básica
6	974	Complementar
3	974	Básica
56	974	Básica
135	313	Básica
135	1203	Básica
135	316	Básica
135	315	Básica
135	317	Complementar
135	314	Complementar
135	528	Complementar
135	1204	Complementar
135	1205	Complementar
19	299	Básica
19	295	Básica
114	1206	Complementar
114	1207	Complementar
114	303	Complementar
114	381	Complementar
114	1209	Complementar
114	1208	Complementar
115	1210	Básica
115	1212	Complementar
115	1211	Complementar
115	1213	Complementar
116	970	Básica
130	970	Complementar
7	1213	Básica
7	1212	Básica
7	411	Complementar
197	966	Básica
197	825	Básica
197	788	Complementar
197	1202	Complementar
197	1212	Complementar
116	411	Básica
116	1214	Complementar
116	1202	Complementar
116	396	Complementar
116	831	Complementar
136	1202	Básica
137	1202	Básica
71	936	Complementar
71	274	Complementar
71	230	Complementar
12	1033	Básica
60	980	Básica
44	980	Básica
91	156	Básica
91	51	Básica
91	35	Básica
91	240	Complementar
91	1202	Complementar
90	1198	Básica
90	1215	Básica
91	896	Complementar
21	284	Básica
104	611	Complementar
21	1216	Básica
21	611	Complementar
199	1217	Básica
199	980	Básica
199	298	Básica
199	50	Complementar
199	237	Complementar
199	274	Complementar
199	98	Complementar
199	49	Complementar
199	48	Complementar
132	1202	Básica
36	355	Complementar
115	396	Complementar
197	1210	Complementar
82	728	Complementar
39	286	Básica
28	523	Complementar
29	430	Básica
29	334	Básica
29	337	Básica
29	338	Complementar
29	448	Complementar
29	449	Complementar
29	336	Complementar
29	335	Complementar
106	1202	Básica
131	1202	Básica
57	982	Básica
97	3	Básica
2	897	Básica
60	58	Complementar
49	58	Complementar
187	1218	Básica
187	1219	Básica
187	1220	Básica
187	1221	Básica
187	1222	Complementar
187	1223	Complementar
187	1224	Complementar
187	1202	Complementar
186	1226	Básica
186	1227	Básica
186	1225	Básica
186	1228	Complementar
186	1230	Complementar
186	1231	Complementar
186	1229	Complementar
182	1238	Básica
182	1239	Básica
182	1240	Básica
1	46	Complementar
6	46	Básica
182	1234	Complementar
182	1235	Complementar
182	46	Complementar
182	1236	Complementar
182	1237	Complementar
179	1241	Básica
179	1242	Básica
179	1243	Básica
179	1240	Complementar
179	46	Complementar
179	1244	Complementar
179	1245	Complementar
179	1246	Complementar
176	1247	Básica
176	729	Básica
176	1248	Básica
176	1249	Complementar
176	1251	Complementar
176	1252	Complementar
176	1253	Complementar
176	1254	Complementar
191	1255	Básica
191	1256	Básica
191	1257	Básica
191	1258	Básica
191	1259	Complementar
191	1262	Complementar
191	1260	Complementar
191	1261	Complementar
191	1263	Complementar
193	1255	Básica
193	1256	Básica
193	1257	Básica
193	1258	Básica
193	1259	Complementar
193	1260	Complementar
193	1262	Complementar
193	1261	Complementar
193	1263	Complementar
30	1264	Básica
104	126	Básica
43	126	Básica
15	126	Complementar
64	125	Complementar
39	125	Complementar
65	125	Complementar
188	126	Básica
188	1113	Básica
188	176	Básica
188	164	Complementar
188	244	Complementar
188	234	Complementar
188	108	Complementar
188	160	Complementar
188	107	Complementar
42	113	Básica
109	113	Básica
42	799	Básica
96	988	Complementar
66	390	Básica
66	40	Básica
66	41	Básica
66	1271	Básica
66	125	Complementar
66	345	Complementar
117	976	Básica
117	413	Complementar
102	767	Complementar
102	494	Complementar
89	329	Complementar
89	324	Complementar
103	329	Complementar
48	295	Básica
90	295	Complementar
90	1015	Complementar
12	1015	Complementar
118	1278	Complementar
118	1279	Complementar
67	650	Complementar
35	505	Complementar
34	81	Básica
143	1280	Básica
143	1281	Básica
143	1282	Básica
143	1283	Complementar
143	1284	Complementar
143	1285	Complementar
143	1288	Complementar
143	529	Complementar
143	1287	Complementar
143	1291	Complementar
151	1289	Básica
151	1290	Básica
151	1291	Básica
151	1292	Complementar
151	1293	Complementar
151	1281	Complementar
151	1294	Complementar
151	1295	Complementar
144	1283	Básica
144	1296	Básica
144	1297	Básica
144	1282	Complementar
144	1298	Complementar
144	1299	Complementar
144	1300	Complementar
144	1301	Complementar
154	1302	Básica
154	1303	Básica
154	1304	Básica
154	1305	Complementar
154	1306	Complementar
154	1308	Complementar
154	1307	Complementar
198	443	Complementar
117	972	Básica
103	1192	Básica
103	587	Básica
154	1309	Complementar
139	1310	Básica
139	1311	Básica
139	1312	Básica
139	528	Complementar
139	987	Complementar
139	286	Complementar
139	296	Complementar
139	248	Complementar
138	1313	Básica
138	1314	Básica
138	1315	Básica
138	1280	Complementar
138	1316	Complementar
138	1317	Complementar
138	1318	Complementar
138	1319	Complementar
146	1320	Básica
146	1321	Básica
146	1322	Básica
146	1323	Complementar
146	1324	Complementar
146	1325	Complementar
146	1326	Complementar
146	1327	Complementar
79	1007	Complementar
85	1007	Complementar
36	1197	Básica
37	1197	Básica
195	1328	Básica
195	1262	Básica
195	1329	Básica
195	1263	Complementar
195	1330	Complementar
195	1331	Complementar
195	1333	Complementar
195	1332	Complementar
82	899	Básica
49	899	Básica
80	80	Complementar
100	150	Complementar
73	998	Básica
79	1334	Básica
105	1307	Básica
198	435	Básica
198	997	Básica
198	679	Básica
120	983	Básica
141	1340	Básica
141	1341	Básica
141	1342	Básica
141	140	Complementar
141	17	Complementar
141	206	Complementar
141	138	Complementar
141	114	Complementar
80	1334	Básica
80	93	Básica
10	18	Básica
178	46	Básica
178	145	Básica
178	1240	Básica
178	43	Complementar
178	44	Complementar
178	42	Complementar
178	1254	Complementar
178	36	Complementar
177	1335	Básica
177	1336	Básica
177	1337	Básica
177	1338	Complementar
177	1339	Complementar
177	46	Complementar
177	731	Complementar
177	974	Complementar
80	1202	Complementar
68	1202	Complementar
152	1343	Básica
152	1344	Básica
152	1345	Básica
152	1346	Complementar
152	1347	Complementar
152	1348	Complementar
152	205	Complementar
152	1349	Complementar
41	182	Complementar
119	19	Básica
119	386	Complementar
130	993	Básica
130	1202	Complementar
130	1350	Complementar
189	1351	Básica
189	1352	Básica
189	1237	Básica
189	1353	Complementar
189	1354	Complementar
189	1355	Complementar
189	1236	Complementar
189	1356	Complementar
121	413	Complementar
121	1200	Complementar
121	417	Complementar
147	1357	Básica
147	1358	Básica
147	313	Básica
147	1359	Complementar
140	527	Básica
140	319	Básica
140	1360	Básica
140	104	Complementar
140	1361	Complementar
140	1310	Complementar
140	1326	Complementar
101	107	Básica
76	1	Básica
76	2	Básica
76	1154	Básica
76	328	Complementar
76	365	Complementar
76	587	Complementar
10	482	Complementar
10	466	Complementar
10	487	Básica
10	39	Básica
3	18	Complementar
16	486	Básica
16	482	Básica
16	515	Complementar
16	446	Básica
16	474	Complementar
16	626	Complementar
16	438	Complementar
140	308	Complementar
92	308	Complementar
31	308	Complementar
16	1365	Complementar
16	1364	Complementar
93	482	Básica
93	473	Complementar
93	1019	Complementar
93	437	Complementar
93	680	Complementar
50	626	Básica
50	474	Básica
50	445	Básica
50	458	Complementar
50	515	Complementar
50	472	Complementar
50	1366	Complementar
50	1368	Complementar
10	1369	Complementar
16	1369	Complementar
123	1026	Complementar
122	1026	Básica
123	993	Básica
130	407	Básica
122	407	Básica
122	470	Básica
122	419	Complementar
122	1097	Complementar
122	1382	Complementar
123	407	Complementar
123	1097	Complementar
124	1115	Básica
129	1115	Complementar
155	1384	Básica
155	1385	Básica
155	1386	Básica
155	1202	Complementar
155	528	Complementar
155	1387	Complementar
155	1389	Complementar
155	1388	Complementar
81	999	Básica
81	1341	Básica
81	1390	Básica
81	1392	Complementar
81	1391	Complementar
145	1393	Básica
145	1347	Básica
145	1346	Básica
145	154	Complementar
145	1040	Complementar
145	1395	Complementar
145	205	Complementar
145	1394	Complementar
8	1040	Complementar
9	1374	Complementar
13	1396	Complementar
80	99	Básica
88	1397	Básica
88	96	Complementar
22	981	Básica
23	62	Complementar
60	96	Complementar
60	649	Complementar
148	1398	Básica
148	1399	Básica
148	1400	Básica
148	1401	Complementar
148	1402	Complementar
148	1403	Complementar
148	1404	Complementar
148	1289	Complementar
153	1405	Básica
153	1406	Básica
153	1407	Básica
153	1408	Complementar
153	1409	Complementar
153	1412	Complementar
16	1363	Complementar
153	1411	Complementar
153	1285	Complementar
153	1410	Complementar
159	1413	Básica
159	1414	Básica
159	1415	Básica
159	1416	Complementar
159	1420	Complementar
159	1417	Complementar
159	1419	Complementar
159	1418	Complementar
163	1421	Básica
163	1422	Básica
163	1423	Básica
163	1416	Complementar
163	1424	Complementar
163	1427	Complementar
163	1425	Complementar
163	1426	Complementar
172	1428	Básica
172	1429	Básica
172	1430	Básica
172	1431	Complementar
172	994	Complementar
172	1432	Complementar
172	1434	Complementar
172	1433	Complementar
175	1435	Básica
175	1436	Básica
175	1384	Básica
175	1346	Complementar
175	1437	Complementar
175	1439	Complementar
175	1395	Complementar
175	1438	Complementar
99	167	Básica
99	225	Básica
99	172	Complementar
99	611	Complementar
99	1216	Básica
99	1440	Básica
115	966	Básica
197	1442	Básica
96	1441	Básica
96	372	Básica
96	396	Complementar
142	1443	Básica
142	1444	Básica
142	1445	Básica
142	1446	Complementar
142	1447	Complementar
142	1202	Complementar
142	1283	Complementar
142	1051	Complementar
43	650	Básica
43	422	Complementar
125	1202	Básica
125	1451	Complementar
125	1450	Complementar
125	1449	Complementar
125	1448	Complementar
201	1452	Básica
201	1453	Básica
201	1454	Básica
201	1455	Complementar
201	935	Complementar
201	1457	Complementar
201	994	Complementar
126	322	Básica
126	1458	Complementar
126	1459	Complementar
126	1200	Complementar
126	414	Complementar
126	1460	Complementar
82	84	Básica
82	99	Básica
82	83	Básica
82	981	Complementar
82	60	Complementar
22	58	Complementar
22	1028	Complementar
107	1202	Básica
202	34	Básica
202	1466	Básica
202	806	Básica
202	1468	Complementar
202	994	Complementar
85	1477	Complementar
192	1478	Básica
192	1479	Básica
192	1480	Básica
192	1481	Complementar
192	1482	Complementar
192	1483	Complementar
192	1484	Complementar
192	1485	Complementar
194	1486	Básica
194	1488	Básica
194	1487	Básica
194	1489	Complementar
194	1492	Complementar
194	1491	Complementar
194	1490	Complementar
14	258	Básica
196	1493	Básica
196	1494	Básica
196	1495	Básica
196	1496	Complementar
196	270	Complementar
196	268	Complementar
196	1497	Complementar
190	1498	Básica
190	1499	Básica
190	1248	Básica
190	1500	Complementar
190	1501	Complementar
190	1249	Complementar
190	1247	Complementar
190	1502	Complementar
44	320	Complementar
203	1503	Básica
203	1504	Básica
203	116	Básica
203	1506	Complementar
203	1507	Complementar
203	1355	Complementar
203	1237	Complementar
203	1236	Complementar
73	1040	Complementar
73	1202	Complementar
180	270	Básica
180	267	Básica
180	252	Complementar
180	261	Complementar
180	230	Complementar
180	268	Complementar
180	38	Complementar
184	268	Básica
184	1508	Básica
184	1509	Básica
184	237	Complementar
184	270	Complementar
184	321	Complementar
184	97	Complementar
184	304	Complementar
150	1510	Básica
150	1511	Básica
150	1512	Básica
150	1513	Complementar
150	1517	Complementar
150	1516	Complementar
150	1514	Complementar
150	1515	Complementar
46	1202	Básica
169	1518	Básica
169	1519	Básica
169	1520	Básica
169	1521	Complementar
169	1525	Complementar
169	1522	Complementar
169	1524	Complementar
169	1523	Complementar
127	390	Básica
17	325	Complementar
18	325	Complementar
127	325	Complementar
127	1527	Complementar
127	385	Complementar
127	1526	Complementar
73	311	Complementar
128	995	Básica
128	992	Básica
128	381	Básica
128	30	Complementar
128	898	Complementar
128	112	Complementar
128	113	Complementar
198	518	Complementar
198	457	Complementar
198	330	Complementar
198	456	Complementar
198	689	Complementar
158	1530	Básica
158	1532	Básica
158	1531	Básica
158	1533	Complementar
158	1534	Complementar
158	1535	Complementar
158	1536	Complementar
158	1293	Básica
158	1537	Complementar
51	1202	Básica
52	1202	Básica
53	1202	Básica
54	1202	Básica
181	1538	Básica
181	1539	Básica
181	1540	Básica
181	1541	Complementar
181	1542	Complementar
181	268	Complementar
181	1544	Complementar
185	207	Básica
185	1546	Básica
185	1545	Básica
185	1541	Complementar
185	268	Complementar
185	1544	Complementar
185	1542	Complementar
181	208	Complementar
174	285	Básica
174	1547	Básica
174	1548	Básica
174	994	Complementar
174	1550	Complementar
174	1415	Complementar
174	1551	Complementar
145	1552	Básica
170	1553	Básica
170	1554	Básica
170	1420	Básica
170	1556	Complementar
170	1557	Complementar
170	1559	Complementar
170	1558	Complementar
170	1555	Complementar
171	1560	Básica
171	1562	Básica
171	1561	Básica
171	1563	Complementar
171	1309	Complementar
171	1567	Complementar
171	1566	Complementar
171	1564	Complementar
171	1565	Complementar
160	1568	Básica
160	1569	Básica
160	1439	Básica
160	1388	Complementar
160	1570	Complementar
160	1384	Complementar
160	1571	Complementar
160	1572	Complementar
167	1573	Básica
167	626	Básica
167	994	Básica
167	1574	Complementar
167	1368	Complementar
167	1575	Complementar
167	1576	Complementar
167	472	Complementar
162	1577	Básica
162	1439	Básica
162	1403	Básica
162	1581	Complementar
162	1580	Complementar
162	1578	Complementar
162	1579	Complementar
162	1401	Complementar
164	1589	Básica
164	1590	Básica
164	1591	Básica
164	1592	Complementar
164	1596	Complementar
164	1593	Complementar
164	1595	Complementar
164	1594	Complementar
165	913	Básica
165	1307	Básica
165	915	Básica
165	1598	Complementar
105	1598	Complementar
105	1599	Complementar
165	1599	Complementar
165	779	Complementar
165	1601	Complementar
165	1600	Complementar
173	1602	Básica
173	1603	Básica
173	1604	Básica
173	1605	Complementar
173	1607	Complementar
173	1608	Complementar
173	1609	Complementar
173	1606	Complementar
147	1613	Complementar
147	1614	Complementar
147	1610	Complementar
147	1611	Complementar
147	1612	Complementar
161	1615	Básica
161	1438	Básica
161	1367	Básica
161	1616	Básica
161	1622	Complementar
161	1617	Complementar
161	1621	Complementar
161	1619	Complementar
161	1618	Complementar
156	1623	Básica
156	1624	Básica
156	1625	Básica
156	1346	Complementar
156	1437	Complementar
156	1395	Complementar
156	1552	Complementar
156	1626	Complementar
205	1627	Básica
205	1628	Básica
205	1429	Básica
205	1629	Complementar
205	1389	Complementar
205	1569	Complementar
205	1570	Complementar
30	510	Básica
205	509	Complementar
206	1202	Básica
48	1033	Básica
32	1630	Básica
33	1630	Básica
16	1370	Básica
3	1202	Complementar
157	327	Básica
157	1631	Básica
157	1632	Básica
157	1633	Complementar
157	326	Complementar
157	1634	Complementar
157	308	Complementar
200	900	Básica
200	1174	Básica
200	552	Básica
200	571	Básica
200	582	Básica
200	558	Básica
200	1037	Básica
200	570	Básica
200	564	Básica
200	574	Básica
200	535	Básica
200	569	Básica
200	550	Básica
200	1085	Básica
200	1172	Básica
200	562	Básica
200	576	Básica
200	560	Básica
200	556	Básica
200	573	Básica
200	567	Básica
200	1171	Básica
200	563	Básica
200	1178	Básica
200	1177	Básica
200	1158	Básica
200	1119	Básica
200	1168	Básica
200	575	Básica
200	566	Básica
200	565	Básica
200	559	Básica
200	557	Básica
200	555	Básica
200	554	Básica
200	553	Básica
200	577	Básica
200	358	Básica
200	572	Básica
200	1132	Básica
200	1409	Básica
200	978	Básica
200	1163	Básica
207	382	Básica
207	1139	Básica
207	1060	Básica
207	1058	Básica
207	1059	Básica
207	1064	Básica
207	1086	Básica
207	1137	Básica
207	1133	Básica
207	469	Básica
207	364	Básica
207	29	Básica
207	1076	Básica
207	1120	Básica
207	1156	Básica
200	332	Básica
200	1173	Básica
200	1130	Básica
200	1081	Básica
200	1170	Básica
200	1111	Básica
200	1123	Básica
200	1165	Básica
200	1099	Básica
200	547	Básica
207	1114	Básica
207	359	Básica
207	1053	Básica
208	543	Básica
208	1128	Básica
208	1195	Básica
208	1145	Básica
200	1077	Básica
200	583	Básica
200	1100	Básica
200	531	Básica
200	1031	Básica
200	534	Básica
200	546	Básica
200	532	Básica
200	1157	Básica
200	1134	Básica
200	429	Básica
200	543	Básica
200	1107	Básica
200	1127	Básica
200	339	Básica
200	545	Básica
200	549	Básica
200	1184	Básica
200	548	Básica
207	1098	Básica
207	1032	Básica
207	190	Básica
207	1035	Básica
207	1162	Básica
207	1152	Básica
207	349	Básica
207	1024	Básica
207	1135	Básica
207	240	Básica
207	1167	Básica
207	1006	Básica
207	581	Básica
207	348	Básica
207	1196	Básica
207	1160	Básica
207	1149	Básica
207	1066	Básica
207	421	Básica
207	1084	Básica
207	361	Básica
207	1142	Básica
207	1004	Básica
207	1025	Básica
208	1008	Básica
208	1070	Básica
208	1372	Básica
200	541	Básica
200	1112	Básica
200	1183	Básica
200	1125	Básica
200	1175	Básica
200	1131	Básica
200	568	Básica
200	1023	Básica
200	1117	Básica
200	333	Básica
200	1118	Básica
200	551	Básica
200	561	Básica
200	537	Básica
200	580	Básica
200	1180	Básica
200	1179	Básica
200	1176	Básica
200	533	Básica
200	539	Básica
200	1071	Básica
200	1181	Básica
200	1169	Básica
200	542	Básica
200	1182	Básica
200	1136	Básica
200	538	Básica
200	544	Básica
200	536	Básica
200	1094	Básica
200	1092	Básica
200	1091	Básica
200	1090	Básica
200	1166	Básica
207	1055	Básica
207	331	Básica
207	1155	Básica
207	1073	Básica
207	1067	Básica
207	1153	Básica
207	1144	Básica
207	1122	Básica
207	1096	Básica
207	1011	Básica
207	1106	Básica
207	1068	Básica
207	1147	Básica
207	1036	Básica
207	1141	Básica
207	1151	Básica
207	1150	Básica
207	1072	Básica
207	1143	Básica
207	380	Básica
207	1095	Básica
207	363	Básica
207	352	Básica
207	1146	Básica
207	526	Básica
207	1140	Básica
183	1265	Básica
183	1266	Básica
207	1108	Básica
207	354	Básica
207	1079	Básica
207	1063	Básica
207	1078	Básica
207	1054	Básica
207	1075	Básica
207	1148	Básica
207	1110	Básica
207	1185	Básica
183	1635	Complementar
183	1267	Básica
183	1268	Complementar
183	1212	Complementar
183	988	Complementar
183	1269	Complementar
94	1630	Básica
66	1273	Complementar
66	1272	Complementar
149	1469	Básica
149	1470	Básica
149	1471	Básica
149	1472	Complementar
149	1476	Complementar
149	1473	Complementar
149	1474	Complementar
149	1475	Complementar
202	1202	Complementar
82	1461	Complementar
82	726	Complementar
82	741	Complementar
186	1232	Complementar
117	1274	Básica
117	1275	Complementar
117	1276	Complementar
117	1277	Complementar
82	1464	Básica
82	1463	Básica
208	717	Básica
168	1547	Básica
168	1583	Básica
168	1582	Básica
168	1584	Complementar
168	1585	Complementar
168	1588	Complementar
168	1587	Complementar
168	1586	Complementar
174	1587	Complementar
209	1009	Básica
186	1233	Complementar
128	1528	Complementar
124	315	Complementar
124	1383	Complementar
124	1202	Complementar
124	1203	Complementar
129	1202	Complementar
207	1104	Básica
207	1161	Básica
207	1074	Básica
209	1069	Básica
209	1027	Básica
209	1013	Básica
204	1002	Básica
210	1005	Básica
210	986	Básica
210	1017	Básica
207	1000	Básica
200	1050	Básica
204	1001	Básica
204	1103	Básica
204	1105	Básica
65	1193	Básica
101	1193	Complementar
210	1371	Básica
210	215	Básica
210	27	Básica
210	360	Básica
210	862	Básica
200	1012	Básica
40	578	Complementar
210	228	Básica
210	518	Básica
36	1030	Complementar
37	1030	Complementar
204	1187	Básica
210	1377	Básica
200	1049	Básica
204	217	Básica
204	1034	Básica
209	216	Básica
204	524	Básica
210	902	Básica
210	901	Básica
69	1199	Básica
204	1138	Básica
210	111	Básica
210	1061	Básica
210	1057	Básica
210	1056	Básica
210	1186	Básica
200	1121	Básica
210	1029	Básica
204	1018	Básica
209	377	Básica
209	904	Básica
27	431	Complementar
210	1038	Básica
12	290	Complementar
19	290	Complementar
210	1126	Básica
210	1373	Básica
200	1082	Básica
210	1129	Básica
210	1044	Básica
27	1041	Complementar
210	384	Básica
210	1042	Básica
200	1164	Básica
200	1045	Básica
102	1039	Complementar
84	1378	Complementar
204	301	Básica
210	143	Básica
210	456	Básica
210	1392	Básica
210	461	Básica
210	1065	Básica
210	1380	Básica
210	195	Básica
200	1083	Básica
200	1109	Básica
200	1101	Básica
200	1003	Básica
200	348	Básica
200	1159	Básica
200	1080	Básica
18	389	Básica
200	1046	Básica
210	467	Básica
210	194	Básica
210	293	Básica
210	420	Básica
210	508	Básica
210	412	Básica
210	478	Básica
210	171	Básica
210	1379	Básica
210	179	Básica
210	1043	Básica
210	189	Básica
210	439	Básica
210	10	Básica
210	152	Básica
210	162	Básica
210	245	Básica
210	212	Básica
200	1052	Básica
200	1021	Básica
200	1020	Básica
76	346	Complementar
89	346	Complementar
210	1048	Básica
210	1047	Básica
210	117	Básica
210	459	Básica
200	460	Básica
200	347	Básica
209	1010	Básica
13	399	Complementar
110	399	Complementar
210	1375	Básica
210	193	Básica
210	350	Básica
210	1062	Básica
210	383	Básica
209	398	Básica
39	33	Complementar
210	288	Básica
209	32	Básica
118	990	Básica
210	492	Básica
210	369	Básica
210	1191	Básica
210	300	Básica
210	811	Básica
210	990	Básica
210	192	Básica
210	263	Básica
209	905	Básica
210	178	Básica
34	23	Complementar
22	22	Complementar
34	22	Complementar
80	23	Complementar
210	254	Básica
210	253	Básica
210	979	Básica
210	491	Básica
210	490	Básica
204	463	Básica
93	464	Básica
209	991	Básica
16	464	Complementar
210	232	Básica
210	231	Básica
40	315	Básica
204	243	Básica
200	1022	Básica
22	1465	Básica
65	132	Complementar
25	132	Complementar
204	131	Básica
204	378	Básica
204	903	Básica
13	985	Complementar
204	388	Básica
204	379	Básica
204	488	Básica
209	1194	Básica
9	1381	Básica
204	408	Básica
75	1381	Básica
64	1189	Básica
81	712	Básica
204	265	Básica
88	85	Complementar
22	747	Complementar
69	1188	Básica
210	213	Básica
196	1124	Complementar
180	1124	Básica
210	94	Básica
120	984	Básica
210	147	Básica
210	148	Básica
204	15	Básica
31	342	Básica
204	340	Básica
133	1191	Básica
133	997	Complementar
133	39	Complementar
133	1194	Complementar
133	1637	Básica
133	1202	Básica
133	1636	Complementar
133	1638	Complementar
210	520	Básica
204	452	Básica
204	211	Básica
209	1190	Básica
59	1376	Complementar
210	257	Básica
209	441	Básica
210	180	Básica
210	224	Básica
92	540	Complementar
31	540	Complementar
157	540	Complementar
82	727	Básica
204	181	Básica
76	6	Complementar
97	6	Complementar
89	6	Complementar
34	52	Complementar
210	127	Básica
204	292	Básica
210	996	Básica
210	393	Básica
41	200	Básica
204	47	Básica
204	63	Básica
209	989	Básica
57	1016	Complementar
9	1016	Complementar
75	1016	Básica
204	442	Básica
206	1638	Complementar
6	731	Complementar
2	169	Complementar
96	986	Básica
13	1200	Básica
21	1440	Básica
97	346	Complementar
90	294	Complementar
22	100	Básica
109	1638	Básica
109	1202	Básica
109	1639	Complementar
134	1640	Complementar
134	1639	Complementar
134	1638	Complementar
134	1202	Complementar
38	465	Complementar
47	200	Complementar
64	519	Complementar
177	1113	Básica
58	1113	Básica
66	1113	Complementar
64	1113	Complementar
64	159	Básica
49	7	Básica
49	60	Complementar
69	149	Complementar
72	1640	Complementar
72	1639	Complementar
72	1638	Complementar
83	1638	Complementar
83	1640	Complementar
83	1639	Complementar
43	1638	Básica
43	1639	Complementar
61	1638	Básica
61	1639	Complementar
63	238	Complementar
63	1639	Complementar
63	1640	Complementar
63	1638	Complementar
24	1202	Complementar
24	1039	Complementar
103	1154	Básica
103	444	Complementar
103	413	Complementar
103	3	Complementar
103	324	Complementar
\.


--
-- Data for Name: curriculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY curriculo (id_c, ch_comp_opt_livres, ch_opt_minima, ch_periodo_maxima, ch_periodo_media, ch_periodo_minima, codigo, matriz_curricular, municipio, prazo_conclusao_maximo, prazo_conclusao_medio, prazo_conclusao_minimo, semestre_vigor, unidade_vinculacao, id_curso) FROM stdin;
2	0	0	0	0	0	2010.1	0	0	0	0	0	0	0	2
3	0	0	0	0	0	2010.1	0	0	0	0	0	0	0	3
4	0	0	0	0	0	2013.1	0	0	0	0	0	0	0	4
1 	0	0	0	0	0	2014.1	0	0	0	0	0	0	0	1
6 	0	0	0	0	0	2015.1	0	0	0	0	0	0	0	6
7	0	0	0	0	0	2015.1	0	0	0	0	0	0	0	7
8	0	0	0	0	0	2016.1	0	0	0	0	0	0	0	1
9	0	0	0	0	0	2015.1	0	0	0	0	0	0	0	8
\.


--
-- Name: curriculo_id_c_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('curriculo_id_c_seq', 1, false);


--
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY curso (id_crs, cod_c, nome_c, sigla) FROM stdin;
1	401	Sistemas de Informação	SI
2	402	Engenharia de Software	ES
3	403	Redes de Computadores	RC
4	404	Ciência da Computação	CC
6	406	Design Digital	DD
7	405	Engenharia de Computação	EC
8	999	Biblioteca Quixadá	BCQ
\.


--
-- Name: curso_id_crs_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('curso_id_crs_seq', 1, false);


--
-- Data for Name: componentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY componentes (id_c, cod_d, nome ,ch_pratica , ch_teorica, tipo) FROM stdin;
1	QXD0108	INTRODUÇÃO À CIÊNCIA DA COMPUTAÇÃO	0	0	0
2	QXD0001	FUNDAMENTOS DE PROGRAMAÇÃO	0	0	0
3	QXD0002	INTRODUÇÃO A CIÊNCIA DA COMPUTAÇÃO E SISTEMAS DE INFORMAÇÃO	0	0	0
6	QXD0005	ARQUITETURA DE COMPUTADORES	0	0	0
7	QXD0006	CÁLCULO DIFERENCIAL E INTEGRAL I	0	0	0
8	QXD0007	PROGRAMAÇÃO ORIENTADA A OBJETOS	0	0	0
9	QXD0008	MATEMÁTICA DISCRETA	0	0	0
10	QXD0009	TEORIA GERAL DE SISTEMAS	0	0	0
11	QXD0010	ESTRUTURA DE DADOS	0	0	0
12	QXD0011	FUNDAMENTOS DE BANCO DE DADOS	0	0	0
13	QXD0012	PROBABILIDADE E ESTATÍSTICA	0	0	0
14	QXD0013	SISTEMAS OPERACIONAIS	0	0	0
15	QXD0014	ANÁLISE E PROJETO DE SISTEMAS	0	0	0
17	QXD0016	LINGUAGENS DE PROGRAMAÇÃO	0	0	0
18	QXD0017	LÓGICA PARA COMPUTAÇÃO	0	0	0
19	QXD0018	CONSTRUÇÃO DE SISTEMAS DE GERÊNCIA DE BANCO DE DADOS	0	0	0
20	QXD0019	ENGENHARIA DE SOFTWARE	0	0	0
21	QXD0020	DESENVOLVIMENTO DE SOFTWARE PARA WEB	0	0	0
22	QXD0021	REDES DE COMPUTADORES	0	0	0
23	QXD0022	AUDITORIA DE SEGURANÇA DE SISTEMAS DE INFORMAÇÃO	0	0	0
24	QXD0023	GERÊNCIA DE PROJETOS DE SOFTWARE	0	0	0
25	QXD0024	AVALIAÇÃO DE SISTEMAS	0	0	0
26	QXD0025	COMPILADORES	0	0	0
27	QXD0026	CONTABILIDADE E CUSTOS	0	0	0
28	QXD0027	E-BUSINESS	0	0	0
29	QXD0028	ECONOMIA E FINANÇAS	0	0	0
30	QXD0029	EMPREENDEDORISMO	0	0	0
32	QXD0031	FILOSOFIA DA CIÊNCIA	0	0	0
33	QXD0032	FUNÇÕES EMPRESARIAIS	0	0	0
34	QXD0033	GERÊNCIA DE REDES	0	0	0
35	QXD0034	GERÊNCIA DE PROJETOS	0	0	0
36	QXD0035	INGLÊS INSTRUMENTAL I	0	0	0
37	QXD0036	INGLÊS INSTRUMENTAL II	0	0	0
38	QXD0037	INTELIGÊNCIA ARTIFICIAL	0	0	0
39	QXD0038	INTERFACE HUMANO-COMPUTADOR	0	0	0
40	QXD0039	INTRODUÇÃO A COMPUTAÇÃO GRAFICA	0	0	0
41	QXD0040	LINGUAGENS FORMAIS E AUTOMATOS	0	0	0
42	QXD0041	PROJETO E ANALISE DE ALGORITMOS	0	0	0
43	QXD0042	QUALIDADE DE SOFTWARE	0	0	0
44	QXD0043	SISTEMAS DISTRIBUIDOS	0	0	0
45	QXD0044	SISTEMAS MULTIMIDIA	0	0	0
47	QXD0046	TEORIA DA COMPUTAÇÃO	0	0	0
48	QXD0047	TOPICOS AVANÇADOS EM BANCO DE DADOS	0	0	0
49	QXD0048	TOPICOS AVANÇADOS EM REDES DE COMPUTADORES	0	0	0
51	QXD0050	TOPICOS ESPECIAIS I	0	0	0
52	QXD0051	TOPICOS ESPECIAIS II	0	0	0
53	QXD0052	TOPICOS ESPECIAIS III	0	0	0
54	QXD0053	TOPICOS ESPECIAIS IV	0	0	0
56	QXD0055	INTRODUÇÃO A COMPUTAÇÃO E ENGENHARIA DE SOFTWARE	0	0	0
57	QXD0056	MATEMÁTICA BÁSICA	0	0	0
58	QXD0057	INTRODUÇÃO A PROCESSO E REQUISITOS DE SOFTWARE	0	0	0
59	QXD0058	PROJETO DETALHADO DE SOFTWARE	0	0	0
60	QXD0059	REDES E SISTEMAS DISTRIBUÍDOS	0	0	0
61	QXD0060	PROCESSOS DE SOFTWARE	0	0	0
62	QXD0061	REQUISITOS DE SOFTWARE	0	0	0
63	QXD0062	MANUTENÇÃO DE SOFTWARE	0	0	0
64	QXD0063	VERIFICAÇÃO E VALIDAÇÃO	0	0	0
65	QXD0064	ARQUITETURA DE SOFTWARE	0	0	0
66	QXD0065	ESPECIFICAÇÃO FORMAL DE SOFTWARE	0	0	0
67	QXD0066	GERÊNCIA DE CONFIGURAÇÃO	0	0	0
68	QXD0067	LEITURA DE SOFTWARE	0	0	0
69	QXD0068	REUSO DE SOFTWARE	0	0	0
71	QXD0074	DESENVOLVIMENTO DE SOFTWARE CONCORRENTE	0	0	0
72	QXD0075	REDES SOCIAIS	0	0	0
73	QXD0076	SISTEMAS MULTIAGENTES	0	0	0
74	QXD0081	INFORMATICA E ORGANIZAÇÃO DE COMPUTADORES	0	0	0
76	QXD0083	MÉTODOS E TÉCNICAS DE PESQUISA	0	0	0
77	QXD0084	ADMINISTRAÇÃO DE SISTEMAS OPERACIONAIS LINUX	0	0	0
78	QXD0085	ADMINISTRAÇÃO DE SISTEMAS OPERACIONAIS WINDOWS	0	0	0
79	QXD0086	INTERNET E ARQUITETURA TCP/IP	0	0	0
80	QXD0087	LABORATÓRIO EM INFRAESTRUTURA DE REDES DE COMPUTADORES	0	0	0
81	QXD0088	PROGRAMAÇÃO DE SCRIPT	0	0	0
82	QXD0089	REDES DE ALTA VELOCIDADE	0	0	0
83	QXD0090	REDES DE COMUNICAÇÕES MÓVEIS	0	0	0
85	QXD0092	SERVIÇOS DE REDES DE COMPUTADORES	0	0	0
86	QXD0093	ANÁLISE DE DESEMPENHO DE REDES DE COMPUTADORES	0	0	0
87	QXD0094	GESTÃO DE TECNOLOGIA DA INFORMAÇÃO E COMUNICAÇÃO	0	0	0
88	QXD0095	PROJETO INTEGRADO EM REDES DE COMPUTADORES	0	0	0
90	QXD0099	DESENVOLVIMENTO DE SOFTWARE PARA PERSISTÊNCIA	0	0	0
91	QXD0102	DESENVOLVIMENTO DE SOFTWARE PARA DISPOSITIVOS MÓVEIS	0	0	0
94	QXD0107	PROGRAMAÇÃO LINEAR	0	0	0
96	QXD0109	PRÉ-CÁLCULO	0	0	0
98	QXD0113	LINGUA BRASILEIRA DE SINAIS - LIBRAS	0	0	0
99	1111111	PRÁTICAS EM TECNOLOGIA DA INFORMAÇÃO I	0	0	0
100	QXD0071	INTEGRAÇÃO DE APLICAÇÕES	0	0	0
101	QXD0073	MÉTODOS E FERRAMENTAS DA ENGENHARIA DE SOFTWARE	0	0	0
102	QXD0070	ESTIMATIVA DE CUSTOS EM PROJETOS DE SOFTWARE	0	0	0
103	QXD0072	EXPERIMENTAÇÃO EM ENGENHARIA DE SOFTWARE	0	0	0
104	1111112	PRÁTICAS EM TECNOLOGIA DA INFORMAÇÃO II	0	0	0
105	QXD0078	INTRODUÇÃO AO DESENVOLVIMENTO DE JOGOS	0	0	0
106	PRG0003	EDUCAÇAO AMBIENTAL	0	0	0
107	PRG0002	RELAÇOES ETNICO-RACIAIS E AFRICANIDADES	0	0	0
108	QXD0114	PROGRAMAÇÃO FUNCIONAL	0	0	0
109	QXD0115	ESTRUTURA DE DADOS AVANÇADA	0	0	0
110	1111113	ALGORITMOS PROBABILÍSTICOS	0	0	0
97	QXD0110	PROJETO DE PESQUISA CIENTÍFICA E TECNOLÓGICA	0	0	0
111	1111114	ANALISE E DESEMPENHO DE SISTEMAS	0	0	0
75	QXD0082	MATEMÁTICA COMPUTACIONAL RC	0	0	0
70	QXD0069	SEGURANÇA ES CC	0	0	0
84	QXD0091	SEGURANÇA DA INFORMAÇÃO RC	0	0	0
46	QXD0045	SOCIOLOGIA SI	0	0	0
50	QXD0049	TRABALHO COOPERATIVO BASEADO EM COMPUTADORE	0	0	0
16	QXD0015	GESTÃO DA INFORMAÇÃO E DOS SISTEMAS DE INFORMAÇÃO E GESTÃO DA INF E CONHEC	0	0	0
93	QXD0106	GOVERNANÇA ESTRATÉGICA DE TECNOLOGIA DA INFORMAÇÃO E GESTÃO DE TI	0	0	0
92	QXD0103	ÉTICA DIREITO E LEGISLAÇÃO CC EC RC	0	0	0
55	QXD0054	ÉTICA NORMAS E POSTURA PROFISSIONAL ES	0	0	0
113	1111116	COMPUTAÇÃO PARALELA	0	0	0
114	1111117	CRIPTOGRAFIA	0	0	0
116	1111119	CÁLCULO NUMÉRICO	0	0	0
117	1111120	ESTATÍSTICA MULTIVARIADA	0	0	0
118	1111121	FÍSICA I	0	0	0
119	1111122	LÓGICA MODAL	0	0	0
120	1111123	MINERAÇÃO DE DADOS	0	0	0
121	1111124	MODELAGEM E SIMULAÇÃO DISCRETA DE SISTEMA	0	0	0
122	1111125	OTIMIZAÇÃO COMBINATÓRIA	0	0	0
123	1111126	PESQUISA OPERACIONAL	0	0	0
124	1111127	PROCESSAMENTO DE IMAGEM	0	0	0
126	1111129	RECUPERAÇÃO DE INFORMAÇÃO	0	0	0
127	1111130	TEORIA DA PROVA	0	0	0
128	1111131	TEORIA DOS GRAFOS	0	0	0
129	1111132	VISÃO COMPUTACIONAL	0	0	0
131	PRG0004	EDUCAÇÃO EM DIREITOS HUMANOS	0	0	0
133	QXD0154	GESTÃO DE PROCESSOS DE NEGÓCIOS	0	0	0
132	PRG0005	DIFERENÇA E ENFRENTAMENTO PROFISSIONAL NAS DESIGUALDADES SOCIAIS	0	0	0 
112	1111115	APRENDIZADO DE MÁQUINA	0	0	0
134	QXD0116	ÁLGEBRA LINEAR	0	0	0
135	QXD0119	COMPUTAÇÃO GRÁFICA	0	0	0
136	1111234	DESAFIOS DE PROGRAMAÇÃO	0	0	0
137	QXD0121	DESENHO I	0	0	0
138	QXD0122	HISTÓRIA DA ARTE	0	0	0
139	QXD0123	EDIÇÃO DIGITAL DE IMAGENS	0	0	0
140	QXD0124	MULTIMÍDIA	0	0	0
141	QXD0125	INTRODUÇÃO À PROGRAMAÇÃO PARA DESIGN 	0	0	0
142	QXD0126	PSICOLOGIA E PERCEPÇÃO	0	0	0
143	QXD0127	COMUNICAÇÃO VISUAL I	0	0	0
144	QXD0128	DESENHO II	0	0	0
145	QXD0129	PROGRAMAÇÃO PARA DESIGN	0	0	0
146	QXD0130	HISTÓRIA DO DESIGN	0	0	0
147	QXD0159	MODELAGEM TRIDIMENSIONAL	0	0	0
148	QXD0160	PROJETO INTEGRADO I	0	0	0
150	QXD0162	SOCIEDADE   CULTURA E TECNOLOGIAS	0	0	0
151	QXD0163	COMUNICAÇÃO VISUAL II	0	0	0
152	QXD0164	LINGUAGENS DE MARCAÇÃO E SCRIPTS	0	0	0
153	QXD0165	PROJETO INTEGRADO II	0	0	0
154	QXD0166	DIREÇÃO DE ARTE	0	0	0
155	1112233	PROCESSOS DE CRIAÇÃO	0	0	0
158	111222	TIPOGRAFIA	0	0	0
159	111122	PROJETO INTEGRADO III	0	0	0
160	1111225	CONCEPÇÃO E DESENVOLVIMENTO DE PRODUTOS	0	0	0
161	110026	PROJETO DE INTERFACES PARA DISPOSITIVOS MÓVEIS	0	0	0
162	1111226	DESIGN E INOVAÇÃO	0	0	0
163	211133	PROJETO INTEGRADO IV	0	0	0
164	1111224	FOTOGRAFIA	0	0	0
165	111334	JOGOS ELETRÔNICOS	0	0	0
167	111445	DESIGN DE SISTEMAS COLABORATIVOS	0	0	0
168	221111	ERGONOMIA	0	0	0
170	2211111	ARQUITETURA DA INFORMAÇÃO	0	0	0
171	111227	CINEMA E ANIMAÇÃO	0	0	0
172	111133	PROTOTIPAÇÃO RÁPIDA	0	0	0
173	111225	MARKETING    DD	0	0	0
174	241112	USER EXPERIENCE UX	0	0	0
156	111132	PROJETO DE INTERFACES WEB	0	0	0
176	QXD0117	CIRCUITOS DIGITAIS	0	0	0
177	QXD0118	INTRODUÇÃO À ENGENHARIA DE COMPUTAÇÃO	0	0	0
178	QXD0142	INTRODUÇÃO À ARQUITETURA DE COMPUTADORES	0	0	0
179	QXD0132	ARQUITETURA E ORGANIZAÇÃO DE COMPUTADORES I	0	0	0
180	QXD0147	SISTEMAS OPERACIONAIS I	0	0	0
181	QXD0149	TÉCNICAS DE PROGRAMAÇÃO PARA SISTEMAS EMBARCADOS I	0	0	0
182	QXD0133	ARQUITETURA E ORGANIZAÇÃO DE COMPUTADORES II	0	0	0
183	QXD0140	EQUAÇÕES DIFERENCIAIS	0	0	0
184	QXD0148	SISTEMAS OPERACIONAIS II	0	0	0
185	QXD0150	TÉCNICAS DE PROGRAMAÇÃO PARA SISTEMAS EMBARCADOS II 	0	0	0
186	QXD0131	ANÁLISE DE CIRCUITOS	0	0	0
187	QXD0136	ELETRICIDADE E MAGNETISMO	0	0	0
188	QXD0139	ENGENHARIA DE SOFTWARE             EC	0	0	0
189	QXD143	MICROCONTROLADORES	0	0	0
190	QXD0146	SISTEMAS DIGITAIS PARA COMPUTADORES	0	0	0
191	QXD0137	ELETRÔNICA FUNDAMENTAL I	0	0	0
192	QXD0144	SINAIS E SISTEMAS	0	0	0
193	QXD0138	ELETRÔNICA FUNDAMENTAL II	0	0	0
194	QXD0151	SISTEMAS DE AUTOMAÇÃO E CONTROLE	0	0	0
195	QXD0141	INSTRUMENTAÇÃO	0	0	0
196	QXD0145	SISTEMAS DE TEMPO REAL	0	0	0
197	QXD0135	CÁLCULO DIFERENCIAL E INTEGRAL III 	0	0	0
199	QXD0079	COMPUTAÇÃO EM NUVEM	0	0	0
130	QXD0120	MATEMÁTICA COMPUTACIONAL CC	0	0	0
89	QXD0096	PROJETO DE PESQUISA CIENTÍFICA E TECNOLÓGICA  RC	0	0	0
175	333334	PRÁTICAS EM DESIGN	0	0	0
125	1111128	REALIDADE VIRTUAL CC	0	0	0
201	8889989	REALIDADE VIRTUAL DD	0	0	0
203	9990000	SISTEMAS EMBARCADOS	0	0	0
169	211324	SOCIOLOGIA E ANTROPOLOGIA DD	0	0	0
198	QXD0004	TEORIA GERAL DA ADMINISTRAÇÃO   INTROD ADM	0	0	0
204	BCQ0002	BCQ EDIÇÕES ANTERIORES	0	0	0
205	QXD9999	SEMINÁRIOS DD	0	0	0
206	2349494	AVALIAÇÃO DA INTERAÇÃO HUMANO COMPUTADOR	0	0	0
157	1112234	ÉTICA E LEGISLAÇÃO DD	0	0	0
31	QXD0030	ÉTICA DIREITO E LEGISLAÇÃO SI	0	0	0
207	BCQ0003	BCQ TECNICO COM EXEMPLAR UNICO E NAO PODE SER COMPLEMENTAR	0	0	0
208	BCQ0004	BCQ VERIFICAR	0	0	0
149	QXD0161	SEMIÓTICA DD	0	0	0
202	4449999	ENGENHARIA SEMIÓTICA DD	0	0	0
209	BCQ0005	BCQ COMPLEMENTA QUANTIDADE	0	0	0
200	BCQ0001	BCQ LITERATURA E TÉCNICO	0	0	0
210	BCQ0006	BCQ DISPONÍVEL MAS NÃO ALOCADO EM DISCIPLINAS	0	0	0
115	QXD0134	CÁLCULO DIFERENCIAL E INTEGRAL II	0	0	0
\.


--
-- Name: componentes_id_c_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('componentes_id_c_seq', 1, false);


--
-- Data for Name: exemplarconflitante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY exemplarconflitante (id_ef, autor, cod_ef, discricao_erro, edicao, isbn, linhaerro, pagina, publicador, ref_artigo, sub_titulo, tipo, titulo, titulo_revista, titulo_n) FROM stdin;
1	MONTENEGRO, Abelardo F.	14137453	 ISBN inválido, 	   		28	 181 p. 	 Fortaleza: UFC, Casa de José de Alencar, 2002.	 (Coleção Alagadiço Novo ; 296).	 um pioneiro da sociologia regional no Ceará.	0	 Júlio de Mattos Ibiapina:  		
2	MONTENEGRO, Abelardo F.	14137454	 ISBN inválido, 	   		29	 181 p. 	 Fortaleza: UFC, Casa de José de Alencar, 2002.	 (Coleção Alagadiço Novo ; 296).	 um pioneiro da sociologia regional no Ceará.	0	 Júlio de Mattos Ibiapina:  		
3	MONTENEGRO, Abelardo F.	14137455	 ISBN inválido, 	   		30	 181 p. 	 Fortaleza: UFC, Casa de José de Alencar, 2002.	 (Coleção Alagadiço Novo ; 296).	 um pioneiro da sociologia regional no Ceará.	0	 Júlio de Mattos Ibiapina:  		
4	NASCIMENTO, F. S.	14137492	 ISBN inválido, 	   		41	 124 p. 	 Fortaleza: UFC/Casa Jose de Alencar, 1995.	 	 sistema de fonometria poemática .	0	 Teoria da Versificação moderna:  		
5	NASCIMENTO, F. S.	14137493	 ISBN inválido, 	   		42	 124 p. 	 Fortaleza: UFC/Casa Jose de Alencar, 1995.	 	 sistema de fonometria poemática .	0	 Teoria da Versificação moderna:  		
6	NASCIMENTO, F. S.	14137494	 ISBN inválido, 	   		43	 124 p. 	 Fortaleza: UFC/Casa Jose de Alencar, 1995.	 	 sistema de fonometria poemática .	0	 Teoria da Versificação moderna:  		
7	MENEZES NETO, Paulo Elpidio de.	14137482	 ISBN inválido, 	   		44	 130 p. 	 Fortaleza: UFC, Casa de José de Alencar, 1996.	 (Alagadico Novo; 64).	 	0	 Os caminhos da unidade germânica. 		
8	MENEZES NETO, Paulo Elpidio de.	14137483	 ISBN inválido, 	   		45	 130 p. 	 Fortaleza: UFC, Casa de José de Alencar, 1996.	 (Alagadico Novo; 64).	 	0	 Os caminhos da unidade germânica. 		
9	MENEZES NETO, Paulo Elpidio de.	14137484	 ISBN inválido, 	   		46	 130 p. 	 Fortaleza: UFC, Casa de José de Alencar, 1996.	 (Alagadico Novo; 64).	 	0	 Os caminhos da unidade germânica. 		
10	SWOKOWSKI, Earl William.	14034196	 ISBN inválido, 	   2.ed.		101	 2v. 	  Sao Paulo: McGraw-Hill, 1983.	 	 	0	 Calculo com geometria analitica. 		
11	KROMMEN, Rita.	14137596	 ISBN inválido, 	   		106	 300p 	 Fortaleza: Casa de José de Alencar,UFC, 1997.	 	 e a companhia das índias ocidentais: (o domínio holandês no Ceará colonial).	0	 Mathias Beck:  		
12	KROMMEN, Rita.	14137597	 ISBN inválido, 	   		107	 300p 	 Fortaleza: Casa de José de Alencar,UFC, 1997.	 	 e a companhia das índias ocidentais: (o domínio holandês no Ceará colonial).	0	 Mathias Beck:  		
13	KROMMEN, Rita.	14137598	 ISBN inválido, 	   		108	 300p 	 Fortaleza: Casa de José de Alencar,UFC, 1997.	 	 e a companhia das índias ocidentais: (o domínio holandês no Ceará colonial).	0	 Mathias Beck:  		
14	MARTINS, Ana Carolina Borges Leão.	14137148	 ISBN inválido, 	   		109	 128p. 	 Fortaleza: Edições UFC, 2001.	 (Coleção Alagadiço Novo ;).	 	0	 A vida sem poesia e bem pequena. 		
15	MARTINS, Ana Carolina Borges Leão.	14137149	 ISBN inválido, 	   		110	 128p. 	 Fortaleza: Edições UFC, 2001.	 (Coleção Alagadiço Novo ;).	 	0	 A vida sem poesia e bem pequena. 		
16	MARTINS, Ana Carolina Borges Leão.	14137150	 ISBN inválido, 	   		111	 128p. 	 Fortaleza: Edições UFC, 2001.	 (Coleção Alagadiço Novo ;).	 	0	 A vida sem poesia e bem pequena. 		
17	Azevedo. Rubens de.	14137413	 ISBN inválido, 	   		112	 226p. 	 Fortaleza: Edições UFC, 1996.	 (Coleção Alagadiço Novo ; 63).	 	0	 Memorias de um caçador de estrelas. 		
18	Azevedo. Rubens de.	14137414	 ISBN inválido, 	   		113	 226p. 	 Fortaleza: Edições UFC, 1996.	 (Coleção Alagadiço Novo ; 63).	 	0	 Memorias de um caçador de estrelas. 		
19	Azevedo. Rubens de.	14137415	 ISBN inválido, 	   		114	 226p. 	 Fortaleza: Edições UFC, 1996.	 (Coleção Alagadiço Novo ; 63).	 	0	 Memorias de um caçador de estrelas. 		
20	LIMA, Herman.	14137138	 ISBN inválido, 	   2.ed.		115	 158p. 	 Ceará: UFC, Casa de José de Alencar, 1997.	 	 	0	 Imagens do Ceará. 		
21	LIMA, Herman.	14137139	 ISBN inválido, 	   2.ed.		116	 158p. 	 Ceará: UFC, Casa de José de Alencar, 1997.	 	 	0	 Imagens do Ceará. 		
22	LIMA, Herman.	14137140	 ISBN inválido, 	   2.ed.		117	 158p. 	 Ceará: UFC, Casa de José de Alencar, 1997.	 	 	0	 Imagens do Ceará. 		
23	MONTENEGRO, Braga.	14137460	 ISBN inválido, 	   3.ed.		121	 174p 	 Fortaleza: Edições UFC, 1997.	 	 	0	 Uma chama ao vento. 		
24	MONTENEGRO, Braga.	14137461	 ISBN inválido, 	   3.ed.		122	 174p 	 Fortaleza: Edições UFC, 1997.	 	 	0	 Uma chama ao vento. 		
25	MONTENEGRO, Braga.	14137462	 ISBN inválido, 	   3.ed.		123	 174p 	 Fortaleza: Edições UFC, 1997.	 	 	0	 Uma chama ao vento. 		
26	MAIA FILHO, Napoleão Nunes.	14137525	 ISBN inválido, 	   		132	 208p. 	 Fortaleza: Casa José de Alencar, 2002.	 	 introdução ao estudo do sistema recursal .	0	 O Direito de recorrer:  		
27	MAIA FILHO, Napoleão Nunes.	14137526	 ISBN inválido, 	   		133	 208p. 	 Fortaleza: Casa José de Alencar, 2002.	 	 introdução ao estudo do sistema recursal .	0	 O Direito de recorrer:  		
28	BARROSO, Gustavo.	14137518	 ISBN inválido, 	   		134	 202p. 	 Fortaleza: Casa José de Alencar, 1996.	 (Coleção Alagadiço Novo ;).	 	0	 Mississipi. 		
29	BARROSO, Gustavo.	14137519	 ISBN inválido, 	   		135	 202p. 	 Fortaleza: Casa José de Alencar, 1996.	 (Coleção Alagadiço Novo ;).	 	0	 Mississipi. 		
30	BARROSO, Gustavo.	14137520	 ISBN inválido, 	   		136	 202p. 	 Fortaleza: Casa José de Alencar, 1996.	 (Coleção Alagadiço Novo ;).	 	0	 Mississipi. 		
31	GUERRA FILHO, Willis Santiago.	14137523	 ISBN inválido, 	   Ed. refundida.		137	 188 p. 	 Fortaleza, CE: Casa Jose de Alencar/Programa Editorial, 1999.	 	 (conceitos de filosofia).	0	 Para uma filosofia da filosofia:  		
32	GUERRA FILHO, Willis Santiago.	14137524	 ISBN inválido, 	   Ed. refundida.		138	 188 p. 	 Fortaleza, CE: Casa Jose de Alencar/Programa Editorial, 1999.	 	 (conceitos de filosofia).	0	 Para uma filosofia da filosofia:  		
33	MARTINS, Fran.	14137504	 ISBN inválido, 	   2.ed.		139	 169p. 	 Fortaleza: Casa de José de Alencar,UFC, 1999.	 (Coleção Alagadiço Novo ; 195).	 	0	 Ponta de rua /. 		
34	MARTINS, Fran.	14137505	 ISBN inválido, 	   2.ed.		140	 169p. 	 Fortaleza: Casa de José de Alencar,UFC, 1999.	 (Coleção Alagadiço Novo ; 195).	 	0	 Ponta de rua /. 		
35	MARTINS, Fran.	14137506	 ISBN inválido, 	   2.ed.		141	 169p. 	 Fortaleza: Casa de José de Alencar,UFC, 1999.	 (Coleção Alagadiço Novo ; 195).	 	0	 Ponta de rua /. 		
36	MARTINS, Fran.	14137498	 ISBN inválido, 	   		142	 278p. 	 Fortaleza: Casa de José de Alencar,UFC, 1997.	 (Coleção Alagadiço Novo ; 120).	 romance .	0	 Nós somos jovens ::  		
37	MARTINS, Fran.	14137499	 ISBN inválido, 	   		143	 278p. 	 Fortaleza: Casa de José de Alencar,UFC, 1997.	 (Coleção Alagadiço Novo ; 120).	 romance .	0	 Nós somos jovens ::  		
38	MARTINS, Fran.	14137500	 ISBN inválido, 	   		144	 278p. 	 Fortaleza: Casa de José de Alencar,UFC, 1997.	 (Coleção Alagadiço Novo ; 120).	 romance .	0	 Nós somos jovens ::  		
39	MARTINS, Fran.	14137121	 ISBN inválido, 	   3.ed.		145	 230p 	 Fortaleza: Casa de José de Alencar,UFC, 2000.	 (Coleção Alagadiço Novo ; 248).	 Romance .	0	 Mundo perdido:  		
40	MARTINS, Fran.	14137122	 ISBN inválido, 	   3.ed.		146	 230p 	 Fortaleza: Casa de José de Alencar,UFC, 2000.	 (Coleção Alagadiço Novo ; 248).	 Romance .	0	 Mundo perdido:  		
41	MARTINS, Fran.	14137123	 ISBN inválido, 	   3.ed.		147	 230p 	 Fortaleza: Casa de José de Alencar,UFC, 2000.	 (Coleção Alagadiço Novo ; 248).	 Romance .	0	 Mundo perdido:  		
42	MARTINS, Fran.	14137207	 ISBN inválido, 	   2.ed.		148	 151p. 	 Fortaleza: Casa de José de Alencar,UFC, 2000.	 (Coleção Alagadiço Novo ; 238).	 contos /.	0	 O amigo de infância ::  		
43	MARTINS, Fran.	14137208	 ISBN inválido, 	   2.ed.		149	 151p. 	 Fortaleza: Casa de José de Alencar,UFC, 2000.	 (Coleção Alagadiço Novo ; 238).	 contos /.	0	 O amigo de infância ::  		
44	MARTINS, Fran.	14137209	 ISBN inválido, 	   2.ed.		150	 151p. 	 Fortaleza: Casa de José de Alencar,UFC, 2000.	 (Coleção Alagadiço Novo ; 238).	 contos /.	0	 O amigo de infância ::  		
45	MARTINS, Fran.	14137514	 ISBN inválido, 	   		151	 230p. 	 Fortaleza: Casa de José de Alencar,UFC, 1997.	 (Coleção Alagadiço Novo ; 142).	 	0	 Pireu ida e volta e outras crônicas /. 		
46	MARTINS, Fran.	14137515	 ISBN inválido, 	   		152	 230p. 	 Fortaleza: Casa de José de Alencar,UFC, 1997.	 (Coleção Alagadiço Novo ; 142).	 	0	 Pireu ida e volta e outras crônicas /. 		
47	MARTINS, Fran.	14137516	 ISBN inválido, 	   		153	 230p. 	 Fortaleza: Casa de José de Alencar,UFC, 1997.	 (Coleção Alagadiço Novo ; 142).	 	0	 Pireu ida e volta e outras crônicas /. 		
48	LIMA, José Flávio Costa.	14137486	 ISBN inválido, 	   		158	 188 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1998.	 (Coleção Alagadiço Novo ; v. 187).	  valores éticos-sociais do empresariado, união pelo Ceará político- 1962, CIC - 1978.	0	 Revolução por consentimento:  		
49	LIMA, José Flávio Costa.	14137487	 ISBN inválido, 	   		159	 188 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1998.	 (Coleção Alagadiço Novo ; v. 187).	  valores éticos-sociais do empresariado, união pelo Ceará político- 1962, CIC - 1978.	0	 Revolução por consentimento:  		
50	LIMA, José Flávio Costa.	14137488	 ISBN inválido, 	   		160	 188 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1998.	 (Coleção Alagadiço Novo ; v. 187).	  valores éticos-sociais do empresariado, união pelo Ceará político- 1962, CIC - 1978.	0	 Revolução por consentimento:  		
51	GÖRGEN, Hermann Matthias; UNIVERSIDADE FEDERAL DO CEARÁ.	14137489	 ISBN inválido, 	   		165	 216, [21] p. 	 Fortaleza: UFC, Casa de José de Alencar, 1999.	 (Coleção Alagadiço Novo ; 230).	 história e salvamento do "grupo Görgen" (resumo autobiográfico).	0	 Uma vida contra Hitler:  		
52	GÖRGEN, Hermann Matthias; UNIVERSIDADE FEDERAL DO CEARÁ.	14137490	 ISBN inválido, 	   		166	 216, [21] p. 	 Fortaleza: UFC, Casa de José de Alencar, 1999.	 (Coleção Alagadiço Novo ; 230).	 história e salvamento do "grupo Görgen" (resumo autobiográfico).	0	 Uma vida contra Hitler:  		
53	GÖRGEN, Hermann Matthias; UNIVERSIDADE FEDERAL DO CEARÁ.	14137491	 ISBN inválido, 	   		167	 216, [21] p. 	 Fortaleza: UFC, Casa de José de Alencar, 1999.	 (Coleção Alagadiço Novo ; 230).	 história e salvamento do "grupo Görgen" (resumo autobiográfico).	0	 Uma vida contra Hitler:  		
54	MAIA FILHO, Napoleão Nunes.	14137521	 ISBN inválido, 	   		169	 129p. 	 Fortaleza: UFC, Casa de José de Alencar, 1998.	 (Coleção Alagadiço Novo ; v.175).	 	0	 Estudos tópicos de direito eleitoral. 		
55	MAIA FILHO, Napoleão Nunes.	14137522	 ISBN inválido, 	   		170	 129p. 	 Fortaleza: UFC, Casa de José de Alencar, 1998.	 (Coleção Alagadiço Novo ; v.175).	 	0	 Estudos tópicos de direito eleitoral. 		
56	PAIVA, Manoel de Oliveira.	14137152	 ISBN inválido, 	   		171	 197 p. 	 Fortaleza: UFC, Casa de José de Alencar, 1997.	 (Coleção Alagadiço Novo ; 101).	 	0	 Dona Guidinha do Poço. 		
57	PAIVA, Manoel de Oliveira.	14137153	 ISBN inválido, 	   		172	 197 p. 	 Fortaleza: UFC, Casa de José de Alencar, 1997.	 (Coleção Alagadiço Novo ; 101).	 	0	 Dona Guidinha do Poço. 		
58	PAIVA, Manoel de Oliveira.	14137154	 ISBN inválido, 	   		173	 197 p. 	 Fortaleza: UFC, Casa de José de Alencar, 1997.	 (Coleção Alagadiço Novo ; 101).	 	0	 Dona Guidinha do Poço. 		
59	VERÍSSIMO, Érico.	14064065	 ISBN inválido, 	 3. ed.		174	 110p. 	 Sao Paulo: Companhia das Letras, 2005.	 	 	0	 Ana Terra. 		
60	CARLOS, Maria.	14137163	 ISBN inválido, 	   		175	 95 p. 	 Fortaleza: UFC, Casa de José de Alencar, 2002.	 (Coleção Alagadiço Novo ; 307).	 	0	 Simplesmente Maria. 		
61	CARLOS, Maria.	14137164	 ISBN inválido, 	   		176	 95 p. 	 Fortaleza: UFC, Casa de José de Alencar, 2002.	 (Coleção Alagadiço Novo ; 307).	 	0	 Simplesmente Maria. 		
62	CARLOS, Maria.	14137165	 ISBN inválido, 	   		177	 95 p. 	 Fortaleza: UFC, Casa de José de Alencar, 2002.	 (Coleção Alagadiço Novo ; 307).	 	0	 Simplesmente Maria. 		
63	GONDIM, Carlos.	14137173	 ISBN inválido, 	   		226	 244p. 	 Fortaleza: Casa de José de Alencar,UFC, 1997.	 (Coleção Alagadiço Novo ; 115).	 	0	 Poemas do cárcere e ânsia revel. 		
64	GONDIM, Carlos.	14137174	 ISBN inválido, 	   		227	 244p. 	 Fortaleza: Casa de José de Alencar,UFC, 1997.	 (Coleção Alagadiço Novo ; 115).	 	0	 Poemas do cárcere e ânsia revel. 		
65	GONDIM, Carlos.	14137175	 ISBN inválido, 	   		228	 244p. 	 Fortaleza: Casa de José de Alencar,UFC, 1997.	 (Coleção Alagadiço Novo ; 115).	 	0	 Poemas do cárcere e ânsia revel. 		
66	MARTINS FILHO, Antônio; RIVAS MÁXIMUS, Sofia Elena Isabel; UNIVERSIDADE FEDERAL DO CEARÁ.	14137202	 ISBN inválido, 	   		373	 239 p. 	 Fortaleza: UFC/Casa de Jose de Alencar, 1998.	 (Coleção Alagadiço Novo ; 75).	 l944 a l998.	0	 Historia abreviada de la UFC:  		
67	MARTINS FILHO, Antônio; RIVAS MÁXIMUS, Sofia Elena Isabel; UNIVERSIDADE FEDERAL DO CEARÁ.	14137203	 ISBN inválido, 	   		374	 239 p. 	 Fortaleza: UFC/Casa de Jose de Alencar, 1998.	 (Coleção Alagadiço Novo ; 75).	 l944 a l998.	0	 Historia abreviada de la UFC:  		
68	MARTINS FILHO, Antônio; RIVAS MÁXIMUS, Sofia Elena Isabel; UNIVERSIDADE FEDERAL DO CEARÁ.	14137204	 ISBN inválido, 	   		375	 239 p. 	 Fortaleza: UFC/Casa de Jose de Alencar, 1998.	 (Coleção Alagadiço Novo ; 75).	 l944 a l998.	0	 Historia abreviada de la UFC:  		
69	BARROSO, Gustavo.	14137467	 ISBN inválido, 	   2. ed.		376	 [175] p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 2000.	 (Coleção Alagadiço Novo ; 257).	 	0	 A guerra de artigas, 1816-1820. 		
70	BARROSO, Gustavo.	14137468	 ISBN inválido, 	   2. ed.		377	 [175] p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 2000.	 (Coleção Alagadiço Novo ; 257).	 	0	 A guerra de artigas, 1816-1820. 		
71	BARROSO, Gustavo.	14137469	 ISBN inválido, 	   2. ed.		378	 [175] p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 2000.	 (Coleção Alagadiço Novo ; 257).	 	0	 A guerra de artigas, 1816-1820. 		
72	LIMAVERDE, Regine.	14137145	 ISBN inválido, 	   		379	 143p. 	 Fortaleza: UFC, Casa de José de Alencar, 1998.	 (Coleção  Alagadiço Novo ; 161).	 	0	 O limo e a várzea. 		
73	LIMAVERDE, Regine.	14137146	 ISBN inválido, 	   		380	 143p. 	 Fortaleza: UFC, Casa de José de Alencar, 1998.	 (Coleção  Alagadiço Novo ; 161).	 	0	 O limo e a várzea. 		
74	LIMAVERDE, Regine.	14137147	 ISBN inválido, 	   		381	 143p. 	 Fortaleza: UFC, Casa de José de Alencar, 1998.	 (Coleção  Alagadiço Novo ; 161).	 	0	 O limo e a várzea. 		
75	CARVALHO, Francisco.	14137170	 ISBN inválido, 	   		382	 227 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 2001.	 (Coleção Alagadiço Novo ; v. 269).	 	0	 Rascunhos e resenhas (registros literários). 		
76	CARVALHO, Francisco.	14137171	 ISBN inválido, 	   		383	 227 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 2001.	 (Coleção Alagadiço Novo ; v. 269).	 	0	 Rascunhos e resenhas (registros literários). 		
77	CARVALHO, Francisco.	14137172	 ISBN inválido, 	   		384	 227 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 2001.	 (Coleção Alagadiço Novo ; v. 269).	 	0	 Rascunhos e resenhas (registros literários). 		
78	MACEDO, Sérgio.	14137501	 ISBN inválido, 	   		385	 187 p. 	 [Fortaleza]: UFC, Casa de José de Alencar, 2002.	 (Coleção Alagadiço Novo ; v.288).	 	0	 Mercador de sonhos. 		
79	MACEDO, Sérgio.	14137502	 ISBN inválido, 	   		386	 187 p. 	 [Fortaleza]: UFC, Casa de José de Alencar, 2002.	 (Coleção Alagadiço Novo ; v.288).	 	0	 Mercador de sonhos. 		
80	MACEDO, Sérgio.	14137503	 ISBN inválido, 	   		387	 187 p. 	 [Fortaleza]: UFC, Casa de José de Alencar, 2002.	 (Coleção Alagadiço Novo ; v.288).	 	0	 Mercador de sonhos. 		
81	LIMA, Almery Cordeiro.	14137416	 ISBN inválido, 	   		388	 119 p 	 Fortaleza, CE: Edições UFC, Casa de José de Alencar, 2001.	 (Coleção Alagadiço Novo ; 290).	 	0	 Momentos. 		
82	LIMA, Almery Cordeiro.	14137417	 ISBN inválido, 	   		389	 119 p 	 Fortaleza, CE: Edições UFC, Casa de José de Alencar, 2001.	 (Coleção Alagadiço Novo ; 290).	 	0	 Momentos. 		
83	LIMA, Almery Cordeiro.	14137418	 ISBN inválido, 	   		390	 119 p 	 Fortaleza, CE: Edições UFC, Casa de José de Alencar, 2001.	 (Coleção Alagadiço Novo ; 290).	 	0	 Momentos. 		
84	ADERALDO, Mozart Soriano.	14137182	 ISBN inválido, 	   3. ed.		391	 254p. 	 Fortaleza: UFC, Casa de José de Alencar, 1998.	 (Coleção Alagadiço Novo ; 40).	 	0	 História abreviada de Fortaleza e crônicas sobre a cidade amada. 		
85	ADERALDO, Mozart Soriano.	14137183	 ISBN inválido, 	   3. ed.		392	 254p. 	 Fortaleza: UFC, Casa de José de Alencar, 1998.	 (Coleção Alagadiço Novo ; 40).	 	0	 História abreviada de Fortaleza e crônicas sobre a cidade amada. 		
86	ADERALDO, Mozart Soriano.	14137184	 ISBN inválido, 	   3. ed.		393	 254p. 	 Fortaleza: UFC, Casa de José de Alencar, 1998.	 (Coleção Alagadiço Novo ; 40).	 	0	 História abreviada de Fortaleza e crônicas sobre a cidade amada. 		
87	BARROSO, Gustavo.	14137511	 ISBN inválido, 	   3. ed.		394	 206  p. 	 [Fortaleza]: UFC, Casa de José de Alencar, 2000.	 (Coleção Alagadiço Novo ; v. 256).	 memórias.	0	 O consulado da China:  		
88	BARROSO, Gustavo.	14137512	 ISBN inválido, 	   3. ed.		395	 206  p. 	 [Fortaleza]: UFC, Casa de José de Alencar, 2000.	 (Coleção Alagadiço Novo ; v. 256).	 memórias.	0	 O consulado da China:  		
89	BARROSO, Gustavo.	14137513	 ISBN inválido, 	   3. ed.		396	 206  p. 	 [Fortaleza]: UFC, Casa de José de Alencar, 2000.	 (Coleção Alagadiço Novo ; v. 256).	 memórias.	0	 O consulado da China:  		
90	BARROSO, Gustavo.	14137442	 ISBN inválido, 	   3. ed.		397	 248 p. 	 [Fortaleza]: UFC, Casa de José de Alencar, 2000.	 	 memórias.	0	 Coração de menino:  		
91	BARROSO, Gustavo.	14137443	 ISBN inválido, 	   3. ed.		398	 248 p. 	 [Fortaleza]: UFC, Casa de José de Alencar, 2000.	 	 memórias.	0	 Coração de menino:  		
92	BARROSO, Gustavo.	14137444	 ISBN inválido, 	   3. ed.		399	 248 p. 	 [Fortaleza]: UFC, Casa de José de Alencar, 2000.	 	 memórias.	0	 Coração de menino:  		
93	BARROSO, Gustavo.	14137449	 ISBN inválido, 	   3. ed.		400	 196 p. 	 [Fortaleza]: UFC, Casa de José de Alencar, 2000.	 (Coleção Alagadiço Novo ; 252).	 memórias.	0	 Liceu do Ceará:  		
94	BARROSO, Gustavo.	14137450	 ISBN inválido, 	   3. ed.		401	 196 p. 	 [Fortaleza]: UFC, Casa de José de Alencar, 2000.	 (Coleção Alagadiço Novo ; 252).	 memórias.	0	 Liceu do Ceará:  		
95	BARROSO, Gustavo.	14137451	 ISBN inválido, 	   3. ed.		402	 196 p. 	 [Fortaleza]: UFC, Casa de José de Alencar, 2000.	 (Coleção Alagadiço Novo ; 252).	 memórias.	0	 Liceu do Ceará:  		
96	NASCIMENTO, Stela.	14137191	 ISBN inválido, 	   		414	 232p. 	 Foraleza: UFC, Casa de José de Alencar, 1997.	 (Coleção Alagadiço Novo ; 124).	 romance.	0	 O pacto:  		
97	NASCIMENTO, Stela.	14137192	 ISBN inválido, 	   		415	 232p. 	 Foraleza: UFC, Casa de José de Alencar, 1997.	 (Coleção Alagadiço Novo ; 124).	 romance.	0	 O pacto:  		
98	NASCIMENTO, Stela.	14137193	 ISBN inválido, 	   		416	 232p. 	 Foraleza: UFC, Casa de José de Alencar, 1997.	 (Coleção Alagadiço Novo ; 124).	 romance.	0	 O pacto:  		
99	BEZERRA, João Clímaco.	14137495	 ISBN inválido, 	   2. ed.		417	 238p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1997.	 (Coleção  Alagadiço Novo ; 139).	 	0	 Não há estrelas no céu. 		
100	BEZERRA, João Clímaco.	14137496	 ISBN inválido, 	   2. ed.		418	 238p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1997.	 (Coleção  Alagadiço Novo ; 139).	 	0	 Não há estrelas no céu. 		
101	BEZERRA, João Clímaco.	14137497	 ISBN inválido, 	   2. ed.		419	 238p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1997.	 (Coleção  Alagadiço Novo ; 139).	 	0	 Não há estrelas no céu. 		
102	LINHARES, Marcelo.	14137508	 ISBN inválido, 	   		420	 443 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1996.	 (Coleção Alagadiço Novo ; 94).	 sua época.	0	 Virgílio Távora:  		
103	LINHARES, Marcelo.	14137509	 ISBN inválido, 	   		421	 443 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1996.	 (Coleção Alagadiço Novo ; 94).	 sua época.	0	 Virgílio Távora:  		
104	LINHARES, Marcelo.	14137510	 ISBN inválido, 	   		422	 443 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1996.	 (Coleção Alagadiço Novo ; 94).	 sua época.	0	 Virgílio Távora:  		
105	MOREIRA, Vanderley.	14137456	 ISBN inválido, 	   		423	 176 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1998.	 (Coleção Alagadiço Novo ; v. 188).	 poesia.	0	 Canto imaterial:  		
106	MOREIRA, Vanderley.	14137457	 ISBN inválido, 	   		424	 176 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1998.	 (Coleção Alagadiço Novo ; v. 188).	 poesia.	0	 Canto imaterial:  		
107	MOREIRA, Vanderley.	14137458	 ISBN inválido, 	   		425	 176 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1998.	 (Coleção Alagadiço Novo ; v. 188).	 poesia.	0	 Canto imaterial:  		
108	LIMA, Socorro Farias.	14137446	 ISBN inválido, 	   		426	 166 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 2002.	 (Coleção  Alagadiço Novo ; 297).	 poemas.	0	 Caras recordações:  		
109	LIMA, Socorro Farias.	14137447	 ISBN inválido, 	   		427	 166 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 2002.	 (Coleção  Alagadiço Novo ; 297).	 poemas.	0	 Caras recordações:  		
110	LIMA, Socorro Farias.	14137448	 ISBN inválido, 	   		428	 166 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 2002.	 (Coleção  Alagadiço Novo ; 297).	 poemas.	0	 Caras recordações:  		
111	BARROSO, Gustavo.	14137478	 ISBN inválido, 	   2.ed.		430	 255 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 2000.	 (Coleção  Alagadiço Novo ; 260).	 contos e episódios da campanha cisplatina.	0	 A guerra do vidéo, 1825-1828:  		
112	BARROSO, Gustavo.	14137479	 ISBN inválido, 	   2.ed.		431	 255 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 2000.	 (Coleção  Alagadiço Novo ; 260).	 contos e episódios da campanha cisplatina.	0	 A guerra do vidéo, 1825-1828:  		
113	BARROSO, Gustavo.	14137480	 ISBN inválido, 	   2.ed.		432	 255 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 2000.	 (Coleção  Alagadiço Novo ; 260).	 contos e episódios da campanha cisplatina.	0	 A guerra do vidéo, 1825-1828:  		
114	SA, Magdalena.	14137410	 ISBN inválido, 	   		441	 193 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1999.	 (Coleção  Alagadiço Novo ; 228).	 	0	 Oráculo. 		
115	SA, Magdalena.	14137411	 ISBN inválido, 	   		442	 193 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1999.	 (Coleção  Alagadiço Novo ; 228).	 	0	 Oráculo. 		
116	SA, Magdalena.	14137412	 ISBN inválido, 	   		443	 193 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1999.	 (Coleção  Alagadiço Novo ; 228).	 	0	 Oráculo. 		
117	ALVES, Dário Moreira de Castro.	14137176	 ISBN inválido, 	   		444	 442 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1999.	 (Coleção Alagadiço Novo ; 220).	 	0	 Luso-brasilidades nos 500 anos. 		
118	ALVES, Dário Moreira de Castro.	14137177	 ISBN inválido, 	   		445	 442 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1999.	 (Coleção Alagadiço Novo ; 220).	 	0	 Luso-brasilidades nos 500 anos. 		
119	ALVES, Dário Moreira de Castro.	14137178	 ISBN inválido, 	   		446	 442 p. 	 Fortaleza, CE: UFC, Casa de José de Alencar, 1999.	 (Coleção Alagadiço Novo ; 220).	 	0	 Luso-brasilidades nos 500 anos. 		
124	UNIVERSIDADE FEDERAL DO CEARÁ.	14002607	 ISBN inválido, 	   		1999	 303 p. 	 Fortaleza, CE: Imprensa Universitária - UFC, 2009.	 	 base 2008.	0	 Anuário Estatístico 2009 : 		
138	CAMINHA, Adolfo.	13992319	 ISBN inválido, 	   		3341	 72 p. 	 São Paulo: DCL, 2005.	 (A obra prima de cada autor. 102)	 	0	 Bom crioulo. 		
139	DUQUE, José Guimarães.	13992425	 ISBN inválido, 	   6. ed.		3348	 272p. 	 Fortaleza: Banco do Nordeste do Brasil, 2004.	 (Mossoroense ; 201)	 	0	 Solo e água no polígono das secas. 		
140	ARAGÃO, Cleudene.	13995857	 ISBN inválido, 	   		3367	 149 p. 		 	 vida e obra.	0	 Cem anos de Rachel de Queiroz:  		
141	UNIVERSIDADE FEDERAL DO CEARÁ.	14022239	 ISBN inválido, 	   		3433	 399 p. 	 Fortaleza, CE: Imprensa Universitária - UFC, 2010.	 	 	0	 Anuário estatístico 2010 base 2009. 		
179	TULLOCH, Mitch.	14057577	 ISBN inválido, 	   		4866	 xiv, 477 p. 	 Washington: Microsoft Press, c2007.	 	 	0	 Introducing Windows Server 2008. 		
198	COLARES, Otacílio.	14137616	 ISBN inválido, 	   		5665	 193 p. 	 Fortaleza: Casa de José de Alencar,UFC, 1996.	 	 	0	 Poesia reunida. 		
199	COLARES, Otacílio.	14137617	 ISBN inválido, 	   		5666	 193 p. 	 Fortaleza: Casa de José de Alencar,UFC, 1996.	 	 	0	 Poesia reunida. 		
200	COLARES, Otacílio.	14137618	 ISBN inválido, 	   		5667	 193 p. 	 Fortaleza: Casa de José de Alencar,UFC, 1996.	 	 	0	 Poesia reunida. 		
201		14137619	 Nome do título não especificado,  ISBN inválido, 			5668					0			
202		14137620	 Nome do título não especificado,  ISBN inválido, 			5669					0			
203		14137621	 Nome do título não especificado,  ISBN inválido, 			5670					0			
204	VERNE, Jules.	14137660	 ISBN inválido, 	   		5671	 vi, 170 p. 	 New York: Dover Publications, Inc., 2000.	 	 	0	 Around the world in eighty days. 		
205	CONRAD, Joseph.	14137667	 ISBN inválido, 	   		5672	 vi, 170 p. 	 New York: Dover Publications, Inc., 2001.	 	 	0	 The secret agent. 		
209	REBITTE, Leonardo; BP, Marcus Vinícius.	14138341	 ISBN inválido, 	   		5678	 115 p. 	 Rio de Janeiro: Alta Books, 2006.	 	 seu site entre os primeiros nos sites de busca.	0	 Dominando tableless:  		
210		14139272	 Nome do título não especificado,  ISBN inválido, 			5692					0			
211	COMISSÃO DE VALORES MOBILIÁRIOS.	14139246	 ISBN inválido, 	   		5693	 39 p. 	 Rio de Janeiro: Comissão de Valores Mobiliários, 2014.	 (Cadernos CVM, 3).	 	0	 Fundos de investimento. 		
212	COMISSÃO DE VALORES MOBILIÁRIOS.	14139290	 ISBN inválido, 	   		5694	 31 p. 	 Rio de Janeiro: Comissão de Valores Mobiliários, 2014.	 (Cadernos CVM, 1).	 	0	 O que é a CVM. 		
213	COMISSÃO DE VALORES MOBILIÁRIOS.	14139305	 ISBN inválido, 	   		5695	 32 p. 	 Rio de Janeiro: Comissão de Valores Mobiliários, 2009.	 (Cadernos CVM, 1).	 	0	 O que é a CVM. 		
214	CHAUVINEAU, Jean.	14146728	 ISBN inválido, 	   		2	 127p 	 [Lisboa]: Europa America, c1957.	 	 	0	 A logica moderna. 		
215	RIBEIRO, Darcy.	14163282	 ISBN inválido, 	   		4	 272p. 	 Rio de Janeiro, RJ: Paz e Terra, 1969.	 (Estudos sobre o Brasil e a América Latina ; v. 7).	 	0	 A universidade necessária. 		
216	MACHADO, Lia Zanotta.	14163407	 ISBN inválido, 	   		5	 242p. 	 São Paulo: Brasiliense, 1983.	 	 	0	 Estado, escola e ideologia. 		
217	MESQUITA, Vianney; CARVALHO, Gilmar de.	14163160	 ISBN inválido, 	   		6	 149 p. 	 Fortaleza: Ágora, c1985.	 	 	0	 Estudos de comunicação no Ceará. 		
218	CUNHA, Luiz Antonio.	14163603	 ISBN inválido, 	  6. ed.		11	 293p. 	 Rio de Janeiro: F. Alves, 1981.			0	  Educacao e desenvolvimento social no Brasil. 		
219	MARTINS, José Murilo.	14162906	 ISBN inválido, 	   Ed. do cinqüentenário.		15	 v. 	 Fortaleza, CE: Imprensa Universitária da UFC, 1998.	 	 professores e médicos graduados .	0	 Faculdade de Medicina da UFC:  		
220	CAMINHA, Adolfo.	14160322	 ISBN inválido, 			16	 174p 	 Fortaleza: Edições UFC, 1999.	 	 	0	 Cartas literarias. 		
221	PRADO JÚNIOR, Caio.	14161676	 ISBN inválido, 	   32. ed.		20	 364 p. 	 São Paulo: Brasiliense, 1985.	 	 	0	 História econômica do Brasil. 		
222	DESCARTES, René,; DESCARTES, René,; DESCARTES, René,; DESCARTES, René,; DESCARTES, René.	14163607	 ISBN inválido, 	   		132	 336 p. 	 São Paulo: Abril Cultural, 1973.	 (Coleção Os pensadores ; v. XV).	 	0	 Discurso do método ; Meditações ; Objeções e respostas ; As paixões da alma ; Cartas. 		
223	LIBANEO, Jose Carlos.	14163167	 ISBN inválido, 	   6. ed.		568	 149 p. 	 São Paulo, SP: Ed. Loyola, 1984.	 (Colecao Educar ; 1.).	 a pedagogia crítico-social dos conteúdos .	0	 Democratização da escola pública:  		
224	MENEZES, Paulo Blauth.	14150926	 ISBN inválido, 	    4. ed.		640	 xxi, 348 p. 	 Porto Alegre: Bookman, 2013.	 (Livros didáticos informática ufrgs ; 16).	 	0	 Matemática discreta para computação e informática. 		
240	SEWELL, Anna.	14141661	 ISBN inválido, 	   		680	 58 p. 	 Essex, England: Longman, 1988.	 (Longman classics).	 	0	 Black beauty. 		
241	ANDERSEN, H. C.	14141687	 ISBN inválido, 	   		681	 57 p. 	 Essex, England: Longman, 1991.	 (Longman classics).	 	0	 Tales from Hans Andersen. 		
242	SPYRI, Johanna.	14141724	 ISBN inválido, 	   		683	 58 p. 	 Essex, England: Longman, 1991.	 (Longman classics).	 	0	 Heidi. 		
243	GURGEL, Italo  (Org.).	14160349	 ISBN inválido, 	   		761	 181 p. 	 Fortaleza, CE: Pouchain Ramos, 2014..	 	 50 anos promovendo educação e cidadania.	0	 CETREDE:  		
244		14161728	 ISBN inválido, 	   		765	 233 p. 	 Fortaleza: EdUECE, 2014.	 	 reflexões sobre educação, história, cultura e tecnologias.	0			SOCIEDADE, ciência e sertão:
245		14161729	 ISBN inválido, 	   		766	 233 p. 	 Fortaleza: EdUECE, 2014.	 	 reflexões sobre educação, história, cultura e tecnologias.	0			SOCIEDADE, ciência e sertão:
246		14161730	 ISBN inválido, 	   		767	 233 p. 	 Fortaleza: EdUECE, 2014.	 	 reflexões sobre educação, história, cultura e tecnologias.	0			SOCIEDADE, ciência e sertão:
247		14163381	 ISBN inválido, 	   		768	 233 p. 	 Fortaleza: EdUECE, 2014.	 	 reflexões sobre educação, história, cultura e tecnologias.	0			SOCIEDADE, ciência e sertão:
248		14163382	 ISBN inválido, 	   		769	 233 p. 	 Fortaleza: EdUECE, 2014.	 	 reflexões sobre educação, história, cultura e tecnologias.	0			SOCIEDADE, ciência e sertão:
249		14163383	 ISBN inválido, 	   		770	 233 p. 	 Fortaleza: EdUECE, 2014.	 	 reflexões sobre educação, história, cultura e tecnologias.	0			SOCIEDADE, ciência e sertão:
250		14163384	 ISBN inválido, 	   		771	 233 p. 	 Fortaleza: EdUECE, 2014.	 	 reflexões sobre educação, história, cultura e tecnologias.	0			SOCIEDADE, ciência e sertão:
251		14163385	 ISBN inválido, 	   		772	 233 p. 	 Fortaleza: EdUECE, 2014.	 	 reflexões sobre educação, história, cultura e tecnologias.	0			SOCIEDADE, ciência e sertão:
252	BARRETO, Lima.	14163222	 ISBN inválido, 	   		798	 191 p. 	 São Paulo: Klick Editora, 1997.	 (Ler é aprender ; v. 18).	 	0	 Triste fim de Policarpo Quaresma. 		
253	DAWKINS, Richard.	14163323	 ISBN inválido, 	   		801	 230 p. 	 Belo Horizonte: São Paulo: Itatiaia, EDUSP, 1979.	 (O homem e a ciência ; v. 7).	 	0	 O gene egoísta. 		
254	GIANNOTTI, José Arthur.	14163345	 ISBN inválido, 	   2. ed.		802	 113 p. 	 São Paulo: Brasiliense, 1986.	 	 	0	 A universidade em ritmo de barbárie. 		
255	HUBERMAN, Leo.	14163492	 ISBN inválido, 	   16. ed.		803	 318p. 	 Rio de Janeiro: Zahar, 1980.	 (Biblioteca de Ciências Sociais).	 	0	 História da riqueza do homem. 		
256	SILVA, Arlete Marques da.	14163542	 ISBN inválido, 	   		804	 188 p. 	 São Paulo: Edições Loyola, 1983.	 (Coleção Educ - Ação; 8).	 terra de ninguém .	0	 Educação:  		
257	ROSENBERG, Lia.	14163590	 ISBN inválido, 	   2. ed.		805	 80 p. 	 São Paulo: Ed. Loyola, 1984.	 (Coleção Espaço ; v. 8).	 	0	 Educação e desigualdade social. 		
258	ALMEIDA, Guido de.	14163559	 ISBN inválido, 	   		806	 158 p. 	 São Paulo: Summus editorial, 1986.	 (Novas buscas em educação ; 26).	 	0	 O professor que não ensina. 		
259	PRADO JÚNIOR, Caio.	14163597	 ISBN inválido, 	   20. ed.		807	 390 p. 	 São Paulo: Companhia das Letras, 1987.	 	 colônia.	0	 Formação do Brasil contemporâneo:  		
260	Claudius; OLIVEIRA, Miguel Darcy de; OLIVEIRA, Rosiska Darcy de.	14163611	 ISBN inválido, 	   16. ed.		809	 95p. 	 Petropolis: Rio de Janeiro: Vozes, Instituto de Ação Cultural, 1987.	 	 	0	 A vida na escola e a escola da vida. 		
261		14163610	 ISBN inválido, 	   		810	 112 p. 	 Rio de Janeiro: UFRJ, 2007.	 (Série Memorabilia ; n. 5).	 70 anos de história .	0			CURSO de serviço social na UFRJ:
262	FREYRE, Gilberto.	14163609	 ISBN inválido, 	   4. ed.		811	 793 p. 	 Rio de Janeiro: Record, 1990.	 	 processo de desintegracao das sociedadespatriarcal e semipatriarcal no Brasil sob o regime de trabalho livre .	0	 Ordem e progresso:  		
263	BOCCACCIO, Giovanni.	14163608	 ISBN inválido, 	   		812	 317 p. 	 São Paulo: Abril Cultural, 1981.	 	 	0	 Decamerão. 		
264	SPÍNDOLA, Amelhita; BANDEIRA, Francisco.	14163612	 ISBN inválido, 	   		813	 77 p. 	 Fortaleza: UFC, 2010.	 	 	0	 A história abreviada da UFC de Antônio Martins Filho contada em forma de cordel. 		
265	STÉDILE, João Pedro.	14163613	 ISBN inválido, 	   		814	 103 p. 	 Fortaleza: NUDOC; Museu do Ceará, Secretaria da Cultura do Estado do Ceara, 2005.	 (Cadernos Paulo Freire; 3).	 	0	 Bibliografia básica sobre a questão agrária no Brasil. 		
266	LEITE, Anizeuton.	14190023	 ISBN inválido, 	   		941	 56 p. 	 Ceará: Gráfica Imagem, s.d..	 	 	0	 Recomeço. 		
\.


--
-- Name: exemplarconflitante_id_ef_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('exemplarconflitante_id_ef_seq', 1, false);


--
-- Data for Name: exemplares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY exemplares (id_e, cod_e, id_titulo) FROM stdin;
1	14126206	396
2	13890944	396
3	13890945	396
4	14126207	396
5	13890946	396
6	14126208	396
7	13890947	396
8	14126209	396
9	14081045	396
10	14081046	396
11	14081047	396
12	14085112	396
13	14088701	396
14	14088702	396
15	14088703	396
16	14088704	396
17	14124012	396
18	14124013	396
19	14124014	396
20	14124015	396
21	14124016	396
22	14124017	396
23	14124018	396
24	14124019	396
25	14124020	396
26	14124021	396
27	14124022	396
28	13988600	16
29	13988601	16
30	13988602	16
31	13988603	16
32	14050564	16
33	14050565	16
34	14050566	16
35	14019965	439
36	14031614	439
37	14031615	439
38	13941564	208
39	13890943	208
40	14042767	208
41	14042762	208
42	14042768	208
43	14042763	208
44	14042769	208
45	14042770	208
46	14042764	208
47	14042765	208
48	14042771	208
49	14042766	208
50	14042772	208
51	14052435	208
52	14059304	208
53	14059302	208
54	14059305	208
55	14059303	208
56	14085108	372
57	14139277	372
58	13934646	418
59	13934647	418
60	13934648	418
61	13934649	418
62	13937078	418
63	13984331	418
64	13984332	418
65	13984333	418
66	13984334	418
67	13992568	1000
68	14064075	564
69	14055942	456
70	14055943	456
71	14085111	905
72	14139288	905
73	14085109	904
74	14085107	903
75	14139286	903
76	14139287	903
77	14139282	1001
78	13924463	137
79	13924464	137
80	13924465	137
81	13924466	137
82	13926431	137
83	14034198	1002
84	14126479	970
85	14126480	970
86	14126481	970
87	14126482	970
88	13986738	406
89	13986739	406
90	13986740	406
91	13986741	406
92	14081353	831
93	14081354	831
94	14081355	831
95	14085106	831
96	14137439	1003
97	14137440	1003
98	14137441	1003
99	14124222	885
100	14124223	885
101	14124224	885
102	14124225	885
103	14124226	885
104	14124227	885
105	14124228	885
106	14124229	885
107	14064071	575
108	14064082	554
109	13992423	332
110	13992433	551
111	13983538	323
112	13983539	323
113	13983540	323
114	13983541	323
115	13992430	429
116	14064070	555
117	14064069	559
118	13890952	30
119	13890953	30
120	13890954	30
121	13890955	30
122	13960341	30
123	13960342	30
124	13960343	30
125	13960344	30
126	13960345	30
127	13985822	30
128	13985823	30
129	13985824	30
130	13985825	30
131	13985826	30
132	13985827	30
133	13985828	30
134	13985829	30
135	14050894	30
136	14050895	30
137	14050896	30
138	14050897	30
139	14050898	30
140	14050899	30
141	14063895	30
142	14063896	30
143	14063897	30
144	14063898	30
145	14063899	30
146	14063900	30
147	14086341	30
148	14086342	30
149	14086343	30
150	14086344	30
151	14086345	30
152	14086346	30
153	14086347	30
154	14086348	30
155	14086349	30
156	14086350	30
157	14086351	30
158	14086352	30
159	14086353	30
160	14086354	30
161	14086355	30
162	14086356	30
163	14086357	30
164	13984816	398
165	13984818	398
166	13984819	398
167	13984820	398
168	13992429	339
169	13890948	441
170	13890949	441
171	13890950	441
172	13890951	441
173	14018177	441
174	14018178	441
175	14018179	441
176	13998549	337
177	13998550	337
178	13998551	337
179	13998552	337
180	14017925	337
181	14017926	337
182	14017927	337
183	14056327	337
184	14056328	337
185	14056329	337
186	13947564	2
187	13947565	2
188	13947566	2
189	13947567	2
190	13947958	2
191	14050927	519
192	14050928	519
193	14051025	519
194	13984973	63
195	13984974	63
196	13940743	63
197	13940744	63
198	13984983	63
199	13984984	63
200	13984985	63
201	13984986	63
202	14061434	63
203	13940741	63
204	13940742	63
205	13984975	63
206	13984976	63
207	13934662	113
208	13934663	113
209	13934664	113
210	13934665	113
211	13937066	113
212	13984306	113
213	13984307	113
214	13984308	113
215	13984309	113
216	14019808	113
217	14019809	113
218	14019810	113
219	14019811	113
220	14019812	113
221	14019813	113
222	14054534	113
223	14054535	113
224	14054536	113
225	14054537	113
226	14054538	113
227	14054539	113
228	14012278	387
229	14012279	387
230	14012280	387
231	14055354	387
232	14055355	387
233	14055356	387
234	14055357	387
235	14055397	387
236	14055398	387
237	14055399	387
238	14055400	387
239	14055401	387
240	14055402	387
241	13936895	310
242	13936896	310
243	13936897	310
244	13936898	310
245	13937563	310
246	13984288	310
247	13984289	310
248	13984290	310
249	13984291	310
250	14019856	310
251	14019857	310
252	14019858	310
253	14019859	310
254	14019860	310
255	14019861	310
256	13985309	165
257	13985310	165
258	13985311	165
259	13985312	165
260	14031361	165
261	14031362	165
262	14056260	165
263	14056261	165
264	14056262	165
265	14081163	165
266	14081164	165
267	14081165	165
268	14081166	165
269	14081167	165
270	14081168	165
271	14123605	165
272	14123606	165
273	14123607	165
274	14123608	165
275	13941080	173
276	13941081	173
277	13941082	173
278	13941083	173
279	13941084	173
280	13985289	173
281	13985290	173
282	13985291	173
283	13985292	173
284	14031267	173
285	14031268	173
286	14031269	173
287	14031270	173
288	14031271	173
289	14031272	173
290	14054511	173
291	14054512	173
292	14054513	173
293	14123425	173
294	14123426	173
295	14123427	173
296	14123428	173
297	14123429	173
298	14123430	173
299	14123431	173
300	14123432	173
301	14123433	173
302	14123434	173
303	14123435	173
304	14123436	173
305	14123437	173
306	14123438	173
307	14123439	173
308	13934641	480
309	13934642	480
310	13934643	480
311	13934644	480
312	13937075	480
313	14019053	433
314	14019054	433
315	14019055	433
316	14055378	433
317	14055383	433
318	14055384	433
319	13992435	581
320	13942925	393
321	13942926	393
322	13942927	393
323	13942928	393
324	13942929	393
325	14056342	393
326	14056343	393
327	14056344	393
328	13992431	1004
329	13924447	329
330	13924448	329
331	13924449	329
332	13924450	329
333	13926429	329
334	13983558	372
335	13983559	372
336	13983560	372
337	13983561	372
338	14040134	372
339	14056903	372
340	14056904	372
341	14056905	372
342	14040143	374
343	14040154	1005
344	13985405	79
347	13985406	79
348	13985407	79
350	13985408	79
352	14031419	79
355	14031420	79
357	14031421	79
358	14056574	79
361	14056575	79
363	14056576	79
365	14081424	79
367	14081425	79
368	14081426	79
371	14081427	79
372	14122512	79
373	14122513	79
374	14122514	79
375	14122515	79
376	14122516	79
377	14040166	375
378	14056024	375
379	14056025	375
380	14056026	375
381	14056027	375
382	14056028	375
383	14056039	375
384	14056040	375
385	14056041	375
386	13932192	378
387	13932193	378
388	13932194	378
389	13932195	378
390	13932196	378
391	14056044	378
392	14056045	378
393	14056046	378
394	14056142	378
395	14056143	378
396	14086729	378
397	14086730	378
398	14086731	378
399	14086732	378
400	14086733	378
401	14086734	378
402	14086735	378
403	14086736	378
404	14086737	378
405	14086738	378
406	14086739	378
407	14086740	378
408	14086741	378
409	14086742	378
410	14086743	378
411	14086744	378
412	14086745	378
413	14086746	378
414	14086747	378
415	14086748	378
416	14086749	378
417	14086750	378
418	14040171	379
419	14056147	379
420	14056148	379
421	14056149	379
422	14040172	376
423	14056154	376
424	14056155	376
425	14056156	376
426	13983564	377
427	13945309	377
428	13946116	377
429	13983565	377
430	13983566	377
431	13946118	377
432	13946119	377
433	13983567	377
434	13946117	377
435	14040182	377
436	14040214	1006
437	14040219	902
438	14088556	902
439	14040221	373
440	14056144	373
441	14056145	373
442	14056146	373
443	13937626	446
444	13937627	446
445	13976714	446
446	13976715	446
447	13976716	446
448	14054607	6
449	14054608	6
450	14054609	6
451	14054610	6
452	14054611	6
453	14054612	6
454	14054613	6
455	14054614	6
456	14054615	6
457	14054616	6
458	13941114	458
459	13941115	458
460	13941116	458
461	13941117	458
462	13941118	458
463	13937624	447
464	13937874	447
465	13937873	447
466	13940708	447
467	13940699	447
468	13940700	447
469	13940720	447
470	13940719	447
471	13940722	447
472	13940724	447
473	13940726	447
474	13940725	447
475	13940731	447
476	13998530	447
477	13940723	447
478	13998533	447
479	13940732	447
480	13998531	447
481	13998535	447
482	13998536	447
483	13998534	447
484	13998532	447
485	14020900	447
486	14020901	447
487	14020903	447
488	14020904	447
489	14020902	447
490	14020911	447
491	14020905	447
492	14020912	447
493	14033553	447
494	14033550	447
495	14020892	447
496	14033654	447
497	14033653	447
498	14033649	447
499	13936925	1007
500	13936926	1007
501	13936927	1007
502	13936928	1007
503	13937562	1007
504	13984672	1007
505	13984673	1007
506	13984674	1007
507	13984675	1007
508	13984688	1007
509	13984689	1007
510	13984690	1007
511	13984691	1007
512	14012343	1007
513	14012344	1007
514	14012345	1007
515	14054779	1007
516	14054780	1007
517	14054781	1007
518	14088705	606
519	14088706	606
520	14088707	606
521	14088708	606
522	13942796	269
523	13942797	269
524	13942798	269
525	13942799	269
527	13986037	207
531	13986039	207
532	13986040	207
535	13986041	207
536	13986042	207
539	13986043	207
541	13986044	207
543	14051014	207
544	14051015	207
547	14051016	207
548	14054428	207
551	14054429	207
552	14054430	207
554	13934086	435
555	13934087	435
556	13934088	435
557	13934089	435
558	13937696	435
559	14031657	435
560	14031658	435
561	14031659	435
562	14055039	435
563	14055040	435
564	14055041	435
565	14110862	435
566	14110863	435
567	14110864	435
568	14110865	435
569	14110866	435
570	14110867	435
571	14110868	435
572	14110869	435
573	14110870	435
574	14110871	435
575	14110872	435
576	14110873	435
577	14110874	435
578	14110875	435
579	14110876	435
580	14110877	435
581	14110878	435
582	14127178	435
583	14127179	435
584	14127180	435
585	14127181	435
586	14127182	435
587	14127183	435
588	14127184	435
589	14127185	435
590	14127186	435
591	14127187	435
592	13937605	385
593	13942827	385
594	13942826	385
595	13942829	385
596	13942828	385
597	14056607	385
598	14056608	385
599	13931552	346
600	13931562	346
601	13931563	346
602	13931564	346
603	13931565	346
604	14018344	407
605	14018345	407
606	14018346	407
607	13931573	469
608	13890969	408
609	13890970	408
610	13890971	408
611	13890972	408
612	13890976	15
613	13890977	15
614	13890978	15
615	13890979	15
616	13890973	37
617	13890974	37
618	13890975	37
619	13890980	37
620	13936883	37
621	13936884	37
622	13936885	37
623	13936886	37
624	13937625	37
625	13988604	37
626	13988605	37
627	13988606	37
628	13988607	37
629	14019248	37
630	14019249	37
631	14019250	37
632	14019251	37
633	14019253	37
634	14051357	37
636	14051359	37
637	14051368	37
638	14051369	37
639	14051370	37
640	14086681	37
641	14086682	37
642	14086683	37
643	14086684	37
645	14086686	37
646	14086687	37
647	14086688	37
648	14086689	37
649	14086690	37
650	14086691	37
651	14086692	37
652	14086693	37
653	14086694	37
654	14086695	37
655	14086696	37
656	14086697	37
657	14086698	37
658	14086699	37
659	14126369	37
660	14126370	37
661	14126371	37
662	14126372	37
663	14126373	37
664	14126374	37
665	14126375	37
666	14126376	37
667	14126377	37
668	14126383	37
669	14126384	37
670	14126385	37
671	14126386	37
672	14126387	37
673	14126388	37
674	14126389	37
675	14126390	37
676	14126391	37
677	14126392	37
678	13890981	488
679	13890982	488
680	13890983	488
681	13890984	488
682	14019996	450
683	14019997	450
684	14019998	450
685	14019999	450
686	14020000	450
687	14020001	450
688	14020002	450
689	14020003	450
690	14020004	450
691	14041681	450
692	14082793	605
693	14082794	605
694	14082795	605
695	14082796	605
696	14082797	605
697	14082798	605
698	14082799	605
699	14082800	605
700	14082801	605
701	14082802	605
702	14082803	605
703	14082804	605
704	14082805	605
705	14082806	605
706	14082807	605
707	14082808	605
708	13934658	146
709	13934659	146
710	13934660	146
711	13937081	146
712	13983787	146
713	13983788	146
714	13983789	146
715	13983790	146
716	14055973	146
717	14055974	146
718	14055975	146
719	14055976	146
720	14055977	146
721	14055978	146
722	14055999	146
723	14056000	146
724	14056001	146
725	14056002	146
726	14056003	146
727	14056004	146
728	14056116	146
729	14056117	146
730	14056118	146
731	14086390	146
732	14086391	146
733	14086392	146
734	14086393	146
735	14127386	146
736	14127387	146
737	14127388	146
738	14127389	146
739	14127390	146
740	14127391	146
741	14127392	146
742	14127393	146
743	14127394	146
744	14127395	146
745	14127396	146
746	14127397	146
747	14127398	146
748	14056205	44
749	14056206	44
750	14033384	526
751	13934654	274
752	13934655	274
753	13934656	274
754	13934657	274
755	13937062	274
756	13986126	274
757	13986127	274
758	13986128	274
759	13986129	274
760	14042235	274
761	14042236	274
762	14050911	274
763	14050912	274
764	14050913	274
765	14055051	274
766	14055052	274
767	14055053	274
768	14081385	274
769	14081386	274
770	14081387	274
771	14081388	274
772	14081389	274
773	14081390	274
774	14081391	274
775	14081392	274
776	14081393	274
777	14081394	274
778	14081395	274
779	14081396	274
780	14081397	274
781	14081398	274
782	14081399	274
783	14098119	274
784	14098120	274
785	13940746	125
786	13940747	125
787	13940748	125
788	13940749	125
789	13984990	125
790	13984991	125
791	13984992	125
792	13984993	125
793	13984994	125
794	13984995	125
795	13984996	125
796	13984997	125
797	14055773	125
798	14055774	125
799	13934103	138
800	13934104	138
801	13934105	138
802	13934106	138
803	13936909	138
804	14051334	138
805	14051335	138
806	14051336	138
807	14051337	138
808	14051338	138
809	14051350	138
810	14051351	138
811	14051352	138
812	14084138	138
813	14084139	138
814	14084140	138
815	14084141	138
816	14084142	138
817	14084143	138
818	14084144	138
819	14084145	138
820	14084146	138
821	14084147	138
822	14084148	138
823	14084149	138
824	13934650	145
825	13985937	145
826	13934651	145
827	13985938	145
828	13934652	145
829	13934653	145
830	13985940	145
831	13937074	145
832	13985941	145
833	13985943	145
834	13985944	145
835	14050918	145
836	14050919	145
837	14050920	145
838	14056188	145
839	14056189	145
840	14056190	145
841	13985939	145
842	14081204	145
843	14081205	145
844	14081206	145
845	14081207	145
846	14081208	145
847	14081209	145
848	14081210	145
849	14081211	145
850	14081212	145
851	14081213	145
852	14081214	145
853	14081215	145
854	14081216	145
855	14081217	145
856	14081218	145
857	14081219	145
858	14081220	145
859	14081221	145
860	13941093	47
861	13941238	47
862	13941239	47
863	13941240	47
864	13941241	47
865	13985815	47
866	13985816	47
867	13985817	47
868	13985818	47
869	13985819	47
870	13985820	47
871	13985821	47
872	14061433	47
873	13985395	51
874	13985396	51
875	13985397	51
876	13985398	51
877	13985399	51
878	13985400	51
879	13985401	51
880	13985402	51
881	14054782	51
882	14054783	51
883	14054784	51
884	14054785	51
885	14054786	51
886	14054787	51
887	14012460	189
888	14012461	189
889	14012462	189
890	14063963	417
891	14063964	417
892	14063965	417
893	13960335	120
894	13960336	120
895	13960337	120
896	13960338	120
897	13960588	120
898	13988626	120
899	13988627	120
900	13988628	120
901	13988629	120
902	13928030	181
903	13928031	181
904	13928032	181
905	13928033	181
906	13985389	181
907	13985390	181
908	13985391	181
909	13985392	181
910	13937601	233
911	13937602	233
912	13937603	233
913	13937604	233
914	13986074	233
915	13986075	233
916	13986076	233
917	13986077	233
918	13986078	233
919	13986079	233
920	13986080	233
921	13986081	233
922	14056348	233
923	14056349	233
924	14056350	233
925	14056351	233
926	14056352	233
927	14056353	233
928	13936899	449
929	13936900	449
930	13936901	449
931	13936902	449
933	14088740	608
935	14088741	608
937	14088742	608
939	14088743	608
941	14088744	608
943	14088745	608
944	14088746	608
947	14088747	608
948	14088748	608
950	14088749	608
953	14088750	608
954	14088751	608
956	14088752	608
958	14088753	608
960	14088754	608
962	14088755	608
965	14088756	608
967	14088757	608
969	14088758	608
970	14088759	608
973	14088760	608
974	14124355	608
976	14124356	608
979	14124357	608
980	14124358	608
982	14124359	608
985	14124360	608
986	14124361	608
989	14124362	608
990	14124363	608
992	14021514	10
993	14021515	10
994	14021516	10
995	13947257	492
996	13947258	492
997	13947259	492
998	13947260	492
999	13947963	492
1000	14055093	492
1001	14055094	492
1002	14055095	492
1003	14123125	492
1004	14123126	492
1005	14123127	492
1006	14123128	492
1007	13922209	495
1008	13922255	495
1009	13922256	495
1010	13922257	495
1011	13922258	495
1012	13922207	525
1013	13922233	525
1014	13922234	525
1015	13922235	525
1016	13922232	525
1017	13923180	434
1018	13923187	434
1019	13923188	434
1020	13923189	434
1021	13923190	434
1022	13998541	434
1023	13998542	434
1024	13998543	434
1025	13998544	434
1026	14017890	434
1027	14017891	434
1028	14017892	434
1029	14017893	434
1030	14017894	434
1031	14017895	434
1032	14055380	434
1033	14055381	434
1034	14055382	434
1035	14122567	434
1036	14122568	434
1037	14122569	434
1038	14122570	434
1039	14122571	434
1040	14122572	434
1041	14122573	434
1042	14122574	434
1043	14122575	434
1044	14122576	434
1045	14122577	434
1046	14122578	434
1047	14122579	434
1048	13923249	340
1049	13923250	340
1050	13923251	340
1051	13923252	340
1052	13942923	340
1053	13923706	153
1054	13986099	153
1055	13923707	153
1056	13986100	153
1057	13923708	153
1058	13986101	153
1059	13986102	153
1060	13986103	153
1061	13986104	153
1062	13986105	153
1063	13986106	153
1064	14054620	153
1065	14054621	153
1066	14054622	153
1067	14054626	153
1068	14054627	153
1069	14054628	153
1070	13923701	357
1071	13923702	357
1072	13923703	357
1073	13923704	357
1074	13923718	357
1075	13923715	326
1076	13923731	326
1077	13923735	326
1078	13923736	326
1079	13923737	326
1080	13984077	326
1081	13984078	326
1082	13984079	326
1083	13984080	326
1084	13984081	326
1085	13984082	326
1086	13984083	326
1087	13984084	326
1088	14123445	326
1089	14123446	326
1090	14123447	326
1091	14123448	326
1092	14123449	326
1093	14123450	326
1094	14123451	326
1095	14123452	326
1096	14123453	326
1097	14126438	326
1098	14126439	326
1099	14126440	326
1100	14126441	326
1101	14126442	326
1102	14126443	326
1103	13934115	521
1104	13934116	521
1105	13934117	521
1106	13934118	521
1107	13937057	521
1108	14055008	521
1109	14055009	521
1110	14055010	521
1111	13925510	319
1112	13926419	319
1113	13926420	319
1114	13926421	319
1115	13926422	319
1116	13925531	516
1117	13927574	516
1118	13927575	516
1119	13927576	516
1120	13927577	516
1121	13984396	516
1122	13984397	516
1123	13984398	516
1124	13984399	516
1125	13984016	304
1126	13983654	304
1127	13983655	304
1128	13983656	304
1129	13983653	304
1130	13984017	304
1131	13984018	304
1132	13984019	304
1133	14122303	304
1134	14122304	304
1135	14122305	304
1136	14122306	304
1137	14122307	304
1138	14122308	304
1139	14122309	304
1140	14122310	304
1141	14122311	304
1142	14122312	304
1143	14122313	304
1144	14122314	304
1145	13926432	474
1146	13926442	474
1147	13926443	474
1148	13926444	474
1149	13926445	474
1150	14055125	474
1151	14055126	474
1152	14055127	474
1153	14127188	474
1154	14127189	474
1155	14127190	474
1156	14127191	474
1157	14127192	474
1158	14127193	474
1159	14127194	474
1160	13926401	444
1161	13926407	444
1162	13926402	444
1163	13926409	444
1164	13926403	444
1165	13926410	444
1166	13926415	444
1167	13926404	444
1168	13926417	444
1169	13926405	444
1170	13927592	1
1171	13927594	1
1172	13927595	1
1173	14054423	1
1174	14054424	1
1175	14054425	1
1176	14091187	1
1177	14091188	1
1178	14091189	1
1179	14091190	1
1180	14091191	1
1181	14091192	1
1182	14091193	1
1183	14091194	1
1184	14126999	1
1185	14127000	1
1186	14127001	1
1187	14012529	214
1188	14012530	214
1189	14012531	214
1190	14050996	419
1191	14050997	419
1192	13984004	261
1193	13984005	261
1194	13984006	261
1195	13984007	261
1196	14012467	261
1197	14012468	261
1198	14012469	261
1199	14055369	261
1200	14055370	261
1201	14055371	261
1202	14086751	261
1203	14086752	261
1204	14086753	261
1205	14086754	261
1206	14086755	261
1207	14086756	261
1208	14086757	261
1209	14086758	261
1210	14086759	261
1211	14086760	261
1212	14086761	261
1213	14086762	261
1214	14086763	261
1215	14086764	261
1216	14086765	261
1217	14086766	261
1218	14086767	261
1219	14123749	261
1220	14123750	261
1221	14123751	261
1222	14123752	261
1223	14123753	261
1224	14123754	261
1225	14123755	261
1226	14123756	261
1227	14123757	261
1228	14123758	261
1229	14123759	261
1230	14123760	261
1231	14123761	261
1232	14123762	261
1233	14123763	261
1234	14123764	261
1235	13984692	252
1236	13984693	252
1237	13984694	252
1238	13984695	252
1239	14056957	252
1240	14056958	252
1241	14056959	252
1242	13931518	241
1243	13931519	241
1244	13931524	241
1245	13931520	241
1246	13931521	241
1247	13931525	241
1248	13931522	241
1249	13931526	241
1250	13931527	241
1251	13931523	241
1252	14130365	241
1253	14055330	241
1254	14055331	241
1255	14130366	241
1256	14130374	241
1257	14055332	241
1258	14055968	335
1259	14055969	335
1260	13931537	1008
1261	13931505	365
1262	13932188	365
1263	13932189	365
1264	13932190	365
1265	13932191	365
1266	13931571	479
1267	13948663	479
1268	13948664	479
1269	13948665	479
1270	13948666	479
1271	13984063	479
1272	13984064	479
1273	13984065	479
1274	13984066	479
1275	14056165	416
1276	14056166	416
1277	13941094	243
1278	13941095	243
1279	13941096	243
1280	13941097	243
1281	13934042	1009
1282	13934043	1009
1283	13934044	1009
1284	13934045	1009
1285	13937064	1009
1286	13934276	211
1287	13934277	211
1288	13934278	211
1289	13934279	211
1290	13937082	211
1291	13934681	280
1292	13934682	280
1293	13934683	280
1294	13934684	280
1295	13934685	280
1296	13985481	280
1297	13985482	280
1298	13985483	280
1299	13985484	280
1300	14050914	280
1301	14050915	280
1302	14050916	280
1303	14055348	280
1304	14055349	280
1305	14055350	280
1306	14055351	280
1307	14055352	280
1308	14055353	280
1309	13934630	32
1310	13934631	32
1311	13934632	32
1312	13934633	32
1313	13999443	167
1314	13999444	167
1315	13999445	167
1316	13999446	167
1317	14019125	167
1318	14019126	167
1319	14019127	167
1320	14051506	167
1321	14051507	167
1322	14051508	167
1323	14051509	167
1324	14051510	167
1325	14051511	167
1326	14126307	167
1327	14126308	167
1328	14126309	167
1329	14126310	167
1330	14126311	167
1331	14126312	167
1332	14126313	167
1333	14126314	167
1334	14126315	167
1335	14126316	167
1336	14126317	167
1337	14126318	167
1338	14126319	167
1339	14126320	167
1340	14126321	167
1341	14126322	167
1342	14126323	167
1343	14126324	167
1344	14126325	167
1345	14126326	167
1346	14126327	167
1347	14126328	167
1348	14126329	167
1349	14126330	167
1350	14126331	167
1351	14126340	167
1352	14126341	167
1353	14126342	167
1354	14126343	167
1355	14126345	167
1356	14126346	167
1357	14126347	167
1358	14126348	167
1359	14126349	167
1360	13936887	389
1361	13936888	389
1362	13936889	389
1363	13936890	389
1364	13937559	389
1365	13984318	389
1366	13984319	389
1367	13984320	389
1368	13984321	389
1369	14019791	389
1370	14019792	389
1371	14019793	389
1372	14054885	389
1373	14054886	389
1374	14054887	389
1375	14086776	389
1376	14086777	389
1377	14086778	389
1378	14086779	389
1379	14086780	389
1380	14086781	389
1381	14086782	389
1382	14086783	389
1383	14086784	389
1384	14086785	389
1385	14086786	389
1386	14123925	389
1387	14123926	389
1388	14123927	389
1389	14123928	389
1390	14123929	389
1391	14123930	389
1392	14123931	389
1393	14123932	389
1394	14123933	389
1395	14123934	389
1396	14123935	389
1397	14123936	389
1398	14123937	389
1399	14123938	389
1400	14123939	389
1401	14123940	389
1402	14123941	389
1403	14123942	389
1404	14123943	389
1405	13934696	506
1406	13934697	506
1407	13934698	506
1408	13934699	506
1409	13937054	506
1410	14001397	506
1411	14001398	506
1412	14001399	506
1413	14001400	506
1414	14123392	506
1415	14123393	506
1416	14123394	506
1417	14123395	506
1418	14123396	506
1419	14123397	506
1420	13934909	356
1421	13934910	356
1422	13934911	356
1423	13934912	356
1424	13937051	356
1425	13984177	514
1426	13984178	514
1427	13984179	514
1428	13984180	514
1429	14051006	514
1430	14051007	514
1431	14051008	514
1432	14054419	514
1433	14054420	514
1434	14054421	514
1435	14054422	514
1436	14091028	514
1437	14091029	514
1438	14091030	514
1439	14091031	514
1440	14091032	514
1441	14091033	514
1442	14091034	514
1443	14091035	514
1444	14091036	514
1445	14091037	514
1446	14091038	514
1447	14091039	514
1448	14126572	514
1449	14126573	514
1450	14126574	514
1451	14126575	514
1452	14126577	514
1453	14126578	514
1454	14126579	514
1455	14126580	514
1456	14126581	514
1457	14126582	514
1458	14126583	514
1459	14126584	514
1460	14126585	514
1461	14126586	514
1462	14055887	315
1464	14055888	315
1467	14055889	315
1468	14055944	315
1470	14055949	315
1473	14055953	315
1475	14055958	315
1476	14124047	315
1477	14124048	315
1478	14124049	315
1479	14124050	315
1480	14124051	315
1481	14124052	315
1482	14124053	315
1483	13936920	172
1484	13936921	172
1485	13936922	172
1486	13936923	172
1487	13937560	172
1488	13999420	172
1489	13999421	172
1490	13999422	172
1491	13999423	172
1492	14019780	172
1493	14019781	172
1494	14019782	172
1495	13936879	515
1496	13936880	515
1497	13936881	515
1498	13936882	515
1499	13937558	515
1500	14123440	515
1501	14123441	515
1502	14123442	515
1503	14123443	515
1504	13936891	432
1505	13936892	432
1506	13936893	432
1507	13936894	432
1508	13936869	291
1509	13936870	291
1510	13936871	291
1511	13936872	291
1512	13936873	291
1513	13984283	291
1514	13984284	291
1515	13984285	291
1516	13984286	291
1517	14019848	291
1518	14019849	291
1519	14019850	291
1520	14019851	291
1521	14019852	291
1522	14019853	291
1523	14054416	291
1524	14054417	291
1525	14054418	291
1526	13936862	481
1527	13936863	481
1528	13936864	481
1529	13937254	481
1530	13937566	481
1531	13936865	18
1532	13936866	18
1533	13936867	18
1534	13936868	18
1535	13937567	18
1536	14054895	18
1537	14054896	18
1538	14054897	18
1539	13985301	312
1540	13985302	312
1541	13985303	312
1542	13985304	312
1543	13985446	176
1544	13985447	176
1545	13985448	176
1546	13985449	176
1547	14051500	176
1548	14051501	176
1549	14051502	176
1550	14051503	176
1551	14051504	176
1552	14051505	176
1553	14081422	176
1554	14081423	176
1555	14122900	176
1556	14122901	176
1557	14122902	176
1558	14122903	176
1559	14122904	176
1560	14122905	176
1561	14122906	176
1562	14122907	176
1563	14122908	176
1564	14122909	176
1565	14122910	176
1566	14122911	176
1567	14122912	176
1568	14122913	176
1569	14122914	176
1570	14122915	176
1571	14122916	176
1572	14122917	176
1573	14122918	176
1574	14122919	176
1575	14122920	176
1576	13937922	216
1579	13941218	216
1580	13941219	216
1582	13941220	216
1584	13941221	216
1586	13986158	216
1589	13986159	216
1590	13986160	216
1593	13986161	216
1594	13986162	216
1597	13986163	216
1598	13986164	216
1600	13986165	216
1602	13937965	507
1603	13937966	507
1604	13937967	507
1605	13937968	507
1606	13937970	507
1607	13998556	507
1608	13998557	507
1609	13998558	507
1610	13998559	507
1611	13985442	206
1612	13985443	206
1613	13985444	206
1614	13985445	206
1615	13941113	390
1616	13941713	390
1617	13941714	390
1618	13941715	390
1619	13941716	390
1620	13983810	390
1621	13983811	390
1622	13983812	390
1623	13983813	390
1624	14050908	390
1625	14050909	390
1626	14050910	390
1627	14056159	390
1628	14056160	390
1629	14056161	390
1630	14081092	390
1631	14081093	390
1632	14081094	390
1633	14081095	390
1634	14127500	390
1635	14127501	390
1636	14127502	390
1637	14127503	390
1638	14127504	390
1639	14127505	390
1640	14127506	390
1641	14127507	390
1642	14127508	390
1643	14127509	390
1644	14127510	390
1645	14127511	390
1646	14127512	390
1647	14127513	390
1648	14127514	390
1649	14127515	390
1650	14127516	390
1651	14127517	390
1652	14127518	390
1653	13988676	292
1654	13988677	292
1655	13988678	292
1656	13988679	292
1657	13988680	292
1658	13988681	292
1659	13988682	292
1660	13988683	292
1661	14055183	292
1662	13941154	175
1663	13941150	175
1664	13941155	175
1665	13941151	175
1666	13941152	175
1667	13941156	175
1668	13941157	175
1669	13941153	175
1670	13941509	175
1671	13941508	175
1672	14042819	17
1673	14042820	17
1674	14042821	17
1675	14042822	17
1676	14042823	17
1677	14042824	17
1678	14055815	457
1679	14055929	457
1680	14055816	457
1681	14055930	457
1682	13941129	242
1683	13986089	242
1684	13986090	242
1685	13986091	242
1686	13986092	242
1687	13986093	242
1688	13986094	242
1689	13986095	242
1690	13986096	242
1691	14056370	242
1692	14056371	242
1693	14056372	242
1694	14056373	242
1695	14056374	242
1696	14056375	242
1697	14056377	242
1698	14056378	242
1699	14056379	242
1701	13941130	355
1702	13941254	355
1704	13941255	355
1707	13941256	355
1708	13941257	355
1711	13986742	355
1712	13986743	355
1714	13986744	355
1716	13986745	355
1718	13941172	383
1719	13941246	383
1720	13941247	383
1721	13941248	383
1722	13941249	383
1723	13941732	391
1724	13941733	391
1725	13941734	391
1726	13941735	391
1727	13941729	391
1728	14056571	1010
1729	14056572	1010
1730	14056573	1010
1731	14056583	1010
1732	13942930	490
1733	13942931	490
1734	13942932	490
1735	13942933	490
1736	13942934	490
1737	13942937	316
1738	13942938	316
1739	13942939	316
1740	13942940	316
1741	13942941	316
1742	13942943	463
1743	13942944	463
1744	13942945	463
1745	13942946	463
1746	13942947	463
1747	13946129	352
1748	14031890	405
1749	14031891	405
1750	14031892	405
1751	13946166	1011
1752	13947574	452
1753	13947575	452
1754	13947576	452
1755	13947577	452
1756	13947961	452
1757	14124273	972
1758	14124274	972
1759	14124275	972
1760	14124276	972
1761	14021476	268
1762	14021475	268
1763	14031090	268
1764	14031095	268
1765	14031096	268
1766	14031091	268
1767	14031097	268
1768	14031092	268
1769	14031093	268
1770	14031098	268
1771	14031094	268
1772	14031099	268
1773	13952537	282
1774	13952538	282
1775	13952539	282
1776	13952540	282
1777	13952541	282
1778	13952544	426
1779	13952545	426
1780	13952546	426
1781	13952547	426
1782	13952548	426
1783	13983630	426
1784	13983631	426
1785	13983632	426
1786	13983633	426
1787	13952603	445
1788	13952604	445
1789	13952605	445
1790	13952606	445
1791	13952619	445
1792	14055128	445
1793	14055129	445
1794	14055130	445
1795	14055131	445
1796	14055132	445
1797	14110883	445
1798	14110884	445
1799	14110885	445
1800	14110886	445
1801	14110887	445
1802	14110888	445
1803	14110889	445
1804	14110890	445
1805	14126495	445
1806	14126496	445
1807	14126497	445
1808	14126498	445
1809	14126499	445
1810	14126500	445
1811	14126501	445
1812	13952611	517
1813	13952612	517
1814	13952613	517
1815	13952614	517
1816	13988591	517
1817	13988592	517
1818	13988593	517
1819	13988594	517
1820	14055821	110
1821	14055822	110
1822	14055880	110
1823	14055881	110
1824	14082968	110
1825	14082969	110
1826	13962973	289
1827	13962974	289
1828	13962975	289
1829	13962976	289
1830	13962977	289
1831	13970975	159
1832	13983996	159
1833	13983997	159
1834	13983998	159
1835	13983999	159
1836	13986384	159
1837	13986385	159
1838	13986387	159
1839	14019728	159
1840	14019729	159
1841	14019730	159
1842	14054984	159
1843	14054985	159
1844	14054986	159
1845	14122333	159
1846	14122334	159
1847	14122335	159
1848	14122336	159
1849	14122337	159
1850	14122338	159
1851	14122339	159
1852	14122340	159
1853	14122341	159
1854	14122342	159
1855	14122343	159
1856	14122344	159
1857	14122345	159
1858	14122346	159
1859	14122347	159
1860	14122348	159
1861	14122349	159
1862	14122350	159
1863	14122351	159
1864	13971016	353
1865	13971017	353
1866	13971018	353
1867	13971019	353
1868	13971020	353
1869	13971076	466
1870	13971106	466
1871	13971107	466
1872	13971108	466
1873	13971109	466
1874	14138475	1012
1875	14138476	1012
1876	13976363	1013
1878	13984949	381
1879	13984950	381
1880	13984951	381
1881	13984952	381
1882	13984953	381
1883	13984954	381
1884	13984955	381
1885	13984956	381
1886	14031699	381
1887	14031700	381
1888	14031701	381
1889	14031702	381
1890	14031703	381
1891	14031704	381
1892	14055042	381
1893	14055043	381
1894	14081020	381
1895	14081021	381
1896	14081022	381
1897	14081023	381
1898	14081024	381
1899	14081025	381
1900	14081026	381
1901	14081027	381
1902	14081028	381
1903	14081029	381
1904	14081030	381
1905	14081031	381
1906	14081032	381
1907	14081033	381
1908	14081034	381
1909	13998545	462
1910	13998546	462
1911	13998547	462
1912	13998548	462
1913	14019801	462
1914	14019802	462
1915	14019803	462
1916	13983642	305
1917	13983650	305
1918	13983643	305
1919	13983651	305
1920	13983644	305
1921	13983652	305
1922	13983645	305
1923	13983657	305
1924	13983752	177
1925	13983756	177
1926	13983757	177
1927	13983753	177
1928	13983754	177
1929	13983758	177
1930	13983759	177
1931	13983755	177
1932	13983728	224
1933	13983733	224
1934	13983734	224
1935	13983729	224
1936	13983730	224
1937	13983735	224
1938	13983736	224
1939	13983731	224
1940	13983696	188
1941	13983678	188
1942	13983714	188
1943	13983679	188
1944	13983715	188
1945	13983680	188
1946	13983681	188
1947	13983716	188
1948	13983664	223
1949	13983668	223
1950	13983665	223
1951	13983669	223
1952	13983670	223
1953	13983666	223
1954	13983676	223
1955	13983667	223
1956	13983660	161
1957	13983661	161
1958	13983662	161
1959	13983663	161
1960	13983621	265
1962	13983622	265
1965	13983623	265
1966	13983624	265
1968	13983626	114
1969	13984669	114
1970	13984670	114
1971	13984671	114
1972	14055088	114
1973	14055089	114
1974	14055090	114
1975	14098072	114
1976	14098073	114
1977	14098074	114
1978	14098075	114
1979	14098076	114
1980	14098077	114
1981	14098078	114
1982	14098079	114
1983	14098080	114
1984	14098081	114
1985	14098082	114
1986	14098083	114
1987	14098084	114
1988	14098085	114
1989	14098086	114
1990	14098087	114
1991	14098088	114
1992	14098089	114
1993	14098090	114
1994	14098091	114
1995	14098092	114
1996	14098093	114
1997	14098094	114
1998	14098095	114
1999	14098096	114
2000	14098097	114
2001	14098098	114
2002	14098099	114
2003	14098100	114
2004	14098101	114
2005	14098102	114
2006	14098103	114
2007	14098104	114
2008	14098105	114
2009	14098106	114
2010	14098107	114
2011	14098108	114
2012	14098109	114
2013	14123315	114
2014	14123316	114
2015	14123317	114
2016	14123318	114
2017	14123319	114
2018	14123331	114
2019	14123332	114
2020	14123333	114
2021	14123334	114
2022	14123335	114
2023	14123336	114
2024	14123337	114
2025	14123338	114
2026	14123339	114
2027	14123340	114
2028	14123341	114
2029	14123342	114
2030	14123343	114
2031	14123344	114
2032	14123345	114
2033	14123346	114
2034	14123347	114
2035	14123348	114
2036	14123349	114
2037	13983635	229
2038	13983636	229
2039	13983637	229
2040	13983638	229
2041	13983639	229
2042	13983640	229
2043	13983641	229
2044	13983646	164
2045	13983647	164
2046	13983648	164
2047	13983649	164
2048	14019794	164
2049	14019795	164
2050	14019796	164
2051	14055327	164
2052	14055328	164
2053	14055329	164
2054	13983719	22
2055	13983720	22
2056	13983721	22
2057	13983722	22
2058	13988730	22
2059	13988731	22
2060	13983740	495
2061	13983741	495
2062	13983742	495
2063	13988736	495
2064	13983765	35
2065	13983766	35
2066	13983767	35
2067	13983768	35
2068	13983992	35
2069	13983993	35
2070	13983994	35
2071	13983995	35
2072	13983978	974
2073	13983979	974
2074	13983980	974
2075	13983981	974
2076	14050714	974
2077	14050715	974
2078	14050716	974
2079	14055003	974
2080	14055004	974
2081	14055005	974
2082	14080951	974
2083	14080952	974
2084	14080953	974
2085	14080954	974
2086	14080955	974
2087	14080956	974
2088	14080957	974
2089	14080958	974
2090	14080959	974
2091	14080960	974
2092	14080961	974
2093	14080962	974
2094	14080963	974
2095	14080964	974
2096	14080965	974
2097	14127481	974
2098	14127482	974
2099	14127483	974
2100	14127484	974
2101	14127485	974
2102	14127486	974
2103	14127487	974
2104	14127488	974
2105	14127489	974
2106	14127490	974
2107	14127491	974
2108	14127492	974
2109	14127493	974
2110	14127494	974
2111	14127495	974
2112	14127496	974
2113	14127497	974
2114	14127498	974
2115	14127499	974
2116	14130839	974
2117	13983988	738
2118	13983989	738
2119	13983990	738
2120	13983991	738
2121	13988727	738
2122	13988728	738
2123	14053724	738
2124	14053725	738
2125	14053726	738
2126	14056295	413
2127	14056296	413
2128	14056297	413
2129	14081001	413
2130	14081002	413
2131	14081003	413
2132	14081004	413
2133	14081005	413
2134	14081006	413
2135	14081007	413
2136	14081008	413
2137	14081009	413
2138	14081010	413
2139	14081011	413
2140	14081012	413
2141	14081013	413
2142	14081014	413
2143	14081015	413
2144	14081016	413
2145	14081017	413
2146	14081018	413
2147	14081019	413
2148	14127246	413
2149	14127247	413
2150	14127248	413
2151	14127249	413
2152	14127250	413
2153	14127252	413
2154	14127253	413
2155	14127254	413
2156	14127255	413
2157	14127256	413
2158	14127257	413
2159	13984021	174
2160	13984022	174
2161	13984023	174
2162	13984024	174
2163	13984042	246
2164	13984043	246
2165	13984044	246
2166	13984045	246
2167	14050578	246
2168	14050579	246
2169	14050580	246
2170	14050581	246
2171	14050582	246
2172	14050583	246
2173	14053721	246
2174	14053722	246
2175	14053723	246
2176	13984052	213
2177	13984053	213
2178	13984054	213
2179	13984055	213
2180	13984073	341
2181	13984074	341
2182	13984075	341
2183	13984076	341
2184	13984086	494
2185	13984087	494
2186	13984088	494
2187	13984089	494
2188	13984979	191
2189	13984980	191
2190	13984981	191
2191	13984982	191
2192	14031358	191
2193	14031359	191
2194	14031360	191
2195	14056332	191
2196	14056333	191
2197	14056334	191
2198	14056335	191
2199	14056336	191
2200	14056337	191
2201	14060073	191
2202	14060074	191
2203	14060075	191
2204	14122156	191
2205	14122157	191
2206	14122158	191
2207	14122159	191
2208	14122160	191
2209	14122161	191
2210	14122162	191
2211	14122163	191
2212	14122164	191
2213	14122165	191
2214	14122166	191
2215	13985322	196
2216	13985323	196
2217	13985324	196
2218	13985325	196
2219	14031281	196
2220	14031282	196
2221	14031283	196
2222	14053727	196
2223	14053728	196
2224	14053729	196
2225	13985330	160
2226	13985331	160
2227	13985332	160
2228	13985333	160
2229	13986281	160
2230	13986282	160
2231	13986283	160
2232	13986284	160
2233	14019798	160
2234	14019799	160
2235	14031569	160
2236	14055160	160
2237	14055161	160
2238	14055162	160
2239	13985454	21
2240	13985455	21
2241	13985456	21
2242	13985457	21
2243	14031367	21
2244	14031368	21
2245	14031369	21
2246	13985432	107
2247	13985433	107
2248	13985434	107
2249	13985435	107
2250	14031274	107
2251	14031275	107
2252	14031276	107
2253	14053736	107
2254	14053737	107
2255	14053738	107
2256	14081063	107
2257	14081064	107
2258	14081065	107
2259	13985273	351
2260	13985274	351
2261	13985275	351
2262	13985276	351
2263	14031684	351
2264	14031685	351
2265	14031686	351
2266	14056322	351
2267	14056323	351
2268	14056324	351
2269	13985009	254
2270	13985010	254
2271	13985011	254
2272	13985012	254
2273	14123739	254
2274	14123740	254
2275	14123741	254
2276	14123742	254
2277	13985004	128
2278	13985005	128
2279	13985006	128
2280	13985007	128
2281	14081303	128
2282	14081304	128
2283	14081305	128
2284	14081306	128
2285	14081307	128
2286	14081308	128
2287	14081309	128
2288	14081310	128
2289	14081311	128
2290	14081312	128
2291	14081313	128
2292	14081314	128
2293	14081315	128
2294	14081316	128
2295	14081317	128
2296	13985839	83
2297	13985840	83
2298	13985841	83
2299	13985842	83
2300	14050720	83
2301	14050721	83
2302	14050722	83
2303	14053733	83
2304	14053734	83
2305	14053735	83
2306	13984998	139
2307	13984999	139
2308	13985000	139
2309	13985001	139
2310	14031705	139
2311	14031707	139
2312	14054755	139
2313	14054756	139
2314	14054757	139
2315	13984137	249
2316	13984138	249
2317	13984139	249
2318	13984140	249
2319	14031619	249
2320	14031620	249
2321	14031621	249
2322	14057963	249
2323	14057964	249
2324	14057965	249
2325	13984141	244
2326	13984142	244
2327	13984143	244
2328	13984144	244
2329	14031616	244
2330	14031617	244
2331	14031618	244
2332	14057970	244
2333	14057971	244
2334	14057972	244
2335	13984145	251
2336	13984146	251
2337	13984147	251
2338	13984148	251
2339	14031425	251
2340	14031426	251
2341	14031427	251
2342	14057967	251
2343	14057968	251
2344	14057969	251
2345	13984166	272
2346	13984167	272
2347	13984168	272
2348	13984169	272
2349	13984153	230
2350	13984154	230
2351	13984155	230
2352	13984156	230
2353	13984157	230
2354	13984158	230
2355	13984159	230
2356	13984160	230
2357	14019351	230
2358	14019352	230
2359	14019353	230
2360	14051387	230
2361	14051388	230
2362	14051389	230
2363	13984170	38
2364	13984171	38
2365	13984172	38
2366	13984173	38
2367	14019783	38
2368	14019784	38
2369	14019785	38
2370	13984181	428
2371	13984183	428
2372	13984184	428
2373	13984185	428
2374	14019865	428
2375	14019866	428
2376	14019867	428
2377	14054396	428
2378	14054397	428
2379	14054398	428
2380	13984194	286
2381	13984195	286
2382	13984196	286
2383	13984197	286
2384	14056829	286
2385	14056830	286
2386	14056831	286
2387	14056832	286
2388	14056833	286
2389	14056834	286
2390	13984302	96
2391	13984303	96
2392	13984304	96
2393	13984305	96
2394	14050977	96
2395	14050978	96
2396	14050979	96
2397	14081066	96
2398	14081067	96
2399	14081068	96
2400	13984297	509
2401	13984298	509
2402	13984299	509
2403	13984300	509
2404	14054434	509
2405	14054435	509
2406	14054436	509
2407	14054437	509
2408	14054438	509
2409	14054439	509
2410	13984322	427
2411	13984323	427
2412	13984324	427
2413	13984325	427
2414	14054408	427
2415	14054409	427
2416	14054410	427
2417	14081049	427
2418	14081050	427
2419	14081051	427
2420	13984326	301
2421	13984327	301
2422	13984328	301
2423	13984329	301
2424	14019845	301
2425	14019846	301
2426	14019847	301
2427	13984338	422
2428	13984339	422
2429	13984340	422
2430	13984341	422
2431	14051022	422
2432	14051023	422
2433	14051024	422
2434	14055372	422
2435	14055373	422
2436	14055374	422
2437	14055375	422
2438	14055376	422
2439	14055377	422
2440	13984350	80
2441	13984351	80
2442	13984352	80
2443	13984353	80
2444	14050992	80
2445	14050993	80
2446	14051031	80
2447	13984345	7
2448	13984346	7
2449	13984347	7
2450	13984348	7
2451	14031933	7
2452	14031934	7
2453	14031935	7
2454	14055760	7
2455	14055761	7
2456	14055762	7
2457	13984676	93
2458	13984677	93
2459	13984678	93
2460	13984679	93
2461	13984414	343
2462	13984415	343
2463	13984416	343
2464	13984417	343
2465	13984924	141
2466	13984925	141
2467	13984926	141
2468	13984927	141
2469	14031872	141
2470	14031873	141
2471	14031874	141
2472	14052428	141
2473	14052429	141
2474	14098116	141
2475	14098117	141
2476	13984680	503
2477	13984684	503
2478	13984685	503
2479	13984681	503
2480	13984682	503
2481	13984686	503
2482	13984683	503
2483	13984687	503
2484	13984696	95
2485	13984697	95
2486	13984698	95
2487	13984699	95
2488	13984700	60
2489	13984701	60
2490	13984702	60
2491	13984703	60
2492	14063902	60
2493	14063903	60
2494	14063904	60
2495	14081325	60
2496	14081326	60
2497	14081327	60
2498	13984785	84
2499	13984787	84
2500	13984788	84
2501	13984789	84
2502	14019804	84
2503	14019805	84
2504	14019806	84
2505	14055341	84
2506	14055342	84
2507	14055343	84
2508	13984737	127
2509	13984738	127
2510	13984739	127
2511	13984740	127
2512	14012286	127
2513	14056953	127
2514	14056954	127
2515	14063872	127
2516	14063873	127
2517	14063874	127
2518	13984836	394
2519	13984837	394
2520	13984838	394
2521	13984839	394
2522	14055339	394
2523	14055340	394
2524	14059301	394
2525	14088726	394
2526	14088727	394
2527	14088728	394
2528	14088729	394
2529	13984804	53
2530	13984805	53
2531	13984806	53
2532	13984807	53
2533	14019842	53
2534	14019843	53
2535	14019844	53
2536	14054520	53
2537	14054521	53
2538	14054522	53
2539	14054523	53
2540	14054524	53
2541	14088623	53
2542	14088624	53
2543	14088625	53
2544	13984844	119
2545	13984845	119
2546	13984846	119
2547	13984847	119
2548	14081478	119
2549	14081479	119
2550	14081480	119
2551	14081481	119
2552	14081482	119
2553	14081483	119
2554	14081484	119
2555	14081485	119
2556	14081486	119
2557	14081487	119
2558	14081488	119
2559	14081489	119
2560	14081490	119
2561	13984968	163
2562	13984969	163
2563	13984970	163
2564	13984971	163
2565	13984935	299
2566	13984936	299
2567	13984937	299
2568	13984938	299
2569	14122111	299
2570	14122112	299
2571	14122113	299
2572	14122114	299
2573	14122115	299
2574	14122116	299
2575	14122117	299
2576	13985028	192
2577	13985029	192
2578	13985030	192
2579	13985031	192
2580	14031364	192
2581	14031365	192
2582	14031366	192
2583	13985036	255
2584	13985037	255
2585	13985038	255
2586	13985039	255
2587	13985313	115
2588	13985314	115
2589	13985315	115
2590	13985316	115
2591	14018162	115
2592	14018163	115
2593	14018164	115
2594	14055196	115
2595	14055197	115
2596	14055198	115
2597	14018250	523
2598	14018251	523
2599	14018252	523
2600	14054863	523
2601	14054864	523
2602	13985285	166
2603	13985286	166
2604	13985287	166
2605	13985288	166
2606	13985294	94
2607	13985295	94
2608	13985296	94
2609	13985297	94
2610	13985458	210
2611	13985459	210
2612	13985460	210
2613	13985461	210
2614	14080943	210
2615	14080944	210
2616	14080945	210
2617	14080946	210
2618	14080947	210
2619	14098062	210
2620	14098063	210
2621	14098064	210
2622	14098065	210
2623	14098066	210
2624	14098067	210
2625	14098068	210
2626	14098069	210
2627	14098154	210
2628	14098155	210
2629	14127170	210
2630	14098156	210
2631	14127171	210
2632	14127172	210
2633	14098157	210
2634	14127173	210
2635	14098158	210
2636	14098159	210
2637	14098160	210
2638	14098161	210
2639	14098162	210
2640	14098163	210
2641	14098164	210
2642	14098165	210
2643	14098166	210
2644	14098167	210
2645	14098168	210
2646	14127151	210
2647	14127152	210
2648	14127153	210
2649	14127154	210
2650	14127155	210
2651	14127156	210
2652	14127157	210
2653	14127159	210
2654	14127160	210
2655	14127161	210
2656	14127162	210
2657	14127163	210
2658	14127164	210
2659	14127165	210
2660	14127166	210
2661	14127167	210
2662	14127168	210
2663	14127169	210
2664	13985318	440
2665	13985319	440
2666	13985320	440
2667	13985321	440
2668	13985326	180
2669	13985327	180
2670	13985328	180
2671	13985329	180
2672	14018085	180
2673	14018086	180
2674	14018087	180
2675	14021510	459
2676	14021511	459
2677	14021512	459
2678	14021513	459
2679	13985450	130
2680	13985451	130
2681	13985452	130
2682	13985453	130
2683	13985436	199
2684	13985437	199
2685	13985438	199
2686	13985439	199
2688	13985463	271
2690	13985464	271
2691	13985465	271
2696	14124217	271
2698	14124218	271
2699	14124219	271
2702	14124220	271
2704	14124221	271
2705	13985476	100
2706	13985477	100
2707	13985478	100
2708	13985479	100
2709	13985621	302
2710	13985622	302
2711	13985623	302
2712	13985624	302
2713	14031428	302
2714	14031429	302
2715	14031430	302
2716	13985760	36
2717	13985761	36
2718	13985762	36
2719	13985763	36
2720	14018071	31
2721	14018072	31
2722	14027202	31
2723	14054739	31
2724	14054740	31
2725	14054741	31
2726	14054742	31
2727	14054743	31
2728	14054744	31
2729	14054745	31
2730	14054746	31
2731	14054747	31
2732	14054748	31
2733	14054749	31
2734	14054750	31
2735	14054751	31
2736	14081069	31
2737	14081070	31
2738	14081071	31
2739	14081072	31
2740	13985897	300
2741	13985898	300
2742	13985899	300
2743	13985900	300
2744	14050717	300
2745	14050718	300
2746	14050719	300
2747	14054413	300
2748	14054414	300
2749	14054415	300
2750	13985929	98
2751	13985930	98
2752	13985931	98
2753	13985932	98
2754	13985949	56
2755	13985950	56
2756	13985951	56
2757	13985952	56
2758	14056213	56
2759	14056214	56
2760	14056215	56
2761	13985978	61
2762	13985979	61
2763	13985980	61
2764	13985981	61
2765	13986009	154
2766	13986010	154
2767	13986011	154
2768	13986012	154
2769	14050940	154
2770	14050941	154
2771	14050942	154
2772	14054525	154
2773	14054526	154
2774	14054527	154
2775	13986263	424
2776	13986264	424
2777	13986266	424
2778	14032354	424
2779	14032355	424
2780	14032356	424
2781	14054411	424
2782	14054412	424
2783	14059300	424
2784	13986027	1015
2785	13986028	1015
2786	13986029	1015
2787	13986030	1015
2788	14050903	1015
2789	14050904	1015
2790	14050905	1015
2791	14081455	1015
2792	14081456	1015
2793	13986063	296
2794	13986064	296
2795	13986065	296
2796	13986066	296
2797	14050945	296
2798	14050946	296
2799	14050947	296
2800	13986068	108
2801	13986069	108
2802	13986070	108
2803	13986071	108
2804	14056401	108
2805	14056402	108
2806	14056409	108
2807	13986086	109
2808	13986087	109
2809	13986088	109
2810	13986109	55
2811	13986110	55
2812	13986111	55
2813	13986112	55
2814	13986186	169
2815	13986140	169
2816	13986141	169
2817	13986187	169
2818	13986142	169
2819	13986190	169
2820	13986191	169
2821	13986143	169
2822	14111670	169
2823	13986150	270
2824	13986151	270
2825	13986152	270
2826	13986153	270
2827	14054592	270
2828	14054593	270
2829	14054594	270
2830	14054595	270
2831	14054596	270
2832	14054597	270
2833	14054598	270
2834	14054599	270
2835	14054600	270
2836	14054601	270
2837	14054602	270
2838	14054603	270
2839	14054604	270
2840	14054605	270
2841	14054606	270
2842	14080923	270
2843	14080924	270
2844	14080925	270
2845	14080926	270
2846	14080927	270
2847	14080928	270
2848	14080929	270
2849	14098115	270
2850	13986195	306
2851	13986196	306
2852	13986197	306
2853	13986198	306
2854	13986199	306
2855	13986200	306
2856	13986201	306
2857	13986202	306
2858	14050886	306
2859	14050887	306
2860	14050888	306
2861	14050889	306
2862	14050890	306
2863	14050891	306
2864	13986256	106
2865	13986257	106
2866	13986258	106
2867	13986259	106
2868	14050572	106
2869	14050573	106
2870	14050574	106
2871	14052238	106
2872	14052239	106
2873	14052240	106
2874	14081154	106
2875	14081155	106
2876	14081156	106
2877	14081157	106
2878	14081158	106
2879	14081159	106
2880	13986277	404
2881	13986278	404
2882	13986279	404
2883	13986280	404
2884	14055105	404
2885	14055106	404
2886	14055115	404
2887	13986664	45
2888	13986665	45
2889	13986666	45
2890	13986667	45
2891	14050994	45
2892	14050995	45
2893	14056614	45
2894	14056615	45
2895	13986693	105
2896	13986694	105
2897	13986695	105
2898	13986696	105
2899	13986705	236
2900	13986706	236
2901	13986707	236
2902	13986708	236
2903	14031909	236
2904	14031910	236
2905	14059047	236
2906	14059368	236
2907	14022234	142
2908	14054791	142
2909	14054792	142
2910	14054793	142
2911	14054794	142
2912	14054795	142
2913	14054796	142
2914	14080966	142
2915	14080967	142
2916	14080968	142
2917	14080969	142
2918	14080970	142
2919	14080971	142
2920	14080972	142
2921	14080973	142
2922	14085849	142
2923	14085850	142
2924	14085851	142
2925	14085852	142
2926	14085853	142
2927	14085854	142
2928	14085855	142
2929	14085856	142
2930	14085857	142
2931	14085858	142
2932	14085859	142
2933	14085860	142
2934	14085861	142
2935	14085862	142
2936	14085863	142
2937	14085864	142
2938	14085865	142
2939	14085866	142
2940	14085867	142
2941	14085868	142
2942	14085869	142
2943	14085870	142
2944	14085871	142
2945	14085872	142
2946	13986734	222
2947	13986735	222
2948	13986736	222
2949	13986737	222
2950	14031652	222
2951	14031653	222
2952	14056231	222
2953	14056232	222
2954	13986746	12
2955	13986747	12
2956	13986748	12
2957	13986749	12
2958	14033209	12
2959	14033210	12
2960	14056217	12
2961	14056218	12
2962	13986765	505
2963	13986766	505
2964	13986767	505
2965	13986768	505
2966	14031695	505
2967	14031696	505
2968	13986800	248
2969	13986801	248
2970	13986802	248
2971	13986803	248
2972	14031577	248
2973	14031578	248
2974	13986820	395
2975	13986823	395
2976	13986816	395
2977	13986817	395
2978	13986825	395
2979	13986824	395
2980	13986826	395
2981	13986827	395
2982	13986828	395
2983	13986819	395
2984	13986829	395
2985	13986944	52
2986	13986945	52
2987	13986946	52
2988	13986947	52
2989	14031570	52
2990	14031571	52
2991	14031572	52
2992	14031573	52
2993	14055113	52
2994	14055114	52
2995	13986990	131
2996	13986991	131
2997	13986992	131
2998	13986993	131
2999	13987033	321
3000	13987034	321
3001	13987035	321
3002	13987036	321
3007	13987156	303
3008	13987157	303
3009	13987158	303
3010	13987159	303
3011	14051017	285
3012	14051018	285
3013	14051019	285
3014	14055118	285
3015	14055119	285
3016	14055120	285
3017	14055124	285
3018	13987213	147
3019	13987214	147
3020	13987215	147
3021	13987216	147
3022	13987219	148
3023	13987220	148
3024	13987221	148
3025	13987222	148
3026	14050970	148
3027	14050971	148
3028	13987229	311
3029	13987230	311
3030	13987231	311
3031	13987232	311
3032	14055030	311
3033	14055031	311
3034	14055032	311
3035	14055033	311
3036	14056896	311
3037	14056897	311
3038	13987233	283
3039	13987234	283
3040	13987235	283
3041	13987236	283
3042	14031708	283
3043	14031709	283
3044	14056253	283
3045	14056254	283
3046	13987238	288
3047	13987239	288
3048	13987240	288
3049	13987241	288
3050	14031622	288
3051	14031623	288
3052	13987253	247
3053	13987254	247
3054	13987255	247
3055	13987256	247
3056	14031567	247
3057	14031568	247
3058	14054532	247
3059	14054533	247
3060	13987257	297
3061	13987258	297
3062	13987259	297
3063	13987260	297
3064	13987247	354
3065	13987243	354
3066	13987248	354
3067	13987244	354
3068	13987245	354
3069	13987249	354
3070	13987246	354
3071	13987250	354
3072	14130363	354
3073	14050931	354
3074	14050932	354
3075	14130364	354
3076	14059393	354
3077	14059394	354
3078	13987261	81
3079	13987262	81
3080	13987263	81
3081	13987264	81
3082	14055107	81
3083	14055108	81
3084	14055109	81
3085	14055110	81
3086	13987272	150
3087	13987273	150
3088	13987274	150
3089	13987275	150
3090	14051020	150
3091	14051021	150
3092	14090792	150
3093	14090793	150
3094	13987268	345
3095	13987269	345
3096	13987270	345
3097	13987271	345
3098	14051012	345
3099	14051013	345
3100	13987768	237
3101	13987769	237
3102	13987770	237
3103	13987771	237
3104	13987764	40
3105	13987765	40
3106	13987766	40
3107	13987767	40
3108	13987777	41
3109	13987778	41
3110	13987779	41
3111	13987780	41
3112	14041427	41
3113	14041428	41
3114	14041429	41
3115	13987792	540
3116	13987793	540
3117	13987794	540
3118	13987795	540
3119	14050951	540
3120	14050952	540
3121	14058833	540
3122	14058834	540
3123	13987802	239
3124	13987803	239
3125	13987804	239
3126	13987805	239
3127	14050924	239
3128	14050935	239
3129	14058923	239
3130	14058924	239
3131	13987807	82
3132	13987808	82
3133	13987809	82
3134	13987810	82
3135	14056791	82
3136	14056792	82
3137	14057950	82
3138	14057951	82
3139	13987815	157
3140	13987816	157
3141	13987817	157
3142	13987818	157
3143	14056298	157
3144	14056299	157
3145	14059357	157
3146	14059358	157
3147	13987831	322
3148	13987832	322
3149	13987833	322
3150	13987834	322
3151	14098127	1016
3152	14098128	1016
3153	14098129	1016
3154	14098130	1016
3155	14098131	1016
3156	14098132	1016
3157	14098133	1016
3158	14098134	1016
3159	14098135	1016
3160	14098136	1016
3161	14098137	1016
3162	14098138	1016
3163	14098139	1016
3164	14098140	1016
3165	14098141	1016
3166	14098142	1016
3167	14098143	1016
3168	14098144	1016
3169	14098145	1016
3170	14098146	1016
3171	14098147	1016
3172	14126418	1016
3173	14126419	1016
3174	14126420	1016
3175	14126421	1016
3176	14126422	1016
3177	14126423	1016
3178	14126424	1016
3179	14126425	1016
3180	14126426	1016
3181	14126427	1016
3182	13988559	273
3183	13988560	273
3184	13988561	273
3185	13988562	273
3186	13988567	117
3187	13988568	117
3188	13988569	117
3189	13988570	117
3190	13988896	59
3191	13988897	59
3192	13988898	59
3193	13988899	59
3194	14056181	59
3195	14056182	59
3196	14056183	59
3197	13992133	330
3198	13992134	330
3199	13992135	330
3200	13992136	330
3201	13992313	553
3202	13992315	562
3203	13992318	558
3204	13992322	560
3205	13992330	557
3206	13992333	571
3207	13992339	552
3208	13992368	556
3209	13992369	574
3210	13992432	349
3211	13992436	566
3212	13992437	565
3213	13992438	576
3214	13992547	569
3215	13992548	563
3216	13992549	573
3217	13992550	567
3218	13992551	570
3219	13992552	572
3220	13992556	577
3221	13992564	29
3222	13992567	333
3223	13992573	460
3224	13992574	460
3225	13992575	460
3226	13992576	460
3227	13992577	460
3228	14055769	529
3229	14055770	529
3230	14055771	529
3231	14055772	529
3232	14059297	529
3233	14059298	529
3234	13998452	20
3235	14019670	20
3236	14019671	20
3237	14019672	20
3238	14019673	20
3239	14019674	20
3240	14019675	20
3241	14054502	20
3242	14054503	20
3243	14054504	20
3244	14054505	20
3245	14054506	20
3246	14054507	20
3247	14088020	20
3248	14088021	20
3249	14088022	20
3250	14088023	20
3251	14088024	20
3252	14088025	20
3253	14088026	20
3254	14088027	20
3255	14088028	20
3256	14088029	20
3257	14088030	20
3258	14122845	20
3259	14122846	20
3260	14122847	20
3261	14122848	20
3262	14122849	20
3263	14122850	20
3264	14122851	20
3265	14122852	20
3266	14122853	20
3267	14122854	20
3268	14122855	20
3269	14122856	20
3270	14122857	20
3271	14122858	20
3272	14122859	20
3273	14122860	20
3274	14122861	20
3275	14122862	20
3276	13998522	342
3277	13998523	342
3278	13998524	342
3279	13998525	342
3280	14002994	582
3281	14021509	583
3282	14002989	331
3283	14139283	1017
3284	14139284	1018
3285	14139285	1018
3286	14085114	901
3287	14139289	901
3288	14055966	336
3289	14055967	336
3290	14051009	1019
3291	14051010	1019
3292	14051011	1019
3293	14056157	314
3294	14056158	314
3295	14051039	221
3298	14051040	221
3299	14051041	221
3301	14056331	221
3303	14056338	221
3305	14056339	221
3306	14081365	221
3309	14081366	221
3311	14081367	221
3312	14088034	221
3315	14088035	221
3317	14088036	221
3319	14088037	221
3321	14088038	221
3323	14088039	221
3325	14088040	221
3326	14088041	221
3329	14088042	221
3331	14088043	221
3333	14088044	221
3335	14088045	221
3337	14088046	221
3338	14088047	221
3340	14088048	221
3343	14088049	221
3345	14088050	221
3347	14088051	221
3348	14088052	221
3350	14088053	221
3352	14088054	221
3355	14088055	221
3357	14088056	221
3359	14088057	221
3360	14088058	221
3362	14088059	221
3364	14088060	221
3366	14050980	62
3367	14050981	62
3368	14050982	62
3369	14050983	62
3370	14050984	62
3371	14050985	62
3372	14050986	62
3373	14050987	62
3374	14050988	62
3375	14051479	62
3376	14051480	62
3377	14051481	62
3378	14051482	62
3379	14051483	62
3380	14051484	62
3381	14051485	62
3382	14051486	62
3383	14051487	62
3384	14051488	62
3385	14051489	62
3386	14051490	62
3387	14051491	62
3388	14051492	62
3389	14051493	62
3390	14051494	62
3391	14051495	62
3392	14051496	62
3393	14051497	62
3394	14051498	62
3395	14051499	62
3396	14081428	62
3397	14081429	62
3398	14081430	62
3399	14081431	62
3400	14081432	62
3401	14081433	62
3402	14081434	62
3403	14081435	62
3404	14081436	62
3405	14081437	62
3406	14081438	62
3407	14081439	62
3408	14081440	62
3409	14081441	62
3410	14085113	62
3411	14086400	62
3412	14086401	62
3413	14086402	62
3414	14055783	380
3415	14055784	380
3416	14012447	205
3417	14012448	205
3418	14012449	205
3419	14012450	205
3420	14012451	205
3421	14012452	205
3422	14012338	234
3423	14012339	234
3424	14020059	234
3425	14055006	234
3426	14055007	234
3427	14013094	284
3428	14013095	284
3429	14013096	284
3430	14018091	99
3431	14018092	99
3432	14018093	99
3433	14055121	99
3434	14055122	99
3435	14055123	99
3436	14081036	99
3437	14081037	99
3438	14081038	99
3439	14081039	99
3440	14081040	99
3441	14081041	99
3442	14081042	99
3443	14081043	99
3444	14081035	99
3445	14123981	99
3446	14123982	99
3447	14123983	99
3448	14123984	99
3449	14055910	386
3450	14055911	386
3451	14055912	386
3452	14055913	386
3453	14055914	386
3454	14055915	386
3455	14055923	386
3456	14055924	386
3457	14055925	386
3458	14055926	386
3459	14055927	386
3460	14055928	386
3461	14123463	386
3462	14123464	386
3463	14123465	386
3464	14123466	386
3465	14123467	386
3466	14123468	386
3467	14123469	386
3468	14123470	386
3469	14033385	348
3470	14018152	112
3471	14018153	112
3472	14018154	112
3473	14018155	112
3474	14018156	112
3475	14018157	112
3476	14054646	112
3477	14054647	112
3478	14054648	112
3479	14081342	112
3480	14081343	112
3481	14081344	112
3482	14081345	112
3483	14123542	112
3484	14123543	112
3485	14123544	112
3486	14123545	112
3487	14123546	112
3488	14123547	112
3489	14123548	112
3490	14123549	112
3491	14123550	112
3492	14123551	112
3493	14054642	3
3494	14054643	3
3495	14054644	3
3496	14126539	3
3497	14126540	3
3498	14126541	3
3499	14126542	3
3500	14126543	3
3501	14126544	3
3502	14126545	3
3503	14126546	3
3504	14126547	3
3505	14055955	414
3506	14055956	414
3507	14055957	414
3508	14018068	49
3509	14018069	49
3510	14018070	49
3511	14064325	350
3512	14064326	350
3513	14064327	350
3514	14064328	350
3515	14064329	350
3516	14055404	399
3517	14055405	399
3518	14055406	399
3519	14066909	399
3520	14066910	399
3521	14066911	399
3522	14054888	39
3523	14054889	39
3524	14054890	39
3525	14054891	39
3526	14054892	39
3527	14054893	39
3528	14054894	39
3529	14054902	39
3530	14054903	39
3531	14054904	39
3532	14019173	478
3533	14019174	478
3534	14019175	478
3535	14019209	281
3536	14019210	281
3537	14019211	281
3538	14056962	281
3539	14056963	281
3540	14056964	281
3541	14019226	493
3542	14019227	493
3543	14019228	493
3544	14031690	493
3545	14031691	493
3546	14031692	493
3547	14031693	493
3548	14057078	493
3549	14057079	493
3550	14057080	493
3551	14019269	436
3552	14019261	436
3553	14019270	436
3554	14019262	436
3555	14019263	436
3556	14019271	436
3557	14055274	527
3558	14055275	527
3559	14019684	468
3560	14019685	468
3561	14019686	468
3562	14055388	468
3563	14055389	468
3564	14055390	468
3565	14019736	240
3566	14019738	240
3567	14019739	240
3568	14019740	240
3569	14019741	240
3570	14019742	240
3571	14019743	240
3572	14019944	486
3573	14019945	486
3574	14019946	486
3575	14055410	486
3576	14055411	486
3577	14055412	486
3578	14124332	486
3579	14124333	486
3580	14124334	486
3581	14124335	486
3582	14019956	415
3583	14019957	415
3584	14019958	415
3585	14086701	415
3586	14086702	415
3587	14086703	415
3588	14086704	415
3589	14086705	415
3590	14086706	415
3591	14086707	415
3592	14086708	415
3593	14086709	415
3594	14086710	415
3595	14086711	415
3596	14086712	415
3597	14086713	415
3598	14086714	415
3599	14086715	415
3600	14086716	415
3601	14086717	415
3602	14086718	415
3603	14086719	415
3604	14086720	415
3605	14086721	415
3606	14086722	415
3607	14086723	415
3608	14086724	415
3609	14086725	415
3610	14086726	415
3611	14086727	415
3612	14122596	415
3613	14122597	415
3614	14122598	415
3615	14122599	415
3616	14122600	415
3617	14122601	415
3618	14122602	415
3619	14122603	415
3620	14122604	415
3621	14122605	415
3622	14122606	415
3623	14019959	42
3624	14019962	42
3625	14019963	42
3626	14019960	42
3627	14019964	42
3628	14019961	42
3629	14020304	522
3630	14020305	522
3631	14020306	522
3632	14055413	522
3633	14055414	522
3634	14055415	522
3635	14020331	140
3636	14020332	140
3637	14020333	140
3638	14024765	347
3639	14024766	347
3640	14024767	347
3641	14024768	347
3642	14024769	347
3643	14021480	438
3644	14021481	438
3645	14021482	438
3646	14021483	438
3647	14021484	438
3648	14094672	900
3649	14094673	900
3650	14055950	267
3651	14055951	267
3652	14081332	267
3653	14081333	267
3654	14086653	621
3655	14086654	621
3656	14086655	621
3657	14086656	621
3658	14086657	621
3659	14086658	621
3660	14086659	621
3661	14086660	621
3662	14086661	621
3663	14086662	621
3664	14086663	621
3665	14086664	621
3666	14086665	621
3667	14086666	621
3668	14086667	621
3669	14086668	621
3670	14123169	621
3671	14123170	621
3672	14123171	621
3673	14123172	621
3674	14123173	621
3675	14123174	621
3676	14123175	621
3677	14123176	621
3678	14123177	621
3679	14123178	621
3680	14123179	621
3681	14123180	621
3682	14123181	621
3683	14123182	621
3684	14123183	621
3685	14123184	621
3686	14056764	392
3687	14059299	392
3688	14031886	200
3689	14031887	200
3690	14031888	200
3691	14055058	200
3692	14055059	200
3693	14055060	200
3694	14055061	200
3695	14055062	200
3696	14055063	200
3697	14081086	200
3698	14081087	200
3699	14081088	200
3700	14081089	200
3701	14060076	191
3702	14032066	97
3703	14032067	97
3704	14032681	97
3705	14032072	144
3706	14032073	144
3707	14032074	144
3708	14122803	144
3709	14122804	144
3710	14122805	144
3711	14122806	144
3712	14032075	104
3713	14032076	104
3714	14032077	104
3715	14055963	104
3716	14055964	104
3717	14032127	520
3718	14032128	520
3719	14032129	520
3720	14055158	520
3721	14055159	520
3722	14032130	448
3723	14032131	448
3724	14032132	448
3725	14057350	448
3726	14057351	448
3727	14032155	388
3728	14098301	388
3729	14098302	388
3730	14032156	388
3731	14056759	397
3732	14056757	397
3733	14056758	397
3734	14056760	397
3735	14032552	344
3736	14032553	344
3737	14032554	344
3738	14055393	344
3739	14032664	195
3740	14032665	195
3741	14032678	8
3742	14032679	8
3743	14032680	8
3744	14053730	8
3745	14053731	8
3746	14053732	8
3747	14032684	430
3748	14032685	430
3749	14032686	430
3750	14054822	430
3751	14054823	430
3752	14054826	430
3753	14054827	430
3754	14054828	430
3755	14054829	430
3756	14054830	430
3757	14032753	156
3758	14032754	156
3759	14054540	156
3760	14054541	156
3761	14032778	508
3762	14032779	508
3763	14032780	508
3764	14033248	225
3765	14033242	225
3766	14033250	225
3767	14033243	225
3768	14033244	225
3769	14033252	225
3770	14088440	225
3771	14110891	225
3772	14088441	225
3773	14110894	225
3774	14110896	225
3775	14088442	225
3776	14110897	225
3777	14088443	225
3778	14110898	225
3779	14088444	225
3780	14110899	225
3781	14088445	225
3782	14110900	225
3783	14088446	225
3784	14088447	225
3785	14110901	225
3786	14110902	225
3787	14088448	225
3788	14131499	225
3789	14088449	225
3790	14131500	225
3791	14088450	225
3792	14088451	225
3793	14033380	1020
3794	14033381	1020
3795	14033382	1020
3796	14033383	1020
3797	14033404	1021
3798	14033405	1021
3799	14033406	1021
3800	14033407	1021
3801	14033847	1022
3802	14033848	1022
3803	14033849	1022
3804	14033850	1022
3805	14035985	363
3806	14036006	420
3807	14036007	420
3808	14036008	420
3809	14036496	358
3810	14036497	358
3811	14036498	358
3812	14036531	421
3813	14037209	190
3814	14042834	126
3815	14042835	126
3816	14042836	126
3817	14042837	126
3818	14042838	126
3819	14042839	126
3820	14042840	126
3821	14042841	126
3822	14042842	126
3823	14055763	126
3824	14055764	126
3825	14055765	126
3826	14055766	126
3827	14055767	126
3828	14055768	126
3829	14082970	126
3830	14082971	126
3831	14082972	126
3832	14085992	126
3833	14085993	126
3834	14085994	126
3835	14085995	126
3836	14085996	126
3837	14085997	126
3838	14085998	126
3839	14085999	126
3840	14086000	126
3841	14086001	126
3842	14086002	126
3843	14086003	126
3844	14086004	126
3845	14086005	126
3846	14086006	126
3847	14086007	126
3848	14086008	126
3849	14086009	126
3850	14086010	126
3851	14086011	126
3852	14086012	126
3853	14086013	126
3854	14086014	126
3855	14086015	126
3856	14086016	126
3857	14086017	126
3858	14086018	126
3859	14086019	126
3860	14126650	126
3861	14126651	126
3862	14126652	126
3863	14126653	126
3864	14126654	126
3865	14126655	126
3866	14126656	126
3867	14126657	126
3868	14126658	126
3869	14126659	126
3870	14126660	126
3871	14126661	126
3872	14126662	126
3873	14126663	126
3874	14126664	126
3875	14126665	126
3876	14126666	126
3877	14126667	126
3878	14126668	126
3879	14126669	126
3880	14126670	126
3881	14126671	126
3882	14126672	126
3883	14126673	126
3884	14126674	126
3885	14138677	1023
3886	14050958	307
3887	14050959	307
3888	14058837	307
3889	14058838	307
3890	14058839	307
3891	14058840	307
3892	14050998	85
3893	14050999	85
3894	14051000	85
3895	14051001	85
3896	14040109	382
3897	14040117	384
3898	14040116	384
3899	14040119	360
3900	14040120	360
3901	14040229	361
3902	14040231	1024
3903	14040232	364
3904	14040233	359
3905	14124198	976
3906	14124199	976
3907	14124200	976
3908	14124201	976
3909	14139020	1025
3910	14042720	170
3911	14042721	170
3912	14042722	170
3913	14055077	170
3914	14055078	170
3915	14055083	170
3916	14055193	170
3917	14055194	170
3918	14055195	170
3919	14081073	170
3920	14081074	170
3921	14081075	170
3922	14081076	170
3923	14081077	170
3924	14081078	170
3925	14081079	170
3926	14081080	170
3927	14081081	170
3928	14081082	170
3929	14081083	170
3930	14081084	170
3931	14081085	170
3932	14098121	170
3933	14098122	170
3934	14098123	170
3935	14098124	170
3936	14098125	170
3937	14098126	170
3938	14126519	170
3939	14042758	412
3940	14042759	412
3941	14042760	412
3942	14042774	212
3943	14042775	212
3944	14042776	212
3945	14042827	162
3946	14042828	162
3947	14042829	162
3948	14092597	679
3949	14092598	679
3950	14092599	679
3951	14092600	679
3952	14127326	679
3953	14127327	679
3954	14127328	679
3955	14127329	679
3956	14127330	679
3957	14127331	679
3958	14127332	679
3959	14127333	679
3960	14127334	679
3961	14127335	679
3962	14127336	679
3963	14127337	679
3964	14127338	679
3965	14127339	679
3966	14127340	679
3967	14127341	679
3968	14127342	679
3969	14088734	768
3970	14088735	768
3971	14088736	768
3972	14088737	768
3973	14056162	470
3974	14056167	470
3975	14056163	470
3976	14056168	470
3977	14056169	470
3978	14056164	470
3979	14056234	470
3980	14056219	470
3981	14056220	470
3982	14056235	470
3983	14056221	470
3984	14056236	470
3985	14056237	470
3986	14056222	470
3987	14056223	470
3988	14056238	470
3989	14056239	470
3990	14056224	470
3991	14056225	470
3992	14056240	470
3993	14056241	470
3994	14056226	470
3995	14056227	470
3996	14056242	470
3997	14056228	470
3998	14056243	470
3999	14056229	470
4000	14056244	470
4001	14056209	245
4002	14056210	245
4003	14056211	245
4004	14124186	784
4005	14124187	784
4006	14124188	784
4007	14124189	784
4008	14124190	784
4009	14055786	294
4010	14055787	294
4011	14055788	294
4012	14055789	294
4013	14055790	294
4014	14055791	294
4015	14055792	294
4016	14055793	294
4017	14055794	294
4018	14081400	294
4019	14081401	294
4020	14081402	294
4021	14081403	294
4022	14081404	294
4023	14081405	294
4024	14081406	294
4025	14081407	294
4026	14081408	294
4027	14081409	294
4028	14081410	294
4029	14081411	294
4030	14081412	294
4031	14081413	294
4032	14081414	294
4033	14081415	294
4034	14122811	294
4035	14122812	294
4036	14122813	294
4037	14122814	294
4038	14122815	294
4039	14122816	294
4040	14122817	294
4041	14122818	294
4042	14122819	294
4043	14122820	294
4044	14122821	294
4045	14122822	294
4046	14122823	294
4047	14122824	294
4048	14122825	294
4049	14122826	294
4050	14122827	294
4051	14122828	294
4052	14123643	610
4053	14123644	610
4054	14123645	610
4055	14123646	610
4056	14123647	610
4057	14123648	610
4058	14123649	610
4059	14123650	610
4060	14123651	610
4061	14123652	610
4062	14123653	610
4063	14123654	610
4064	14123655	610
4065	14123656	610
4066	14123657	610
4067	14123658	610
4068	14123659	610
4069	14090370	622
4070	14090371	622
4071	14090372	622
4072	14090373	622
4073	14056170	34
4074	14056171	34
4075	14056172	34
4076	14056173	34
4077	14056174	34
4078	14056175	34
4079	14056176	34
4080	14056177	34
4081	14056178	34
4082	14088541	34
4083	14088542	34
4084	14088543	34
4085	14088544	34
4086	14088545	34
4087	14088546	34
4088	14088547	34
4089	14088548	34
4090	14088549	34
4091	14088550	34
4092	14088551	34
4093	14088552	34
4094	14088553	34
4095	14088554	34
4096	14123632	34
4097	14123633	34
4098	14123634	34
4099	14123635	34
4100	14123636	34
4101	14123637	34
4102	14123638	34
4103	14123639	34
4104	14123640	34
4105	14123641	34
4106	14088730	767
4107	14088731	767
4108	14088732	767
4109	14088733	767
4110	14126634	767
4111	14126635	767
4112	14126636	767
4113	14126637	767
4114	14126638	767
4115	14126639	767
4116	14126640	767
4117	14126641	767
4118	14126642	767
4119	14126643	767
4120	14126644	767
4121	14126645	767
4122	14126646	767
4123	14126647	767
4124	14126648	767
4125	14050734	258
4126	14050735	258
4127	14050736	258
4128	14050892	258
4129	14050893	258
4130	14055011	258
4131	14055012	258
4132	14055013	258
4133	14055014	258
4134	14063886	258
4135	14063887	258
4136	14063888	258
4137	14063889	258
4138	14063890	258
4139	14063891	258
4140	14063892	258
4141	14063893	258
4142	14063894	258
4143	14081360	258
4144	14086244	258
4145	14086245	258
4146	14086246	258
4147	14086247	258
4148	14052223	295
4149	14052224	295
4150	14052225	295
4151	14052226	295
4152	14052227	295
4153	14052228	295
4154	14052229	295
4155	14052230	295
4156	14052231	295
4157	14052232	295
4158	14052233	295
4159	14052234	295
4160	14081458	295
4161	14081459	295
4162	14081460	295
4163	14081461	295
4164	14081462	295
4165	14081463	295
4166	14081464	295
4167	14081465	295
4168	14081466	295
4169	14081467	295
4170	14081468	295
4171	14081469	295
4172	14081470	295
4173	14081471	295
4174	14081472	295
4175	14081473	295
4176	14056325	253
4177	14056326	253
4178	14059369	253
4179	14137119	1026
4180	14053693	260
4181	14056357	260
4182	14053694	260
4183	14056358	260
4184	14053695	260
4185	14056359	260
4186	14053713	182
4187	14053714	182
4188	14053715	182
4189	14053716	182
4190	14053717	182
4191	14053718	182
4192	14053719	182
4193	14053720	182
4194	14122070	182
4195	14122071	182
4196	14122072	182
4197	14122073	182
4198	14122074	182
4199	14122075	182
4200	14122076	182
4201	14122077	182
4202	14122078	182
4203	14122079	182
4204	14122080	182
4205	14122081	182
4206	14122082	182
4207	14122083	182
4208	14122084	182
4209	14122085	182
4210	14123298	182
4211	14123299	182
4212	14123300	182
4213	14123301	182
4214	14123302	182
4215	14123303	182
4216	14123304	182
4217	14054404	518
4218	14054405	518
4219	14054586	425
4220	14054587	425
4221	14054588	425
4222	14054589	425
4223	14054590	425
4224	14054591	425
4225	14054761	262
4226	14054762	262
4227	14054763	262
4228	14054764	262
4229	14054765	262
4230	14054766	262
4231	14054767	262
4232	14054768	262
4233	14054769	262
4234	14054770	328
4235	14054771	328
4236	14054772	328
4237	14054788	328
4238	14054789	328
4239	14054790	328
4240	14054867	19
4241	14054868	19
4242	14054869	19
4243	14054870	19
4244	14054871	19
4245	14054872	19
4246	14054874	19
4247	14054875	19
4248	14054876	19
4249	14054877	19
4250	14054878	19
4251	14054879	19
4252	14127425	19
4253	14127426	19
4254	14127427	19
4255	14127428	19
4256	14127429	19
4257	14127430	19
4258	14127431	19
4259	14127432	19
4260	14055015	502
4261	14055016	502
4262	14055017	502
4263	14055021	502
4264	14055022	502
4265	14055023	502
4266	14055073	451
4267	14055074	451
4268	14055075	451
4269	14126920	451
4270	14126921	451
4271	14126922	451
4272	14126923	451
4273	14126924	451
4274	14126925	451
4275	14126926	451
4276	14126927	451
4277	14126928	451
4278	14126929	451
4279	14126930	451
4280	14126931	451
4281	14126932	451
4282	14126933	451
4283	14126934	451
4284	14056122	257
4285	14055179	257
4286	14055180	257
4287	14056123	257
4288	14055181	257
4289	14056127	257
4290	14056132	256
4291	14055202	256
4292	14056133	256
4293	14055203	256
4294	14056134	256
4295	14055204	256
4296	14055885	308
4297	14055886	308
4298	14055917	324
4299	14055918	324
4300	14055919	324
4301	14056011	369
4302	14056012	369
4303	14056013	369
4304	14056017	369
4305	14056018	369
4306	14056019	369
4307	14056020	369
4308	14056405	443
4309	14056406	443
4310	14056407	443
4311	14056408	443
4312	14127040	443
4313	14127041	443
4314	14127042	443
4315	14127043	443
4316	14127044	443
4317	14127045	443
4318	14127046	443
4319	14056414	504
4320	14056415	504
4321	14056416	504
4322	14081356	504
4323	14081357	504
4324	14081358	504
4325	14081359	504
4326	14127217	504
4327	14127218	504
4328	14056417	231
4329	14056418	231
4330	14056419	231
4331	14056427	266
4332	14056428	266
4333	14056429	266
4334	14056437	266
4335	14056438	266
4336	14056439	266
4337	14056420	152
4338	14056421	152
4339	14056422	152
4340	14056433	327
4341	14056434	327
4342	14056435	327
4343	14056436	327
4344	14063877	327
4345	14063878	327
4346	14063879	327
4347	14063880	327
4348	14063881	327
4349	14063882	327
4350	14063883	327
4351	14063884	327
4352	14063885	327
4353	14056485	442
4354	14056486	442
4355	14056487	442
4356	14127022	442
4357	14127023	442
4358	14127024	442
4359	14127025	442
4360	14127026	442
4361	14127027	442
4362	14127028	442
4363	14127029	442
4364	14056606	1027
4365	14056658	9
4366	14056659	9
4367	14056660	9
4368	14056661	9
4369	14056662	9
4370	14056663	9
4371	14056664	9
4372	14122720	9
4373	14122721	9
4374	14122722	9
4375	14122723	9
4376	14056621	1028
4377	14056622	1028
4378	14056623	1028
4379	14056624	1028
4380	14056641	325
4381	14056652	325
4382	14056653	325
4383	14056657	325
4384	14056656	325
4385	14056642	325
4386	14056685	318
4387	14056687	318
4388	14056686	318
4389	14056688	318
4390	14057385	318
4391	14057393	318
4392	14057394	318
4393	14057386	318
4394	14056725	259
4395	14056722	259
4396	14056723	259
4397	14056726	259
4398	14056727	259
4399	14056724	259
4400	14056742	193
4401	14056743	193
4402	14056744	193
4403	14056745	193
4404	14056746	193
4405	14056747	193
4406	14056778	43
4407	14056779	43
4408	14056780	43
4409	14056781	43
4410	14056782	43
4411	14056783	43
4412	14056784	43
4413	14056845	198
4414	14056846	198
4415	14057152	198
4416	14057154	198
4417	14057155	198
4418	14057156	198
4419	14057157	198
4420	14122880	198
4421	14123957	198
4422	14123958	198
4423	14123959	198
4424	14123960	198
4425	14056806	46
4426	14056807	46
4427	14056808	46
4428	14056809	46
4429	14056810	46
4430	14056811	46
4431	14056820	46
4432	14056821	46
4433	14056822	46
4434	14056823	46
4435	14056824	46
4436	14056825	46
4437	14056826	46
4438	14056827	46
4439	14056828	46
4440	14080931	46
4441	14080932	46
4442	14080933	46
4443	14080934	46
4444	14080935	46
4445	14085830	46
4446	14085831	46
4447	14085832	46
4448	14085833	46
4449	14085834	46
4450	14085835	46
4451	14085836	46
4452	14085837	46
4453	14056872	250
4456	14056873	250
4457	14056854	132
4458	14056855	132
4459	14063875	132
4460	14063876	132
4461	14056913	23
4462	14056914	23
4463	14056915	23
4464	14056939	118
4465	14056940	118
4466	14056941	118
4467	14123775	118
4468	14123776	118
4469	14123777	118
4470	14123778	118
4471	14123779	118
4472	14123780	118
4473	14123781	118
4474	14123782	118
4475	14123783	118
4476	14123784	118
4477	14123785	118
4478	14123786	118
4479	14123787	118
4480	14123945	118
4481	14056945	455
4482	14056946	455
4483	14056976	58
4484	14056977	58
4485	14056978	58
4486	14080977	58
4487	14080978	58
4488	14080979	58
4489	14080980	58
4490	14080981	58
4491	14080982	58
4492	14080983	58
4493	14080984	58
4494	14080985	58
4495	14080986	58
4496	14080987	58
4497	14080988	58
4498	14080989	58
4499	14080990	58
4500	14080991	58
4501	14080992	58
4502	14080993	58
4503	14080994	58
4504	14080995	58
4505	14080996	58
4506	14080997	58
4507	14080998	58
4508	14086394	58
4509	14086395	58
4510	14086396	58
4511	14086397	58
4512	14086398	58
4513	14126679	58
4514	14126680	58
4515	14126681	58
4516	14126682	58
4517	14126683	58
4518	14126684	58
4519	14126685	58
4520	14126686	58
4521	14126687	58
4522	14126688	58
4523	14126689	58
4524	14126690	58
4525	14126691	58
4526	14126692	58
4527	14126694	58
4528	14126695	58
4529	14126696	58
4530	14126697	58
4531	14126698	58
4532	14126699	58
4533	14126700	58
4534	14126701	58
4535	14056982	293
4536	14056983	293
4537	14056984	293
4538	14057003	461
4539	14057004	461
4540	14057005	461
4564	14057158	178
4565	14057159	178
4568	14057160	178
4569	14057165	194
4570	14057166	194
4571	14057167	194
4572	14057173	209
4573	14057174	209
4574	14057178	116
4575	14057179	116
4576	14057180	116
4577	14127213	116
4578	14127214	116
4579	14127215	116
4580	14127216	116
4581	14057184	431
4582	14057185	431
4583	14057302	334
4584	14057303	334
4585	14057304	334
4586	14057317	334
4587	14057318	334
4588	14057319	334
4589	14057320	334
4590	14057244	530
4591	14057245	530
4592	14057298	309
4593	14057299	309
4594	14057300	309
4595	14057301	309
4596	14063866	309
4597	14063867	309
4598	14063868	309
4599	14063869	309
4600	14063870	309
4601	14063871	309
4602	14057295	168
4603	14057296	168
4604	14057297	168
4605	14124264	168
4606	14124265	168
4607	14124266	168
4608	14124267	168
4609	14057309	28
4610	14057310	28
4611	14057311	28
4612	14123191	28
4613	14123192	28
4614	14123193	28
4615	14123194	28
4616	14123305	28
4617	14123306	28
4618	14123307	28
4619	14123308	28
4620	14057312	487
4621	14057313	487
4622	14057314	487
4623	14057325	464
4624	14057326	464
4625	14057327	464
4626	14057428	471
4627	14057429	471
4628	14057442	528
4629	14057443	528
4630	14057444	528
4631	14057445	528
4632	14057446	528
4633	14057447	528
4634	14057454	528
4635	14057455	528
4636	14057456	528
4637	14124064	528
4638	14124065	528
4639	14124066	528
4640	14124067	528
4641	14057452	371
4642	14057453	371
4643	14086236	371
4644	14086237	371
4645	14057449	491
4646	14057450	491
4647	14057451	491
4648	14057606	473
4649	14057607	473
4650	14090355	473
4651	14090356	473
4652	14090357	473
4653	14090358	473
4654	14090359	473
4655	14090360	473
4656	14090361	473
4657	14090362	473
4658	14090363	473
4659	14090364	473
4660	14090365	473
4661	14122729	473
4662	14122730	473
4663	14122731	473
4664	14122732	473
4665	14122737	473
4666	14122738	473
4667	14122739	473
4668	14122740	473
4669	14057542	370
4670	14057543	370
4671	14081096	370
4672	14081097	370
4673	14057611	235
4674	14057612	235
4675	14057613	235
4676	14057614	235
4677	14057615	235
4678	14057616	235
4679	14057622	235
4680	14057623	235
4681	14057601	437
4682	14057602	437
4683	14057603	437
4684	14057618	437
4685	14057619	437
4686	14057620	437
4687	14057621	437
4688	14057594	482
4689	14057595	482
4690	14057596	482
4691	14057640	510
4692	14057641	510
4693	14057642	510
4694	14057689	155
4695	14057690	155
4696	14057644	365
4697	14057645	365
4698	14057646	365
4699	14057693	171
4700	14057694	171
4701	14057695	171
4702	14057698	467
4703	14057699	467
4704	14057700	467
4705	14057836	317
4706	14057837	317
4707	14057832	465
4708	14057833	465
4709	14057872	151
4710	14057873	151
4711	14059391	151
4712	14059392	151
4713	14057870	290
4714	14057871	290
4715	14057956	33
4716	14057957	33
4717	14057958	33
4718	14057959	33
4719	14057960	33
4720	14057961	33
4721	14057993	338
4722	14057994	338
4723	14057987	111
4724	14057988	111
4725	14056367	472
4726	14091042	472
4727	14091043	472
4728	14058430	179
4729	14058431	179
4730	14058432	179
4731	14058500	475
4732	14058501	475
4733	14058502	475
4734	14058503	475
4735	14058504	475
4736	14091209	475
4737	14091210	475
4738	14091211	475
4739	14091212	475
4740	14091213	475
4741	14091214	475
4742	14091215	475
4743	14123106	475
4744	14058593	227
4745	14058594	227
4746	14058600	238
4747	14058601	238
4748	14059360	238
4749	14059361	238
4750	14056584	275
4751	14056585	275
4752	14056570	275
4753	14081098	275
4754	14081099	275
4755	14081100	275
4756	14081101	275
4757	14127415	275
4758	14127416	275
4759	14127417	275
4760	14127418	275
4761	14127419	275
4762	14127420	275
4763	14127421	275
4764	14127422	275
4765	14058707	143
4766	14058708	143
4767	14058712	215
4768	14058713	215
4769	14058741	524
4770	14058742	524
4771	14058772	50
4772	14058773	50
4773	14058778	578
4774	14058779	578
4775	14058876	1029
4776	14058877	1029
4777	14058967	27
4778	14058968	27
4779	14058826	579
4780	14058824	579
4781	14058825	579
4782	14058827	579
4783	14058835	287
4784	14058836	287
4785	14058940	287
4786	14058941	287
4787	14058845	149
4788	14058846	149
4789	14058851	148
4790	14058852	148
4791	14058910	411
4792	14058911	411
4793	14058918	423
4794	14058919	423
4795	14058933	264
4796	14058934	264
4797	14058975	1030
4798	14058976	1030
4799	14059275	263
4800	14059035	263
4801	14059415	263
4802	14059036	263
4803	14059276	263
4804	14059416	263
4805	14059045	228
4806	14059046	228
4807	14059052	48
4808	14059359	48
4809	14059370	320
4810	14059371	320
4811	14059372	320
4812	14059373	320
4813	14059410	298
4814	14059411	298
4815	14059412	298
4816	14059413	298
4817	14059389	92
4818	14059390	92
4819	14056440	313
4821	14056441	313
4823	14056442	313
4825	14056474	313
4828	14056479	313
4829	14056480	313
4831	14056481	313
4834	14124540	313
4836	14124541	313
4838	14124542	313
4840	14124543	313
4841	14124544	313
4844	14124545	313
4845	14124546	313
4847	14059425	232
4848	14059426	232
4849	14059427	232
4850	14061581	217
4851	14061584	217
4852	14064076	580
4853	14064077	561
4854	14064079	549
4855	14064084	1031
4856	14064085	546
4857	14064089	547
4858	14064087	545
4859	14064093	535
4860	14064096	537
4861	14064099	550
4862	14064104	534
4863	14064107	532
4864	14064175	539
4865	14064078	533
4866	14064131	541
4867	14064140	536
4868	14064141	531
4869	14064146	568
4870	14064172	543
4871	14064173	548
4872	14064193	544
4873	14064202	542
4874	14064224	538
4875	14110879	587
4876	14110880	587
4877	14110881	587
4878	14110882	587
4879	14136636	1032
4880	14080936	899
4881	14080937	899
4882	14080938	899
4883	14126548	899
4884	14126559	899
4885	14126560	899
4886	14126561	899
4887	14126562	899
4888	14126563	899
4889	14126564	899
4890	14126565	899
4891	14081598	681
4892	14081599	681
4893	14081600	681
4894	14081601	681
4895	14081602	681
4896	14081603	681
4897	14081604	681
4898	14081605	681
4899	14081606	681
4900	14081607	681
4901	14081608	681
4902	14081609	681
4903	14123161	681
4904	14123162	681
4905	14123163	681
4906	14123164	681
4907	14123165	681
4908	14123166	681
4909	14123167	681
4910	14123168	681
4912	14082641	712
4913	14082642	712
4916	14082643	712
4917	14082644	712
4919	14082645	712
4921	14082646	712
4924	14082647	712
4926	14082648	712
4927	14082772	898
4928	14082773	898
4929	14082776	896
4930	14082777	896
4931	14082778	896
4932	14082779	896
4933	14082780	896
4934	14082781	896
4935	14082810	895
4936	14082811	895
4937	14082812	895
4938	14082813	895
4939	14082814	895
4940	14082815	895
4941	14082816	895
4942	14082818	728
4943	14082819	728
4944	14082820	728
4945	14082821	728
4946	14082822	728
4947	14082823	728
4948	14082824	728
4949	14082825	728
4950	14082826	728
4951	14082827	728
4952	14082828	728
4953	14082829	728
4954	14082896	897
4955	14082897	897
4956	14082898	897
4957	14082899	897
4958	14082900	897
4959	14082901	897
4960	14082902	897
4961	14082903	897
4962	14082904	897
4963	14082905	897
4965	14082907	897
4966	14082908	897
4967	14082909	897
4968	14082910	897
4969	14082911	897
4970	14082912	897
4971	14082913	897
4972	14082914	897
4973	14082915	897
4974	14082916	897
4975	14082917	897
4976	14082918	897
4977	14082919	897
4978	14082920	897
4979	14082921	897
4980	14082922	897
4981	14082923	897
4982	14082924	897
4983	14090382	1033
4984	14090383	1033
4985	14090384	1033
4986	14090385	1033
4987	14090386	1033
4988	14090387	1033
4989	14090388	1033
4990	14090389	1033
4991	14090390	1033
4992	14090391	1033
4993	14090392	1033
4994	14090393	1033
4995	14085120	1034
4996	14085119	1034
4997	14123667	172
4998	14123668	172
4999	14123669	172
5000	14123670	172
5001	14123671	172
5002	14123672	172
5003	14123673	172
5004	14123674	172
5005	14123675	172
5006	14123676	172
5007	14123677	172
5008	14123678	172
5009	14123679	172
5010	14123680	172
5011	14123681	172
5012	14085379	1035
5013	14085417	1036
5014	14085491	1037
5015	14085531	1038
5016	14085509	1038
5017	14086379	837
5018	14086380	837
5019	14086616	640
5020	14086617	640
5021	14086618	640
5022	14086619	640
5023	14086620	640
5024	14086621	640
5025	14086622	640
5026	14086623	640
5027	14086624	640
5028	14086625	640
5029	14086626	640
5030	14086627	640
5031	14086628	640
5032	14086629	640
5033	14086630	640
5034	14086631	640
5035	14086632	640
5036	14086633	640
5037	14086634	640
5038	14088557	1039
5039	14088558	1039
5040	14088598	1040
5041	14088599	1040
5042	14088600	1040
5043	14088601	1040
5044	14088602	637
5045	14088603	637
5046	14088604	637
5047	14088605	637
5048	14088606	637
5049	14088607	637
5050	14088608	637
5051	14088609	637
5052	14088610	637
5053	14088611	637
5054	14088612	637
5055	14088613	637
5056	14088614	637
5057	14088615	637
5058	14088616	637
5059	14088617	637
5060	14088618	637
5061	14088619	637
5062	14088620	637
5063	14088621	637
5064	14088622	637
5065	14123351	637
5066	14123352	637
5067	14123353	637
5068	14123354	637
5069	14123355	637
5070	14123356	637
5071	14123357	637
5072	14123358	637
5073	14123359	637
5074	14123360	637
5075	14123361	637
5076	14123362	637
5077	14123363	637
5078	14123364	637
5079	14123365	637
5080	14123366	637
5081	14123367	637
5082	14123368	637
5083	14123369	637
5084	14123370	637
5085	14123371	637
5086	14123372	637
5087	14123373	637
5088	14123374	637
5089	14123375	637
5090	14088721	626
5091	14088722	626
5092	14088723	626
5093	14088724	626
5094	14123138	626
5095	14123139	626
5096	14123140	626
5097	14123141	626
5098	14123142	626
5099	14123143	626
5100	14123144	626
5101	14123145	626
5102	14123146	626
5103	14123147	626
5104	14123148	626
5105	14123149	626
5106	14088738	1041
5107	14088739	1041
5108	14090399	427
5109	14090400	427
5110	14090401	427
5111	14090402	427
5112	14124337	427
5113	14124338	427
5114	14090408	729
5115	14090409	729
5116	14090412	1042
5117	14090413	1042
5118	14090800	1043
5119	14090801	1043
5120	14091155	1044
5121	14091156	1044
5122	14091676	1045
5123	14091677	1045
5124	14091683	1046
5125	14091684	1046
5126	14092545	1047
5127	14092546	1047
5128	14092547	1047
5129	14092548	1047
5130	14092572	978
5131	14092573	978
5132	14092574	978
5133	14092575	978
5134	14126945	978
5135	14126946	978
5136	14092884	1048
5137	14092885	1048
5138	14092886	1048
5139	14092887	1048
5140	14093555	1049
5141	14093556	1049
5142	14138683	1050
5143	14094718	1051
5144	14094720	1052
5145	14094721	1052
5146	14094722	1052
5147	14094723	1052
5148	14094724	1052
5149	14136758	1052
5150	14136759	1052
5151	14136760	1052
5152	14136761	1052
5153	14136762	1052
5154	14136763	1052
5155	14136764	1052
5156	14136765	1052
5157	14136766	1052
5158	14094931	1053
5159	14094929	1054
5160	14095069	1055
5161	14095280	1056
5162	14095281	1056
5163	14096395	1057
5164	14096394	1057
5165	14096396	1058
5166	14096397	1059
5167	14096398	1060
5168	14096399	1061
5169	14096400	1061
5170	14098150	680
5171	14098151	680
5172	14098152	680
5173	14098153	680
5174	14100206	1062
5175	14100209	1063
5176	14100224	1064
5177	14100227	1065
5178	14100228	1065
5179	14100229	1065
5180	14100380	1066
5181	14100390	1067
5182	14100422	1068
5183	14019744	1069
5184	14124192	979
5185	14124193	979
5186	14124194	979
5187	14124195	979
5188	14124196	979
5189	14124197	979
5190	14123689	980
5191	14123690	980
5192	14123691	980
5193	14123692	980
5194	14123693	980
5195	14123694	980
5196	14123695	980
5197	14123696	980
5198	14123697	980
5199	14123698	980
5200	14123699	980
5201	14123700	980
5202	14123701	980
5203	14123702	980
5204	14123703	980
5205	14123704	980
5206	14126856	981
5207	14126857	981
5208	14126858	981
5209	14126859	981
5210	14126861	981
5211	14126862	981
5212	14126863	981
5213	14126864	981
5214	14126865	981
5215	14126866	981
5216	14126867	981
5217	14126868	981
5218	14126869	981
5219	14126870	981
5220	14126871	981
5221	14126872	981
5222	14126873	981
5223	14126874	981
5224	14126875	981
5225	14126876	981
5226	14126877	981
5227	14126878	981
5228	14126879	981
5229	14126880	981
5230	14126881	981
5231	14126882	981
5232	14126883	981
5233	14126884	981
5234	14124135	982
5235	14124136	982
5236	14124137	982
5237	14124138	982
5238	14124139	982
5239	14124140	982
5240	14124141	982
5241	14124142	982
5242	14124143	982
5243	14124144	982
5244	14124145	982
5245	14124146	982
5246	14124147	982
5247	14124148	982
5248	14124149	982
5249	14124150	982
5250	14124151	982
5251	14124152	982
5252	14124153	982
5253	14124154	982
5254	14124155	982
5255	14124156	982
5256	14124157	982
5257	14124158	982
5258	14124159	982
5259	14124160	982
5260	14124161	982
5261	14124162	982
5262	14135942	1070
5263	14091046	356
5264	14091047	356
5265	14091048	356
5266	14091049	356
5267	14123628	356
5268	14123629	356
5269	14123630	356
5270	14123631	356
5271	14124210	939
5272	14124211	939
5273	14124212	939
5274	14124213	939
5275	14124214	939
5276	14124215	939
5277	14126446	983
5278	14126447	983
5279	14126448	983
5280	14126449	983
5281	14126451	984
5282	14126452	984
5283	14126453	984
5284	14126454	984
5285	14124403	985
5286	14124404	985
5287	14124405	985
5288	14124406	985
5289	14124407	985
5290	14124408	985
5291	14124409	985
5292	14124410	985
5293	14124411	985
5294	14124412	985
5295	14124413	985
5296	14124414	985
5297	14124477	986
5298	14124478	986
5299	14124479	986
5300	14124480	986
5301	14124481	986
5302	14124482	986
5303	14124483	986
5304	14124484	986
5305	14124485	986
5306	14125214	987
5307	14125215	987
5308	14125216	987
5309	14125217	987
5310	14124450	988
5311	14124451	988
5312	14124452	988
5313	14124453	988
5314	14124454	988
5315	14124455	988
5316	14124456	988
5317	14124457	988
5318	14124458	988
5319	14125250	989
5320	14125251	989
5321	14125252	989
5322	14125253	989
5323	14125254	989
5324	14125255	989
5325	14125256	989
5326	14125257	989
5327	14125258	989
5328	14125259	989
5329	14125260	989
5330	14125261	989
5331	14125262	989
5332	14125263	989
5333	14125264	989
5334	14125265	989
5335	14124492	990
5337	14124493	990
5340	14124494	990
5341	14124495	990
5343	14124102	991
5344	14124103	991
5345	14124104	991
5346	14124105	991
5347	14124106	991
5348	14127235	992
5349	14127236	992
5350	14127237	992
5351	14127238	992
5352	14123814	993
5353	14123815	993
5354	14123816	993
5355	14123817	993
5356	14123818	993
5357	14123819	993
5358	14123820	993
5359	14123821	993
5360	14123822	993
5361	14123823	993
5362	14123824	993
5363	14123825	993
5364	14126474	811
5365	14126483	811
5366	14126475	811
5367	14126484	811
5368	14127141	811
5369	14127143	811
5370	14127142	811
5371	14127150	811
5372	14124085	994
5373	14124086	994
5374	14124087	994
5375	14124088	994
5376	14124089	994
5377	14124090	994
5378	14124091	994
5379	14124092	994
5380	14124093	994
5381	14124094	994
5382	14124324	995
5383	14124325	995
5384	14124326	995
5385	14124327	995
5386	14124345	996
5387	14124346	996
5388	14124347	996
5389	14124348	996
5390	14124349	996
5391	14124350	996
5392	14124351	996
5393	14124352	996
5394	14124353	996
5395	14124298	936
5396	14124299	936
5397	14124300	936
5398	14124301	936
5399	14124302	936
5400	14124303	936
5401	14124304	936
5402	14124305	936
5403	14124306	936
5404	14124307	936
5405	14124308	936
5406	14124309	936
5407	14124310	936
5408	14124311	936
5409	14124312	936
5410	14124313	936
5411	14138880	1071
5412	14127346	997
5413	14127347	997
5414	14127348	997
5415	14127349	997
5416	14127350	997
5417	14127351	997
5418	14127352	997
5419	14127353	997
5420	14127354	997
5421	14127355	997
5422	14125346	998
5423	14125347	998
5424	14125348	998
5425	14125349	998
5426	14125350	998
5427	14125351	998
5428	14125352	998
5429	14125353	998
5430	14125377	630
5431	14125378	630
5432	14125379	630
5433	14125380	630
5434	14125595	746
5435	14125596	746
5436	14125597	746
5437	14125598	746
5438	14125599	746
5439	14125600	746
5440	14125601	746
5441	14125602	746
5442	14125603	746
5444	14127053	999
5446	14127054	999
5447	14127055	999
5449	14127056	999
5452	14127057	999
5454	14127058	999
5456	14127059	999
5458	14127060	999
5459	14127242	369
5460	14127243	369
5461	14127244	369
5462	14127245	369
5463	14138474	1072
5464	14136633	1073
5465	14136723	1074
5466	14136755	1075
5467	14136757	1076
5468	14138624	1077
5469	14138355	1078
5470	14138444	1079
5471	14138456	1080
5472	14138457	1080
5473	14138458	1080
5474	14138620	1081
5475	14138687	1082
5476	14138688	1082
5477	14139051	1083
5478	14139052	1083
5479	14139053	1083
5480	14139054	1083
5481	14139055	1083
5482	14139064	1084
5483	14139319	1085
5484	14140184	1086
5485	14146569	1095
5486	14146759	1096
5487	14146643	208
5488	14146715	372
5489	14146749	1097
5490	14146721	418
5491	14146716	905
5492	14146718	904
5493	14146699	903
5494	14163228	1098
5495	14163574	1099
5496	14163046	1100
5497	14146585	63
5498	14150592	173
5499	14150593	173
5500	14150594	173
5501	14150595	173
5502	14150596	173
5503	14150597	173
5504	14150598	173
5505	14150599	173
5506	14150600	173
5507	14150601	173
5508	14150602	173
5509	14150603	173
5510	14150604	173
5511	14150605	173
5512	14150606	173
5513	14150607	173
5520	14151041	1101
5521	14151042	1101
5522	14151043	1101
5523	14146610	269
5524	14146591	207
5525	14173867	435
5526	14173868	435
5527	14173869	435
5528	14173870	435
5529	14173871	435
5530	14173872	435
5531	14173873	435
5532	14173874	435
5533	14173876	435
5534	14173877	435
5535	14173878	435
5536	14173879	435
5537	14173880	435
5538	14173881	435
5539	14173882	435
5540	14173883	435
5541	14173902	1102
5542	14173903	1102
5543	14173904	1102
5544	14173905	1102
5545	14173906	1102
5546	14173907	1102
5547	14146642	37
5548	14146571	1103
5549	14146609	138
5550	14146691	145
5551	14146584	1104
5552	14146578	181
5553	14146753	1105
5554	14165855	434
5555	14165856	434
5556	14165857	434
5557	14165858	434
5558	14142107	280
5559	14142108	280
5560	14142109	280
5561	14142110	280
5562	14142111	280
5563	14142112	280
5564	14142113	280
5565	14142114	280
5566	14173485	280
5567	14173486	280
5568	14173487	280
5569	14173488	280
5570	14173489	280
5571	14173490	280
5572	14173491	280
5573	14173492	280
5574	14150755	515
5575	14150756	515
5576	14150757	515
5577	14150758	515
5578	14150759	515
5579	14150760	515
5580	14150761	515
5581	14150762	515
5582	14150763	515
5583	14150764	515
5584	14150765	515
5585	14150766	515
5586	14150743	176
5587	14150744	176
5588	14150745	176
5589	14150746	176
5590	14150747	176
5591	14150748	176
5592	14150749	176
5593	14150750	176
5594	14146692	216
5595	14164161	649
5596	14164162	649
5597	14174936	649
5598	14174937	649
5599	14174938	649
5600	14174939	649
5601	14174940	649
5602	14174941	649
5603	14174942	649
5604	14174943	649
5605	14174944	649
5606	14146611	1010
5607	14160250	1106
5608	14150792	191
5609	14150793	191
5610	14150794	191
5611	14150795	191
5612	14150796	191
5613	14150797	191
5614	14150798	191
5615	14150799	191
5616	14150800	191
5617	14150801	191
5618	14150802	191
5619	14150803	191
5620	14150804	191
5621	14150805	191
5622	14142225	128
5623	14142226	128
5624	14142227	128
5625	14142228	128
5626	14150830	299
5627	14150831	299
5628	14141769	1107
5629	14173671	210
5630	14173672	210
5631	14173673	210
5632	14173674	210
5633	14173675	210
5634	14173676	210
5635	14173677	210
5636	14173678	210
5637	14173679	210
5638	14173680	210
5639	14173681	210
5640	14173682	210
5641	14173683	210
5642	14173684	210
5643	14173685	210
5644	14173686	210
5645	14173687	210
5646	14173688	210
5647	14173689	210
5648	14173690	210
5649	14173691	210
5650	14173692	210
5651	14173693	210
5652	14173694	210
5653	14173695	210
5654	14173696	210
5655	14173697	210
5656	14173698	210
5657	14173699	210
5658	14173700	210
5659	14173701	210
5660	14173702	210
5661	14173703	210
5662	14173704	210
5663	14173705	210
5664	14173706	210
5665	14142077	142
5666	14142078	142
5667	14142079	142
5668	14142080	142
5669	14142081	142
5670	14142082	142
5671	14142083	142
5672	14142084	142
5673	14142085	142
5674	14142089	142
5675	14142090	142
5676	14142091	142
5677	14142092	142
5678	14142093	142
5679	14142095	142
5680	14142096	142
5681	14142097	142
5682	14142098	142
5683	14142099	142
5684	14142100	142
5685	14142101	142
5686	14142102	142
5687	14142103	142
5688	14142104	142
5689	14142105	142
5690	14142106	142
5691	14164113	222
5692	14164114	222
5693	14173888	222
5694	14173889	222
5695	14167583	311
5696	14167587	311
5697	14167588	311
5698	14167589	311
5699	14165774	342
5700	14165775	342
5701	14165776	342
5702	14165777	342
5703	14165778	342
5704	14165779	342
5705	14165780	342
5706	14165781	342
5707	14165782	342
5708	14165783	342
5709	14165784	342
5710	14165786	342
5711	14146700	1017
5712	14146724	1108
5713	14142306	221
5715	14142307	221
5717	14142308	221
5719	14142309	221
5721	14142316	221
5723	14142317	221
5725	14142318	221
5727	14142319	221
5729	14142320	221
5731	14142321	221
5733	14142322	221
5735	14142332	221
5737	14142333	221
5739	14142334	221
5741	14142335	221
5743	14142336	221
5745	14142337	221
5747	14142338	221
5749	14142339	221
5751	14142340	221
5753	14142341	221
5755	14173467	221
5757	14173468	221
5759	14173469	221
5761	14173470	221
5763	14173471	221
5765	14173472	221
5767	14173473	221
5769	14165761	3
5770	14165762	3
5771	14165763	3
5772	14165764	3
5773	14165765	3
5774	14165766	3
5775	14165767	3
5776	14165768	3
5777	14165769	3
5778	14165770	3
5779	14165771	3
5780	14151174	267
5781	14151175	267
5782	14151176	267
5783	14151177	267
5784	14151178	267
5785	14151179	267
5786	14151180	267
5787	14151181	267
5788	14151182	267
5789	14151183	267
5790	14173711	97
5791	14173712	97
5792	14173713	97
5793	14173714	97
5794	14173715	97
5795	14173716	97
5796	14173717	97
5797	14173718	97
5798	14173719	97
5799	14173720	97
5800	14150911	144
5801	14173894	156
5802	14173895	156
5803	14173896	156
5804	14173897	156
5805	14173898	156
5806	14173899	156
5807	14173900	156
5808	14150998	1109
5809	14150999	1109
5810	14151000	1109
5811	14161564	1110
5812	14160268	1111
5813	14165932	767
5814	14165933	767
5815	14165934	767
5816	14165935	767
5817	14165936	767
5818	14165937	767
5819	14165938	767
5820	14165939	767
5821	14165940	767
5822	14165941	767
5823	14165942	767
5824	14165943	767
5825	14165944	767
5826	14165945	767
5827	14165946	767
5828	14165947	767
5829	14165948	767
5830	14165949	767
5831	14165950	767
5832	14165951	767
5833	14165952	767
5834	14165953	767
5835	14165954	767
5836	14165955	767
5837	14150702	258
5838	14150703	258
5839	14150704	258
5840	14150705	258
5841	14142268	295
5842	14142269	295
5843	14142270	295
5844	14142271	295
5845	14142272	295
5846	14142273	295
5847	14142274	295
5848	14142275	295
5849	14142276	295
5850	14142277	295
5851	14142278	295
5852	14142279	295
5853	14142280	295
5854	14142281	295
5855	14142282	295
5856	14142283	295
5857	14142284	295
5858	14142285	295
5859	14142286	295
5860	14142287	295
5861	14142288	295
5862	14142289	295
5863	14142293	295
5864	14142294	295
5865	14142295	295
5866	14142296	295
5867	14142297	295
5868	14142298	295
5869	14142299	295
5870	14142300	295
5871	14142301	295
5872	14150471	182
5873	14150472	182
5874	14150473	182
5875	14150474	182
5876	14150475	182
5877	14150476	182
5878	14150477	182
5879	14150478	182
5880	14150479	182
5881	14150480	182
5882	14150481	182
5883	14150482	182
5884	14150483	182
5885	14150484	182
5886	14150485	182
5887	14150486	182
5888	14150487	182
5889	14150488	182
5890	14150489	182
5891	14150490	182
5892	14150491	182
5893	14150492	182
5894	14150493	182
5895	14150494	182
5896	14150495	182
5897	14150496	182
5898	14150497	182
5899	14150498	182
5900	14150499	182
5901	14150500	182
5902	14150501	182
5903	14150502	182
5904	14150503	182
5905	14150504	182
5906	14150505	182
5907	14150506	182
5908	14146640	19
5909	14162606	1112
5910	14165809	443
5911	14165810	443
5912	14165811	443
5913	14165812	443
5914	14165813	443
5915	14165814	443
5916	14165815	443
5917	14165816	443
5918	14165817	443
5919	14142231	327
5920	14142232	327
5921	14142233	327
5922	14142234	327
5923	14142235	327
5924	14142236	327
5925	14142237	327
5926	14142238	327
5927	14142239	327
5928	14165960	442
5929	14165961	442
5930	14165962	442
5931	14165963	442
5932	14165964	442
5933	14165965	442
5934	14165966	442
5935	14165967	442
5936	14165968	442
5937	14165969	442
5938	14165971	442
5939	14165972	442
5940	14165973	442
5941	14165974	442
5942	14165975	442
5943	14165976	442
5944	14165977	442
5945	14165978	442
5946	14165979	442
5947	14165980	442
5948	14142122	46
5949	14142123	46
5950	14142124	46
5951	14142125	46
5952	14142126	46
5953	14142127	46
5954	14142128	46
5955	14142129	46
5956	14142130	46
5957	14142135	46
5958	14142136	46
5959	14142137	46
5960	14142138	46
5961	14142141	46
5962	14142142	46
5963	14142143	46
5964	14142144	46
5965	14142145	46
5966	14142146	46
5967	14142147	46
5968	14142148	46
5969	14142149	46
5970	14142150	46
5971	14142151	46
5972	14142152	46
5973	14142153	46
5974	14142155	46
5975	14142156	46
5976	14142157	46
5977	14173663	46
5978	14173664	46
5979	14173665	46
5980	14173666	46
5981	14173667	46
5982	14173668	46
5983	14173669	46
5984	14173670	46
5985	14150832	118
5986	14150833	118
5987	14150714	1113
5988	14150715	1113
5989	14150716	1113
5990	14150717	1113
5991	14150718	1113
5992	14150719	1113
5993	14150720	1113
5994	14150721	1113
5995	14150722	1113
5996	14150723	1113
5997	14150724	1113
5998	14150725	1113
5999	14150727	1113
6000	14150728	1113
6001	14150729	1113
6002	14150730	1113
6003	14150731	1113
6004	14150732	1113
6005	14150733	1113
6006	14150734	1113
6007	14150735	1113
6008	14150736	1113
6009	14150737	1113
6010	14150630	168
6011	14150631	168
6012	14150632	168
6013	14150633	168
6014	14142242	487
6015	14142243	487
6016	14142244	487
6017	14142245	487
6018	14142246	487
6019	14142247	487
6020	14142248	487
6021	14142249	487
6022	14142250	487
6023	14150738	528
6024	14150739	528
6025	14150740	528
6026	14150741	528
6027	14173890	155
6028	14173891	155
6029	14173892	155
6030	14173893	155
6031	14160273	1114
6032	14142382	1115
6033	14142383	1115
6034	14142384	1115
6035	14142385	1115
6036	14170256	320
6037	14170257	320
6041	14141476	1117
6042	14162611	1118
6043	14160362	1119
6044	14146690	1120
6045	14158689	899
6046	14158690	899
6047	14158691	899
6048	14142253	897
6049	14142254	897
6050	14142255	897
6051	14142256	897
6052	14142257	897
6053	14142258	897
6054	14142259	897
6055	14142260	897
6056	14142261	897
6057	14142262	897
6058	14142263	897
6059	14142264	897
6060	14142265	897
6061	14150608	626
6062	14150609	626
6063	14150610	626
6064	14150611	626
6065	14150612	626
6066	14150613	626
6067	14150614	626
6068	14150615	626
6069	14150616	626
6070	14150617	626
6071	14150618	626
6072	14150619	626
6073	14150664	978
6074	14150665	978
6075	14160343	1121
6076	14160344	1121
6077	14162017	1122
6078	14141431	1062
6079	14141432	1062
6080	14141433	1062
6081	14141434	1062
6082	14150769	980
6083	14150770	980
6084	14150771	980
6085	14150772	980
6086	14150773	980
6087	14150774	980
6088	14150775	980
6089	14151184	980
6090	14151185	980
6091	14151186	980
6092	14151187	980
6093	14151188	980
6094	14151189	980
6095	14151190	980
6096	14151191	980
6097	14150776	982
6098	14150777	982
6099	14150778	982
6100	14150779	982
6101	14150780	982
6102	14150781	982
6103	14150782	982
6104	14150783	982
6105	14150806	982
6106	14150807	982
6107	14150808	982
6108	14150809	982
6109	14150810	982
6110	14150811	982
6111	14150812	982
6112	14150813	982
6113	14160365	1123
6114	14158696	1124
6115	14158697	1124
6116	14158698	1124
6117	14158699	1124
6118	14160350	1125
6119	14173497	997
6120	14173498	997
6121	14173499	997
6122	14173500	997
6123	14173501	997
6124	14173502	997
6125	14173503	997
6126	14173504	997
6127	14173505	997
6128	14173506	997
6129	14161982	1126
6130	14162008	1126
6131	14141448	1127
6132	14141447	1128
6133	14141684	1129
6134	14141685	1129
6135	14141456	1130
6136	14141466	1131
6137	14141492	1132
6138	14141710	1133
6139	14141782	1134
6140	14141817	1135
6141	14142386	832
6142	14142387	832
6143	14142388	832
6144	14142389	832
6145	14142390	832
6146	14151402	1136
6147	14151398	1137
6148	14146573	1138
6149	14146612	1139
6150	14146727	1140
6151	14146750	1141
6152	14146752	1142
6153	14146848	1143
6154	14146900	1144
6155	14146969	1145
6156	14146971	1146
6157	14146988	1147
6159	14147013	1148
6160	14147039	1149
6161	14147102	1150
6162	14147212	1151
6163	14147235	1152
6164	14147236	1153
6165	14150958	1154
6166	14150959	1154
6167	14150960	1154
6168	14150961	1154
6169	14150962	1154
6170	14150963	1154
6171	14150964	1154
6172	14150965	1154
6173	14150966	1154
6174	14150967	1154
6175	14150968	1154
6176	14150969	1154
6177	14150970	1154
6178	14150971	1154
6179	14150972	1154
6180	14157902	1154
6181	14157903	1154
6182	14157904	1154
6183	14157905	1154
6184	14157906	1154
6185	14157907	1154
6186	14157908	1154
6187	14157909	1154
6188	14157910	1154
6189	14157911	1154
6190	14151153	731
6191	14151154	731
6192	14151155	731
6193	14151156	731
6194	14151157	731
6195	14151158	731
6196	14151159	731
6197	14151160	731
6198	14151161	731
6199	14151162	731
6200	14151163	731
6201	14151164	731
6202	14151165	731
6203	14151166	731
6204	14151167	731
6205	14151168	731
6206	14151169	731
6207	14151170	731
6208	14151171	731
6209	14151172	731
6210	14151316	1155
6211	14151413	1090
6212	14151446	1091
6213	14151569	1092
6214	14151496	1094
6215	14151570	1092
6216	14160308	1156
6217	14161868	1157
6218	14161660	1158
6219	14161750	1159
6220	14161806	1160
6221	14161799	1161
6222	14162023	1162
6223	14161845	1163
6224	14161861	1164
6225	14161862	1164
6226	14162050	1165
6227	14162525	1166
6228	14162537	1167
6229	14162583	1168
6230	14162616	1169
6231	14162913	1170
6232	14162903	1171
6233	14163022	1172
6234	14162975	1173
6235	14162976	1174
6236	14163208	1175
6237	14163139	1176
6238	14163147	1177
6239	14163153	1178
6240	14163154	1179
6241	14163155	1180
6242	14163247	1181
6243	14163216	1182
6244	14163281	1183
6245	14163283	1184
6246	14163605	1185
6247	14164066	1186
6248	14164067	1186
6249	14164126	1187
6250	14164127	1187
6251	14164160	619
6252	14167483	619
6253	14164184	647
6254	14164185	647
6255	14164186	647
6256	14164187	647
6257	14164201	1188
6258	14164202	1188
6259	14170258	1188
6260	14170259	1188
6261	14164471	611
6262	14164472	611
6263	14164473	611
6264	14164474	611
6265	14164475	611
6266	14164476	611
6267	14164477	611
6268	14164478	611
6269	14164479	611
6270	14164480	611
6271	14164481	611
6272	14164482	611
6273	14164653	1189
6274	14164654	1189
6275	14167548	1189
6276	14188007	1189
6277	14164716	609
6278	14167602	609
6279	14173901	609
6280	14188379	609
6281	14165896	1190
6282	14165897	1190
6283	14165898	1190
6284	14165899	1190
6285	14165900	1190
6286	14165901	1190
6287	14165998	1191
6288	14165999	1191
6289	14166000	1191
6290	14166001	1191
6291	14166002	1191
6292	14166003	1191
6293	14166004	1191
6294	14166005	1191
6295	14166006	1191
6296	14166007	1191
6297	14167599	1192
6298	14167600	1192
6299	14170277	1193
6300	14170278	1193
6301	14173884	1194
6302	14173885	1194
6303	14173886	1194
6304	14173887	1194
6305	14173908	651
6306	14173909	651
6307	14173910	651
6308	14173911	651
6309	14173912	651
6310	14173913	651
6311	14173914	651
6312	14173915	651
6313	14173916	651
6314	14173917	651
6315	14173918	651
6316	14173919	651
6317	14173920	651
6318	14173921	663
6319	14173922	663
6320	14173923	663
6321	14173924	663
6322	14173925	663
6323	14173926	663
6324	14173927	663
6325	14174042	635
6326	14174043	635
6327	14174044	635
6328	14174045	635
6329	14174046	635
6330	14174948	620
6331	14174949	620
6332	14185230	1195
6333	14185402	1196
6334	14187973	1197
6336	14187974	1197
6338	14187975	1197
6340	14187976	1197
6342	14187977	1197
6344	14187978	1197
6346	14187979	1197
6348	14187980	1197
6350	14187981	1197
6352	14187982	1197
6354	14187983	1197
6356	14187984	1197
6358	14187985	1197
6360	14187986	1197
6362	14187987	1197
6364	14191571	1197
6365	14188028	1198
6366	14188029	1198
6367	14188030	1198
6368	14188031	1198
6369	14188032	1198
6370	14188033	1198
6371	14188042	1199
6372	14188043	1199
6373	13986038	207
6374	13985466	271
6375	00000000001	586
6376	00000000002	586
6377	00000000003	586
6378	00000000004	586
6379	13945311	1366
6380	13945312	1366
6381	13946121	1366
6382	13946122	1366
6383	13986651	1367
6384	13986652	1367
6385	13986653	1367
6386	13986654	1367
6387	14059408	1368
6388	14059409	1368
6389	13987773	672
6390	13987774	672
6391	13987775	672
6392	13987776	672
6393	14055922	689
6394	14055921	689
6395	14055920	689
6396	13986810	1272
6397	13986812	1272
6398	13986813	1272
6399	13986814	1272
6400	14019216	1371
6401	14019215	1371
6402	14031903	589
6403	14031904	589
6404	14055800	589
6405	14055801	589
6406	14055802	589
6407	14055803	589
6408	14055804	589
6409	14055805	589
6410	14055807	589
6411	14055808	589
6412	14031902	589
6413	14060664	1372
6414	14055809	589
6415	14055810	589
6416	14032407	1373
6417	14032408	1373
6418	14040018	1374
6419	14056649	1375
6420	14056645	1375
6421	14056650	1375
6422	14056647	1375
6423	14056651	1375
6424	14056646	1375
6425	14056763	862
6426	14056762	862
6427	14056586	1376
6428	14056587	1376
6429	14056588	1376
6430	14057874	1376
6431	14057875	1376
6432	14057876	1376
6433	14057115	1377
6434	14057114	1377
6435	14057578	743
6436	14088106	743
6437	14088107	743
6438	14057692	1378
6439	14057691	1378
6440	14057989	1379
6441	14057990	1379
6442	14057991	1379
6443	14058764	727
6444	14058765	727
6445	14058766	727
6446	14098110	727
6447	14098111	727
6448	14098112	727
6449	14098113	727
6450	14098114	727
6451	14138044	1380
6452	14138045	1380
6453	14138046	1380
6454	14150927	1381
6455	14150928	1381
6456	14150929	1381
6457	14150930	1381
6458	14150931	1381
6459	14150932	1381
6460	14150933	1381
6461	14150934	1381
6462	14150935	1381
6463	14150936	1381
6464	14150937	1381
6465	14150938	1381
6466	14150939	1381
6467	14150940	1381
6468	14150941	1381
6469	14051002	320
6470	14051003	320
6471	14051004	320
6472	14051005	320
6473	13976366	1009
6474	14057010	1113
6475	14057011	1113
6476	14124164	1113
6477	14124165	1113
6478	14124166	1113
6479	14124167	1113
6480	14124168	1113
6481	14124169	1113
6482	14124170	1113
6483	14124171	1113
6484	14124172	1113
6485	14124173	1113
6486	14124174	1113
6487	14124175	1113
6488	14124176	1113
6489	14124177	1113
6490	14124178	1113
6491	14124179	1113
6492	14124180	1113
6493	14124181	1113
6494	14124182	1113
6495	14124183	1113
6496	14150950	313
6497	14150951	313
6498	14150952	313
\.


--
-- Name: exemplares_id_e_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('exemplares_id_e_seq', 1, false);


--
-- Data for Name: integracao_curricular; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY integracao_curricular (id_componente, id_curriculo, qtd_alunos,  semestre_oferta , natureza) FROM stdin;
7	1	50	2	0
9	1	50	2	0
6	1	50	2	0
10	1	50	2	0
8	1	50	2	0
9	2	50	2	0
8	4	50	2	0
30	4	40	7	0
99	4	20	7	0
21	1	40	5	0
19	1	40	5	0
22	1	40	5	0
24	1	40	6	0
23	1	40	6	0
96	1	52	1	0
97	1	40	7	0
3	1	52	1	0
26	1	10	9	0
57	1	52	1	0
2	2	52	1	0
55	2	52	1	0
56	2	52	1	0
57	2	52	1	0
6	2	50	2	0
8	2	50	2	0
15	2	45	3	0
13	2	50	2	0
14	2	45	3	0
17	2	45	3	0
18	2	40	4	0
30	2	45	3	0
26	2	10	9	0
30	1	40	10	0
39	2	40	4	0
36	4	15	9	0
36	2	15	9	0
59	2	40	4	0
42	2	40	5	0
64	2	40	6	0
43	2	40	6	0
58	2	50	2	0
60	2	40	4	0
21	3	30	6	0
61	2	40	5	0
62	2	40	5	0
65	2	30	10	0
66	2	30	9	0
67	2	30	9	0
69	2	30	9	0
37	4	15	10	0
105	2	20	9	0
107	2	15	9	0
90	2	30	10	0
91	2	30	10	0
101	2	30	10	0
102	2	30	10	0
45	4	20	9	0
2	3	52	1	0
68	2	30	10	0
21	2	30	9	0
11	2	45	3	0
71	2	15	9	0
74	3	52	1	0
75	3	52	1	0
76	3	52	1	0
8	3	50	2	0
13	3	50	2	0
14	3	50	2	0
22	3	50	2	0
30	3	50	2	0
12	3	40	3	0
77	3	40	3	0
78	3	40	3	0
79	3	40	3	0
1	4	52	1	0
2	4	52	1	0
6	4	52	1	0
57	4	52	1	0
55	4	52	1	0
96	4	52	1	0
14	4	50	2	0
11	4	50	2	0
7	4	50	2	0
9	4	50	2	0
13	4	45	3	0
108	4	45	3	0
109	4	45	3	0
12	4	40	4	0
17	4	40	4	0
42	4	40	4	0
15	4	40	4	0
70	2	20	9	0
26	4	40	5	0
104	4	20	8	0
22	4	40	5	0
21	4	40	5	0
20	4	40	6	0
39	4	40	6	0
44	4	40	6	0
38	4	40	6	0
47	4	40	6	0
72	2	10	9	0
70	4	20	9	0
41	2	10	10	0
72	4	10	9	0
73	4	29	9	0
19	4	10	9	0
105	4	10	9	0
47	2	10	10	0
106	2	15	9	0
110	4	20	9	0
111	4	20	9	0
20	1	40	5	0
2	1	52	1	0
61	4	10	9	0
98	3	30	6	0
131	2	30	9	0
97	2	40	7	0
24	2	40	5	0
63	2	40	6	0
12	2	40	4	0
131	3	30	6	0
130	4	40	5	0
90	4	10	9	0
135	4	40	5	0
97	4	40	7	0
112	4	20	9	0
113	4	20	9	0
114	4	20	9	0
115	4	20	9	0
116	4	20	9	0
117	4	20	9	0
118	4	20	9	0
98	4	30	9	0
119	4	20	9	0
120	4	20	9	0
121	4	20	9	0
122	4	20	9	0
123	4	20	9	0
125	4	20	9	0
124	4	20	9	0
126	4	20	9	0
127	4	20	9	0
128	4	20	9	0
129	4	20	9	0
136	4	20	9	0
137	6	52	1	0
138	6	52	1	0
139	6	52	1	0
140	6	52	1	0
141	6	52	1	0
142	6	50	2	0
143	6	50	2	0
144	6	50	2	0
145	6	50	2	0
146	6	50	2	0
155	6	40	5	0
156	6	40	5	0
157	6	40	5	0
158	6	40	5	0
159	6	40	5	0
163	6	40	6	0
160	6	40	6	0
161	6	40	6	0
162	6	40	6	0
30	6	40	6	0
164	6	30	9	0
165	6	30	9	0
167	6	30	9	0
168	6	30	9	0
170	6	30	9	0
171	6	30	9	0
172	6	30	9	0
173	6	30	9	0
174	6	30	9	0
175	6	20	7	0
2	7	52	1	0
57	7	52	1	0
92	7	52	1	0
96	7	52	1	0
7	7	50	2	0
9	7	50	2	0
11	7	50	2	0
134	7	50	2	0
178	7	50	2	0
179	7	45	3	0
115	7	45	3	0
185	7	40	4	0
18	7	40	5	0
186	7	40	5	0
187	7	40	5	0
188	7	40	5	0
189	7	40	5	0
190	7	40	5	0
22	7	40	6	0
41	7	40	6	0
191	7	40	6	0
192	7	40	6	0
44	7	40	7	0
193	7	40	7	0
194	7	40	7	0
195	7	40	8	0
196	7	40	8	0
97	7	40	9	0
14	1	45	3	0
13	1	45	3	0
12	1	45	3	0
11	1	45	3	0
31	1	30	9	0
27	1	30	10	0
25	1	30	9	0
29	1	30	10	0
13	7	45	3	0
184	7	40	4	0
183	7	40	4	0
197	7	40	4	0
182	7	40	4	0
39	6	45	3	0
100	2	30	10	0
47	1	10	10	0
36	1	15	9	0
106	3	30	6	0
107	3	30	6	0
89	3	30	5	0
132	3	30	6	0
41	4	45	3	0
134	4	40	4	0
62	4	10	9	0
24	4	10	9	0
63	4	10	10	0
103	4	10	9	0
43	1	15	9	0
43	4	15	9	0
69	4	10	9	0
49	4	10	9	0
64	4	10	10	0
107	1	15	10	0
106	1	15	10	0
131	1	15	10	0
132	1	15	10	0
91	1	15	10	0
103	2	30	10	0
133	1	30	10	0
46	1	0	10	0
33	1	0	9	0
44	1	10	10	0
72	1	10	9	0
132	2	15	9	0
147	6	45	3	0
148	6	45	3	0
149	6	45	3	0
151	6	40	4	0
152	6	40	4	0
41	1	10	9	0
154	6	40	4	0
107	6	15	9	0
106	6	15	9	0
131	6	15	9	0
132	6	15	9	0
36	6	15	9	0
37	6	15	10	0
91	6	10	9	0
21	6	10	10	0
13	6	10	9	0
20	6	10	9	0
169	6	30	9	0
72	6	10	9	0
98	6	15	9	0
181	7	45	3	0
107	7	15	10	0
106	7	15	10	0
132	7	15	10	0
98	7	15	10	0
32	1	0	10	0
83	4	10	10	0
94	1	10	9	0
98	1	15	10	0
39	1	40	9	0
42	1	10	9	0
34	1	30	10	0
37	1	15	10	0
38	2	10	10	0
50	1	15	9	0
40	1	30	9	0
28	1	30	9	0
93	1	30	9	0
180	7	45	3	0
17	1	40	4	0
18	1	40	4	0
15	1	40	4	0
16	1	40	4	0
50	2	30	9	0
34	3	30	5	0
35	3	30	5	0
49	3	30	5	0
81	3	35	4	0
82	3	35	4	0
83	3	35	4	0
84	3	30	5	0
85	3	30	5	0
86	3	30	6	0
87	3	30	6	0
88	3	30	6	0
44	3	35	4	0
80	3	35	4	0
92	3	35	4	0
18	4	45	3	0
73	1	15	10	0
98	2	15	9	0
37	2	15	10	0
73	2	15	10	0
150	6	45	3	0
40	6	10	9	0
131	7	15	10	0
199	2	30	9	0
200	9	1	1	0
204	9	1	1	0
205	6	30	8	0
206	6	40	4	0
201	6	30	8	0
207	9	1	1	0
208	9	1	1	0
177	7	52	1	0
153	6	45	4	0
176	7	52	1	0
202	6	20	10	0
203	7	30	10	0
209	9	1	1	0
210	9	1	1	0
198	1	52	1	0
198	3	52	1	0
92	4	52	1	0
48	1	30	9	0
45	1	20	9	0
59	4	10	10	0
36	7	15	9	0
37	7	15	10	0
131	4	15	9	0
71	1	15	9	0
132	4	15	9	0
106	4	15	9	0
38	1	10	10	0
105	1	10	9	0
107	4	15	9	0
49	1	10	9	0
\.


--
-- Data for Name: meta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY meta (id_mt, indicecalculobasica, indicecalculocomplementar, nome) FROM stdin;
3	100	0	Vazio2
2	6	2	INEP 2014
1	4	2	Meta 2015
\.


--
-- Name: meta_id_mt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('meta_id_mt_seq', 1, false);


--
-- Data for Name: titulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY titulos (id_t, isbn, nome_titulo, tipo_titulo) FROM stdin;
1	9788573074895	LAVILLE, Christian; DIONNE, Jean. A construção do saber: manual de metodologia da pesquisa em ciências humanas. Porto Alegre: Artmed, Belo Horizonte: Editora UFMG, 2008. 340 p.	Físico
2	8522440158	MARCONI, Marina de Andrade; LAKATOS, Eva Maria. Fundamentos de metodologia científica. 6.ed. São Paulo: Atlas, 2005. 315p.	Físico
3	9788522457588	MARCONI, Marina de Andrade; LAKATOS, Eva Maria. Fundamentos de metodologia científica. 7. ed. São Paulo, SP: Atlas, 2010. xvi, 297 p.	Físico
6	8576050471	CERVO, Amado Luiz. Metodologia científica. 6. ed. São Paulo, SP: Prentice Hall, 2007. 162 p.	Físico
8	9788573936506	VIANA, Eliseu Ribeiro Cherene. Virtualização de servidores linux para redes corporativas: guia prático. Rio de Janeiro, RJ: Ciência Moderna, 2008. 230 p.	Físico
9	9788522448395	PASSOS, Eduardo José Pedreira Franco dos. Programação linear como instrumento da pesquisa operaciona: Eduardo José Pedreira Franco dos Passos. São Paulo, SP: Atlas, 2008. xii, 451p.	Físico
10	1595937537	SYMPOSIUM ON APPLIED COMPUTING 23rd., 2008, Fortaleza, CE); WAINWRIGHT, Roger L. Applied computing 2008 : the 23rd annual ACM Symposium on Applied Computing: proceedings of the 2008 ACM Symposium on Applied Computing, Fortaleza, March 16-20, 2008. Fortaleza, CE: ACM Press, 2008. 3v.	Físico
12	9780321117663	HASS, Anne Mette Jonassen. Configuration management: principles and practice. Boston, Massachusetts: Addison-Wesley, 2003. xlv, 370 p. (The Agile software development series)	Físico
15	8535215360	VELLOSO, Fernando de Castro. Informática: conceitos básicos . 7. ed. rev. atual. Rio de Janeiro, RJ: Campus, 2004. xiii, 407p.	Físico
16	852160372X	GUIMARÃES, Ângelo de Moura; LAGES, Newton Alberto de Castilho. INTRODUÇÃO a ciencia da computacao. Rio de Janeiro: Livros Técnicos e Científicos, 1984. 165p. (Ciência da computação)	Físico
17	9788587918888	CAPRON, H. L.; JOHNSON, J. A. INTRODUÇÃO à informatica. 8. ed. São Paulo: Prentice Hall, Pearson, 2004. 350 p.	Físico
20	9788535235227	WAZLAWICK, Raul Sidnei. Metodologia de pesquisa para ciência da computação. Rio de Janeiro, RJ: Elsevier, 2008. 159 p.	Físico
27	9783642112935	CHARRON-BOST, Bernadette; SCHIPER, André; PEDONE, Fernando. Replication: Theory and practice. Germany: Springer-Verlag Berlin Heidelberg, 2010. xv, 290p.	Físico
28	9788577808243	DIVERIO, Tiarajú Asmuz. Teoria da computação: máquinas universais e computabilidade. 3. ed. Porto Alegre: Bookman, 2011. 288 p. (Livros didáticos. n.5)	Físico
29	9788576691884	ATUALIZAÇÕES em informática 2008. Rio de Janeiro: Editora PUC-Rio, 2008. 272 p.	Físico
34	9788535234183	BARBOSA, Simone D. J.; SILVA, Bruno Santana da. Interação humano-computador. Rio de Janeiro, RJ: Elsevier, 2010. 384 p.	Físico
35	9788575222034	ROGERS, Rick; LOMBARDO, John; MEDNIEKS, Zigurd R.; MEIKE, Blake. Desenvolvimento de aplicações Android. São Paulo, SP: Novatec, 2009. xvi, 376 p.	Físico
36	9788577803101	WEBER, Raul Fernando. Fundamentos de arquitetura de computadores. 3. ed. Porto Alegre, RS: Bookman, 2008. 306 p. (Série Livros Didáticos 8)	Físico
37	8535212280	CELES, Waldemar; CERQUEIRA, Renato; RANGEL, José Lucas. Introdução a estruturas de dados: com técnicas de programação em C. Rio de Janeiro, RJ: Elsevier: Campus, 2004. xi, 294 p.	Físico
38	8535211020	MENASCÉ, Daniel A.; ALMEIDA, Virgilio A. F. Planejamento de capacidade para serviços na Web: métricas, modelos e métodos. Rio de Janeiro, RJ: Campus, 2002.	Físico
39	9788522107971	STAIR, Ralph M.; REYNOLDS, George Walter; SILVA, Flávio Soares Corrêa da. Princípios de sistemas de informação. São Paulo, SP: Cengage Learning, 2011. xvii, 590 p.	Físico
40	9780262026499	BAIER, Christel; KATOEN, Joost-Pieter. Principles of model checking. Cambridge, Massachusetts: The Mit Press, 2008. xvii, 975 p.	Físico
41	9780262032704	CLARKE, E. M. Model checking. Cambridge: MIT Press, 1999. xiv, 314 p.	Físico
42	9788535223552	HENNESSY, John L; PATTERSON, David A. Arquitetura de computadores: uma abordagem quantitativa. 4. ed. Rio de Janeiro, RJ: Elsevier, 2008. 494 p.	Físico
43	9788535206845	MURDOCCA, Miles; HEURING, Vincent P. Introdução a arquitetura de computadores. Rio de Janeiro, RJ: Elsevier, 2000. xxii, 512p.	Físico
44	9788521615439	MONTEIRO, Mario A. Introdução à organização de computadores. 5. ed. Rio de Janeiro, RJ: LTC, 2007. xii, 696p.	Físico
45	9780471503361	JAIN, Raj. The art of computer systems perfomance analysis: techniques for experimental design, measurement, simulation, and modeling . New York, NY: John Wiley & Sons, 1991. xxvii, 685 p.	Físico
46	9788576055648	STALLINGS, William; VIEIRA, Daniel. Arquitetura e organização de computadores. 8. ed. São Paulo: Pearson Prentice Hall, 2010. xiv, 624 p.	Físico
18	9788535222067	TURBAN, Efraim. Introdução a sistemas de informação: uma abordagem GERÊNCIAl. Rio de Janeiro, RJ: Elsevier, 2007. xi, 364 p. ISBN: 9788535222067	Físico
30	8521614225	GERSTING, Judith L. Fundamentos matemáticos para a ciência da computação: um tratamento moderno de matemática discreta . 5. ed. Rio de Janeiro: Livros Técnicos e Científicos, c2004. xiv, 597 p.  ISBN: 8521614225	Físico
31	8536304944	PREECE, Jennifer; ROGERS, Yvonne; SHARP, Helen. Design de interação: além da interação homem-computador . Porto Alegre, RS: Bookman, 2005. xvi, 548 p. ISBN 8536304944.	Físico
22	9788599593097	MORIMOTO, Carlos E. Redes, guia prático. Porto Alegre, RS: Sul Editores, 2009. 555 p. ISBN 9788599593097 (broch.).	Físico
23	97788599593196	MORIMOTO, Carlos E. Redes, guia prático. 2. ed., amp. e atual. Porto Alegre, RS: Sul Editores, 2011. 573 p. ISBN 97788599593196 (broch.).	Físico
7	9788573937701	ALECRIM, Paulo Dias de. Simulação computacional para redes de computadores. Rio de Janeiro, RJ: Ciência Moderna, 2009. xii, 253 p. ISBN 9788573937701 (broch.).	Físico
33	9788575022603	OLIVEIRA NETTO, Alvim Antônio de. IHC e a engenharia pedagógica. Florianópolis: Visual Books, 2010. 216 p. ISBN 9788575022603 (broch.).	Físico
21	8536302313	SCOTT, Kendall. O processo unificado explicado. Porto Alegre: Bookman, 2003. 160 p. ISBN 8536302313 (broch.).	Físico
32	8575021389	OLIVEIRA NETTO, Alvim Antônio de. IHC - Interação Humano Computador: modelagem e gerência de interfaces com o usuário : sistemas de informações . Florianópolis: Visual Books, 2004. xiii, 120 p. ISBN 8575021389 (broch.).	Físico
47	8587918532	STALLINGS, William. Arquitetura e organização de computadores: projeto para o desempenho. 5. ed. São Paulo, SP: Prentice Hall, 2006. xix, 786 p.	Físico
48	9781935182481	HAY, Chris; PRINCE, Brian H. Azure in action. Stamford, Ct: Manning, 2011. xxx, 457 p.	Físico
49	9788574524238	TAURION, Cezar. Cloud computing: computação em nuvem, transformando o mundo da Tecnologia da Informação. Rio de Janeiro, RJ: Brasport, 2009. 205 p.	Físico
50	9780470506387	JENNINGS, Roger. Cloud computing with the Windows Azure Platform. Indianapolis, Indiana: Wiley Pub., 2009. xxvii, 331 p.	Físico
51	8560031498	COULOURIS, George F.; DOLLIMORE, Jean; KINDBERG, Tim. Sistemas distribuídos: conceitos e projeto. 4. ed. Porto Alegre: Bookman, 2007. viii, 784p.	Físico
52	0132393085	COMER, Douglas. Automated network management sytems: current and future capabilities. New Jersey: Pearson/ Prentice Hall, 2007. xvi, 342 p.	Físico
53	9788535220179	COMER, Douglas. Interligação de redes com TCP/IP. 5. ed. rev. atual. Rio de Janeiro, RJ: Elsevier, 2006. v. 1	Físico
55	8588745887	HALLBERG, Bruce A. Networking: redes de computadores: teoria e prática. Rio de Janeiro, RJ: Alta Books, 2003. xvi, 292 p.	Físico
56	9788576083542	LIMA JUNIOR, Almir Wirth. Rede de computadores: tecnologia e convergência das redes. Rio de Janeiro, RJ: Alta Books, 2009. xiii, 592 p.	Físico
59	9788561893057	TORRES, Gabriel. Redes de computadores. Rio de Janeiro: Novaterra, 2009. xxiii, 805 p.	Físico
61	8576080567	OLIVEIRA, Gorki Starlin da Costa. Redes de computadores comunicações de dados TCP/IP: conceitos, protocolos e usos. Rio de Janeiro, RJ: Alta Books, 2004. xi, 224 p.	Físico
62	9788588639973	KUROSE, James F.; ROSS, Keith W. Redes de computadores e a Internet: uma abordagem top-down. 5. ed. São Paulo: Pearson Addison Wesley, 2010. xxii, 614 p.	Físico
63	8588639181	KUROSE, James F.; ROSS, Keith W. Redes de computadores e a Internet: uma abordagem top-down. 3. ed. São Paulo: Pearson/Addison Wesley, 2006. xx, 634 p.	Físico
79	9788560031368	COMER, Douglas. Redes de computadores e internet : abrange transmissão de dados, ligações inter-redes,web e aplicações. 4. ed. Porto Alegre: Bookman, 2007. 632 p. + 1 CD-ROM	Físico
80	8536501383	TRONCO, Tania Regina. Redes de nova geração: a arquitetura de convergência do IP, telefonia e redes ópticas . 1. ed. São Paulo, SP: Érica, 2006. 164 p.	Físico
81	9780201485349	STALLINGS, William. SNMP. SNMPv2, SNMPv3, RMON 1 and 2. 3rd. ed. New Jersey: Addison-Wesley, 2009. xv, 619 p.	Físico
82	0471433012	BLUM, Richard. Network perfomance: open source toolkit, using netperf, tcptrace, NIST Net, and SSFNet. Indianapolis: Wiley Publishing, 2003. xxiii, 405 p.	Físico
83	9788576081876	DONAHUE, Gary A. Redes robustas. Rio de Janeiro, RJ: Alta Books, 2008. xx, 502 p.	Físico
84	8535215913	FARREL, Adrian. A internet e seus protocolos: uma análise comparativa . Rio de Janeiro, RJ: Elsevier, 2005. xxvii, 572 p.	Físico
92	9780596008406	MAURO, Douglas R.; SCHMIDT, Kevin J. Essential SNMP. 2nd ed. Sebastopol: O´Reilly, 2005. xv, 442p.	Físico
93	9788536500270	GASPARINI, Anteu Fabiano L. Infra-estrutura, protocolos e sistemas operacionais de LANs: redes locias . 3. ed. São Paulo: Érica, 2007. 334 p.	Físico
94	8536304707	STEVENS, W. Richard. Programação de rede UNIX: API para soquetes de rede. 3. ed. São Paulo, SP: Bookman, 2005. v. 1	Físico
95	8535209220	SCRIMGER, Rob. TCP/IP: a bíblia. Rio de Janeiro: Elsevier, 2002. xix, 642 p.	Físico
97	9788576051893	ERL, Thomas. SOA: princípios de design de serviços. São Paulo, SP: Pearson Prentice Hall, 2009. x, 320 p.	Físico
98	9788576081845	JOSUTTIS, Nicolai M. SOA na prática: a arte da modelagem de sistemas distribuídos. Rio de Janeiro, RJ: Alta Books, 2008. xiv, 265 p.	Físico
99	9788586804885	FOROUZAN, Behrouz A. Comunicação de dados e redes de computadores. 4.ed. São Paulo, SP: McGraw-Hill, 2008. xxxiv, 1134 p.	Físico
100	9788536306148	FOROUZAN, Behrouz A. Comunicação de dados e redes de computadores. 3.ed. São Paulo, SP: McGraw-Hill, 2006. xi, 840 p.	Físico
104	9788573935950	COSTA, Daniel Gouveia. Comunicações multimídia na internet: da teoria à prática. Rio de Janeiro, RJ: Ciência Moderna, 2007. xiii, 236 p.	Físico
105	9781430219422	VENNER, Jason. Pro Hadoop: build scalable, distributed applications in the cloud. New York, NY: Apress, 2009. xxvii, 407 p.	Físico
106	9788576083078	SCHRODER, Carla. Redes linux: livro de receitas. Rio de Janeiro, RJ: Alta Books, 2009. xxi, 566 p.	Físico
107	9788577802623	PEZZÈ, Mauro; YOUNG, Michal. Teste e análise de software: processo, princípios e técnicas. Porto Alegre, RS: Bookman, 2008. x, 512 p.	Físico
108	9788576082125	PILONE, Dan; MILES, Russ. Use a cabeça: desenvolvimento de software. Rio de Janeiro, RJ: Alta Books, 2008. xxxiv, 378 p.	Físico
109	9788576083092	GREENE, Jennifer; STELLMAN, Andrew. Use a cabeça: PMP. Rio de Janeiro, RJ: Alta Books, 2008. xxx, 594 p.	Físico
110	0321295358	KLEINBERG, Jon; TARDOS, Éva. Algorithm design. Boston: Pearson/Addison Wesley, c2006. 838 p. :	Físico
111	0471383651	GOODRICH, Michael T.; TAMASSIA, Roberto. Algorithm design: foundations, analysis, and Internet examples . New York: John Wiley & Sons, 2002. xii, 708 p.	Físico
112	9788577260324	DASGUPTA, Sanjoy; PAPADIMITRIOU, Christos H.; VAZIRANI, Umesh. Algoritmos. São Paulo, SP: McGraw-Hill, 2009. xiv, 320 p.	Físico
114	857522073X	MEDINA, Marco; FERTIG, Cristina. Algoritmos e programação: teoria e prática. 2. ed. São Paulo, SP: Novatec, 2006. 384 p.	Físico
96	9788536502137	SOUSA, Lindeberg Barros de. TCP/IP & conectividade em redes: guia prático. 5. ed. rev. atual e ampl. São Paulo: Érica, 2009. 192 p. 9788536502137	Físico
85	9780123705488	PETERSON, Larry L.; DAVIE, Bruce S. Computer networks: a systems approach . 4th ed. Amsterdam; Boston, Massachusetts: Morgan Kaufmann, c2007. 806 p. ISBN 9780123705488	Físico
58	9788576059240	TANENBAUM, Andrew S.; WETHERALL, D. Redes de computadores. 5. ed. São Paulo: Pearson Prentice Hall, c2011. xvi, 582 p. ISBN 9788576059240.	Físico
113	8535209263	cormen-CORMEN, Thomas H. Algoritmos: teoria e prática. Rio de Janeiro: Elsevier, 2002. xvii , 916 p. ISBN: 8535209263	Físico
115	0735619670	MCCONNELL, Steve. Code Complete: um guia prático para a construção de software . 2. ed. Porto Alegre, RS: Bookman, 2005. xv, 928 p.	Físico
117	8573934069	GIMENES, Itana Maria de Souza; HUZITA, Elisa Hatsue Moriya. Desenvolvimento baseado em componentes: conceitos e técnicas . Rio de Janeiro, RJ: Ciência Moderna, 2005. xvi, 282 p.	Físico
118	9788577808076	COHN, Mike; SILVA, Aldir José Coelho da. Desenvolvimento de software com scrum: aplicando métodos ágeis com sucesso . Porto Alegre: Bookman, 2011. xii, 496 p.	Físico
119	9788534602372	PRESSMAN, Roger S. Engenharia de software. São Paulo: Pearson/ Makron Books, 2009. xxxii, 1056 p.	Físico
120	8586804576	PRESSMAN, Roger S. Engenharia de software. 6.ed. São Paulo: McGraw-Hill, 2006. 720 p.	Físico
125	9788588639287	SOMMERVILLE, Ian, |d 1951-. Engenharia de software. 8. ed. São Paulo, SP: Pearson/ Prentice Hall, 2007. xiv, 552 p.	Físico
126	9788579361081	SOMMERVILLE, Ian, |d 1951-; OLIVEIRA, Kalinka; BOSNIC, Ivan. Engenharia de software. 9. ed. São Paulo, SP: Pearson/ Prentice Hall, 2011. xiii, 529 p.	Físico
127	9788521616504	PAULA FILHO, Wilson de Pádua. Engenharia de software: fundamentos, métodos e padrões . 3. ed. Rio de Janeiro, RJ: LTC, 2009. xiii, 1248 p.	Físico
128	9788587918314	PFLEEGER, Shari Lawrence. Engenharia de software: teoria e prática. 2. ed. São Paulo, SP: Pearson/ Prentice Hall, 2007. xix, 537 p.	Físico
130	9788536304571	COCKBURN, Alistair. Escrevendo casos de uso eficazes: um guia prático para desenvolvedores de software . Porto Alegre: Bookman, 2005. viii, 254 p.	Físico
131	3540287132	GORTON, Ian. Essential software architecture. Berlin: Springer, 2006. xviii, 283 p.	Físico
132	9783642191756	GORTON, Ian. Essential software architecture. 2. ed. Berlin: Springer, 2011. xvi, 242 p.	Físico
137	8521610149	SZWARCFITER, Jayme Luiz; MARKENZON, Lilian. Estruturas de dados e seus algoritmos. 2. ed. rev. Rio de Janeiro: Livros Técnicos e Científicos, c1994. 320 p.	Físico
138	8576051480	ASCENCIO, Ana Fernanda Gomes; CAMPOS, Edilene Aparecida Veneruchi de. Fundamentos da programação de computadores: algoritmos, Pascal, C/C++ e java. 2. ed. São Paulo, SP: Prentice Hall, 2007. viii, 434 p.	Físico
140	9788535234190	FEIJÓ, Bruno; CLUA, Esteban; SILVA, Flávio Soares Corrêa da. Introdução à ciência da computação com jogos: aprendendo a programar com entretenimento . Rio de Janeiro: Elsevier, c2010. 263 p. (Série campus ; Sociedade Brasileira de Computação)	Físico
141	8573932759	KRUCHTEN, Philippe; FELLOW, Rational. Introdução ao RUP. rational unified process . Rio de Janeiro, RJ: Ciência Moderna, 2003. (Addison-Wesley object technology)	Físico
142	9788576050247	FORBELLONE, André Luiz Villar; EBERSPÄCHER, Henri Frederico. Lógica de programação: a construção de algoritmos e estruturas de dados . 3. ed. São Paulo: Makron, 2005. xii, 218 p.	Físico
143	9780735623583	WIGLEY, Andy; MOTH, Daniel; FOOT, Peter. Microsoft mobile development handbook. Redmond, Wash.: Microsoft Press, 2007. xxix, 651 p.	Físico
144	9788577807000	HUNT, Andrew. O programador pragmático: de aprendiz a mestre. Porto Alegre, RS: Bookman, 2010. xvii, 343 p.	Físico
145	8576050676	TANENBAUM, Andrew S. Organização estruturada de computadores. 5. ed. São Paulo, SP: Prentice Hall, 2007. xii, 449 p.	Físico
146	8522105251	ZIVIANI, Nivio; BOTELHO, Fabiano Cupertino. Projeto de algoritmos: com implementações em java e C++. São Paulo, SP: Thomson Learning, 2007. vii, 620 p.	Físico
150	9780735623989	WITHALL, Stephen. Software requirement patterns. Redmond, Wash.: Microsoft Press, c2007. xvi, 366 p. (Best practices)	Físico
151	0735618798	WIEGERS, Karl Eugene. Software requirements: practical techniques for gathering and managing requirements throughout the product development cycle . 2. ed. Redmond: Microsoft, 2003. 516 p.	Físico
152	9788577802814	SANTOS, Clesio Saraiva dos; AZEREDO, Paulo Alberto de; UNIVERSIDADE FEDERAL DO RIO GRANDE DO SUL. Tabelas: organização e pesquisa. Porto Alegre, RS: Sagra Luzzato, 2008. 85 p. (n 10)	Físico
153	9788576081746	FREEMAN, Eric; FREEMAN, Elisabeth; SIERRA, Kathy; BATES, But. Use a cabeça!: padrões e projetos. 2. ed. rev. Rio de Janeiro, RJ: Alta Books, 2007. xxiv, 478 p.	Físico
154	9788576081456	MCLAUGHLIN, Brett; POLLICE, Gary; WEST, David. Use a cabeça: análise e projeto orientado ao objeto. Rio de Janeiro, RJ: Alta Books, 2007. xxviii, 441 p.	Físico
155	9780321205681	COHN, Mike. User stories applied: for agile software development . Boston: Addison-Wesley, 2004. 268 p. (Addison-Wesley signature series)	Físico
156	9780321269317	SALMRE, Ivo. Writing mobile code: essential software engineering for building mobile applications. New Jersey: Addison-Wesley, 2005. xviii, 771p.	Físico
161	9788574523088	MARTINS, José Carlos Cordeiro. Técnicas para GERÊNCIAmento de projetos de software. Rio de Janeiro, RJ: Brasport, 2007. xviii, 432p.	Físico
162	9788576052074	PUGA, Sandra; RISSETTI, Gerson. Lógica de programação e estruturas de dados: com aplicações em Java. São Paulo, SP: Pearson, 2009. xiv , 262 p.	Físico
163	8536304030	SHALLOWAY, Alan; TROTT, James. Explicando padrões de projeto: uma nova perspectiva em projeto orientado a objeto . Porto Alegre: Bookman, 2004. xix, 328 p.	Físico
217	8573077271	DEITEL, Harvey M.; DEITEL, Paul J. Java: como programar. 3. ed. Porto Alegre, RS: Bookman, 2001. xxix, 1201 p. + 1 CD-ROM	Físico
147	9780471684176	THAYER, Richard H.; CHRISTENSEN, M. J. Software Engineering, Volume 1,  The Development Process, 3rd Edition	Físico
681	9788577807253	MOHER, M.; HAYKIN, S. Sistemas de Comunicação. Bookman, 2011.	Fisico
164	8575220470	TELES, Vinícius Manhães. Extreme programming: aprenda como encantar seus usuários desenvolvendo software com agilidade e alta qualidade. São Paulo, SP: Novatec, 2006. 316 p.	Físico
622	8575220241	OLIVEIRA, CelsoH. Poderosode. SQL: curso prático. São Paulo:Novatec, 2002. 272p. ISBN: 8575220241	Físico
159	8575221129	KOSCIANSKI, André; SOARES, Michel dos Santos. Qualidade de software: aprenda as metodologias e técnicas mais modernas para o desenvolvimento de software . 2. ed. São Paulo: Novatec, c2006. 395 p. ISBN 8575221129 (broch.).	Físico
160	9788577802449	KERIEVSKY, Joshua. Refatoração para padrões. Porto Alegre, RS: Bookman, 2008. xviii, 400 p. ISBN 9788577802449 (broch.).	Físico
165	8573076100	GAMMA, Erich. Padrões de projeto: soluções reutilizáveis de software orientado a objetos. Porto Alegre: Bookman, 2000. 364 p.	Físico
166	9788560031511	HORSTMANN, Cay S. Padrões e projeto orientados a objetos. 2. ed. Porto Alegre: Bookman, 2007. 423 p.	Físico
167	9788535216967	BEZERRA, Eduardo. Princípios de análise e projeto de sistemas com UML. 2. ed. rev. e atual. Rio de Janeiro: Elsevier: Campus, c2007. 369 p.	Físico
168	9788577808410	MARTIN, Robert C.; MARTIN, Micah. Princípios, padrões e práticas ágeis em C#. Porto Alegre: Bookman, 2011. 735 p.	Físico
169	8576050129	BARMES, David J.; KÖLLING, Michael. Programação orientada a objetos com Java: uma introdução prática usando o BLUEJ. São Paulo, SP: Pearson/ Prentice Hall, 2007. xxviii, 368 p.	Físico
170	9788576051879	BARNES, David J.; KÖLLING, Michael. Programação orientada a objetos com java: uma introdução prática usando o blueJ. 4.ed. São Paulo, SP: Pearson Prentice Hall, 2009. xxii , 444 p.	Físico
171	9788576082774	FERNANDEZ, Obie. Programando rails A biblia. Rio de Janeiro, RJ: Alta Books, 2008. xlviii, 671 p.	Físico
172	9788535217841	BOOCH, Grady; RUMBAUGH, James; JACOBSON, Ivar. UML: guia do usuário. 2. ed. rev. e atual. Rio de Janeiro, RJ: Elsevier, 2005. xviii, 474 p.	Físico
173	8536304545	FOWLER, Martin. UML essencial: um breve guia para a linguagem-padrão de modelagem de objetos . 3. ed. Porto Alegre: Bookman, 2005. 160 p.	Físico
175	0471463612	ERIKSSON, Hans-Erik; PENKER, Magnus; LYONS, Brian. UML 2 toolkit. Indianapolis, Indiana: Wiley Publishing, 2004. xxvii, 511 p. :	Físico
176	9788560031528	LARMAN, Craig. Utilizando UML e padrões: uma introdução à análise e ao projeto orientados a objetos e ao desenvolvimento iterativo. 3. ed. Porto Alegre: Bookman, 2007. 695 p.	Físico
179	9788576081821	CASTELLANI, Marcelo Fontes. Certificação Sun Java Associado SCJA: exame CX-310-019 : guia de viagem para passar no exame. Rio de Janeiro, RJ: Alta Books, 2008. xxii, 152 p.	Físico
180	8536305398	HORSTMANN, Cay S. Conceitos de computação com o essencial C++. Porto Alegre: Bookman, 2005. 711 p.	Físico
181	8536301716	SEBESTA, Robert W. Conceitos de linguagens de programação. 5. ed. Porto Alegre: Bookman, 2003. ix, 638 p.	Físico
182	9788577807918	SEBESTA, Robert W. Conceitos de linguagens de programação. 9. ed. -. Porto Alegre, RS: Bookman, 2011. ix, 792 p.	Físico
188	9788578730871	MOREIRA NETO, Oziel. Entendendo e dominando o Java para a internet. 2. ed. São Paulo: Digerati Books, 2009. 318 + DVD	Físico
189	8575220950	SÁ, Claudio Cesar de. Haskell: uma abordagem prática. São Paulo, SP: Novatec, 2006. 287 p.	Físico
190	8589579565	GONÇALVES, Enyo José Tavares; CARNEIRO, Domingos Sávio Silva. Linguagem de programação II. Fortaleza, CE: UECE, 2011. 97 p.	Físico
192	9788573936841	XAVIER, Fabrício S. V. PHP: do básico à orientação a objetos . Rio de Janeiro, RJ: Ciência Moderna, 2008. x, 234 p.	Físico
193	9788575222003	DALL´OGLIO, Pablo. PHP: programando com orientação a objetos. 2.ed.-. São Paulo, SP: Novatec, 2009. 574 p.	Físico
194	9788576081210	MONTGOMERY, Eduard. Programando com C: simples & prático. Rio de Janeiro, RJ: Alta Books, 2006. 157 p.	Físico
195	9780321573582	YAO, Paul. Programming. NET compact framework 3.5: Paul Yao, David Durant. 2nd. ed. New Jersey: Addison-Wesley, 2010. xxxvii, 694 p.	Físico
196	8536303956	FOWLER, Martin,. Refatoração: aperfeiçoando o projeto de código existente. Porto Alegre, RS: Bookman, 2008. xiv, 365 p.	Físico
198	9788577804535	RAMOS, Marcus Vinícius Midena; JOSÉ NETO, João; VEGA, Ítalo Santiago. Linguagens formais: teoria, modelagem e implementação. Porto Alegre: Bookman, 2009. 656 p. (Livros didáticos ; n.3)	Físico
199	9788577802661	MENEZES, Paulo Blauth. Linguagens formais e autômatos. 5. ed. Porto Alegre: Bookman, 2008. 215 p. (Livros didáticos ; n.3 Série Livros Didáticos 3)	Físico
205	9788575222119	POWERS, Shelley. Aprendendo JavaScript. São Paulo, SP: Novatec, 2010. 407 p.	Físico
206	9788577800131	LUTZ, Mark; ASCHER, David. Aprendendo python. 2. ed. Porto Alegre: Bookman, 2008. 566 p.	Físico
209	8575220551	DELAMARO, Márcio. Como construir um compilador utilizando ferramentas Java : Márcio Delamaro. -. São Paulo, SP: Novatec, 2004. 308 p.	Físico
212	8534615225	MUCHOW, John W. Core J2ME: tecnologia & MIDP. São Paulo, SP: Pearson/ Makron Books, 2004. xiv, 588 p. (Java)	Físico
213	9788575221884	SCHMITZ, Daniel Pace. Desenvolvendo sistemas com Flex e PHP. São Paulo, SP: Novatec, 2009. 294 p.	Físico
214	8575220500	NIEDERAUER, Juliano. Desenvolvendo websites com PHP: aprenda a criar websites dinâmicos e interativos com PHP e banco de dados. Ed. rev. e atual. São Paulo, SP: Novatec, 2008. 269 p.	Físico
215	9780757529740	CHEN, Yinong; TSAI, Wei-Tek. Introduction to programming languages: proggramming in C, C++, Scheme, Prolog, C#, and SOA. 2nd ed. xii, 383 p.	Físico
216	8576050196	DEITEL, Harvey M.; DEITEL, Paul J. Java: como programar. 6. ed. São Paulo: Pearson/ Prentice Hall, 2006. xl, 1110 p. + 1 CD-ROM	Físico
221	9788576055631	DEITEL, Paul J.; DEITEL, Harvey M. Java: como programar. 8. ed. São Paulo: Pearson Prentice Hall, 2010. xxix, 1144 p. + 1 CD-ROM	Físico
222	9780321349606	GOETZ, Brian. Java concurrency in practice. xx, 403 p.	Físico
223	9788574523361	COSTA, Daniel Gouveia. Java em rede: programação distribuída na internet . Rio de Janeiro: Brasport, 2008. xv, 288p.	Físico
207	8576050560	DEITEL, Harvey M.; DEITEL, Paul J. C++: como programar. 5. ed. São Paulo, SP: Pearson/Prentice Hall, 2006. xlii,1163 p. + cd-rom ISBN 8576050560 + cd-rom	Físico
178	8534614597	DEITEL, Harvey M. et al. C#: como programar : apresentando net e web services. São Paulo: Pearson Education do Brasil, c2003. xxix, 1153 p. + 1 CD-ROM ISBN 8534614597	Físico
208	9788534605953	SCHILDT, Herbert. C completo e total. 3. ed., rev. atual . São Paulo: Pearson/ Makron Books, c1997. 827p. + 1 CD-ROM. ISBN-10: 8534605955 ISBN-13: 9788534605953	Físico
210	9788576053576	HORSTMANN, Cay S.; CORNELL, Gary. Core Java: volume I : fundamentos. 8. ed. São Paulo: Pearson, c2009-2010. xiii, 383 p. ISBN 9788576053576 (broch.).	Físico
200	9788577807659	MENEZES, Paulo Blauth. Linguagens formais e autômatos. 6. ed. Porto Alegre: Bookman, 2011. 215 p. (Livros didáticos ; n.3 Série Livros Didáticos ; 3) ISBN: 9788577807659	Físico
224	9788574523699	COSTA, Daniel Gouveia. Java em rede: recursos avançados de programação. Rio de Janeiro: Brasport, 2008. xiii, 324	Físico
225	8573932104	KURNIAWAN, Budi. Java para a Web com Servlets, JSP e EJB: Budi Kurniawan; tradução Savannah Hartmann; revisão técnica Alfredo Dias da Cunha Júnior. Rio de Janeiro, RJ: Ciência Moderna, 2002. xxiv, 807 p.	Físico
227	1590592395	SEIBEL, Peter. Practical common lisp. Berkeley, Ca: Apress, 2005. xxv, 499 p. (The Expert’s voice in programming languages)	Físico
228	9780470563144	CIBRARO, Pablo. Professional WCF 4: Windows Communication Foundation with .NET 4. Indianapolis, Ind.: Wiley Publishing, 2010. xxvii, 451 p. (Guias Wrox profissional)	Físico
229	9788575221846	URUBATAN, Rodrigo. Ruby on rails: desenvolvimento fácil e rápido de aplicações Web. São Paulo, SP: Novatec, 2009. 285 p.	Físico
231	9788576085591	STELLMAN, Andrew; GREENE, Jennifer. Use a cabeça! C#: um guia de aprendizafem para a programação no mundo real com C# e .NET. 2.ed. Rio de Janeiro, RJ: Alta Books, 2011. 797p.	Físico
232	9788576082118	STELLMAN, Andrew; GREENE, Jennifer. Use a cabeça! C#: um guia de aprendizagem para a programação no mundo real com C# e .NET. Rio de Janeiro, RJ: Alta Books, 2008. xxxvi, 618p.	Físico
233	0596009208	SIERRA, Kathy; BATES, Bert. Use a cabeça! Java. 2. ed. Rio de Janeiro, RJ: Alta Books, 2007. xxvi, 470 p.	Físico
234	9788535226348	DELAMARO, Márcio; MALDONADO, Jose Carlos. Introdução ao teste de software. Rio de Janeiro, RJ: Elsevier: Campus, 2007. 394 p. (Sociedade brasileira de computação)	Físico
235	9788577807246	BECK, Kent. TDD desenvolvimento guiado por testes. Porto Alegre: Bookman, 2010. xiii, 240 p.	Físico
236	0646458418	REEKIE, John; MCADAM, Rohan. A software architecture primer. Sydney, Australia: Angophora Press, 2006. 179 p.	Físico
238	9812384251	GRUBB, Penny; TAKANG, Armstrong A. Software maintenance: concepts and practice. 2nd ed. New Jersey: World Scientfic, 2003. xix, 349 p.	Físico
241	9788573936742	GONÇALVES, Edson. Desenvolvendo aplicações Web com NetBeans IDE 6. Rio de Janeiro, RJ: Ciência Moderna, 2008. xix, 581 p.	Físico
242	9788576082941	BASHAM, Bryan; SIERRA, Kathy; BATES, Bert. Use a cabeça!: Servlets & JSP. 2. ed. Rio de Janeiro, RJ: Alta Books, 2008. xxxii, 879 p.	Físico
243	8576080850	BASHAM, Bryan. Use a cabeça!: Sevlets & JSP. Rio de Janeiro, RJ: Alta Books, 2004. xxi, 534 p. :	Físico
244	8575022105	MOLINARI, Leonardo. Gerência de configuração: técnicas e práticas no desenvolvimento do software. Florianópolis: Visual Books, 2007. 208 p.	Físico
245	9788577807567	POPPENDIECK, Mary; POPPENDIECK, Thomas David. Implementando o desenvolvimento Lean de software: do conceito ao dinheiro. Porto Alegre, RS: Bookman, 2011. 279 p.	Físico
246	9788575221525	JARGAS, Aurélio Marinho. Shell script profissional. São Paulo, SP: Novatec, 2008. 480 p.	Físico
247	9780201774238	SMITH, Roderick W. Advanced linux networking. Boston, Massachusetts: Addison-Wesley, 2002. xviii, 752 p.	Físico
248	9780321447739	BUTOW, Eric. User interface design for mere mortals: a hands-on guide to user interface design software-independent approach. Boston, Massachusetts: Addison-Wesley, 2007. xxii, 286 p.	Físico
249	9788575022443	STATO FILHO, André. Linux: controle de redes. Florianópolis: Visual Books, 2009. 352 p.	Físico
251	8575022202	VIGLIAZZI, Douglas. Redes locais com linux. 2. ed. Florianópolis: Visual Books, 2007. 160 p.	Físico
252	9788521615484	MACHADO, Francis B; MAIA, Luiz Paulo. Arquitetura de sistemas operacionais. 4. ed. Rio de Janeiro: LTC, 2007. 308 p.	Físico
253	9780596005955	ROBBINS, Arnold; BEEBE, Nelson H. F. Classic Shell Scripting. Sebastopol, Ca: c2005. xxii, 534 p.	Físico
254	9788577801473	ROBBINS, Arnold; BEEBE, Nelson H. F. Classic shell scripting: automatize suas tarefas com Unix . Porto Alegre: Bookman, 2008. xvii, 511p.	Físico
255	9788573936476	CARDOSO, Paulo Roberto Sant´anna; SANTANA, Fabiano de; NAKANO, Vitor. Comandos Windows Server 2003: administração e suporte . Rio de Janeiro: Ciência Moderna, 2008. xxviii, 588 p.	Físico
256	9788577805525	NORTHRUP, Anthony; MACKIN, J. C. Configuração do Windows Server 2008: infraestrutura de rede : kit de treinamento MCTS (Exame 70-462). Porto Alegre, RS: Bookman, 2009. 679 p. + 1 DVD (Kit de treinamento Microsoft)	Físico
257	9788577807680	MCLEAN, Ian; THOMAS, Orin. Configuração do windows 7: kit de treinamento MCTS - Exame 70-680. Porto Alegre, RS: Bookman, 2011. 919 p. + 1 DVD (Kit de treinamento Microsoft.)	Físico
259	9788577804832	MACKIN, J. C.; DESAI, Anil. Kit de treinamento MCTS - Exame 70-643: configuração do Windows Server 2008 : infraestrutura de aplicativos. Porto Alegre, RS: Bookman, 2009. 695p. + 1 CD-ROM	Físico
819	8585818107	Elon Lages Lima, A Matemática no Ensino Médio, SBM	Físico
260	9788577805280	HOLME, Dan; RUEST, Nelson; RUEST, Danielle. Kit de treinamento MCTS (Exame 70-640): configuração do Windows Server 2008 : Active Directory . Porto Alegre, RS: Bookman, 2009. 989 p. + 1 CD-ROM (Kits de treinamento Microsoft.)	Físico
261	9788575221778	FERREIRA, Rubem E. Linux: guia do administrador do sistema. 2. ed. rev. e ampl. São Paulo, SP: Novatec, 2008. 716 p.	Físico
262	9788576051121	NEMETH, Evi; SNYDER, Garth; HEIN, Trent R. Manual completo do Linux: guia do administrador . São Paulo, SP: Pearson Education do Brasil, 2007. xiv, 684 p.	Físico
263	9780735626393	THERNSTRÖM, Tobias. MCTS self-paced training kit (Exam 70-433): Microsoft SQL Server 2008: database development . Redmond, Wash.: Microsoft, 2009. xxiii, 456 p. + 1 CD (Self-paced training kit Microsoft)	Físico
258	9788521617471	SILBERSCHATZ, Abraham; GALVIN, Peter B.; GAGNE, Greg. Fundamentos de sistemas operacionais. 8. ed. Rio de Janeiro: LTC, c2010. xvii, 515 p. ISBN 9788521617471	Físico
237	9780596521974	WHITE, Tom. Hadoop: the definitive guide. California: O´Reilly, 2009. xix, 501 p. ISBN 9780596521974	Físico
240	9788575222447	LECHETA, Ricardo R. Google android: aprenda a criar aplicações para dispositivos móveis com o Android SDK. 2. ed. rev. ampl. São Paulo, SP: Novatec, 2010. 608 p. ISBN 9788575222447	Físico
239	9780470147078	APRIL, Alain; ABRAN, Alain. Software maintenance management: evaluation and continuous improvement. New Jersey: IEEE Computer Society, c2008. xx, 314 p. ISBN 9780470147078 (broch.).	Físico
250	978820332638	WILSON, Ed. Microsoft Windows PowerShell: step by step. Redmond, Wash.: Microsoft Press, 2007. xviii, 296 p. + 1 CD ROM ISBN 978820332638 (broch.).	Físico
264	9780470891667	RANDOLPH, Nick; FAIRBAIRN, Christopher. Professional Windows Phone 7 application development: building applications and games using Visual Studio, Silverlight, and XNA. Indianapolis, Indiana: Wiley Publishing, 2011. xxiii, 594 p.	Físico
266	8576051109	BÄCK, Magnus. Servidor de e-mail Linux: guia de instalação, configuração e GERÊNCIAmento para pequenos escritórios. São Paulo, SP: Pearson Prentice Hall, 2007. xvii, 284p.	Físico
269	9788587918574	TANENBAUM, Andrew S. Sistemas operacionais modernos. 2. ed. São Paulo, SP: Prentice Hall, 2003. xii, 695 p. :	Físico
270	9788576052371	TANENBAUM, Andrew S.; GONÇALVES, Ronaldo A. L. Sistemas operacionais modernos. 3. ed. São Paulo, SP: Prentice Hall, 2009, c2010. xvi, 653 p.	Físico
271	9788536305868	HOLME, Dan; THOMAS, Orin. Windows Server 2003: administração e manutenção do ambiente Microsoft : kit de treinamento. Porto Alegre: Bookman, 2006. 688 p. + 1 CD-ROM	Físico
272	9788571949805	THOMPSON, Marco Aurélio. Windows server 2003: administração de redes . 5. ed. São Paulo: Érica, 2009. 370 p.	Físico
273	9788561893040	BATTISTI, Júlio; SANTANA, Fabiano de. Windows Server 2008: guia de estudos completo : implementação, administração e certificado . Rio de Janeiro, RJ: Novaterra, 2009. xxx, 1751p.	Físico
274	9788576051428	TANENBAUM, Andrew S.; STEEN, Van Maarten; MARQUES, Arlete Simille. Sistemas distribuídos: princípios e paradigmas. 2. ed. São Paulo, SP: Prentice Hall, 2007. viii, 402 p.	Físico
280	9788588639249	AHO, Alfred V. et al. (). Compiladores :: príncípios, técnicas e ferramentas. 2. ed. São Paulo, SP: Pearson/Addison Wesley, 2007. 634 p.	Físico
281	9788574524344	COSTA, Daniel Gouveia. Administração de redes com scripts: Bash script, Python, VBscript. 2. ed. Rio de Janeiro, RJ: Brasport, 2010. 186 p.	Físico
282	0321197860	SHNEIDERMAN, Ben. Designing the user interface: strategies for effective human-computer interaction . 4th ed. Boston: Pearson/Addison Wesley, c2005. xviii, 652 p. :	Físico
283	0321200683	HOHPE, Gregor; WOOLF, Bobby. Enterprise integration patterns: designing, building, and deploying messaging solutions . Boston, Massachusetts: Addison-Wesley, c2004. xlix, 683 p. (The Addison-Wesley signature series)	Físico
284	9788575221396	SILVA, Maurício Samy. Construindo sites com CSS e (X)HTML: sites controlados por folhas de estilo em cascata . São Paulo, SP: Novatec, 2008. 446p.	Físico
285	9788576082713	KRUG, Steve. Não me faça pensar!: uma abordagem de bom senso à usabilidade na WEB. 2. ed. Rio de Janeiro, RJ: Alta Books, 2008. 201 p.	Físico
286	9788535221909	NIELSEN, Jakob, |. Usabilidade na web. Rio de Janeiro, RJ: Elsevier, 2007. xxiv, 406 p.	Físico
287	9780470383261	GOODRICH, Michael T.; TAMASSIA, Roberto. Data structures and algorithms in Java. 5th ed. New York, NY: J. Wiley & Sons, 2010. xxii, 714 p.	Físico
289	139780072465631	RAMAKRISHNAN, Raghu. Database management systems. 3rd ed. Boston, Massachusetts: McGraw-Hill, 2003. xxxii, 1065 p. :	Físico
290	9780132145374	KROENKE, David; AUER, David J. Database processing: fundamentals, design & implementation . 12. ed. Upper Saddle River, New Jersey: Pearson Prentice Hall, 2012. xvii, 612 p.	Físico
292	9788588639171	ELMASRI, Ramez; NAVATHE, Shamkant B. Sistemas de banco de dados. 4. ed. São Paulo, SP: Pearson/Addison Wesley, 2009. xi, 724 p.	Físico
293	9788536500126	MACHADO, Felipe Nery Rodrigues. Tecnologia e projeto de data warehouse: uma visão multidimensional. 5. ed. São Paulo, SP: Érica, 2010. 314 p.	Físico
296	9788576082187	FREEMAN, Elisabeth; FREEMAN, Eric. Use a cabeça!: HTML com CCS e XHTML. 2. ed. Rio de Janeiro, RJ: Alta Books, 2008. xxxi, 580 p.	Físico
297	139780131587564	PERSISTENCE in the enterprise: a guide to persistence technologies . Boston: Pearson Education, Inc., 2008. xxxii, 430 p.	Físico
298	9781441988331	OZSU, M.Tamer. Principles of distributed database systems. 3nd. ed. New York: Springer, 2011. 666p.	Físico
300	9788576082989	COAR, Ken A. L. Apache: guia prático. Rio de Janeiro, RJ: Alta Books, 2009. xvii, 250 p.	Físico
301	8535210350	WELCH-ABERNATHY, Dameon D. Check point fire wall-1 essencial: um guia de instalação, configuração e solução de problemas. Rio de Janeiro, RJ: Campus, 2002. xvii, 537 p.	Físico
434	9788522450022	IMONIANA, Joshua Onome. Auditoria de sistemas de informação. 2. ed. São Paulo: Atlas, 2008. 207 p.	Físico
302	8536304294	CHESWICK, William R.; BELLOVIN, Steven M; RUBIN, Aviel D. Firewalls e segurança na Internet: repelindo o hacker ardiloso . 2.ed. Porto Alegre, RS: Bookman, 2005. 400 p. (Ciência da Computação/Redes)	Físico
572	8536800763	POMPÉIA, Raul. O Ateneu. São Paulo, SP: DCL, 2005. 223 p. (Coleção Nossa Literatura Clássica Grandes Nomes da Literatura)	Físico
303	9781590597842	DASWANI, Neil; KERN, Christoph; KESAVAN, Anita. Foundations of security: what every programmer needs to know . Berkeley, Ca: Apress, c2007. xxvii, 290 p. (The Expert’s voice in security)	Físico
304	9788575221365	NAKAMURA, Emilio Tissato; GEUS, Paulo Lício de. Segurança de redes em ambientes cooperativos. São Paulo: Novatec, c2007.	Físico
349	8530801172	KAMII, Constance; DECLARK, Georgia. Reinventando a aritmética: implicações da teoria de Piaget . 4.ed. Campinas, SP: Papirus, 1992. 308 p.	Físico
291	9788535211078	SILBERSCHATZ, Abraham; KORTH, Henry F.; SUDARSHAN, S. Sistema de banco de dados. Rio de Janeiro: Elsevier, 2006. ISBN 9788535211078	Físico
265	9788574523453	NEVES, Julio Cezar. Programação SHELL LINUX. 7. ed. Rio de Janeiro, RJ: Brasport, 2008. xxx, 450p. + 1 CD-ROM ISBN 9788574523453 (broch.).	Físico
295	9788579360855	ELMASRI, Ramez; NAVATHE, Sham. Sistemas de banco de dados. 6. ed. -. São Paulo, SP: Pearson Education do Brasil, 2011. xviii, 788 p. ISBN: 9788579360855	Físico
275	9788522104222	LOUDEN, Kenneth C. Compiladores: princípios e práticas . São Paulo, SP: Cengage Learning, 2004. xiv, 569 p. ISBN 9788522104222 (broch.).[15ex]	Físico
288	0201120372	MANBER, Udi. Introduction to algorithms: a creative approach . Reading: Addison-Wesley, c1989. xiv, 478 p.ISBN: 0201120372	Físico
268	9788577800575	TANENBAUM, Andrew S.; WOODHULL, Albert S. Sistemas operacionais: projeto e implementação. 3. ed. Porto Alegre: Bookman, 2008. xi, 990 p. ISBN 9788577800575	Físico
294	9788577803828	HEUSER, Carlos Alberto. Projeto de banco de dados. 6. ed. Porto Alegre, RS: Bookman, 2009. xii, 282 p. (Livros didáticos informática ufrgs ; 4). ISBN 9788577803828 (broch.).	Físico
305	9788578730529	ULBRICH, Henrique Cesar; DELLA VALLE, James. Universidade H4CK3R: desvende todos os segredos do submundo dos hackers . 6. ed. São Paulo: Digerati Books, 2009. 348p. + DVD (Série Universidade)	Físico
306	9788576051190	STALLINGS, William. Criptografia e segurança de redes: princípios e práticas. 4. ed. São Paulo: Pearson/ Prentice Hall, 2008. xvii, 492 p.	Físico
307	9780470519462	WOOLDRIDGE, Michael J. An introduction to multiagent systems. 2nd ed. New York: J. Wiley & Sons, c2009. xxii, 461 p.	Físico
308	9788585490157	LÉVY, Pierre. As tecnologias da inteligência :: o futuro do pensamento na era da informática /. Rio de Janeiro: Editora 34, 2010. 206 p.	Físico
309	9788521617297	COPPIN, Ben. Inteligência artificial. Rio de Janeiro, RJ: LTC, 2010. xxv 636 p.	Físico
310	8535211772	RUSSELL, Stuart J. |q (Stuart Jonathan), |d 1962-; NORVIG, Peter, |d 1956-. Inteligência artificial. Rio de Janeiro: Elsevier, Campus, 2004. 1021 p.	Físico
311	9780521899437	SHOHAM, Yoav; LEYTON-BROWN, Kevin. Multiagent systems: algorithmic, game-theoretic, and logical foundations . New York, NY: Cambridge at the University Press, 2009. xx, 483 p.	Físico
312	0132733501	HAYKIN, Simon S. Redes neurais: princípios e prática. 2. ed. Porto Alegre: Bookman, 2001. xvii, 900 p.	Físico
314	9788521616290	AMMERAAL, L.; ZHANG, Kang. Computação gráfica para programadores Java. 2. ed. Rio de Janeiro, RJ: LTC, 2008. viii, 217 p.	Físico
317	9788573939507	RIBEIRO, Marcello Marinho; MENEZES, Marco Antonio Figueiredo. Uma breve introdução à computação gráfica. Rui De Janeiro,Rj: Ciência Moderna, 2010. v, 73 p.	Físico
319	9788521612223	PAULA FILHO, Wilson de Pádua. Multimídia: conceitos e aplicações. Rio de Janeiro: LTC, 2000. 321 p.	Físico
323	850808935X	CHAUÍ, Marilena de Sousa. Convite à filosofia. 13.ed. São Paulo: Ática, 1999. 424p.	Físico
324	9788508134694	CHAUÍ, Marilena de Sousa. Convite à filosofia /. 14. ed. São Paulo: Ática, 2011. 520 p.	Físico
325	9781575866321	BARKER-PLUMMER, Dave; BARWISE, Jon; ETCHEMENDY, John. Language, proof and logic. New York, NY: CSLI, 2011. xiii 606 p. (CSLI lecture notes ; v 23)	Físico
327	9788521617761	BARGER, Robert N. Ética na computação: uma abordagem baseada em casos. Rio de Janeiro, RJ: LTC, 2011. xiv, 226 p.	Físico
328	9788577806553	YIN, Robert K. Estudo de caso: planejamento e métodos . 4. ed. Porto Alegre, RS: Bookman, 2010. xviii, 248 p.	Físico
329	8536304626	YIN, Robert K. Estudo de caso: planejamento e métodos. 3. ed. Porto Alegre: Bookman, 2005. 212 p.	Físico
330	9788573028638	FRIEDMAN, Thomas L. O mundo é plano: uma breve história do século XXI. Rio de Janeiro, RJ: Objetiva, 2007. 557 p.	Físico
331	9788574851471	SILVA, Delnise. Flores de um jardim: a narrativa de si em contexto de vulnerabilidade social - sociabilidades, sensibilidades e utopias entre os jovens do grupo Nosso espaço (Fortaleza). Fortaleza, CE: Imprensa Universitária - UFC, 2010. 150 p.	Físico
332	8572821295	CARLEIAL, Adelita Neto; BRAGA, Elza Maria Franco. América Latina: transformações econômicas e políticas. Fortaleza: Ed. UFC, 2003. 291 p.	Físico
333	8525036706	UCHOA, Pablo. A encruzilhada de Hugo Chávez. São Paulo, SP: Globo, 2003. 294 p.	Físico
334	9788535230062	GONÇALVES, Carlos Eduardo S. Gonçalves; GUIMARÃES, Bernardo. Economia sem truques: o mundo a partir das escolhas de cada um . 5.ed. Rio de Janeiro, RJ: Campus, 2008. 209 p.	Físico
335	8522438129	ROSSETTI, José Paschoal. Introdução a economia: livro de exercícios. 4. ed. São Paulo, SP: Atlas, 2004. 387 p. :	Físico
336	8522104247	BRUE, Stanley L. História do pensamento econômico. São Paulo: Thomson Learning, 2006. 553p.	Físico
337	8522434670	ROSSETTI, José Paschoal. Introdução à economia. 20. ed. São Paulo: Atlas, 2003. 922 p.	Físico
338	9788535242027	LEITE, Antonio Dias. A economia brasileira: de onde viemos e onde estamos. 2. ed., rev. e atual. Rio de Janeiro, RJ: Elsevier, 2011. 226p.	Físico
339	8587062387	DUQUE, José Guimarães. Perspectivas nordestinas. 2. ed. Fortaleza: Banco do Nordeste do Brasil, 2004. 423 p.	Físico
340	8522438927	ALMEIDA, Guilherme Assis de; CHRISTMANN, Martha Ochsenhofer. Ética e direito: uma perspectiva integrada . 2. ed. São Paulo: Atlas, 2006. 185 p. ;	Físico
341	9788522445936	PAESANI, Liliana Minardi. O direito na sociedade da informação. São Paulo, SP: Atlas, 2007. xxx, 333 p.	Físico
342	9788522455072	ALMEIDA, Guilherme Assis de; CHRISTMANN, Martha Ochsenhofer. Ética e direito: uma perspectiva integrada . 3. ed. São Paulo: Atlas, 2009. 171 p.	Físico
343	8573484632	LIMBERGER, Têmis. O direito à intimidade na era da informática: a necessidade de proteção dos dados pessoais. Porto Alegre, RS: Livraria do Advogado, 2007. 250 p.	Físico
344	8588813297	CARBONI, Guilherme C. O direito de autor na multímidia: Guilherme C. Carboni. São Paulo, SP: Quartier Latin, 2003. 208 p.	Físico
345	9781558609327	BRACHMAN, Ronald J.; LEVESQUE, Hector J. Knowledge representation and reasoning. San Francisco [California, Estados Unidos]: Elsevier, 2004. xxix, 381 p.	Físico
574	8536800720	ALENCAR, José de. Senhora. São Paulo: DCL, 2005. 144 p. (Grandes Nomes da Literatura)	Físico
347	9788572822855	HISTÓRIA da educação:. arquivos, documentos, historiografia, narrativas orais e outros rastros. Fortaleza, CE: Edições UFC, 2008. 176 p. (Diálogos intempestivos ; 58)	Físico
348	9788572823883	EPISTEMOLOGIAS e metodologias para avaliação educacional:. múltiplas visões e abordagens. Fortaleza, CE: Edições UFC, 2010. 252 p. (Nave , 8)	Físico
321	3540440089	ALONSO, Gustavo et al. Web services: concepts, architectures and applications. Berlin: Springer, 2004. xx, 354 p. ISBN 3540440089	Físico
315	97885352232193	CONCI, Aura; AZEVEDO, Eduardo.; LETA, Fabiana R. Computação gráfica, v.2: teoria e prática. Rio de Janeiro, RJ: Elsevier: Campus, 2008. 407 p., [8] p. de estampas + 1 CD-ROM ISBN 97885352232193 (broch).	Físico
320	9783642078880	ALONSO, Gustavo. Web services: concepts, architectures and applications. Berlin: Springer, 2010. xx, 354 p. ISBN 9783642078880	Físico
346	8521904274	FREIRE, Paulo. Extensão ou comunicação. 13. ed. Rio de Janeiro: Paz e Terra, 2006. 93 p. ; (O Mundo Hoje ;24.) ISBN 8521904274 (broch.)	Físico
350	9788578261191	SANTOS, Deribaldo; SOUSA, Francisco Edisom Eugenio de; NASCIMENTO, Arnaldo Ricardo do. Caderno de pesquisas socioeducativas do Sertão Central. Quixadá: EdUECE, 2012. 150 p.	Físico
351	9788560031993	HAYKIN, Simon S. Sistemas modernos de comunicações wireless. Porto Alegre: Bookman, 2008. x, 579 p.	Físico
352	9788533623323	LEVINSON, Stephen C. Pragmática. São Paulo: Martins Fontes, 2007. xiv, 548 p. ;	Físico
353	8587214470	LONGMAN gramática escolar da língua inglesa: gramática de referências com exercícios e respostas . São Paulo, SP: Longman, 2004. 317 p. :	Físico
354	9781405025263	MACMILLAN English dictionary for advanced learners. 2nd. ed. Oxford: MacMillan Education, 2007. xi, 1748 p.	Físico
355	052143680X	MURPHY, Raymond. English grammar in use: a self-study reference and practice book for intermediate students. 3rd. ed. Cambridge: Cambridge University Press, 2007. x, 379 p.	Físico
356	9788527409742	GALLO, Lígia Razerra. Inglês instrumental para informática: módulo I. São Paulo, SP: Ícone, 2008. 170 p.	Físico
357	97885752211226	MARINOTTO, Demóstene. Reading on info tech: inglês para informática. 2. ed. São Paulo, SP: Novatec, 2007. 176 p.	Físico
358	9788526275393	DE NICOLA, Jose. Língua, literatura e produção de textos: José de Nicola. São Paulo, SP: Scipione, 2009. 3 v.	Físico
359	9788535711738	CEREJA, William Roberto. Português: linguagens. 3. ed. São Paulo, SP: Atual Ed., 2009. 576 p.	Físico
360	9788535709988	CEREJA, William Roberto. Gramática: texto, reflexão e uso. 3. ed. reform. São Paulo, SP: Atual Ed., 2008. 495 p.	Físico
361	8533619758	FERREIRA, Reinaldo Mathias. Lições de português: para nunca mais esquecer. São Paulo, SP: Martins Fontes, 2004. viii, 159 p.	Físico
363	8587484281	SCHLITTLER, José Maria Martins. Pensando em português: teoria e prática, assuntos e temas aplicados em concursos públlicos e vestibulares. Campinas, SP: Servanda, 2004. 392 p.	Físico
364	9788537800218	AZEREDO, José Carlos de. Ensino de português: fundamentos, percursos, objetos. Rio de Janeiro, RJ: Jorge Zahar, 2007. 214 p.	Físico
365	9788571107458	OLIVA, Alberto. Filosofia da ciência. 2. ed. Rio de Janeiro, RJ: J. Zahar, 2008. 74 p. (Passo-a-passo ; v. 31)	Físico
369	9788515019694	ALVES, Rubem. Filosofia da ciência:: introdução ao jogo e a suas regras. 15. ed. São Paulo, SP: Loyola, 2010. 223 p.	Físico
370	9788577804719	MENEZES, Paulo Blauth; TOSCANI, Laira V.; GARCÍA LÓPEZ, Javier. Aprendendo matemática discreta com exercícios. Porto Alegre, RS: Bookman, 2009. 356p. ((Livros didáticos informática ufrgs ; ; v. 19))	Físico
371	9788521618102	HUNTER, David J. Fundamentos da matemática discreta. Rio de Janeiro, RJ: LTC, 2011. x 235 p.	Físico
373	8535704620	IEZZI, Gelson; HAZZAN, Samuel; DEGENSZAJN, David Mauro. Fundamentos de matemática elementar: 11 : matemática comercial, matemática financeira, estatística descritiva . São Paulo, SP: Atual, 2004. 232 p.	Físico
379	8535705481	IEZZI, Gelson. Fundamentos de matemática elementar, 6: complexos, polinômios, equações : 89 exercícios resolvidos, 422 exercícios propostos com resposta, 273 testes de vestibulares com resposta. 7. ed. São Paulo, SP: Atual, 2005. 250 p.	Físico
380	9788522107964	SCHEINERMAN, Edward R. Matemática discreta: uma introdução . São Paulo: Cengage Learning, 2011. xxiii, 573 p.	Físico
382	8571109168	ALBERTI, Leon Battista. Matemática lúdica. Rio de Janeiro, RJ: Jorge Zahar, 2006. 115 p. (Ciência e cultura)	Físico
383	3540219439	MAJEWSKI, M. MuPAD Pro computing essentials. 2nd. ed. Berlin: Springer-Verlag, 2004. xi, 538 p.	Físico
384	9788502102033	SMOLE, Kátia Cristina Stocco; DINIZ, Maria Ignez de Souza Vieira. Matemática: ensino médio. São Paulo, SP: Saraiva, 2010. 3 v.	Físico
385	0122384520	ENDERTON, Herbert B. A mathematical introduction to logic. 2nd ed. San Diego, California: Harcourt/Academic Press, c2001. xii, 317 p. ;	Físico
386	9788571398979	CARNIELLI, Walter Alexandre; EPSTEIN, Richard L. Computabilidade,: funções computáveis, lógica e os fundamentos da matemática . 2. ed. rev. São Paulo: Ed. UNESP, 2009. 415 p.	Físico
387	8535210725	HOPCROFT, John E. Introdução à teoria de autômatos, linguagens e computação. Rio de Janeiro: Elsevier, 2002. 560 p.	Físico
433	8522425353	LEONE, George Sebastiao Guerra. Custos: planejamento, implantação e controle . 3.ed. São Paulo, SP: Atlas, 2000. 518 p.	Físico
388	9780321455369	HOPCROFT, John E.; MOTWANI, Rajeev. Introduction to automata theory, languages, and computation. Boston: Pearson Addison Wesley, c2007. xvii, 535 p. (Addison-Wesley series in computer science.)	Físico
389	9788535229615	SOUZA, João Nunes de. Lógica para ciência da computação: uma introdução concisa. 2. ed. rev. e atual. Rio de Janeiro: Elsevier, 2008. 220 p.	Físico
390	8522105170	SILVA, Flávio Soares Corrêa da; FINGER, Marcelo; MELO, Ana Cristina Vieira de. Lógica para computação. São Paulo, SP: Thomson Learning, 2006. 234 p.	Físico
391	9780521527149	BLACKBURN, Patrick; RIJKE, Maarten de; VENEMA, Yde. Modal logic. Cambridge: Cambridge Univ. Press, c2001. xxii, 554 p. (Cambridge tracts in theoretical computer science ; 53)	Físico
372	8570562705	IEZZI, Gelson; MURAKAMI, Carlos. Fundamentos de matemática elementar: 1 : conjuntos, funções . 8. ed.,. São Paulo, SP: Atual, 2004. 374 p. ISBN: 8570562705	Físico
381	9788577260362	ROSEN, Kenneth H. Matemática discreta e suas aplicações. 6. ed. São Paulo: McGraw-Hill, c2009. xxi, 982 p. ISBN 9788577260362.	Físico
377	8535705473	IEZZI, Gelson; MURAKAMI, Carlos; MACHADO, Nílson José. Fundamentos de matemática elementar: 8 : limites, derivadas, noções de integral . 6. ed. São Paulo, SP: Atual, 2005. 263 p. ISBN 8535705473 (broch.) .	Físico
374	8535704566	IEZZI, Gelson; DOLCE, Osvaldo; MURAKAMI, Carlos. Fundamentos de matemática elementar: 2 : logaritmos . 9. ed. São Paulo, SP: Atual, 2004. 198 p. ISBN 8535704566	Físico
378	8535704612	HAZZAN, Samuel. Fundamentos de matemática elementar, 5: combinatória, probabilidade : 43 exercícios resolvidos, 439 exercícios propostos com resposta, 155 testes de vestibulares com resposta. 7. ed. São Paulo, SP: Atual, 2004. 184 p. ISBN 8535704612 (broch.).	Físico
376	8535705465	IEZZI, Gelson. Fundamentos de matemática elementar: 7 : geometria analítica . 5. ed. São Paulo, SP: Atual, 2005. 282 p. ISBN 8535705465 (broch.) .	Físico
392	0201530821	PAPADIMITRIOU, Christos H. Computational complexity. Reading, Massachusetts [Estados Unidos]: Addison-Wesley, c1994. xv, 523 p.	Físico
393	8524401087	GONCALVES, Adilson. Introdução à álgebra. 5. ed. Rio de Janeiro, RJ: IMPA, 2005. 194 p. (Projeto Euclides)	Físico
395	9780321356932	DEMANA, Franklin D. Precalculus graphical, numerical, algebraic: media update. 7th. ed. Boston: Addison-Wesley, 2010. xxiv, 1032 p.	Físico
397	9780072988437	LAW, Averill M. Simulation modeling and analysis. 4th ed. Boston: McGraw-Hill, 2007. xix, 768 p. + + 1 CD-ROM (4 3/4 in.) (McGraw-Hill series in industrial engineering and management science)	Físico
398	8531406773	MAGALHÃES, Marcos Nascimento. Noções de probabilidade e estatística. 6. ed. rev. São Paulo: Editora da Universidade de São Paulo, 2005. xv, 392 p. (Acadêmica ; 40)	Físico
399	9788531406775	MAGALHÃES, Marcos Nascimento. Noções de probabilidade e estatística. 7. ed. rev. São Paulo, SP: Editora da Universidade de São Paulo, 2010. xv, 408 p. (Acadêmica ; 40)	Físico
404	9788576051992	WALPOLE, Ronald E. Probabilidade e estatística: para engenharia e ciências. 8. ed. São Paulo, SP: Pearson/ Prentice Hall, 2009. xiv, 491 p.	Físico
405	9788571931909	ALBUQUERQUE, José Paulo de Almeida e; FORTES, José Mauro Pedro; FINAMORE, Weiler Alves. Probabilidade, variáveis aleatórias e processos estocásticos. Rio de Janeiro, RJ: Editora PUC-Rio; Interciência, 2008. 334 p.	Físico
406	0262150417	OSBORNE, Martin J; RUBINSTEIN, Ariel. A course in game theory. London, England: Mit Press, 1998. 352 p.	Físico
408	8524106913	MENEZES, Paulo Blauth; UNIVERSIDADE FEDERAL DO RIO GRANDE DO SUL. Matemática discreta para computação e informática. 2. ed. Porto Alegre: Sagra Luzzato, 2005. 258p (Livros didáticos. 16)	Físico
411	9780471734406	GILAT, Amos; SUBRAMANIAM, Vish. Numerical methods for engineers and scientists: an introduction with applications using MATLAB . Massachusetts, [Estados Unidos]: J. Wiley & Sons, 2008. xx, 459 p.	Físico
412	9788587918567	HANSELMAN, Duane C.; LITTLEFIELD, Bruce. Matlab 6: curso completo. São Paulo, SP: Pearson Prentice Hall, 2007. xvi , 676 p	Físico
413	9788576053729	LARSON, Ron; FARBER, Betsy. Estatística aplicada. 4. ed. São Paulo, SP: Pearson/ Prentice Hall, 2010. 637 p.	Físico
414	9788587918598	LARSON, Ron; FARBER, Betsy. Estatística aplicada. 2. ed. São Paulo, SP: Pearson/ Prentice Hall, c2004. 476 p.	Físico
415	9788522459940	BARBETTA, Pedro Alberto; REIS, Marcelo Menezes; BORNIA, Antonio Cezar. Estatística para cursos de engenharia e informática. 3. ed. São Paulo, SP: Atlas, 2010. 410 p.	Físico
416	8536306882	DANCEY, Christine P.; REIDY, John. Estatística sem matemática para psicologia: usando SPSS para Windows. 3. ed. Porto Alegre, RS: Artmed, 2006. 608 p. (Biblioteca Artmed. Métodos de Pesquisa)	Físico
417	9788521615866	TRIOLA, Mario F. Introdução à estatística. 10. ed. Rio de Janeiro, RJ: LTC, 2008. 686 p. + 1 CD-ROM	Físico
418	8529400925	STEVENSON, William J. Estatística aplicada à administração. São Paulo: Harbra, c1981. 495p.	Físico
419	0471283665	WOLSEY, Laurence A. Integer programming. New York, NY: John Wiley & Sons, 1998. 264 p. (Wiley-Interscience series in discrete mathematics and optimization)	Físico
420	9788526258570	LUZ, Antônio Máximo Ribeiro da; ALVARES, Beatriz Alvarenga, Luz,A.M.R. Curso de física: Antônio Máximo Ribeiro da Luz, Beatriz Alvarenga Álvares. São Paulo, SP: Scipione, 2005. 3 v.	Físico
421	9788535711868	FERRARO, Nicolau Gilberto. Física básica. 3. ed. São Paulo, SP: Atual, 2009. 720 p.	Físico
422	9788573935707	COUTO, Ana Brasil. CMMI: integração dos modelos de capacitação e maturidade de sistemas. Rio de Janeiro: Ciência Moderna, 2007. xvi, 276 p.	Físico
423	9780470099254	HARPER, Brian D.; MERIAM, J. L; KRAIGE, L. G. Solving statics problems in MATLAB: engineering mechanics: statics. 6th ed. Massachusetts, [Estados Unidos]: J. Wiley & Sons, 2007. 139 p.	Físico
424	9788576051985	RAPPAPORT, Theodore S. Comunicações sem fio: principios e práticas. 2. ed. São Paulo, SP: Pearson/ Prentice Hall, 2009. 409 p.	Físico
425	85346154039	LEE, Valentino. Aplicações móveis: arquitetura, projeto e desenvolvimento. São Paulo, SP: Pearson Makron Books, 2005. xx, 328 p.	Físico
426	8574522147	FIORESE, Virgílio. Wireless: introdução às redes de telecomunicação móveis celulares . Rio de Janeiro: Brasport, 2005. xv, 343 p.	Físico
427	9788536502076	MARIN, Paulo S. Cabeamento estruturado: desvendando cada passo : do projeto à instalação . 3. ed. rev. e atual. São Paulo: Érica, 2009. 336 p.	Físico
428	9788535213041	PINHEIRO, José Maurício S. Guia completo de cabeamento de redes. Rio de Janeiro, RJ: Elsevier, 2003. xviii, 239p.	Físico
429	8587062360	DUQUE, José Guimarães. O Nordeste e as lavouras xerófilas. 4. ed. Fortaleza, CE: Banco do Nordeste do Brasil, 2004. 329 p.	Físico
430	9788576058082	HONG, Yuh Ching.; MARQUES, Fernando. Contabilidade & finanças para não especialistas. 3. ed. São Paulo, SP: Pearson, 2010. vii, 337 p.	Físico
431	9788522462872	IUDICIBUS, Sérgio de; MARION, José Carlos. Curso de contabilidade para não contadores: para as áreas de administração, economia, direito e engenharia . 7. ed. São Paulo, SP: Atlas, 2011. 274 p.	Físico
432	8522430780	MOSCOVE, Stephen A.; SIMKIN, Mark G.; BAGRANOFF, Nancy A. Sistemas de informações contábeis. São Paulo, SP: Atlas, 2002. 451 p.	Físico
435	8576050261	CARAVANTES, Geraldo Ronchetti.; PANNO, Cláudia Caravantes.; KLOECKNER, Mônica Caravantes. Administração: teorias e processo. São Paulo, SP: Prentice Hall, 2005. 572p.	Físico
436	9788577807451	FITZSIMMONS, James A; FITZSIMMONS, Mona J. Administração de serviços: operações, estratégia e tecnologia da informação. 6.ed. Porto Alegre, RS: Bookman, 2010. 583 p.	Físico
437	9788576800927	WEILL, Peter; ROSS, Jeanne W. Conhecimento em TI: o que os executivos precisam saber para conduzirem com sucesso TI em suas empresas . São Paulo: M. Books do Brasil, 2010. 162 p.	Físico
438	8560334009	CARVALHO, Isamir Machado de. Gestão do conhecimento: uma estratégia empresarial. Brasília, DF: J.J. Gráfica e Comunicações, 2006. 346 p.	Físico
439	8522413630	SILVA, Adelphino Teixeira da. Organizacao e tecnica comercial. 20. ed. rev. e atual. Sao Paulo: Atlas, 1996.	Físico
407	9788535215205	GOLDBARG, Marco Cesar; LUNA, Henrique Pacca L. Otimização combinatória e programação linear: modelos e algoritmos. Rio de Janeiro: Elsevier: Campus, 2005. xvi, 518 p. ISBN 9788535215205	Físico
441	8535213481	CHIAVENATO, Idalberto. Introdução à teoria geral da administração. 7. ed., totalmente rev. e atual. Rio de Janeiro: Elsevier: Campus, 2003. xxviii, 634 p.	Físico
442	9788522436934	ARAÚJO, Luís César G. de. Teoria geral da administração: aplicações e resultados nas empresas brasileiras. São Paulo, SP: Atlas, 2004. 291 p.	Físico
443	9788522460250	ARAÚJO, Luís César G. de; GARCIA, Adriana Amadeu. Teoria geral da administração: orientação para escolha de um caminho profissional. São Paulo: Atlas, 2010. 305 p.	Físico
444	9788536301174	COOPER, Donald R.; SCHINDLER, Pamela S. Métodos de pesquisa em administração. 7. ed. Porto Alegre: Bookman, 2008. ix, 640 p.	Físico
445	8574521914	FREITAS, Rogério Afonso de. Portais corporativos: uma ferramenta estratégica para a gestão do conhecimento. Rio de Janeiro, RJ: Brasport, 2004. xviii, 104 p.	Físico
446	8535215719	TURBAN, Efraim; RAINER, R. Kelly; POTTER, Richard E. Administração de tecnologia da informação. Rio de Janeiro, RJ: Elsevier, Campus, 2005. xvii, 618 p.	Físico
447	9788535217360	SALIM, César Simões. Construindo planos de negócios: todos os passos necessários para planejar e desenvolver negócios de sucesso. 3. ed. rev. e atual. Rio de Janeiro, RJ: Elsevier, 2005. xiv, 332 p.	Físico
448	8534607958	WESTON, J. Fred; BRIGHAM, Eugene F. Fundamentos da administração financeira. São Paulo, SP: Pearson Makron Books, 2004. xxxi, 1030 p.	Físico
449	8522426066	ROSS, Stephen A; WESTERFIELD, Randolph; JORDAN, Bradford D. Princípios de administração financeira. 2. ed. São Paulo, SP: Atlas, 2000. 523p.	Físico
450	8572821856	SANTOS, Sandra Maria dos; PESSOA, Maria Naiula Monteiro; MACIEL, Terezinha de Jesus Pinheiro. Experiências recentes em controladoria. Fortaleza, CE: Edições UFC, 2005. 302p. (Estudos Contemporâneos em Controladoria ; 1)	Físico
451	9788522456932	PADOVEZE, Clóvis Luís. Sistemas de informações contábeis: fundamentos e análise. 6. ed. São Paulo, SP: Atlas, 2009. xvi, 331p.	Físico
452	9788522449118	PADOVEZE, Clóvis Luís. Sistemas de informações contábeis: fundamentos e análise. 5. ed. São Paulo: Atlas, 2007. xvi, 331 p. :	Físico
455	9788522461370	FERRONATO, Airto João. Gestão contábil-financeira de micro e pequenas empresas: sobrevivência e sustentabilidade . São Paulo: Atlas, 2011. 247 p.	Físico
456	852241422X	WELSCH, Glenn A. Orçamento empresarial. 4. ed. São Paulo: Atlas, 1983. 397 p	Físico
457	9788522451487	BRUNI, Adriano Leal; FAMÁ, Rubens. Gestão de custos e formação de preços: com aplicações na calculadora HP 12C e excel. 5. ed. São Paulo, SP: Atlas, 2008. 569 p. (Série Finanças na Prática)	Físico
458	8573123664	LIMONGI-FRANCA, Ana Cristina. As pessoas na organização. São Paulo, SP: Editora Gente, 2002. 306 p. :	Físico
459	8572821872	ESTUDOS empíricos em gestão de recursos humanos e marketing. Fortaleza, CE: Edições UFC, 2005. 385 p. (Estudos Contemporâneos em Administração ; 1)	Físico
460	9788572822305	LIMA, Marcos Antonio Martins; MACIEL, Terezinha de Jesus Pinheiro. Avaliação, gestão e estratégias educacionais: projetos e processos inovadores em organizações. Fortaleza, CE: Edições UFC, 2008. 334 p.	Físico
461	9788573936032	ARAÚJO FILHO, Geraldo Ferreira de. Empreendedorismo criativo: a nova dimensão da empregabilidade . Rio de Janeiro: Ciência Moderna, 2007. 558 p.	Físico
467	9788573937411	MANSUR, Ricardo. Balanced scorecard: revelando SEPV : estudos de casos brasileiros. Rio de Janeiro, RJ: Ciência Moderna, 2008. xi, 265p.	Físico
468	9788535234176	FERRARI, Roberto. Empreendedorismo para computação: criando negócios em tecnologia. Rio de Janeiro, RJ: Elsevier, 2010. 164 p.	Físico
469	8522443955	BALLESTERO-ALVAREZ, María Esmeralda. Manual de organização, sistemas e métodos: abordagem teorica e prática da engenharia da informação. 3. ed. São Paulo, SP: Atlas, 2006. 329p.	Físico
471	8573034505	MEDEIROS, Elizabet M. Spohr de; SAUVÉ, Jácques Philippe. Avaliação do impacto de tecnologias da informação emergentes nas empresas. Rio de Janeiro, RJ: Qualitymark, 2003. 178 p.	Físico
472	9788535238990	MCAFEE, Andrew. Empresas 2.0: a força das mídias colaborativas para superar grandes desafios empresariais. Rio de Janeiro, RJ: Elsevier, 2010. 216 p.	Físico
473	9788535237061	ALBERTIN, Rosa Maria de Moura; ALBERTIN, Alberto Luiz. Estratégias de governança de tecnologia da informação: estrutura e práticas . Rio de Janeiro, RJ: Elsevier, 2010. 212 p.	Físico
474	9788573079784	PROBST, Gilbert; RAUB, Steffen; ROMHARDT, Kai. Gestão do conhecimento: os elementos construtivos do sucesso. Porto Alegre: Bookman, 2002. vii, 286 p.	Físico
475	8589384780	WEILL, Peter; ROSS, Jeanne W. Governança de TI: tecnologia da informação : como as empresas com melhor desempenho administram os direitos decisórios de TI na busca por resultados superiores. São Paulo, SP: M. Books do Brasil, 2006. 276p.	Físico
478	9788502054424	FONTES, Edison Luiz Gonçalves. Segurança da informação: o usuário faz a diferença. São Paulo, SP: Saraiva, 2006. 172 p.	Físico
573	8536800739	AZEVEDO, Aluísio. O Cortiço. São Paulo, SP: DCL, 2008. 136 p. (Coleção Nossa Literatura Clássica Grandes Nomes da Literatura)	Físico
479	9788522440856	BEAL, Adriana. Segurança da informação: princípios e melhores práticas para a proteção dos ativos de informação nas organizações. São Paulo, SP: Atlas, 2008. xii, 175 p.	Físico
463	9788522448524	ANDRADE, Adriana; ROSSETTI, José Paschoal. Governança corporativa: fundamentos, desenvolvimento e tendências . 3. ed., atual. e ampl. São Paulo: Atlas, 2007. 584p. ISBN 9788522448524 (enc.).	Físico
462	9788522454174	ANDRADE, Adriana; ROSSETTI, José Paschoal. Governança corporativa: fundamentos, desenvolvimento e tendências. 4. ed. São Paulo, SP: Atlas, 2009. 584p. ISBN 9788522454174 (enc.).	Físico
464	9788522462711	ROSSETTI, José Paschoal; ANDRADE, Adriana. Governança corporativa: fundamentos, desenvolvimento e tendências . 5. ed. atual. e ampl. São Paulo: Atlas, 2011. 596 p. ISBN 9788522462711.	Físico
466	0131986600	EFRAIM, Turban. DECISION support and business intelligence systems. 8th. ed. New Jersey: Prentice Hall, 2007. xxviii, 772 p. : ISBN: 0131986600	Físico
465	9780136107293	EFRAIM, Turban. DECISION support and business intelligence systems. 9th. ed. New Jersey: Prentice Hall, 2011. xxii, 696 p. ISBN: 9780136107293	Físico
481	9788536303413	TURBAN, Efraim. Tecnologia da informação para gestão: transformando os negócios na economia digital. 3. ed. Porto Alegre: Artmed, 2004. xiv, 660 p. :	Físico
482	9788577805082	TURBAN, Efraim. Tecnologia da informação para gestão: transformando os negócios na economia digital. 6. ed. Porto Alegre: Bookman, 2010. xiii, 680 p.	Físico
486	9788522461226	REZENDE, Denis Alcides. Planejamento de sistemas de informação e informática: guia prático para planejar a tecnologia da informação integrada ao planejamento estratégico das organizações. 4. ed. São Paulo, SP: Atlas, 2011. 179 p.	Físico
487	9788576059233	LAUDON, Kenneth C.; LAUDON, Jane Price. Sistemas de informação GERÊNCIAis. 9. ed. São Paulo, SP: Pearson Education do Brasil, 2011. xxviii, 428 p.	Físico
488	9788576050896	LAUDON, Kenneth C.; LAUDON, Jane Price. Sistemas de informação GERÊNCIAis. 7. ed. São Paulo: Prentice Hall, 2007. xxi, 452 p.	Físico
490	9788522450039	REZENDE, Denis Alcides; Abreu. Tecnologia da informação aplicada a sistemas de informação empresariais: o papel estratégico da informação e dos sistemas de informação nas empresas. 5. ed. rev. e amp. São Paulo, SP: Atlas, 2008. 303 p. :	Físico
491	9788522465187	REZENDE, Denis Alcides; Abreu (Professora). Tecnologia da informação aplicada a sistemas de informação empresariais: o papel estratégico da informação e dos sistemas de informação nas empresas. 8. ed. rev. e amp. São Paulo, SP: Atlas, 2011. xxv, 335 p.	Físico
492	852243493X	SOUZA, Cesar Alexandre de.; SACCOL, Amarolinda Zanela. Sistemas ERP no Brasil: (enterprise resource planning); teoria e casos. São Paulo, SP: Atlas, 2003. 368p.	Físico
493	9788574523237	DINSMORE, Paul C.; CABANIS-BREWIN, Jeannette. AMA: manual de GERÊNCIAmento de projetos. Rio de Janeiro, RJ: Brasport, 2009. xxii, 498p.	Físico
494	9788574523750	VARGAS, Ricardo Viana. Análise de valor agregado em projetos: revolucionando o GERÊNCIAmento de custos e prazos . 4. ed. Rio de Janeiro: Brasport, 2008. xviii, 107p.	Físico
502	9788573039788	DINSMORE, Paul Campbell; BARBOSA, Adriane Monteiro Cavalieri. Como se tornar um profissional em Gerênciamento de projetos: livro-base de Preparação para certificação PMP® - Project management professional. 4. ed., rev. e ampl. Rio de Janeiro: Qualitimark, 2011. xxiv, 383p.	Físico
503	9788535211832	PHILLIPS, Joseph. Gerência de projetos de tecnologia da informação: no caminho certo, do início ao fim. Rio de Janeiro, RJ: Elsevier, 2003. xviii, 449 p.	Físico
504	9788576084983	GREENE, Jennifer; STELLMAN, Andrew. Use a cabeça! PMP. Rio de Janeiro: Alta Books, 2010. xxxv, 794 p.	Físico
505	9781933890517	A GUIDE to the project management body of knowledge (PMBOK GUIDE). 4rd. ed. Newtown Square, Pa: Project Management Institute, c2008. xxvi, 467 p.	Físico
506	9788522106080	FARAH, Osvaldo Elias. Empreendedorismo estratégico. São Paulo: Cengage Learning, 2008. 251 p.	Físico
507	9788502067448	CHIAVENATO, Idalberto. Empreendedorismo: dando asas ao espírito empreendedor: empreendedorismo e viabilização de novas empresas, um guia eficiente para iniciar e tocar seu próprio negócio. 3. ed. rev. e atual. São Paulo, SP: Saraiva, 2008. xiv, 281 p.	Físico
508	9788576352600	JUSTUS, Roberto. O empreendedor: como se tornar um líder de sucesso. São Paulo, SP: Larousse do Brasil, 2007. 127 p.	Físico
514	9788575423387	DOLABELA, Fernando. O segredo de Luísa: uma idéia, uma paixão e um plano de negócios: como nasce o empreendedor e se cria uma empresa . Rio de Janeiro: Sextante, 2008. 299 p.	Físico
515	8535201772	NONAKA, Ikujiro; TAKEUCHI, Hirotaka. Criação de conhecimento na empresa: como as empresas japonesas geram a dinâmica da inovação . 19. ed. Rio de Janeiro: Campus; Elsevier, 1997. 358p. :	Físico
516	8573590963	CARUSO, Carlos A. A.; STEFFEN, Flávio Deny. Segurança em informática e de informações. 3. ed. rev. ampl. São Paulo: SENAC, 2006.	Físico
517	9788574523460	FERNANDES, Aguinaldo Aragon; ABREU, Vladimir Ferraz de. Implantando a governança de TI: da estratégia à gestão de processos e serviços . 2. ed. rev. ampl. Rio de Janeiro, RJ: Brasport, 2008. xxviii, 444 p.	Físico
518	9788520427422	CHIAVENATO, Idalberto. Planejamento e controle da produção. 2. ed.,rev., atual. São Paulo: Manole, 2008. 138 p	Físico
520	9788522456178	DIAS, Marco Aurélio P. Administração de materiais: princípios, conceitos e gestão. 6. ed. São Paulo, SP: Atlas, 2010. 346p.	Físico
521	8587918095	TURBAN, Efraim; KING, David R. Comércio eletrônico: estratégia e gestão . São Paulo: Prentice Hall, 2004. xvii, 436 .p :	Físico
567	8536800860	ASSIS, Machado de. Dom Casmurro. São Paulo: DCL, 2005. 120 p. (Serie Bom Livro Grandes Nomes da Literatura)	Físico
522	9788522456857	ALBERTIN, Alberto Luiz.; MOURA, Rosa Maria de. Comércio eletrônico: modelo, aspectos e contribuições de sua aplicação. 6. ed. atual. e ampl. São Paulo, SP: Atlas, 2004. 306 p.	Físico
523	8573078758	KALAKOTA, Ravi; ROBINSON, Marcia. e-business: estratégias para alcançar o sucesso no mundo digital. 2. ed. Porto Alegre, RS: Bookman, 2002. 470p.	Físico
526	8561381000	LIMA, Roberto Galvão; OLIVEIRA, Almir Leal de; UNIVERSIDADE FEDERAL DO CEARÁ. A escola invisível: artes pláticas em Fortaleza 1928-1958. Fortaleza, CE: Quadricolor, 2008. 215 p.	Físico
527	9788522106387	BERTOMEU, João Vicente Cegato. Criação visual e multimídia. São Paulo, SP: Cengage Learning, 2010. 149 p.	Físico
577	8536800712	HERCULANO, Alexandre. Eurico, o presbítero. São Paulo, SP: DCL, 2005. 96 p. (O Monasticon ; v. 1 Grandes Nomes da Literatura)	Físico
509	9788535232707	DORNELAS, Jose Carlos Assis. Empreendedorismo: transformando idéiais em negócios . 3. ed. rev. atual. Rio de Janeiro: Elsevier, 2008. 232 p. ISBN: 9788535232707	Físico
525	8534613737	DEITEL, Harvey M.; DEITEL, Paul J.; STEINBUHLER, K. E-business e e-commerce para administradores. São Paulo: Makron Books, 2004. xxii, 456 p. ISBN 8534613737 (broch.)	Físico
524	0130323640	DEITEL, Harvey M.; DEITEL, Paul J.; STEINBUHLER, K. E-business & e-commerce for managers. New Jersey: Prentice Hall, 2001. xxxvii, 794 p. ISBN 0130323640 (broch.).	Físico
495	8573035579	DINSMORE, Paul Campbell; BARBOSA, Adriane Monteiro Cavalieri. Como se tornar um profissional em Gerenciamento de projetos: livro base de preparação para certificação PMP - Project Management Professional. 2. ed. Rio de Janeiro: Qualitymark, 2007. xxxvi, 342 p.	Físico
528	9788577807383	LIDWELL, William; HOLDEN, Kritina; BUTLER, Jill. Princípios universais do design: 125 maneiras de aprimorar a usabilidade, influenciar a percepção, aumentar o apelo e ensinar por meio do design. Porto Alegre, RS: Bookman, 2010. 272 p.	Físico
529	9788574163871	WILLIAMS, Robin. Design para quem nao é designer: noções básicas de planejamento visual . 3. ed. São Paulo, SP: Callis, 2009. 191 p.	Físico
530	9788532305305	MOLETTA, Alex. Criação de curta-metragem em vídeo digital: uma proposta para produções de baixo custo. São Paulo, SP: Summus, 2009. 142 p. ((Biblioteca fundamental de cinema) ; 3)	Físico
531	8526214527	HAGGARD, H. Rider. As minas do Rei Salomão. 10. ed. São Paulo, SP: Scipione, 2000. 99 p. (Série Reencontro)	Físico
532	9789875665910	KEYES, Marian. Bajo el edredón. Buenos Aires, Argentina: DeBOLS!LLO, 2010. 414 p. (Coleção Best Seller)	Físico
533	8526211978	ROSTAND, Edmond,. Cyrano de Bergerac. 12. ed. São Paulo: Scipione Autores Editores, 1987. 88 p. (Série Reencontro Série Reencontro)	Físico
534	0689867220	HOPKINS, Cathy. Mates, dates and mad mistakes. New York, NY: Simon Pulse, 2004. 209 p.	Físico
535	8586796980	COLBERT, David. O mundo mágico de Harry Potter: mitos, lendas e histórias fascinantes. Rio de Janeiro, RJ: Sextante, 2001. 183 p.	Físico
536	852621733X	MALORY, Thomas Sir. O Rei Artur e os cavaleiros da Tavola Redonda. 12. ed. São Paulo, SP: Scipione, 2001. 80 p. (Série Reencontro)	Físico
537	0679801146	PIERCE, Tamora. Alanna: the first adventure. New York, NY: Random House, 1983.. 216 p. (Song of the lioness ; 1)	Físico
538	0763619582	MACKLER, Carolyn. The earth, my butt, and other big, round things. Cambridge, Massachusetts: Candlewick Press, 2003. 246 p.	Físico
539	0590476998	RUBY, Lois. Skin Deep. New York: Scholastic, 1994. 280p.	Físico
540	0471138231	EPSTEIN, Richard G. The case of the killer robot: stories about the professional, ethical, and societal dimensions of computing. New York, NY: John Wiley & Sons, 1997. x, 242 p.	Físico
541	8526237284	SHAKESPEARE, William,. A megera domada. São Paulo, SP: Scipione, 2000. 120 p. (Coleção L & PM Pocket. v.95 Série Reencontro)	Físico
542	0521664772	SCOTT-MALDEN, Sarah. A Picture to remember. 1st ed. Cambridge, UK: Cambridge University Press, 1999. 48 p. (Cambridge english readers ; level 2.)	Físico
543	0194230678	DICKENS, Charles. Great expectations. 2. ed. Oxford [England]: Oxford University Press, 2000. 104 p.	Físico
544	0521656079	MALEY, Alan. He Knows too much. Austrália: Cambridge University Press, 1999. 112 p. (Cambridge english readers ; 6)	Físico
545	9788501053213	FIELDING, Helen. O diário de Bridget Jones. 25. ed. Rio de Janeiro, RJ: Record, 2007. 319p.	Físico
546	9780140292817	KEYES, Marian. Sushi for beginners. England: Penguin Books, 2001. 563 p.	Físico
547	9788525419132	CHRISTIE, Agatha. testemunha ocular do crime. Porto Alegre, RS: L & PM, 2009. 254p.	Físico
548	0435272705	GALSWORTHY, John. The man of property. Oxford [England]: Macmillan Heinemann, 1995. 95 p.	Físico
549	8525410349	FLEMING, Ian. Viva e deixe morrer. Porto Alegre, RS: L&PM, 1999. 326 p. (L&PM Pocket ; 193)	Físico
550	8500217588	CERVANTES SAAVEDRA, Miguel de. Dom Quixote. 22. ed. Rio de Janeiro, RJ: Ediouro, 2005. 186 p. (Coleção Clássicos para o jovem leitor)	Físico
551	8572821287	VIANA, Carlos Augusto. Drummond: a insone arquitetura. Fortaleza: Ed. UFC, 2003. 167p	Físico
552	8536800844	ALVES, Castro. Espumas flutuantes. São Paulo, SP: DCL, 2005. 95 p. (Grandes Nomes da Literatura)	Físico
553	8536800801	GONZAGA, Tomás Antônio. Marília de Dirceu. São Paulo: DCL, 2005. 119 p. (Grandes Nomes da Literatura)	Físico
554	857485042X	MAIA, Virgílio. Palimpsesto & outros sonetos. Fortaleza: Imprensa Universitária da Universidade Federal do Ceará, 2004. 99 p. (Coleção Literatura no Vestibular ; 3)	Físico
555	8572821708	BEZERRA, João Clímaco. A vinha dos esquecidos. Fortaleza: Ed. UFC, 2005. 227 p. (Coleção Literatura no Vestibular ; 6)	Físico
556	8536800887	AZEVEDO, Aluísio. Casa de pensão. São Paulo, SP: DCL, 2005. 175 p. (Serie Bom Livro Grandes Nomes da Literatura)	Físico
557	8536800836	TAUNAY, Alfredo d´Escragnolle Taunay Visconde de,. Inocência. São Paulo: DCL, 2005. 104 p. (Serie Bom Livro Grandes Nomes da Literatura)	Físico
558	8586375942	ALMEIDA, Manuel Antônio de. Memórias de um sargento de milícias. Fortaleza: DCL, 2001. 120 p. (Grandes Nomes da Literatura)	Físico
559	8572821686	MONTE, Airton. Moça com flor na boca: crônicas escolhidas. Fortaleza: Ed. UFC, 2005. 130 p. (Coleção Literatura no Vestibular ; 4)	Físico
560	8536800771	AZEVEDO, Álvares de. Noite na taverna e Macário : Álvares de Azevedo . São Paulo, SP: DCL, 2005. 80 p. (Biblioteca de literatura brasileira)	Físico
561	8587791052	VIANCO, André. Os sete. São Paulo, SP: Novo Século, 2001. 380 p.	Físico
562	8536800704	BARRETO, Lima. Triste fim de Policarpo Quaresma. São Paulo, SP: DCL, 2005. 119 p. (Bom livro Grandes Nomes da Literatura)	Físico
563	9788525409683	ASSIS, Machado de. Contos fluminenses. São Paulo, SP: DCL, 2005. 219p. (Coleção L&PM Pocket ; 151)	Físico
564	8587653334	ALENCAR, José de. Luciola. Fortaleza: ABC, 2002. 152p.	Físico
565	8508004656	GÜIMARÃES, Bernardo,. A escrava Isaura. São Paulo, SP: DCL, 2005. 96 p. (Classicos da Literatura Brasileira Grandes Nomes da Literatura)	Físico
566	8536800895	MACEDO, Joaquim Manuel de. A Moreninha. São Paulo, SP: DCL, 2005. 96 p. (Grandes Nomes da Literatura)	Físico
568	8500005645	TAUNAY, Alfredo d´Escragnolle Taunay Visconde de,. Inocência. 2. ed. Rio de Janeiro, RJ: Ediouro, 2001. 216 p. (Serie Bom Livro Coleção Super Prestígio)	Físico
569	8536800828	ALENCAR, José de. Iracema: lenda do Ceará. São Paulo: DCL, 2005. 71 p. (Grandes Nomes da Literatura)	Físico
570	853680081X	ALENCAR, José de. Lucíola. Fortaleza: DCL, 2005. 88 p. (Grandes Nomes da Literatura)	Físico
801	9780470177075	MAK, Ronald, Writing Compilers and Interpreters: A Software Engineering Approach, Wiley, 3rd Edition, 2009.	Físico
571	8536800798	ASSIS, Machado de. Memórias Póstumas de Brás Cubas. São Paulo, SP: DCL, 2005. 112 p. (Coleção Nossa Literatura Clássica Grandes Nomes da Literatura)	Físico
575	8572821406	CAMPOS, Natércia Maria Alcides. A casa. Fortaleza, CE: Ed. UFC, 2004. 89 p. (Coleção Literatura no Vestibular ; 2)	Físico
576	8536800747	BARRETO, Lima. Os Bruzundangas. Fortaleza: DCL, 2005. 88 p. (Coleção Literatura no Vestibular ; 1 Grandes Nomes da Literatura)	Físico
579	9781589482609	ORMSBY, Tim. Getting to know ArcGIS desktop. 2nd. ed., atualizado para ArcGis 10. Redlands, Calif.: ESRI Press, 2010. xii, 584 p. + CD-ROM	Físico
580	8508067712	POLIZZI, Valéria Piassa. Depois daquela viagem: diário de bordo de uma jovem que aprendeu a viver com AIDS. 18. ed. São Paulo, SP: Ática, 1999. 279 p.	Físico
581	8575631160	DUARTE, Ana Rita Fonteles UNIVERSIDADE FEDERAL DO CEARA. Carmen da Silva: o feminismo na imprensa brasileira . Fortaleza: Expressão Gráfica e Editora, 2005. 185p. (Historia e memória do jornalismo Série História e Memória do Jornalismo)	Físico
582	9788574851464	MAIA, Michelle Ferreira. Lembrança de alguém: a construção das memórias sobre a santidade de João das Pedras. Fortaleza, CE: Imprensa Universitária - UFC, 2010. 262 p.	Físico
583	9788574851457	GOMES, José Eudes Arrais Barroso. Um escandaloso theatro de horrores: a capitania do Ceará sob o espectro da violência. Fortaleza, CE: Imprensa Universitária - UFC, 2010. 283 p.	Físico
585	999999506	INTERNATIONAL Network for Social Network Analysis. Disponível em: <http://www.insna.org.>. Acesso em: 23 jan. 2013	Virtual
586	999999507	VASCONCELOS, Davi Romero de; HAEUSLER, Edward Hermann. PONTIFÍCIA UNIVERSIDADE CATÓLICA DO RIO DE JANEIRO Departamento de Informática. Lógica modal de primeira-ordem para racionar sobre jogos. 2007. 241f. Tese(DoutoradoemInformática)-Pontifícia Universidade Católica do Rio de Janeiro, Rio de Janeiro, 2007	Virtual
587	9788563899156	FOWLER, F. J. Pesquisa de Levantamento. PortoAlegre:Pearson, 2011	Físico
589	9788577806812	MENEZES, Paulo Blauth; UNIVERSIDADE FEDERAL DO RIO GRANDE DO SUL. Matemática discreta para computação e informática. 3. ed. PortoAlegre, RS:Bookman, 2010. 350p(Livrosdidáticos. 16)	Físico
591	3212935332011	AMBLER, ScottW. ;SADALAGE, PramondJ. Refactoring databases: evolutionary database design. NewJ ersey: Addison-Wesley, 2011. 350p. (The Addison Wesley signature series)	Físico
592	9780321712479	APPELO, J. Management3. 0:Leading agile developers, developing agile leaders. NewYork: Addison Wesley, 2010. 	Físico
593	0321417461	BRATKO, Ivan. Prolog programming for artificial intelligence. 4. ed. Wokingham: Addison-Wesley, 2011. (International computer science series)	Físico
594	0452284392	BARABASI, Albert-Laszlo. Linked: how everything is connected to everything else and what it means for business, science, and everyday life. New York, :Plume Book, 2003. 294p. 	Físico
599	0471958697	BUSCHMANN, Franketal. Pattern-oriented software architecture: volume4: a system of patterns. New York: John Wiley & Sons, 1996. 457p. 	Físico
600	9780131479415	COHN, Mike; HIGHSMITH, Jim. . Agile estimating and planning. Upper Saddle River, NJ: Prentice Hall PTR, 2006. 330p. (Robert C. Martin series)	Físico
601	1591392705	CROSS, RobertL. ;PARKER, Andrew. The hidden power of social networks: understanding how work really gets done in organizations. Boston: Harvard Business School, 2004. 213p. 	Físico
602	9780470542200	CROSS, RobertL. ; SINGER et al. The organizational network field book: best practices, techniques and exercises to drive organizational innovation and performance. New York: John Wiley, 2010. 	Físico
603	9781580537919	COPELAND, Lee. A practitioners guide to software test design. Boston, Mass. ; London: Artech House, 2004. 294p. 	Físico
604	3540208798	DALEN, D. van. Logic and structure. 4. ed. Berlin: Springer-Verlag, 2004. 263p. (Universitext)	Físico
605	852210295	DROZDEK, Adam. Estrutura de dados e algoritmos em C++. São Paulo: Thomson, 2002. 579p	Físico
607	9780321336385	DUVALL, PaulM. Continuous integration: improving software quality and reducing risk. Boston, MA: Addison-Wesley, 2007. 283p. 	Físico
608	8522430357	SILVA, Sebastiao Medeiros da; SILVA, Elio Medeiros da; SILVA, Ermes Medeiros da. Matemática básica para cursos superiores. São Paulo: Atlas, 2002. 227p. 	Físico
609	0471398195	MILI, Hafedh. Reuse-based software engineering: techniques, organization and measurement. New York: Wiley, 2002. 636p. 	Físico
610	9788575222386	LUCKOW, Décio Heinzelmann; MELO, Alexandre Altair. Programação Java para a web. São Paulo: Novatec Editora, 2010. 	Físico
613	9780470093559	MAGEE, J. ;KRAMER, J. Concurrency: state models and Java programs. Michigan:Wiley, 2006. 	Físico
614	1558603484	LYNCH, Nancy A. Distributed algorithms. San Francisco: Morgan Kaufmann, 1996. 872p. (The morgan kaufmann series in data management systems). 	Físico
617	9780201699443	GARMUS, David; HERRON, David. Function point analysis: measurement practices for successful software projects. Boston: Addison-Wesley, 2001. (Addison-Wesley information technology series)	Físico
618	9780071483001	JONES, Capers. Estimating softwarecosts: bringing realism to estimating. 2. ed. New York: Mc Graw-Hill, 2007. 644p. 	Físico
619	9780071717915	HILL, P. Practical Software Project Estimation: a toolkit for estimating software development effort & duration. New York: McGraw-Hill Osborne Media, 2011. 	Físico
620	9780735605350	MCCONNELL, Steve. Software estimation: demystifying the black art. Redmond, Wa.: MicrosoftPress, 2006. 308p. 	Físico
621	9788535232493	FEOFILOFF, Paulo. . Algoritmos em linguagem C. Rio de Janeiro: Elsevier, 2009. 208p. 	Físico
615	0785342336313	FALL, Kevin R; STEVENS, W. Richard Stevens. TCP/IP Illustrated, Volume 1: The Protocols. 2nd Ed. Addison-Wesley Professional, 2011. ISBN-10: 0321336313. ISBN-13: 078-5342336313	Físico
606	8535212736	DATE, C. J. Introdução a sistemas de banco de dados. 8. ed. Rio de Janeiro: Elsevier, 2004. 865p. ISBN: 8535212736	Físico
578	0471314250	CHRISMAN, Nicholas. Exploring geographic information systems. 2nd. ed. New York, NY: John Wiley, 2002. xiv, 305 p. ISBN 0471314250 (broch.).	Físico
611	9788576086420	GEARY, David M.; HORSTMANN, Cay S. Core JavaServer Faces. Rio de Janeiro: Alta Books, 2012. xiv, 636 p. ISBN 9788576086420 (broch.).	Físico
624	0136291554	MEYER, Bertrand. Object-oriented software construction. 2nd. ed. New Jersey: Prentice Hall PTR, 1997. 1254p	Físico
625	9781412947152	PRELL, Christina. Social network analysis: history, theory and methodology. California: Sage Publications Ltd, 2011. 	Físico
626	9788535246698	PIMENTEL, M. ;FURKS, Hugo. Sistemas Colaborativos. Rio de Janeiro: Elsevier-Campus-SBC, 2011. 	Físico
628	0321419499	ROBERTSON, Suzanne; ROBERTSON, James. Mastering the requirements process. 2. ed. Upper Saddle River, NJ: Addison-Wesley, 2006. 560p. 	Físico
630	9788536503622	MACHADO, Felipe Nery Rodrigues. Análise e gestão de requisitos de software: onde nascem os sistemas. São Paulo: Érica, 2011. 286p. 	Físico
632	9781848000445	SHULL, Forrest;SINGER, Janice;SJÃ¸BERG, DagI. K SPRINGER LINK. Guide to advanced empirical software engineering. London: Springer-Verlag London Limited, 2008. 	Físico
633	9788574524511	MARTINS, José Carlos Cordeiro. Gerenciando projetos de desenvolvimento de software com PMI, RUP E UML. 5. ed. Rio de Janeiro: Brasport, 2010. 290p. 	Físico
635	0131177052	FEATHERS, Michael C. Working effectively with legacy code. Upper Saddle River, NJ: Prentice Hall, 2005. 434p. (Robert C. Martin series)	Físico
636	9780321166074	SPINELLIS, Diomidis. Code Quality: the open source perspective. Boston: Addison-Wesley, 2006. 	Físico
637	9788535243970	VELLOSO, Fernando de Castro. Informática: conceitos básicos. 8. ed. rev. atual. Rio de Janeiro, RJ: Campus, 2011. 	Físico
639	0137288743	WATT, David Anthony; FINDLAY, William; HUGHES, John. Programming language: concepts and paradigms. New York: Prentice Hall, 1990. 322p. 	Físico
640	9788521616108	HUTH, Michael; RYAN, Mark. Lógica em ciência da computação: modelagem e argumentação sobre sistemas. 2. ed. Rio de Janeiro: LTC, 2008. 322p. 	Físico
642	9780321601919	HUMBLE, Jez. ; FARLEY, David. Continuous delivery: reliable software releases through build, test, and deployment automation. Upper Saddle River, NJ: Addison-Wesley, 2011. 463p. (Addison-Wesley Signature Series. )	Físico
643	0470856629	VÖLTER, Markus; KIRCHER, Michael;ZDUN, Uwe. Remoting patterns foundations of enterprise, internet and real time distributed object middleware. Chichester:John Wiley, 2005. 389p. (Wiley series in software design patterns)	Físico
644	0471606952	SCHMIDT, Douglas C. Pattern-oriented software architecture: volume 2. Chichester [England]; New York: John Wiley & Sons, 2000. 633p. (Wiley series in software design patterns)	Físico
645	999999567	ALMEIDA, Eduardo Santana de et al. C.R.U.I.S.E: Component Reuse in Software Engineering. Recife: Gráfica Dom Bosco, 2007. Disponível em: <http://cruise.cesar.org.br/index.html> Acesso em: 14 set. 2008	Virtual
648	999999570	ABRAN, Alain (Ed.).Guide to the software engineering body of knowledge: trial version. Washington: Computer society, 2001. 205p. Disponível em: <http://www.computer.org/portal/web/swebok>. Acesso em: 23 jan. 2013	Virtual
649	9780321312839	BEN-ARI. Principles of concurrent and distributed programming. 2. ed. SãoPaulo: Prentice-Hall, 2006	Físico
650	9780321711502	CHRISSIS, Mary Beth; KONRAD, Mike; SHRUM, Sandy. CMMI for Development®: guidelines for process integration and product improvement. 3. ed. Upper Saddle River:Addison-Wesley,2011	Físico
651	9780321552686	CLEMENTS, Paul et al. Documenting software architectures: views and beyond. 2. ed. Massachusetts: Addison-Wesley Professional. 2010. 592p	Físico
656	999999578	GUIA MPS-BR: Melhoria do processo de software brasileiro. Disponível em:<http://www.softex.br/mpsbr/_home/default.asp>. Acesso em: 23 jan. 2013	Virtual
657	999999579	FIPA. Especificações FIPA. Disponível em: <http://www.fipa.org>. Acesso em: 24 jan. 2013	Virtual
659	999999581	MEIRA, Silvio R. L. et al. The Emerging Web of Social Machines. COMPSAC/IEEE, 2011. p. 26-27. Disponível em: <http://arxiv.org/abs/1010.3045>. Acesso em: 23 jan. 2013	Virtual
660	999999582	UM GUIA para o corpo de conhecimento de análise de negócios: guia BABOK: versão 2.0. Toronto: IIBA International Institutute of Business Analysis, 2011. Disponível em: <http://books.google.com.br/books?id=wZvSEEg39N4C&printsec=frontcover&hl=pt-BR&source=gbs_ge_summary_r&cad=0#v=onepage&q&f=false>. Acesso em: 07 nov. 2012	Virtual
671	999999593	SOFTEX Brasil. Guias MPS.BR. Disponível em: <http://www.softex.br/mpsbr/_home/default.asp>. Acesso em: 23 jan. 2013	Virtual
673	079237990X	JURISTO, Natalia; MORENO, Ana M. Basics of software engineering experimentation. Boston: Kluwer Academic Publishers, 2001. 395p. 	Físico
679	9788535246711	CHIAVENATO, I. Introdução à teoria geral da administração. 8ed. Campus, 2011.	Fisico
680	9788539900459	MANSUR, Ricardo. Governança de ti verde: o ouro verde da nova TI. Rio de Janeiro: Ciência Moderna, 2011. 212p.	Fisico
688	0471333417	Trivedi, K. S. Probability & Statistics with Reliability, Queueing, and Computer Science Applications. JohnWilley, 2002.	Fisico
689	9788532636904	VON BERTALANFFY, L. Teoria Geral dos Sistemas. Vozes, 2008.	Fisico
631	9783642290442	WOHLIN, C., RUNESON, P., HÖST, M., OHLSSON, M. C., REGNELL, B., ; WESSLÉN, A. . Experimentation in software engineering. Springer Science & Business Media, 2012.	Físico
653	9781420068429	KANG, K. C.; SUGUMARAN, V.;PARK, S. Applied software product line engineering. Boca Raton, Florida: CRC Press,2010	Físico
670	9780470746639	MOREIRA, Mario E. Adapting configuration management for agile teams: balancing sustainability and speed. New York: John Wiley & Sons, 2009	Físico
661	9780131829572	SHAW, Mary; GARLAN, David. Software architecture: perspectives on an emerging discipline. São Paulo: Prentice Hall. 1996. 242p	Físico
662	9780470167748	TAYLOR, R. N.; MEDVIDOVIC, N. ; DASHOFTY, E. M. Software architecture: Foundations, Theory, and Practice. Wiley, 2009. 750p	Físico
672	9780818677380	THAYER, Richard H. ; DORFMAN, M. ; BAILIN, Sidney C. Software requirements engineering. 2. ed. Los Alamitos, Calif.: IEEE Computer Society Press, 2000. 483p.	Físico
663	9780136006374	ULLMAN,J.D.;WIDOW,J.First Course in database systems. 3. ed. São Paulo: Prentice Hall, 2007	Físico
652	9789727226665	DELGADO, José; RIBEIRO, Carlos. Arquitetura de computadores. 4. ed. rev. atual. Lisboa: FCA, 2010	Físico
728	9788576081883	ODOM, W. CCNA I CND2-Guia oficial de certificação do exame. 2ed. STARLIN ALTA, CONSULT,2008.	Físico
666	999999588	KITCHENHAM, B. Procedures for Performing Systematic Reviews. Australia: Joint Technical Report Keele University/NICTA Technical/Keele University/ NICTA, 2004	Virtual
665	999999587	Travassos, G. et. al. Introdução a Engenharia de Software Experimental. Rio de Janeiro: COPPE/UFRJ, 2002. Relatório Técnico ES-590/02	Virtual
805	0131877151	Richard A. Johnson, Dean W. Wichern. Applied Multivariate Statistical Analysis (6th Edition, 2007), Pearson	Fisico
722	9780387241524	CHUAH, Moi Choo; ZHANG, Qinqing. Design and perfomance of 3G wirelss networks and wireless lans. New York: 2006	Físico
707	9788574522920	COSTA, Daniel Gouveia. DNS: um guia para administradores de redes. Rio de Janeiro, RJ: Brasport, c2007. xiii, 121p.	Físico
727	9788575022382	FILIPPETTI, Marco Aurélio. CCNA4.1: guia completode estudo exame 640-802). Florianópolis: Visual Books, 2008. 478p.	Físico
729	9788571940192	IDOETA, Ivan Valeije; CAPUANO, Francisco Gabriel. Elementos de eletrônica digital. 40. ed. SãoPaulo: Érica, 2007. 524p.	Físico
720	9788521618645	JOHNSON, T. M. S. M. e Coutinho, M. M. Avaliação de Desempenho de Sistemas Computacionais, 1ªEdição, 2011. Editora LTC.	Físico
719	9780130646347	Mahbub Hassan, Raj Jain. High Performance TCP/IP Networking –Concepts, Issues and Solutions. 2004, Pearson Prentice Hall	Físico
735	9788574523224	MANSUR, Ricardo. Governança de TI: metodologias, frameworks, melhores práticas. Rio de Janeiro: Brasport, 2007. xviii, 200p.	Físico
738	9788599593134	MORIMOTO, Carlos E. Servidores Linux: guiaprático. Porto Alegre: SulEditores, 2010. 735p.	Físico
724	9780071760942	OSBORNE-MCGRAW-HIL, Wireless Network Security, PEARSON, BROCK, 2011	Físico
710	9781118024485	PARKER, S. Shell Scripting Professional: Expert Recipes for Lixux, Bashandmore. John Willey,2011. 	Físico
736	8561024194	SIQUEIRA, Luciano Antonio.C ertificação LPI-1. 3.ed. São Paulo: Linux New Media,2009. 252p. (Coleção LinuxPro)	Físico
737	8561024143	SIQUEIRA, Luciano Antonio. Certificação LPI-2. 2.ed. São Paulo: Linux New Media do Brasil, 2009. 303p. (Coleção LinuxPro)	Físico
746	9788536504346	THOMPSON, M. A. Microsoft Windows Server 2012 - Instalação, Configuração e Administração De Redes. 1a Edição. ÉRICA. 2012.	Físico
730	9788573231731	TORRES, Gabriel. Fundamentos de eletrônica. Rio de Janeiro.: Axcel Books, 2002. 229p.	Físico
743	9780735624214	TULLOCH, M. INTRODUCING WINDOWS SERVER 2008. MICROSOFT PRESS,2007.	Físico
732	9788578730963	ULBRICH, Henrique Cesar. Universidade hacker:exercícios práticos para desvendar os segredos do submundo hacker!.2.ed. São Paulo: Digerati Books,2009. 381p.	Físico
717	9788535202700	COMER, D. Interligação de redes com TCP/IP v.2. 3ed. (vol.2). Campus, 1998	Físico
767	9788522459407	MARTINS, E. Contabilidade de custos. Editora Atlas. 10ª ed. 2010.	Fisico
768	9788522459353	MARTINS, E. Contabilidade de custos - Livro de Exercícios. Editora Atlas. 10ª ed.  2010.	Fisico
766	9999999691	KROETZ, César Eduardo S.. Apostila Contabilidade de Custos. UNIJUI, RS, 2001.  http://apostilas.netsaber.com.br/apostilas/1029.pdf	Virtual
741	9780130322210	STALLINGS, W. High Speed Networks and Internets - Performance and Quality of Service. 2ªedição. Prentice Hall. ISBN: 9780130322210	Físico
747	9788521614043	PETERSON, L. L.; DAVIE, B. S. Redes de Computadores: uma abordagem sistêmica. 2ed. LTC, 2004. ISBN: 9788521614043	Físico
781	0471056693	Pattern Classification, 2nd edition, Wiley- Interscience, 2000. -R.O.Duda, P. E. Hart, D. G. Stork.	Fisico
783	0470853204	WATT, D. A. Programming language design concept. IE-Wiley, 2004.	Fisico
803	9781608454402	Y.C. Tay, Analytical Performance Modeling for Computer Systems, Morgan and Claypool Publishers, 2010 	Fisico
763	8502037226	BRITO, O. Controladoria De Risco-Retorno Em Instituiçoes. Ed. Saraiva, 2002.	Físico
800	9780596155971	LEVINE, J., Flex & Bison: Text Processing Tools. O Reilly Media, 2009.	Físico
765	9788502095106	SARAIVA, E. Licitações e contratos em adminisração pública. 13ª edição. Editora Saraiva, 2010.	Físico
784	9788577808335	Seymour Lipschutz; Marc Lipson; Álgebra Linear; Coleção Schaum; Editora Bookman; 20112;	Físico
790	9788522107353	Valéria Zuma Medeiros, André Machado Caldeira, Luiza Maria Oliveira da Silva e Maria Augusta Soares Machado; PRÉ-CÁLCULO; 2ª edição revista e atualizada, 2010, Editora Cengage	Físico
726	9788571946385	SOARES NETO, V; SILVA, A. P.; BOSCATO JUNIOR, M. TELECOMUNICAÇÕES REDES DE ALTA VELOCIDADE, CABEAMENTO ESTRUTURADO. 3.ed. ÉRICA, 1999. 	Físico
786	9788577803484	TOSCANI, S. S., Implementação de Ling. de Progr. – Compiladores,  1 ed, 2008 Bookman	Físico
822	0123748569	Data Mining: Practical Machine Learning Tools and Techniques, Third Edition (The Morgan Kaufmann Series in Data Management Systems) - Ian H. Witten, Eibe Frank, Mark A. Hall	Fisico
831	8529402022	Algebra Linear; Jose Luiz Boldrini; 3. Edição; Editora Harbra;	Fisico
845	0471503363	Raj Jain, The Art of Computer System Performance Analysis, John Wiley & Sons, 1991	Fisico
847	9781587202834	OPPENHEIMER, P. Top-Down Network Design.  Cisco Press;  2010. 3oedição.	Fisico
950	857123440X	LABORIT, Emmanuelle. O Vôo da Gaivota. Best Seller, 1994.	Físico
832	9780074609446	Alfredo Steinbruch; Introduçao à Algebra Linear; Makron Books Editora; 1990;	Físico
830	9780521780193	An Introduction to Support Vector Machines, Cambridge Univ. Press, 2000. - N. Cristianini and J. Shawe-Taylor	Físico
827	9788521615521	Barbieri Filho, Plinio; Biscolla, Laura M. Da Cunha C. O.; Espinosa, Isabel C. O. N.; Fundamentos de Informática - Álgebra Linear para Computação; Editora LTC;	Físico
825	858863936X	Cálculo,, Thomas, George, Volume-2, B., 11.-Edição, 2008, Editora Addison Wesley Brasil	Físico
804	857780402X	Hair-Joseph F. Hair, Bill Black, Barry Babin, Rolph E. Anderson, Ronald L. Tatham. Análise Multivariada de Dados - 6ª Edição - Anderson Tatham	Físico
785	8540701383	TOSCANI, L. V.; VELOSO, P.A.S. Complexidade de Algoritmos. ISBN: 8540701383	Físico
788	9788429150162	APOSTOL, Tom M. Cálculo 2, Cálculo com Funções de Várias Variáveis e Álgebra. Reverté, 2 ed. 2008. ISBN 9788429150162 	Físico
806	9780262042208	DE SOUZA, Clarisse S. The semiotic engineering of human-computer interaction. Cambridge: Mass. The MIT Press. 2005. ISBN13: 9780262042208	Físico
778	0521779111	TROELSTRA, A. S.; SCHWICHTENBERG, Helmut. Basic proof theory. 2nd ed. New York, NY: Cambridge University, c2000. xii, 417 p. (Cambridge tracts in theoretical computer science ; v. 43) ISBN 05215779111	Físico
779	0982106017	SWEIGART, Al. Invent Your Own Computer Games with Python. 2 ed. Creative Commons licenced. ISBN 0982106017. Disponível para download gratuito em http://inventwithpython.com.	Virtual
856	1558604383	O'NEIL, Patrick. O'NEIL, Elizabeth. Database: Principles, Programming and Performance. 2 ed, Morgan Kaufmann, 2001. ISBN: 1558604383	Físico
731	9788521617914	ENGLANDER, Irv. A Arquitetura de Hardware Computacional, Software de Sistema e Computação e Comunicação em Rede. 4 Edição.  2011. Editora LTC. ISBN: 9788521617914	Físico
799	9788535236996	cormen-LEISERSON, C.E., STEIN, C., RIVEST, R.L.;  CORMEN T.H. Algoritmos: teoria e prática, Editora Campus, 3ª. Edição, 2012. ISBN: 9788535236996	Físico
821	1558609016	Data Mining: Concepts and Techniques, Morgan Kaufmann, 2nd Edition, 2007. - J. Han and M. Kamber.	Físico
842	9788535211481	LOPES, Raquel Vigolvino. Melhores Práticas para Gerência de Redes de Computadores. Campus, Editora Campus, 2003	Físico
818	9788521619031	Fundamentos da Física, Halliday, Resnick, Walker; Volume 1- MECÂNICA; 9.-Edição; 2012; Editora LTC	Físico
816	9780387202488	GRUNE, D.,Jacobs, C., Parsing Techniques: A Practical Guide (Monographs in Computer Science), Springer, 2nd Edition, 2008.	Físico
815	9788585818319	HAMILTON PRADO BUENO; Álgebra Linear; Sociedade Brasileira de Matemática-SBM;	Físico
813	8521613601	HINES, W.W., MONTGOMERY, D.C., GOLDSMAN, D.M., BORROR, C.M. Estatística Aplicada e Probabilidade para Engenheiros. Editora LTC, 2003.	Físico
835	9780763776275	MOZGOVOY, Maxim, Algorithms, Languages, Automata, & Compilers: A Practical Approach, Jones and Bartlett Publishers, Inc., 2009.	Físico
837	9788521617709	PAULA FILHO, W. P. Multimídia: conceitos e aplicações. LTC, 2011.	Físico
838	9788586948121	PRADO, D. Teoria das Filas e da Simulação. 2a. Ed. IDNG, 2004.	Físico
839	9781558606531	Pyle D. (2003) Business Modeling and Data Mining. The Morgan Kaufmann Series in Data Management Systems. Morgan Kaufmann Publisher.	Físico
812	9788573078473	Howard Anton,Chris Rorres; Algebra Linear com Aplicacoes; Editora Bookman 2002;	Físico
810	9788535705492	IEZZI, G. Fundamentos de matemática elementar v.10: Geometria Espacial. 6 ed. Atual, 2005.	Físico
867	1597492728	THEODORIDIS, SERGIOS; KOUTROUMBAS, KONSTANTINOS. PATTERN RECOGNITION. ACADEMIC PRESS. 4a edição, 2008.	Físico
868	0387310738	BISHOP, CHRISTOPHER M. PATTERN RECOGNITION AND MACHINE LEARNING. SPRINGER VERLAG, 2006.	Físico
870	0262018020	MURPHY, KEVIN P. MACHINE LEARNING: A PROBABILISTIC PERSPECTIVE. MIT PRESS, 2012. 	Físico
874	9780201648652	Grama, Ananth and Karypis, George and Kumar, Vipin and Gupta, Anshul; Introduction to Parallel Computing; Second Edition, Editora Addison-Wesley; 	Físico
875	9780123742605	Pacheco, Peter; An Introduction to Parallel Programming; First Edition; Editora Morgan Kaufmann; 	Físico
876	9783642048173	Rauber, Thomas and Rünger Gudula; Parallel Programming: for Multicore and Cluster Systems; First Edition; Editora Springer; 	Físico
877	9780124159921	Kirk, David and Hwu Wen-mei; Programming Massively Parallel Processors A Hands-on Approach; Second Edition; Editora Morgan Kaufmann.	Físico
878	9788574523729	Pitanga, Marcos; Construindo Supercomputadores com Linux; Terceira Edição; Editora Brasport	Físico
879	9780321228116	Mattson, Timothy G. and Sanders Beverly A. and Massingill Berna L.; Patterns for Parallel Programming; First Edition; Editora Addison-Wesley Professional;	Físico
880	9781423901983	Kaminsky, Alan; Building Parallel Programs: SMPs, Clusters & Java; First Edition; Editora Course Technology;	Físico
891	0521527147	Blackburn, P.; de Rijke, Maarten; Venema, Yde, Modal logic, Cambridge University Press, 2002	Físico
892	0792353358	M. Fitting, Richard L. Mendelsohn. First-Order Modal Logic. Springer. 1st ed. 1998 edition	Físico
893	1107010527	Robert Goldblatt. Quantifiers, Propositions and Identity: Admissible Semantics for Quantified Modal and Substructural Logics (Lecture Notes in Logic). Cambridge University Press (August 22, 2011).	Físico
895	9788574524726	DONDA, Daniel. Administração do windows server 2008 R2:server core. xvi, 428 p. Rio de Janeiro: Brasport, 2011.	Físico
896	9788576085140	FREDERICK, Gail Rahn; LAL, Rajesh. Dominando o desenvolvimento web para smartphone:construindo aplicativos baseados em JavaScript, CSS, HTML e Ajax para iPhone, Android, Palm Pre, BlackBerry, Windows Mobile e Nokia S60. 344 p. Rio de Janeiro: Alta Books, 2011.	Físico
897	9788564574168	ASCENCIO, Ana Fernanda Gomes; CAMPOS, Edilene Aparecida Veneruchi de. Fundamentos da programação de computadores:  algoritmos, Pascal, C/C++ e java. x, 569p. 3.ed. São Paulo, SP: Pearson Education do Brasil, 2012.	Físico
898	9788536303611	LIPSCHUTZ, Seymour; LIPSON, Marc. Teoria e problemas de matemática discreta. 511p. (Coleção Schaum) 2. ed.  Porto Alegre, RS: Bookman, 2004.	Físico
900	9788579150432	A REVOLUÇÃO dos monólitos:  pioneirismo e trajetória do desenvolvimento sustentável em Quixadá. 97,[15]p. Fortaleza, CE: LCR, 2010. 	Físico
901	8570564112	DOLCE, Osvaldo; POMPEO, José Nicolau. Fundamentos de matemática elementar, 10:  geometria espacial, posição e métrica.  440 p. 5. ed. São Paulo, SP: Atual, 1993.	Físico
902	853570549X	DOLCE, Osvaldo; POMPEO, José Nicolau.  Fundamentos de matemática elementar 10 : geometria espacial, posição e métrica. 440p. 6.ed. São Paulo, SP: Atual, 2005.	Físico
885	8529400895	BARROSO, CAMPOS FILHO, CARVALHO, MAIA; CALCULO NUMERICO (COM APLICAÇOES); Editora HARBRA, 2a edição.	Físico
862	9781886529199	BERTSIMAS, D., TSITSIKLIS, J.N. Introduction to Linear Optimization. Athena Scientific, 1997. 	Físico
889	9788570568830	CAIO SERGIO CALÇADA, JOSE LUIZ SAMPAIO; Física Clássica; Volume 1-Cinemática; ATUAL EDITORA;	Físico
945	8521615590	COLIN, EMERSON CARLOS. PESQUISA OPERACIONAL - 170 APLICAÇOES EM ESTRATEGIA, FINANÇAS, LOGISTICA, PRODUÇAO, MARKETING E VENDAS. LTC, 2007.	Físico
1148	8572515631	NORTON, Peter; GRIFFITH, Arthur.  Guia completo do Linux.       597 p.         São Paulo: Berkeley, c2000.	Físico
899	9788536501383	TRONCO, Tania Regina. Redes de nova geração: arquitetura de convergência das redes: IP, telefônica e óptica. 164 p.2.ed. São Paulo, SP: Érica, 2011. ISBN: 9788536501383	Físico
858	9788535207491	GARCIA-MOLINA, Hector; WIDOM, Jennifer. Implementação de Sistemas de Bancos de Dados. Campus. 1ª. 2001. ISBN: 9788535207491	Físico
857	9788574521503	COSTA, Rogério Luis C. SQL: Guia Prático. Brasport, 2004. ISBN: 9788574521503	Físico
811	9788515024421	BORTOLOSSI, Humberto. Cálculo diferencial a várias variáveis: uma introdução à teoria de otimização . 5. ed. Rio de Janeiro, RJ: Ed. PUC-Rio; São Paulo, SP: Ed. Loyola, 2011 619 p. + CD ROM (Coleção Matmídia) ISBN 9788515024421 (broch.).	Físico
873	9780471529743	R. Schalkoff. Pattern Recognition: Statistical, Structural and Neural Approaches. John Wiley and Sons, 1992.	Físico
903	8570560478	HAZZAN, Samuel. Fundamentos de matematica elementar, 5: combinatória, probabilidade : 43 exercícios resolvidos, 439 exercícios propostos com resposta, 152 testes de vestibulares com resposta. 174p. 6.ed. Sao Paulo: Atual, 1993	Físico
908	3642084699	Vijay V. Vazirani. Approximation Algorithms. Springer, 2010.	Físico
909	9788507006480	ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS. ABNT NBR ISO/IEC 27002 - Tecnologia da informação - técnicas de segurança - código de prática para a gestão da segurança da informação. RiodeJaneiro, RJ, 2005. 120p. 	Físico
910	9788521617501	SZWARCFITER , Jayme; MARKENZON, Lilian. Estruturas de Dados e Seus Algoritmos. LTC, 3a edição, 2010.	Físico
911	032157351X	SEDGEWICK, Robert, WAYNE, Kevin. Algorithms (4th Edition). Addison-Wesley Professional; 4 edition, 2011.	Físico
912	1468108867	KARUMANCHI, NARASIMHA. DATA STRUCTURES AND ALGORITHMS MADE EASY. CREATESPACE PUB, 2011.	Físico
918	1584505710	Mark DeLoura. Best of Game Programming Gems. Charles River Media. 2008.	Físico
919	1568814135	Jason Gregory, Jeff Lander e Matt Whiting. Game Engine Architecture. A K Peters. 2009.	Físico
920	1848829345	Richard Szeliski. Computer Vision: Algorithms and Applications. Springer, 2010.	Físico
921	1107011795	PRINCE, SIMON J. COMPUTER VISION - MODELS, LEARNING, AND INFERENCE. WILLIAM MORROW, 2012.	Físico
923	1439840458	RUSS, JOHN C. THE IMAGE PROCESSING HANDBOOK. TAYLOR & FRANCIS. 6a edição, 2010.	Físico
932	0136072240	Bruce Croft, Donald Metzler, Trevor Strohman. Search Engines: Information Retrieval in Practice. Addison-Wesley; 1 edition, 2009.	Físico
933	1558603530	SHERMAN, WILLIAM L.; CRAIG, ALAN. UNDERSTANDING VIRTUAL REALITY - INTERFACE, APPLICATION, AND DESIGN. ACADEMIC PRESS, 2002.	Físico
934	1568815808	GOMES, JONAS; VELHO, LUIZ; COSTA SOUSA, MARIO. COMPUTER GRAPHICS - THEORY AND PRACTICE. TAYLOR & FRANCIS USA, 2010.	Físico
936	9788536503745	MANZANO, José Augusto N. G.; COSTA Jr., Roberto Affonso da. Java 7 - Programação de Computadores - Guia Prático de Introdução, Orientação e Desenvolvimento. 1. ed. Editora Érica, 2011.	Físico
937	0486478831	MICHAELSON, Greg. An Introduction to Functional Programming Through Lambda Calculus. Dover Publications, 2011.	Físico
938	0521576814	COUSINEAU, Guy; MAUNY, Michel; CALLAWAY, K. The Functional Approach to Programming. Cambridge University Press; English edition, 1998.	Físico
939	9788575223161	WAMPLER, Dean. Programação Funcional Para Desenvolvedores Java: Ferramentas para Melhor Concorrência, Abstração e Agilidade. Novatec. 1a ed., 2012.	Físico
940	0470643854	PARKER, J. R. ALGORITHMS FOR IMAGE PROCESSING AND COMPUTER VISION. JOHN WILEY. 2a edição, 2010.	Físico
942	013617549X	Ravindra K. Ahuja, Thomas L. Magnanti, James B. Orlin. Network Flows: Theory, Algorithms, and Applications. Prentice Hall; 1 ed. 1993.	Físico
907	9780521835404	MITZENMACHER, Michael; UPFAL, Eli. Probability and computing: randomized algorithms and probabilistic analysis. New York, NY: Cambridge University Press, c2005. xvi, 352 p. 	Físico
890	9788521617105	TIPLER, Paul Allen; MOSCA, Gene. Física para cientistas e engenheiros. 6. ed. Rio de Janeiro, RJ: Livros Técnicos e Científicos, 2009. 3v.	Físico
935	9781118036631	MULLEN, Tony. Prototyping Augmented Reality. Indianapolis, Indiana: John Wiley & Sons, 2011. 246 p. ISBN 9781118036631	Físico
931	1558605703	WITTEN, Ian H; MOFFAT, Alistair; BELL, Timothy C. Managing Gigabytes - Compressing and Indexing Documents And Images. Morgan Kaufmann. 2ª Ed., 1999. ISBN: 1558605703	Físico
318	9780071748469	VAUGHAN, Tay. Multimedia: making it work. New York, NY: McGraw-Hill, 2011. ix 465 p ISBN 9780071748469	Físico
928	9781402003684	GOUBAULT-LARREC, Jean; MACKIE, Ian. Proof theory and automated deduction. (Applied logic series n. 6). Springer, 2011 (Reprint of the original 1st ed. 1997 ed.)  ISBN-10: 1402003684  ISBN-13: 978-1402003684	Físico
927	9783540693185	POHLERS, Wolfram. Proof theory: the first step into impredicativity . Berlin , Heidelberg: Springer, c2009. xiii, 370 p. (Universitext) ISBN 9783540693185	Físico
913	8522106150	SCHUYTEMA, Paul. Design de Games: Uma Abordagem Prática. Cengage. 2008. ISBN 8522106150	Físico
915	158450580X	BRATHWAITE, Brenda; SCHREIBER, Ian. Challenges for Game Designers. Charles River Media. 2008. ISBN 158450580X	Físico
904	8570564392	IEZZI, Gelson; MURAKAMI, Carlos; MACHADO, Nílson José. Fundamentos de matematica elementar, 8: limites, derivadas, noções de integral : 62 exercícios resolvidos, 264 exercícios propostos com resposta, 156 testes de vestibulares com resposta. 5. ed. São Paulo: Atual, 1993. 267 p. ISBN 8570564392 (broch.).	Físico
905	857056046X	IEZZI, Gelson. Fundamentos de matemática elementar: 7 : geometria analítica : 86 exercícios resolvidos, 392 exercícios propostos com resposta, 263 testes de vestibulares com resposta. 4. ed. Portland,Or.: Atual, 1993. 273 p. ISBN 857056046X (broch.).	Físico
946	0471359432	Laurence A. Wolsey, George L. Nemhauser. Integer and Combinatorial Optimization. Wiley-Interscience; 1 edition, 1999.	Físico
947	3642244874	Korte, Bernhard and Vygen, Jens. Combinatorial Optimization: Theory and Algorithms. Springer; 5th ed. 2012 edition (January 10, 2012).	Físico
948	9788531406683	CAPOVILLA, Fernando. C; RAPHAEL, Walkyria. D. Dicionário Enciclopédico Ilustrado Trilingue da Língua de Sinais. 3ª Ed. São Paulo: EDUSP, 2008	Físico
949	8599091018	Felipe, Tanya A.Libras em Contexto : Curso Básico : Livro do Estudante / Tanya A.Felipe. 8ª. edição- Rio de Janeiro : WalPrint Gráfica e Editora,2007.	Físico
951	8536303085	QUADROS, Ronice Muller; KARNOPP, Lodenir B. Língua de Sinais Brasileira: estudos lingüísticos. Porto Alegre: ArtMed, 2004.	Físico
647	9780321685865	AIELLO, R.; SACHS, L. Configuration management best practices: practical methods that work in the real world. Upper Saddle River, NJ: Addison-Wesley, 2011. 229p	Físico
723	9780470741489	ALI, NAJAHABU, LTE, LTE - Advanced And Wimax,JOHN WILEY PROFESSIONAL, 2011	Físico
733	8522440859	BEAL, Adriana. Segurança da informação: princípios e melhores práticas para a proteção dos ativos de informação nas organizações. SãoPaulo: Atlas, 2005. 175p.	Físico
697	8535210458	CHOWDHURY, D. D. PROJETOS AVANÇADOS DE REDES IP: ROTEAMENTO, QUALIDADE DE SERVIÇO E VOZ SOBRE IP. Campus, 2002. 	Físico
177	9788574524061	SERSON, Roberto Rubinstein. A Bíblia: certificação JAVA 6. Rio de Janeiro: Brasport, 2009. V1.	Físico
693	9788574524078	SERSON, Roberto Rubinstein. A Bíblia: certificação JAVA 6. Rio de Janeiro: Brasport, 2009. V2	Físico
646	9780006586371	ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS. ABNT NBR ISO/IEC 27001-Tecnologia da informação - técnicas de segurança-sistemas de gestão de segurança da informação-requisitos.2013.30p	Físico
718	9780137469758	Edward D. Lazowska, John Zahorjan, G. Scott Graham, Kenneth C. Sevcik. Quantitative System Performance Computer System Analysis Using Queueing Network Models, 1984, Editora Prentice Hall	Físico
440	9788577803460	Robert D. Hisrich, Michael P. Peters, Dean A. Shepher. Empreendedorismo. 7. ed. Porto Alegre, RS: Bookman, 2009. 	Físico
139	9788586804960	AGUILAR, Luis Joyanes. Fundamentos de programação: algoritmos, estrutura de dados e objetos. São Paulo, SP: McGraw-Hill, 2008. xxix, 690 p.	Físico
148	9780471684183	THAYER, Richard H.; DORFMAN, M. Software Engineering, Volume 2, the Supporting Processes, 3rd Edition 	Físico
612	020117782X	ZAHRAN, Sami. Software process improvement: practical guide lines for business success. Reading: Addison-Wesley, 1998, 447p. 	Físico
953	9788571647794	SACKS, Oliver. Vendo Vozes: uma viagem ao mundo dos surdos. São Paulo: Cia. Das Letras, 1998.	Físico
954	8573079983	FERNANDES, Eulália. Linguagem e surdez. Porto Alegre. Editora Artmed, 2003	Físico
955	9788528200690	FERREIRA-BRITO, Lucinda. Por uma Gramática da Língua de Sinais. Rio de Janeiro: Tempo Brasileiro, 1995.	Físico
956	9788530802363	GOES, Maria Cecília Rafael; SMOLKA, Ana Luiza B. A linguagem e o outro no espaço escolar: Vygotsky e a construção do conhecimento. Campinas: Papirus, 1993.	Físico
957	9788585689339	GOLDFELD, Marcia. A Criança Surda: linguagem e cognição numa perspectiva sócio-interacionista. São Paulo: Plexus, 1997.	Físico
958	9788585274634	LACERDA, Cristina Broglia. GOES, Cecília Rafael de. Surdez: processos educativos e subjetividade. São Paulo: LOVISE, 2000	Físico
959	9789728407926	LANE, Harlan. A máscara da benevolência : comunidade surda amordaçada. Lisboa: Instituto PIAGET, 1997.	Físico
960	9788587635532	LIMA-SALLES, Heloisa Maria Moreira (org). Bilinguismo dos surdos: questões lingüísticas e educacionais. Goiania: Cânone Editorial, 2007	Físico
961	9788573072655	QUADROS, Ronice Muller de. Educação de surdos: a aquisição da linguagem. Porto Alegre: Artes Médicas, 1997	Físico
962	026251298X	DYBVIG, R. Kent. The Scheme Programming Language, MIT Press; fourth edition, 2009.	Físico
963	1933988924	PETRICEK, Tomas; SKEET, Jon. Real-World Functional Programming: With Examples in F# and C#. Manning Publications; 2010.	Físico
964	1449394701	EMERICK, Chas; CARPER, Brian; GRAND, Christophe. Clojure Programming. O Reilly Media; 1 edition, 2011.	Físico
965	1593272839	LIPOVACA, Miran. Learn You a Haskell for Great Good!: A Beginner s Guide. O Reilly; 1 edition, 2011	Físico
967	1449314651	Gary Bradski, Adrian Kaehler. Learning OpenCV: Computer Vision in C++ with the OpenCV Library. O Reilly Media; Second Edition, 2012.	Físico
869	9780387848570	HASTIE, TREVOR; TIBSHIRANI, ROBERT; FRIEDMAN, JEROME. The Elements of Statistical Learning: Data Mining, Inference, and Prediction Springer. 2a edição, 2008.	Físico
712	9788574524405	NEVES, Julio Cezar. Programação SHELL LINUX. 8. ed. Rio de Janeiro, RJ: Brasport, 2010. xxxix, 549p. + 1 CD-ROM ISBN 9788574524405 (broch.).	Físico
396	8529400941	LEITHOLD, Louis. O Cálculo com geometria analítica. 3. ed. São Paulo: Harbra, c1994. 2 v. ISBN 8529400941. volume 1.	Físico
966	8529402065	LEITHOLD, Louis. O Cálculo com Geometria Analítica. 3. ed. Editora Harbra,1994. ISBN: 8529402065. Volume 2. 	Físico
316	8524402008	GOMES, Jonas de Miranda; VELHO, Luiz. Fundamentos de computação gráfica. Rio de Janeiro, RJ: IMPA, 2008 603 p. ISBN: 8524402008	Físico
191	9788577260447	TUCKER, Allen B. |; NOONAN, Robert. Linguagens de programação: princípios e paradigmas. São Paulo, SP: McGraw-Hill, 2009. xxi, 599 p.	Físico
116	9788576082675	MARTIN, Robert C. Código limpo: habilidades práticas do Agile Software . Rio de Janeiro: Alta Books, 2011. xxi, 413 p.	Físico
19	9788522104994	SIPSER, Michael. Introdução à teoria da computação. São Paulo, SP: Cengage Learning, 2007. xxi, 459 p	Físico
970	8534602042	RUGGIERO, Marcia A. Gomes; LOPES, Vera Lucia da Rocha. Cálculo númerico:   aspectos teóricos e computacionais . xvi, 406 p.     2. ed.	Físico
972	9788522447077	CORRAR, Luiz J; PAULO, Edilson; DIAS FILHO, José Maria (Cord.) FUNDAÇÃO INSTITUTO DE PESQUISAS CONTÁBEIS, ATUARIAIS E FINANCEIRAS. Análise multivariada:   para os cursos de administração, ciências contábeis e economia . xxiv, 541 p.     	Físico
978	8532631967	DEMO, Pedro. Auto-ajuda:   uma sociologia da ingenuidade como condição humana . 126 p.     	Físico
979	978522475483	REZENDE, Denis Alcides; Abreu (Professora). Tecnologia da informação aplicada a sistemas de informação empresariais:   o papel estratégico da informação e dos sistemas de informação nas empresas. xxv, 345 p.     9. ed. rev. e amp.	Físico
980	9788582600535	COULOURIS, George F.; DOLLIMORE, Jean; KINDBERG, Tim; BLAIR, Gordon. Sistemas distribuídos:   conceitos e projeto. xvi, 1048 p.     5. ed.	Físico
981	9788581486777	KUROSE, James F.; ROSS, Keith W. Redes de computadores e a Internet:   uma abordagem top-down. xxii, 634 p.     6. ed.	Físico
983	9788573937077	PINHEIRO, Carlos André Reis. Inteligência analítica:   mineração de dados e descoberta de conhecimento . xxiv, 397 p.     	Físico
984	9788573937619	TAN, Pang-Ning; STEINBACH, Michael; KUMAR, Vipin. Introdução ao DATAMINING: mineração de dados :  Pang- Ning Tan; Michel Steinbach; Vipin Kumar. xxi, 900 p.     	Físico
987	9788574168364	WILLIAMS, Robin; MENEZES, Bárbara. Design para quem não é designer:   princípios de design e tipografia para inciantes. 215 p.     4. ed.	Físico
996	978853650471	MANZANO, José Augusto N. G. Programação de computadores com C++:   guia prático de orientação e desenvolvimento. 318 p.     2. ed.	Físico
997	9788581430850	SOBRAL, Filipe; PECI, Alketa. Administração:   teoria e prática no contexto brasileiro . 611 p.     2. ed.	Físico
998	9788535237016	RUSSELL, Stuart J. |q (Stuart Jonathan), |d 1962-; NORVIG, Peter, |d 1956-. Inteligência artificial.   988 p.     	Físico
1000	8521605641	SANTOS, Nathan Moreira dos. Vetores e matrizes.   xiv, 188, [1] p.     3. ed. rev. e ampl.	Físico
1003	8590269213	BARRETO, José Anchieta de Esmeraldo; MOREIRA, Rui Verlaine Oliveira. A vigilância de argos:   filosofia, ações de enfermagem e cuidado humano . 200 p.  (Coleção  Alagadiço Novo).   	Físico
1004	8575360086	FREITAS, Newton. Dicionário oboé de finanças.   212p.     6. ed. rev. e ampl.	Físico
1006	853570552X	DOLCE, Osvaldo; POMPEO, José Nicolau. Fundamentos de matemática elementar:   9: geometria plana. 455 p.     8. ed.	Físico
1008	8521904428	KOSÍK, Karel. Dialética do concreto.   250 p. ;   7.ed.	Físico
1011	853362137X	PASSWORD  K dictionaries:.   english dictionary for speakers of Portuguese. 783 p.     3. ed.	Físico
1012	9788572823647	CARVALHO, Gilmar de. Patativa em sol maior:   treze ensaios sobre o poeta pássaro. 192 p.     	Físico
1107	0435273418	LEROUX, Gaston.  The phantom of the opera.       63 p.   (Oxford bookworms library ; stage 1).      Oxford, England: Heinemann, 1998.	Físico
993	9788580551181	HILLIER, Frederick S.; LIEBERMAN, Gerald J. Introdução à pesquisa operacional. 9. ed. Porto Alegre: AMGH, 2013. 1005 p. ISBN 9788580551181	Físico
982	9788535716801	IEZZI, Gelson; MURAKAMI, Carlos. Fundamentos de matemática elementar:   1, conjuntos, funções. 410 p.  9.ed. ISBN: 9788535716801	Físico
989	9788535717563	IEZZI, Gelson; MURAKAMI, Carlos; MACHADO, Nílson José. Fundamentos de matemática elementar: 8 : limites, derivadas, noções de integral . 7. ed. São Paulo: Atual, 2013. 280 p. ISBN 9788535717563 (broch.) .	Físico
986	9788535716849	IEZZI, Gelson. Fundamentos de matemática elementar: 3 : trigonometria . 9. ed. São Paulo, SP: Atual, 2013. 311 p. ISBN 9788535716849	Físico
1007	8535211853	TANENBAUM, Andrew S. Redes de computadores. Rio de Janeiro: 4. ed. Elsevier: Campus, c2003. xx, 945 p. ISBN 8535211853	Físico
995	9788535257168	GOLDBARG, Marco Cesar; GOLDBARG, Elizabeth. Grafos: conceitos, algoritmos e aplicações. Rio de Janeiro, RJ: Elsevier, 2012. 622 p. ISBN 9788535257168   	Físico
1002	8534610738	KORTH, Henry F.; SILBERSCHATZ, Abraham. Sistema de banco de dados. [3. ed.]. Sao Paulo: Makron Books do Brasil, c1999. ISBN 8534610738	Físico
1009	852204816	STAIR, Ralph M.; REYNOLDS, George Walter. Princípios de sistemas de informação: uma abordagem gerencial . São paulo: Cengage Learning, 2008. xxvi, 646 p. : ISBN 852204816	Físico
988	9788535717525	IEZZI, Gelson. Fundamentos de matemática elementar, 6: complexos, polinômios, equações . 8. ed. São Paulo, SP: Atual, 2013. 250 p. ISBN 9788535717525 (broch.) .	Físico
1010	8522104220	LOUDEN, Kenneth C. Compiladores: princípios e práticas . São Paulo, SP: Thomson, c2004. xiv, 569 p. ISBN 8522104220 (broch.). [5ex]	Físico
990	9788535715521	CALÇADA, Caio Sérgio; SAMPAIO, José Luiz. Física Clássica: mecânica, v.1. 1. ed. São Paulo, SP: Atual, 2012. 576 p. + 1 CD ROM ISBN 9788535715521 (broch.).	Físico
999	9788574525938	NEVES, Julio Cezar. Programação SHELL LINUX. 9. ed. Rio de Janeiro, RJ: Brasport, 2013. xli, 559 p. + 1 CD-ROM ISBN 9788574525938 (broch.).	Físico
985	9788535717501	HAZZAN, Samuel. Fundamentos de matemática elementar: 5 : combinatória, probabilidade . 8. ed. São Paulo, SP: Atual, 2013. 203 p. ISBN 9788535717501 (broch.).	Físico
1005	8535704574	IEZZI, Gelson. Fundamentos de matemática elementar: 3 : trigonometria . 8. ed. São Paulo, SP: Atual, 2004. 312 p. ISBN 8535704574	Físico
992	9788521206804	BOAVENTURA NETTO, Paulo Oswaldo. Grafos: teoria, modelos, algoritmos. 5. ed. rev. e ampl. São Paulo: Edgard Blücher, c2012. xiii, 310 p. ISBN 9788521206804	Físico
1015	9788576082101	BEIGHLEY, Lynn. Use a cabeça SQL.   xxxiv, 454 p.  (Use a cabeça)   	Físico
1019	9788575221068	MAGALHÃES, Ivan Luizio. Gerenciamento de serviços de TI na prática:   uma abordagem com base na ITIL : inclui ISO/IEC 20.000 e IT Flex. 667 p.  (Gerenciamento de TI)   	Físico
1020	9788576311645	CONGRESSO INTERNACIONAL SOFTWARE LIVRE E GOVERNO ELETRÔNICO 2, 2009, Brasília. Artigos CONSEGI 2009:   o compartilhamento promove o desenvolvimento. 172 p.     	Físico
1021	9788576312932	CONGRESSO INTERNACIONAL SOFTWARE LIVRE E GOVERNO ELETRÔNICO 4, 2011, Brasília. CONSEGI 2011:   dados abertos para a democracia digital. 80 p.     	Físico
1022	9788576312413	CONGRESSO INTERNACIONAL SOFTWARE LIVRE E GOVERNO ELETRÔNICO 3, 2010, Brasília. Amãpytuna computação em nuvem:   serviços livres para a sociedade do conhecimento. 171 p.     	Físico
1023	9788572824460	TRIBUNA de vozes.  531 p.  (Coleção Diálogos Intempestivos, 102).   	Físico
1024	9788586368684	KURY, Adriano da Gama. Para falar e escrever melhor o português\n.   222 p.     2. ed. rev. e atual.	Físico
1025	9788588041028	FRONTIN, Sergio de Oliveira. Prospecção e hierarquização de inovações tecnológicas aplicadas a linhas de transmissão.   366 p.     	Físico
1029	978052189957	HARRISON, John. Handbook of practical logic and automated reasoning.   xix, 681p.     	Físico
1031	852622042X	Homero; LACERDA, Roberto. Odisséia.   88 p.  (Reencontro.)   	Físico
1032	9788522509874	GOMES, Roberto  (Org). A gestão do sistema de transmissão do Brasil.   431 p.     	Físico
1034	8536301236	DEITEL, Harvey M.; DEITEL, Paul J. Java:   como programar. xxi, 1386 p. + 1 CD-ROM     4. ed.	Físico
1035	8574131776	HATCH, Brian; KURTZ, George; LEE, James. Segurança contra hackers:   linux segredos e soluções para segurança linux. 743 p.     2 ed.	Físico
1036	8573232323	RIBEIRO, Uirá. Certificação Linux.   517 p.     	Físico
1037	8575421042	ADAMS, Douglas. O guia do mochileiro das galáxias:   não deixe a Terra sem ele . 204, [4] p.  (O mochileiro das galáxias ; 1)   	Físico
1042	9788501050069	SINGH, Simon. O ultimo teorema de Fermat:   a historia do enigma que confundiu as maiores mentes do mundo durante 358 anos. 324p.     20. ed.	Físico
1045	9788532641427	TOURAINE, Alain. Após a crise:   a decomposição da vida social e o surgimento de atores não sociais.. 213 p.     	Físico
1046	9788577530878	BOBBIO, Norberto. O futuro da democracia.   207 p.  (Pensamento crítico ; 63)   	Físico
1047	9788524915512	MEKSENAS, Paulo. Sociologia.   160 p.  (Magisterio 2. grau. Serie formacao geral)   3.ed.	Físico
1048	8589186121	OLIVEIRA, Luiz Fernandes de; COSTA, Ricardo Cesar Rocha da. Sociologia:   o conhecimento humano para jovens do ensino técnico-profissionalizante. 228 p.     	Físico
1049	9788502173026	CÉSPEDES, Livia; CURIA, Luiz Roberto; NICOLETTI, Juliana. Licitações e contratos da administração pública:   Lei n. 8.666, de 21 de junho de 1993.. XVIII,328 p.  (Coleção Saraiva de Legislação)   14 ed.	Físico
1050	9788588070158	SANTOS, Jocélio Teles dos. Cotas nas universidades:   análises dos processos de decisão. 284 p.     	Físico
1051	8575422103	HUNTER, James C. Como se tornar um líder servidor:   os princípios de liderança de O monge e o executivo. 136 p.     	Físico
1052	9788576314431	(VI 2013, Brasília, Brasil). CONSEGI 2013:   IV Congresso Internacional Software Livre e Comércio Eletrônico. 90 p.     	Físico
1053	9788573071627	DIDÁTICA da matematica: reflexoes psicopedagogicas . vi, 258 p.     	Físico
1054	9788522454587	MEDEIROS, João Bosco. Português instrumental.   xiii, 442 p.     8. ed.	Físico
1055	9788526270800	RIBEIRO, Jackson. Matemática:   ciência e linguagem. 440p.     	Físico
1056	8526230433	GONÇALVES FILHO, Aurélio; TOSCANO, Carlos. Física e realidade:   volume 2: física térmica e óptica. 367 p.     	Físico
1057	8526230417	GONÇALVES FILHO, Aurélio; TOSCANO, Carlos. Física e realidade:   volume 1: mecânica. 367 p.     	Físico
1058	9788532275004	BONJORNO, José Roberto; BONJORNO, Regina de Fátima Souza Azenha; BONJORNO, Valter; RAMOS, Clinton Marciso; ALVES, Luís Augusto. Física:   mecânica: ensino médio: volume 1. 480 p.     	Físico
1040	9788535217537	BLAHA, Michael; RUMBAUGH, James. Modelagem e projetos baseados em objetos com UML 2. 2.ed. rev. e atual. Rio de Janeiro, RJ: Campus; Elsevier, 2006. xvii, 496 p. ISBN 9788535217537	Físico
1028	9780123850591	PETERSON, Larry L.; DAVIE, Bruce S. Computer networks: a systems approach . 5th ed. Amesterdam: Elsevier, c2012. xxxi, 884 p. ISBN 9780123850591	Físico
1027	0333966694	MACMILLAN English dictionary for advanced learners of american english. Oxford: MacMillan Education, 2002. xiv, 1658 p. ISBN 0333966694	Físico
1013	9788576050797	OLIVEIRA, Fátima Bayma. Tecnologia da informação e da comunicação: a busca de uma visão ampla e estruturada. São Paulo, SP: Pearson/ Prentice Hall, 2007. 269 p. ISBN 9788576050797	Físico
1044	9781402059681	MOBILE phone programming and its application to wireless networking. Netherlands: Springer, 2007. xxiv, 473 p. ISBN 9781402059681 (enc.).	Físico
1018	8570562675	IEZZI, Gelson; HAZZAN, Samuel. Fundamentos de matemática elementar, 4: seqüências, matrizes, determinantes, sistemas : 43 exercícios resolvidos, 407 exercícios propostos com resposta, 303 testes de vestibulares com resposta. 6. ed. São Paulo, SP: Atual, 1993. 232 p. ISBN 8570562675 (broch.).	Físico
1038	8574131407	JANDL JÚNIOR, Peter. Mais Java. São Paulo: Futura, 2003. vii, 635p. ISBN 8574131407.	Físico
1041	9788502182066	RIBEIRO, Osni Moura. Contabilidade geral fácil. 8. ed. São Paulo, SP: Saraiva, 2012. xvi, 547 p. ISBN 9788502182066 (broch.).	Físico
1039	9788536504520	VAZQUEZ, Carlos Eduardo; SIMÕES, Guilherme Siqueira.; ALBERT, Renato Machado. Análise de pontos de função: medição, estimativas e gerenciamento de projetos de software . 10. ed.rev. e ampl. São Paulo, SP: Érica, 2013. 272p. ISBN 9788536504520 (broch.).	Físico
1043	9780735663398	WILSON, Ed. Microsoft Windows PowerShell 3.0: step by step. Sebastopol, Ca: Microsoft Press, 2013. xxv, 666 p. ISBN 9780735663398 (broch.).	Físico
1016	852130403X	ALENCAR FILHO, Edgard de. Iniciação à lógica matemática. São Paulo: Nobel, [2002]. 203 p. ISBN 852130403X (broch).	Físico
1030	9780007853892	COLLINS Dicionario: inglês-português, português-inglês. 6rd ed. Glasgow: Collins, 2009. xxix, 607p. ISBN 9780007853892 (broch.).	Físico
1059	9788532275011	BONJORNO, José Roberto; BONJORNO, Regina de Fátima Souza Azenha; BONJORNO, Valter; RAMOS, Clinton Marciso; ALVES, Luís Augusto. Física:   termologia, óptica, ondulatória: ensino médio: volume 2. 416 p.     	Físico
1060	9788532275028	BONJORNO, José Roberto; BONJORNO, Regina de Fátima Souza Azenha; BONJORNO, Valter; RAMOS, Clinton Marciso; ALVES, Luís Augusto. Física:   eletromagnetismo, física moderna: ensino médio: volume 3. 480 p.     	Físico
1061	852623045x	GONÇALVES FILHO, Aurélio; TOSCANO, Carlos. Física e realidade:   volume 3: eletricidade e magnetismo. 384 p.     	Físico
1062	9788563630254	SAADE, Débora Cristina Muchaluat; CARRANO, Ricardo Campanha; SILVA, Edelberto Franco. Eduroam:   acesso sem fio seguro para Comunidade Acadêmica Federada. xii, 144 p.     	Físico
1063	9788563630285	MALUF, Thiago; ROBERTSON, Alex Galhano. Serviço fone@RNP.   xiv, 212 p.     	Físico
1064	9788532251695	BONJORNO, José Roberto. Física:   história e cotidiano: volume 1: mecânica. 488 p.     	Físico
1065	9788532274908	AMARAL, Emilia. Lígua portuguesa:   novas palavras: volume 1: ensino médio. 496 p.     	Físico
1066	9788576760405	FERRARI, Amaury. Matemática faz sentido:   E. 293 p.     	Físico
1067	9788526256460	TERRA, Ernani; DE NICOLA, Jose. Português:   de olho no mundo do trabalho : volume único para o ensino médio. 568 p.     	Físico
1068	8532251889	PEREIRA, Helena B. C.; PELACHIN, Marcia Maisa. Português:    na trama do texto. 590 p.     	Físico
1070	9783319030678	LATIN AMERICAN CONFERENCE London. 2013, VI. Anais ... 155p.  (LNCS 8278).   	Físico
1071	9788588661431	SANTOS, Luis Sérgio. Rui Facó [uma biografia]:   o homem e sua missão. 367 p  ((Coleção Biografias INESP)).   	Físico
1072	9788572825856	SANTOS, Alice Nayara dos; RÓGERIO, Pedro  (Org). Currículo:   diálogos possíveis. 426 p.  (Diálogos Intempestivos ; n. 158).   	Físico
1073	8574131563	TAYLOR, Art; BUEGE, Brian; LAYMAN, Randy. Segurança contra hackers J2EE e Java.   xxv, 456 p.     	Físico
1074	9780596514013	DAVIS, Michele E.; PHILLIPS, Jon A. Learning PHP and MySQL.   xiii, 411 p.     2nd ed.	Físico
1075	9780596005252	MEYER, Eric A. Cascading style sheets:   the definitive guide. xviii, 507 p.     2nd ed.	Físico
1076	9780975841983	ANDREW, Rachel. The CSS anthology:   101 essential tips, tricks & hacks. xxi, 392 p.     2nd ed.	Físico
1077	9788572825986	DIÓGENES, Juliana. IJF:   histórias despercebidas de um hospital . 265 p.     	Físico
1078	9788576692881	MEMÓRIAS da Sociedade Brasileira de Computação.  xi, 154 p.     	Físico
1079	9788576081371	MAHEMOFF, Michael. Padrões de projetos Ajax:   criando sites Web 2.0 com padrões de usabilidade e programação . 490 p.     	Físico
1080	9788589573399	AVALIAÇÃO educacional: sentidos e finalidades. 299 p.     	Físico
1081	9788572825979	BOSI, Isabela Magalhães. Bar do Anísio:   casa de liberdades. 151 p.     	Físico
1082	8575291955	MATOS, Elvis. Paulo Abel.   91 p.  (Coleção terra bárbara).   	Físico
1083	9788567896014	MERCADO de valores mobiliários brasileiro.  370 p.     3. ed.	Físico
1084	9788576083450	FLYNN, Sean Masaki. Economia para leigos.   351 p.     	Físico
1085	0486408817	CLASSIC mystery stories.  209 p.  (Dover thrift editions).   	Físico
1086	9788560370030	BIENAL BRASILEIRA DE DESIGN 2008. 2. II Bienal Brasileira de Design.   248 p.     	Físico
1090	9780553573404	MARTIN, George R. R.  A game of thrones.       835 p.   (A song of ice and fire ; 1).      New York, NY: Bantam Books, 2011.	Físico
1091	9780553582024	MARTIN, George R. R.  A game of thrones:     a feast for crows.   1053 p.   (A song of ice and fire ; 4).      New York, NY: Bantam Books, 2011.	Físico
1092	9780553579901	MARTIN, George R. R.  A game of thrones:     a clash of kings.   1030 p.   (A song of ice and fire; 2).      New York, NY: Bantam Books, 2011.	Físico
1094	97805535841121	MARTIN, George R. R.  A game of thrones:     a dance with gragons.   1112 p.   (A song of ice and fire ; 5).      New York, NY: Bantam Books, 2011.	Físico
1095	0074606476	SCHILDT , Herbert.  Turbo C++:     guia do usuario .   592p.    Sao Paulo: Makron Books: 1992. McGraw-Hill,.	Físico
1096	8585840390	VIANA, Mateus Mosca.  Fundamentos da informática para universitários.       236p.         Rio de Janeiro: Brasport, c1996.	Físico
1097	8572820396	VIANA, Gerardo Valdisio Rodrigues.  Meta-heuristicas e programacao paralela em otimizacao combinatoria.       250p.      Fortaleza: Edições UFC, 1998.	Físico
1098	852300291X	FERNANDES,Ana maria.  A construção da ciência no Brasil e a SBPC :    Ana Maria Fernandes ; traduzido por Marcos Bagno.   292 p.         Brasília: Editora Universidade de Brasília, 1990.	Físico
1099	8571393028	CUNHA, Luiz Antonio.  O ensino de oficios artesanais e manufatureiros no Brasil escravocrata.       190p.   (Politica publica de trabalho e renda;v.5)   Sao Paulo: UNESP; c2000. Brasilia, DF: FLACSO,	Físico
1100	8503001772	HOLANDA, Sérgio Buarque de.  Raizes do Brasil.       liv, 158p.   ((Coleção documentos brasileiros; v.1)).    20.ed.  Rio de Janeiro: J. Olympio, 1988.	Físico
1101	8574851086	FREIRE, Fátima de Souza.  Gestão universitária:     integrando aprendizagem e conhecimento na UFC.   255 p.         Fortaleza, CE: Imprensa Universitária da UFC, 2006.	Físico
1102	0130906735	MENASCÉ, Daniel A.  Performance by design:     computer capacity planning by example.   xiv, 462 p.         Upper Saddle River, N. J.: Prentice Hall PTR, c2004.	Físico
1103	8522102910	SCHEINERMAN, Edward R.  Matemática discreta:     uma introdução .   xxiv, 532 p         São Paulo, SP: Thomson, 2003.	Físico
1104	8587918362	ASCENCIO, Ana Fernanda Gomes; CAMPOS, Edilene Aparecida Veneruchi de.  Fundamentos da programação de computadores:     algoritmos, Pascal, C/C++ .   xviii, 355 p.         São Paulo, SP: Prentice Hall, 2007.	Físico
1105	9788524106352	WEBER, Raul Fernando.  Fundamentos de arquitetura de computadores.       306 p.   (Livros didáticos. n.8).    3.ed.  Porto Alegre: Sagra Luzzato, 2004.	Físico
1106	8506041252	POLITO, André Guilherme.  Michaelis dicionário escolar:     italiano-português português-italiano.   766 p. ;      São Paulo: Melhoramentos, 2003.	Físico
1069	9788575223444	LECHETA, Ricardo R. Google android: aprenda a criar aplicações para dispositivos móveis com o Android SDK. 3. ed. São Paulo, SP: Novatec, 2013. 824 p. ISBN 9788575223444	Físico
1108	8570560532	MACHADO, Antonio dos Santos.  Áreas e volumes.       276 p.   (Matemática : temas e metas, 4).      São Paulo, SP: Atual, 1988.	Físico
1111	9788575638460	ARRUDA, João; PELOGGIO, Marcelo Almeida.  Bibliografia comentada das obras ativa e passiva de José de Alencar.       240 p.         Fortaleza, CE: Fundacao Cearense de Pesquisa e Cultura, 2011.	Físico
1112	9788575633694	SILVA, Regina Cláudia Oliveira da.  O culto da saudade na Casa de Eudoro Corrêa.       150 p.         Fortaleza, CE: Expressão Gráfica, 2009.	Físico
1114	9788572825207	CAVALCANTE, Maria Juraci Maia.  Historia da educação:     republica, escola e religiao.   671p.         Fortaleza, CE: Edições UFC, 2012.	Físico
1115	9788576054016	GONZALEZ, Rafael C.; WOODS, Richard E.  Processamento digital de imagens.       xv,624 p.       3. ed.  São Paulo, SP: Pearson Education do Brasil, 2010.	Físico
1117	0582096774	TWAIN, Mark.  The adventures of Tom Sawyer.       119p.         London: Longman Group, 1994.	Físico
1118	9788572825184	VASCONCELOS, Raquel Célia Silva de; CHAGAS, Eduardo Ferreira; JOVINO, Wildiana Kátia Monteiro; RECH, Hildemar Luiz  (Orgs.).  Indivíduo e educação na crise do capitalismo.       481 p.         Fortaleza: Edições UFC, 2012.	Físico
1119	9788572825160	ARAGÃO, Cleudene.  Rachel de Queiroz e Xosé Neira Vilas:     vidas feitas de terras e palavras.   241 p.         Fortaleza, CE: Edições UFC, 2012.	Físico
1120	9788576058816	ASCENCIO, Ana Fernanda Gomes; ARAÚJO, Graziela Santos de.  Estrutura de dados:     algoritmos, análise da complexidade e implementações em Java e C/C+.   xii, 432 p.         São Paulo: Pearson, 2011.	Físico
1121	9788572825580	GARCIA PASCUAL, Jesus.  Universidade:     fábrica de sonhos e celeiro de decepções?   236 p.         Fortaleza, CE: Edições UFC, 2012.	Físico
1122	9788572825634	VASCONCELOS, Francisco Herbert Lima; SOARES, Swamy de Paula Lima; MARTINS, Cibelle Amorim; AGUIAR, Cefisa Maria Sabin.  Conselho escolar:     processos, mobilização, formação e tecnologia.   370 p.   (Diálogos intempestivos 138).      Fortaleza, CE: Edições UFC, 2013.	Físico
1123	9788575639412	ARARIPE, J.C. Alencar.  A faculdade de medicina e sua ação renovadora.       161 p.       Edição fac-similar.  Fortaleza, CE: Expressão Gráfica, 2012.	Físico
1125	9788581260556	SOUSA FILHO, Antonio de Albuquerque.  Meu percurso na universidade.       237 p.         Fortaleza: Imprece, 2014.	Físico
1126	9788572826112	LEITAO, Vanda Magalhaes; VIANA, Tania Vicente.  ((org.)) UNIVERSIDADE FEDERAL DO CEARA.  Acessibilidade na UFC:     tessituras possíveis.   237 p.         Fortaleza, CE: Edições UFC, 2014.	Físico
1127	043327261	DU MAURIER, Daphne Dame.  Rebecca.       143 p.         Oxford, England: Macmillan Heinemann, 1992.	Físico
1128	9788535255645	COOPER, Keith D.; TORCZON, Linda.  Construindo compiladores.       xxiv, 656 p.       2. ed.  Rio de Janeiro: Elsevier, 2014.	Físico
1130	0521666201	CAMPBELL, Colin.  The lady in white.       80 p.          Cambridge, UK: Cambridge University Press, 1999.	Físico
1131	0582541638	STEVENSON, Robert Louis.  Treasure island.       90 p.   (Longman classics).      London, England: Longman, 1994.	Físico
1132	0582537517	ELIOT, George.  Silas Marner.       91p.         Essex, (England): Longman, 1988.	Físico
1133	058253769x	BENNETT, Susan.  Stranger things have happened and it's not right, is it?      88 p.   (Longman structural readers).      London: Longman, 1972.	Físico
1134	0582402921	LAIRD, Elizabeth.  Dead man's river.       16 p.         Essex, England: Longman, 1999.	Físico
1135	0521798469	LEATHER, Sue.  The big picture.       32 p.   (Cambridge University Press).       Cambridge: Cambridge University Press, 2001.	Físico
1136	8575296189	MACEDO, Roberto.  Made in Ceará:     indústria e cidadania na integração local-global.   629 p.         Fortaleza, CE: Edições Demócrito Rocha, 2014..	Físico
1137	9788567537009	Beto Filho    et al. ().  Franchising:     aprenda com os especialistas = learn from the experts.   408 p.         Rio de Janeiro, RJ: Associação Brasileira de Franchising, 2013..	Físico
1139	853461184x	CANTÚ, Marco.  Dominando o delphi 5:     a bíblia.   xxxii, 860 p.         São Paulo, SP: Makron Books do Brasil, c2000.	Físico
1140	8570564783	MACHADO, Antonio dos Santos.  Trigonometria e progressões.       222 p.   (Matemática : temas e metas, 4).      São Paulo, SP: Atual, 1986.	Físico
1143	857522042X	SAADE, Joel.  Programando em C++.       448 p.         São Paulo: Novatec, 2003.	Físico
1144	9724409694	THIRY, Philippe.  Noções de lógica.       182 p.         Lisboa, Portugual: Edições 70, 1996.	Físico
1145	8575220845	COHEN, Marcelo; MANSSOUR, Isabel Harb.  OpenGL:     uma abordagem prática e objetiva.   478 p.         São Paulo: Novatec, 2006.	Físico
1146	8523200959	LIMA, Arlete Cerqueira.  Lógica e linguagem.       122 p.       2ª ed., rev. e ampl.  Salvador: Centro editorial e didático da UFBA, 1993.	Físico
1147	8571943702	PEREIRA, Silvio do Lago.  Estruturas de dados fundamentais:     conceitos e aplicações .   238 p.       6. ed.  São Paulo: Érica, 2002.	Físico
1142	8527702274	FORTRAN estruturado.     194 p.   (Programação estruturada de computadores).  Rio de Janeiro: Guanabara Koogan, c1992.	Físico
1109	9788572822701	GESTÃO universitária:  avaliação, participação e mudança.   218p.  Fortaleza, CE: Imprensa Universitária da UFC, 2008.	Físico
1110	9788572824699	O ENSINO do jornalismo no Ceará.     196 p.         Fortaleza, CE: Edições UFC, 2011.	Físico
1129	9788560062799	O LIVRO do IETF.     181 p.    São Paulo: Comitê Gestor da Internet no Brasil, 2014.	Físico
1141	85277032917	PASCAL estruturado.     255 p.   (Programação estruturada de computadores).    2. ed.  Rio de Janeiro: Guanabara Koogan, c1995.	Físico
1138	8575220446	FEDELI, Ricardo Daniel; POLLONI, Enrico Giulio Franco; PERES, Fernando Eduardo. Introdução à ciência da computação. São Paulo, SP: Thomson Learning, 2003. xvi, 238 p. ISBN 8575220446 (broch.).	Físico
1113	9788563308337	PRESSMAN, Roger S. Engenharia de software: uma abordagem profissional . 7. ed. Porto Alegre: McGraw-Hill: Bookman: AMGH Ed., 2011. xxviii, 780 p. ISBN 9788563308337 (broch.).	Físico
1149	8589573528	FERNANDEZ, Marcial Porto; CORTÉS, Mariela Inés.  Introdução à computação.       91 p.       2. ed.  Fortaleza: [s. n.], 2010:	Físico
1150	8575220535	SAADE, Joel.  C++:     guia de consulta rápida.   127 p.         São Paulo: Novatec, 2004.	Físico
1151	8575220829	SAADE, Joel.  C++ STL:     guia de consulta rápida.   136 p.         São Paulo: Novatec, 2006.	Físico
1153	8575220608	VEIGA, Roberto G. A.  Comandos do Linux:     guia de consulta rápida.   144 p.         São Paulo: Novatec, 2004.	Físico
1154	9788535277821	WAZLAWICK, Raul Sidnei.  Metodologia de pesquisa para ciência da computação.       146 p.       2. ed. rev. e atual.  Rio de Janeiro, RJ: Campus; Elsevier, 2014.	Físico
1155	9788575221662	SILVA, Maurício Samy.  Criando sites com HTML:     sites de alta qualidade com HTML e CSS .   431 p.         São Paulo: Novatec, 2008.	Físico
1156	857490063X	ALVES, Nilda; GARCIA, Regina Leite.  O sentido da escola.       150 p.       3. ed.  Rio de Janeiro, RJ: DP&A, 2001.	Físico
1157	9789726082484	KURZ, Robert.  Dinheiro sem valor:     linhas gerais para uma transformação da crítica da economia política.   382 p.         Lisboa, Portugal: Antígona, 2014.	Físico
1158	9788575638590	COUTINHO, Fernanda.  Rachel de Queiroz:     paisagens da vida inteira.   63 p.         Fortaleza, CE: Expressão Gráfica e Editora, 2011.	Físico
1160	9788572826396	FERNANDES, Maria Estrela Araujo.  O Curso de Pedagogia da UFC:     uma resenha histórica (1963-1990).   247 p.         Fortaleza: Edições UFC, 2014.	Físico
1162	9788578430542	HEINZ, Flávio M.; HARRES, Marluza M.  A história e seus territórios:     conferências do XXIV Simpósio Nacional de História da ANPUH.   217 p.         Sao Leopoldo, Rs: Oikos, 2008.	Físico
1163	8572325840	DARWIN, Charles.  A origem das espécies.       629p.   (A obra-prima de cada autor ; 23).      São Paulo: Martins Claret, 2004.	Físico
1164	9788575635995	SILVA, Regina Cláudia Oliveira da.  Contando histórias da Terra de Sol.       248p.         Fortaleza: Expressão Gráfica, 2010.	Físico
1166	8575292544	MENEZES NETO, Paulo Elpidio de.  Martins Filho.       142 p.         Fortaleza: Edições Demócrito Rocha, 2004.	Físico
1168	8571647232	GOULD, Stephen Jay.  Dinossauro no palheiro:     reflexões sobre história natural.   567 p.         São Paulo: Companhia das Letras, 1997.	Físico
1169	9789726082507	SCHOLZ, Roswitha.  Homo sacer e os ciganos:     o anticiganismo: reflexões sobre uma variante essencial e por isso esquecida do racismo moderno .   112 p.         Lisboa, Portugual: Antígona, 2014.	Físico
1170	9771128609192	AUGIAS, Corrado.  I segreti di Roma:     storie, luoghi e personaggi di una capitale.   422 p.         Milano, Italy: Mondadori: c2005.	Físico
1171	9788570114389	DUARTE, Paulo de Queiroz.  Sampaio.       326 p.   (Biblioteca do Exército ; 569. Coleção General Benicio ; 259).    2. ed., rev. e ampl.  Rio de Janeiro: Biblioteca do Exército, 2010.	Físico
1172	8533903715	BARRETO, Lima.  Triste fim de Policarpo Quaresma.       63 p.   (Bom livro Clássicos Rideel).      São Paulo: Rideel, 2000.	Físico
1173	9788804583035	AUGIAS, Corrado; CACITTI, Remo.  Inchiesta sul Cristianesimo:     come si costruisce una religione.   276 p.         Milao, Italia: Mondadori, c2008.	Físico
1174	9788804560135	ANGELA, Alberto.  Una giornata nell'antica Roma:     vita quotidiana, segreti e curiosita`.   331 p.   (Ingrandimenti).      Roma: Rai-ERI; Milano: Mondadori, c2007.	Físico
1175	8585775084	SOUSA, Ana Maria Borges de.  Da escola às ruas:     o movimento dos trabalhadores da educação 1988-1992.   189 p.   ((Teses ; ; v. 1)).      Florianópolis: Letras contemporâneas, 1996.	Físico
1176	8571640831	VEYNE, Paul; FEIST, Hildegard.  História da vida privada:     do Império Romano ao Ano Mil.   5 v.   (v. 1).      São Paulo: Companhia das Letras, 1991.	Físico
1177	8571641358	DUBY, Georges; MACHADO, Maria Lucia.  História da vida privada:     da Europa feudal à Renascença.   5 v.   (v. 2).      São Paulo: Companhia das Letras, 1997.	Físico
1178	8571641633	ARIÈS, Philippe; CHARTIER, Roger; FEIST, Hildegard.  História da vida privada:     da Renascença ao Século das Luzes.   5 v.   (v. 3).      São Paulo: Companhia das Letras, 1997.	Físico
1179	8571642001	PERROT, Michelle; BOTTMANN, Denise; JOFFILY, Bernardo.  História da vida privada:     da Revolução Francesa à Primeira Guerra.   5 v.   (v. 4).      São Paulo: Companhia das Letras, 1997.	Físico
1180	8571642400	PROST, Antoine; VINCENT, Gérard; BOTTMANN, Denise.  História da vida privada:     da Primeira Guerra a nossos dias .   5 v.   (v. 5).      São Paulo: Companhia das Letras, 1997.	Físico
1181	9788807815966	SCARPA, Tiziano.  Venezia è un pesce:     una guida.   126 p.   (Universale economica Feltrinelli; 1596).    12. ed.  Milano, Italy: Feltrinelli, 2007.	Físico
1182	857108212x	LOPES, José Leite.  Ciência e liberdade:     escritos sobre ciência e educação no Brasil.   284 p.         Rio de Janeiro: Editora UFRJ, 1998.	Físico
1183	8845910776	SIMENON, Georges; ASCARI, Fabrizio.  Il porto delle nebbie.       182 p.       5. ed.  Milano: Adelphi edizioni, 1994.	Físico
1184	8571803388	FREITAS, Sônia Maria de.  Reminiscências.       328 p.         São Paulo: Maltese, 1993.	Físico
1185	9788563896018	OLIVEIRA, Carla Albuquerque de; MENDES, Maria Elizabete.  Gestão da fase analítica do laboratório:     como assegurar a qualidade na prática .   184 p.   (Como assegurar a qualidade na prática  ; 2).      Rio de Janeiro, RJ: ControlLab, 2011.	Físico
1186	9788578730864	FERREIRA, Silvio.  Segredos do Photoshop CS4.       223 p.         São Paulo: Digerati Books, 2009.	Físico
1187	9780273760597	COULOURIS, George F.  Distributed systems:     concepts and design.   1063 p.       5th ed.  Harlow, England: Pearson/Addison Wesley, 2012.	Físico
1223	9788577802906	WENTWORTH, Stuart M. Eletromagnetismo aplicado: abordagem antecipada das linhas de transmissão . Porto Alegre, RS: Bookman, 2009. xi, 668p.	Físico
1165	9788572826228	ALIMENTOS tradicionais do Nordeste:  Ceará e Piauí.   119 p.         Fortaleza: Edições UFC, 2014.	Físico
1159	9788572826303	DIÁLOGOS em avaliação educacional.     311 p.         Fortaleza: Edições UFC, 2014.	Físico
1161	9788572825917	HISTÓRIA e memória da educação no Ceará.     218 p.         Fortaleza, CE: Edições UFC, 2013.	Físico
1188	9783642063640	POHL, Klaus; BÖCKLE, Günter; LINDEN, Frank van der.  Software product line engineering:     foundations, principles, and techniques.   xxvi, 467 p.         Berlin, Alemanha: Springer-Verlag Berlin Heidelberg, c2010.	Físico
1189	978118031964	MYERS, Glenford J.; BADGETT, Tom; SANDLER, Corey.  The art of software testing.       xi, 240 p.       3rd ed.  Hoboken, NJ: John Wiley & Sons, c2012.	Físico
1190	9788522492459	PADOVEZE, Clóvis Luís.  Sistemas de informações contábeis:     fundamentos e análise.   xiv, 355 p.       7. ed.  São Paulo, SP: Atlas, 2015.	Físico
1191	9788522456215	VALLE, Rogerio; BARBARÁ, Saulo.  Análise e modelagem de processos de negócio:     foco na notação BPMN (Business Process Modeling Notation).   207 p.         São Paulo: Atlas, 2013.	Físico
1192	9780470723371	LAZAR, Jonathan; FENG, Jinjuan Heidi; HOCHHEISER, Harry.  Research methods in human-computer interaction.       xv, 426 p.         Chichester, West Sussex: Wiley, 2010.	Físico
1194	9788543005850	LAUDON, Kenneth C.; LAUDON, Jane Price.  Sistemas de informação gerenciais.       xx, 484 p.       11. ed.  São Paulo: Pearson Education do Brasil, 2014.	Físico
1195	9788535226263	BEZERRA, Eduardo.  Princípios de análise e projeto de sistemas com UML.       xvii, 398 p.       3. ed. rev. e atual.  Rio de Janeiro, RJ: Elsevier: Campus, c2015.	Físico
1196	9788575224182	EQUIPE IPV6.BR.  Laboratório de IPv6:     aprenda na prática usando um emulador de redes.   ix, 398 p.         São Paulo, SP: Novatec, 2015.	Físico
1198	9780321826626	SADALAGE, Pramod J.; FOWLER, Martin.  NoSQL distilled:     a brief guide to the emerging world of polyglot persistence.   xix, 164 p.         Upper Saddle River, NJ: Addison-Wesley, c2013.	Físico
906	9780521474658	MOTWANI, Rajeev. Randomized Algorithms. Cambridge; New York, NY: Cambridge University Press, 2007. xiv, 476 p.	Físico
1200	9788576053705	MORETTIN, Luiz Gonzaga. Estatística básica:: probabilidade e inferência / volume único. São Paulo, SP: Pearson Educational do Brasil. 2010.	Físico
1201	0538735457	POOLE, DAVID. LINEAR ALGEBRA A MODERN INTRODUCTION. CENGAGE LEARNING INT, 2010.	Físico
1203	9780321535863	ANGEL, E. Interactive Computer Graphics: A Top-Down Approach Using OpenGL. Edition: 5th. Published by Addison-Wesley. 2009. 864 pages 	Físico
1204	9780130153906	HEARN, C. D.; BAKER, M. P. Graphics with Opengl. Edition: 3rd. Published by Prentice Hall. 2004.	Físico
1205	0785342399523	HUGHES, John J.; DAM, A. van; McGUIRE, Morgan, SKLAR, David F. FOLEY, James D., FEINER, Steven K, AKELEY, Kurt. Computer Graphics - Principles and Practice. Edition: 3rd. Addison-Wesley, Massachusetts, MASS. 20131996. 1264p.	Físico
802	1584885513	KATZ, Jonathan; LINDELL, Yehuda. Introduction to modern cryptography. Boca Raton: Chapman & Hall/CRC: c2008. xviii, 534 p. (Chapman & Hall/CRC cryptography and network security)	Físico
1206	9788524400439	LEMOS, Manoel. Criptografia, números primos e algoritmos. 2. ed. Rio de Janeiro: Instituto de Matemática Pura e Aplicada, c2009. 72 p. (Publicações matemáticas)	Físico
1207	9780387779942	SILVERMAN, J.H; HOFFSTEIN, Jeffrey; PIPHER, Jill SPRINGERLINK (ONLINE SERVICE). An Introduction to Mathematical Cryptography. Springer eBooks New York, NY: Springer-Verlag New York, 2008. (Undergraduate Texts in Mathematics,)Disponível em: <http://dx.doi.org/10.1007/978-0-387-77993-5>. Acesso em: 21 set. 2010.	Virtual
1208	9781848000018	HIGGINS, Peter M SPRINGERLINK (ONLINE SERVICE). Number Story: From Counting to Cryptography. Springer eBooks London: Springer-Verlag London Limited, 2008.Disponível em: <http://dx.doi.org/10.1007/978-1-84800-001-8>. 	Virtual
1209	9788524401244	COUTINHO, S. C. Números inteiros e criptografia RSA. 2. ed. Rio de Janeiro, RJ: IMPA, c2009. 211 p. (Coleção matemática e aplicações)	Físico
1210	9788521612803	GUIDORIZZI, Hamilton Luiz. Um curso de cálculo. 5. ed. Rio de Janeiro: Livros Técnicos e Científicos, 2002. v. 2	Físico
1212	9788581430867	THOMAS, George Brinton; WEIR, Maurice D.; HASS, Joel. Cálculo. 12. ed. São Paulo, SP: Pearson Education do Brasil, 2012. v. 1	Físico
1213	9788521612599	GUIDORIZZI, Hamilton Luiz. Um curso de cálculo. 5. ed. Rio de Janeiro: Livros Técnicos e Científicos, 2002. v. 1	Físico
887	8587918745	SPERANDIO, Décio; MENDES, João Teixeira; SILVA, Luiz Henry Monken e. Cálculo numérico: características matemáticas e computacionais dos métodos numéricos. São Paulo, SP: Prentice Hall, 2003. ix, 354 p.	Físico
1214	9788522106028	ARENALES, Selma; DAREZZO, Artur. Cálculo numérico: aprendizagem com apoio de software. São Paulo, SP: Cengage Learning, 2008. 364 p	Físico
1215	9788575223383	FOWLER, Martin; SADALAGE, Pramod J. NOSQL Essencial – Um guia conciso para o mundo emergente da persistência poliglota.\tNOVATEC, 1ª ED./2013	Físico
1216	9781937785598	HOGAN, Brian P. HTML5 AND CSS3: Level up with today's web technologies, Pragmatic Bookshelf, 2ª ED./2013	Físico
1217	9788574525686	VERAS, M. Arquitetura de Nuvem - Amazon Web Services (AWS). 1a edição. Brasport, 2013. 	Físico
1218	9788521619055	HALLIDAY, David; RESNICK, Robert; WALKER, Jearl. Fundamentos de Física - Eletromagnetismo. Vol 3. 9a. ed. Rio de Janeiro, RJ: LTC, 2012. 388 p.	Físico
1219	9788580551532	HAYT, William Hart; BUCK, John A. Eletromagnetismo. 8.ed. Porto Alegre, RS: McGraw-Hill, 2013. xviii, 595 p.	Físico
1220	9788540701502	SADIKU, Matthew N. O. Elementos de eletromagnetismo. 5. ed. Porto Alegre, RS: Bookman, 2012. xvi, 704 p.	Físico
1221	9788532806024	BASTOS, JOÃO PEDRO ASSUMPÇÃO.; Eletromagnetismo para Engenharia: Estática e Quase Estática. 3a. ed. Florianópolis, SC: Ed. da UFSC, 2012. 398 p.	Físico
1222	9788521201342	NUSSENZVEIG, H. Moysés. Curso de física básica - Eletromagnetismo. Vol 3.  São Paulo: Blucher, 1997. 336 p.	Físico
1199	852335025	EZRAN, Michel; MORISIO, Maurizio; TULLY, Colin. Practical software reuse. London: Springer-Verlag London, c2002. xxi, 222 p. (Practitioner series). ISBN 852335025 (broch.).	Físico
1033	9788535245356	SILBERSCHATZ, Abraham; KORTH, Henry F.; SUDARSHAN, S. Sistema de banco de dados. Rio de Janeiro: Elsevier: Campus, 2012.  ISBN 9788535245356	Físico
1202	0009999000	Falta título	Físico
1197	9780071766586	THE OFFICIAL GUIDE TO the TOEFL test.     653 p. + 1 CD-ROM       4th ed.  New York: McGraw-Hill, 2012.	Físico
1224	9788126515257	RAMO, Simon; WHINNERY, John R.; VAN DUZER, Theodore. Fields and Waves in Communucation Electronics. 3a. ed.  India: Wiley. 2007.	Físico
1225	9788576051596	NILSSON, JAMES W. CIRCUITOS ELETRICOS. PRENTICE HALL BRASIL. 8 EDIÇÃO. 2008 	Físico
1226	9788536305516	EDMINISTER, JOSEPH A. CIRCUITOS ELETRICOS. BOOKMAN COMPANHIA ED. 2 Edição. 2011.	Físico
1227	9788564574205	BOYLESTAD, ROBERT L. INTRODUÇAO A ANALISE DE CIRCUITOS. PEARSON BRASIL. 12 Edição. 2012.	Físico
1228	9788580551723	ALEXANDER, CHARLES; SADIKU, MATTHEW N. O. FUNDAMENTOS DE CIRCUITOS ELÉTRICOS. MCGRAWHILL/BOOKMAN. 5 EDIÇÃO. 2013.	Físico
1229	9788521621164	SVOBODA, JAMES A.; DORF, RICHARD. INTRODUÇAO AOS CIRCUITOS ELETRICOS. LTC. 8 Edição. 2012.	Físico
1230	9788577260218	HAYT JUNIOR, WILLIAM H. ANALISE DE CIRCUITOS DE ENGENHARIA. MCGRAW HILL - ARTMED. 7 Edição. 2008.	Físico
1231	9788577808786	THOMAS, ROLAND E.; ROSA, ALBERT J.; TOUSSAINT, GREGORY J.. ANALISE E PROJETO DE CIRCUITOS ELETRICOS LINEARES. BOOKMAN COMPANHIA ED. 6 Edição. 2011.	Físico
1232	9788571933019	COSTA, VANDER MENENGOY DA. CIRCUITOS ELETRICOS LINEARES - ENFOQUES TEORICO E PRATICO. INTERCIENCIA. 6 Edição. 2013.	Físico
1233	9788534606936	IRWIN, J. DAVID. ANALISE DE CIRCUITOS EM ENGENHARIA. MAKRON. 4 Edição. 1999.	Físico
1234	9781439806104	HOHL, William; ARM Assembly Language: Fundamentals and Techniques. CRC Press. 1 edição. 2009	Físico
1235	9781118788943	LANGBRIDGE, James A. Professional Embedded ARM Development. Wrox. 1 edição. 2014	Físico
1236	9788536501703	PEREIRA, Fabio. Tecnologia ARM - Microcontroladores de 32bits. Erica. 1 edição. 2007	Físico
1238	9780201737196	SEAL, David. ARM Architecture Reference Manual. Addison-Wesley Professional. 2 edição. 2000	Físico
1239	9781558608740	SLOSS, Andrew; SYMES, Dominic; WRIGHT, Chris; ARM System Developer's Guide: Designing and Optimizing System Software. Morgan Kaufmann. 1 Edição. 2004	Físico
1240	9788535235852	HENNESSY, John L.; PATTERSON, David A. Organização e Projeto De Computadores. 4 edição. 2013	Físico
1241	9780135026458	BREY, Berry B.. The Intel  Microprocessors. 8 edição.  Prentice Hall. 2008	Físico
1242	9780136022121	IRVINE, Kip R. Assembly Language for x86 Processors; 6 edição. Prentice Hall. 2010	Físico
1243	9788587385116	MENDONCA, Alexandre; ZELENOVSKY. Ricardo. PC: um Guia Prático de Hardware e Interfaceamento. 4 edição. MZ editora. 2006	Físico
1244	9781593272074	HYDE, Randall. The Art of Assembly Language. 2 edição. No Starch Press. 2010	Físico
1245	9781466568242	CAVANAGH, Joseph. X86 Assembly Language and C Fundamentals. 1 edição. CRC Press. 2013	Físico
1246	9788536504261	MANZANO, José Augusto N. G. Programação Assembly - Padrão IBM-PC 8086/8088. 6 edição. Erica.  2012	Físico
1247	9788576059226	TOCCI, Ronald J, Widner, Neal S.. Sistemas Digitais. 11 edição. Prentice Hall Brasil. 2011	Físico
1249	9788535234657	PEDRONI, A. Volnei. Eletrônica Digital Moderna e VHDL. 1 edição. Campos. 2010	Físico
1251	9788577801909	VAHID, Frank. Sistemas Digitais - Projeto, Otimização e HDL. Bookman. 2008	Físico
1252	9788522107452	BIGNELL, James W.; DONOVAN, Robert. Eletrônica Digital. 1 edição. Cengage Learning. 2009	Físico
1253	9788536505855	COSTA, Cesar. Projeto de Circuitos Digitais com FPGA. 3 edição. Erica. 2014	Físico
1254	9780123944245	HARRIS, David; HARRIS, Sarah. Digital Design and Computer Architecture. 2nd Edition. 712 p. Elsevier Science & Technology. 2012	Físico
1255	9788564574212	BOYLESTAD, ROBERT. NASHELSKY, LOUISDISPOSITIVOS ELETRÔNICOS E TEORIA DE CIRCUITOS. PEARSON. 11 Edição. 2013	Físico
1256	9788576050223	SEDRA, ADEL S. SMITH, KENNETH C.; MICROELETRONICA. PRENTICE HALL BRASIL. 5 Edição. 2007	Físico
1257	9788580550498	BATES, DAVID J.; MALVINO, ALBERT. ELETRONICA - VERSAO CONCISA. MCGRAW HILL - ARTMED. 7 Edição. 2011	Físico
1258	9788521626480	MOHAN, NED. ELETRONICA DE POTENCIA - CURSO INTRODUTORIO. LTC. 1 Edição. 2014	Físico
1259	9788577260225	BATES, DAVID J.; MALVINO, ALBERT. ELETRONICA, V.1. MCGRAW HILL - ARTMED. 7 Edição. 2008	Físico
1260	9788577260232	BATES, DAVID J.; MALVINO, ALBERT. ELETRONICA, V.2. MCGRAW HILL - ARTMED. 7 Edição. 2008	Físico
1261	9788580550450	HART, DANIEL W. ELETRONICA DE POTENCIA - ANALISE E PROJETOS DE CIRCUITOS.  MCGRAW HILL - ARTMED. 1 Edição. 2011	Físico
1262	9788564519022	PERTENCE JUNIOR, ANTONIO. AMPLIFICADORES OPERACIONAIS E FILTROS ATIVOS. TEKNE - ARTMED. 7 Edição. 2008	Físico
1263	9780750697026	TERREL, DAVID L.. OP AMPS - DESIGN APPLICATION, AND TROUBLESHOOTING. NEWNES. 2 Edição. 1996	Físico
1264	9788535234664	SALIM, César Simões; SILVA, Nelson Caldas. Introdução ao Empreendedorismo: despertando a atitude empreendedora. Rio de Janeiro: Elsevier, 2010. 245 p.	Físico
1265	9788522110599	ZILL, Dennis G. Equações diferenciais com aplicações em modelagem. 2. ed. São Paulo, SP: Pioneira Thomson Learning, 2011. xii, 410 p. 2011	Físico
1266	9788581430836	NAGLE, Kent R.; SAFF, Edward B.; SNIDER, Arthur D. Equações diferenciais. 8. ed. Pearson, 2013. 592 p. 2012	Físico
1267	8585818247	OLIVEIRA, Edmundo Capelas de; TYGEL, Martin. Métodos matemáticos para engenharia. 2. ed. Rio de Janeiro: Sociedade Brasileira de Matematica, c2010. 387 p. (Coleção Textos universitários Coleção Textos universitários)	Físico
1268	8521614993	BOYCE, William E.; DIPRIMA, Richard C. Equações diferenciais elementares e problemas de valores de contorno. 8. ed. Rio de Janeiro, RJ: Livros Técnicos e Científicos, c2006. xvi, 434 p.	Físico
1269	9788524400353	IORIO JUNIOR, Rafael Jose; IÓRIO, Valéria de Magalhães. Equações diferenciais parciais: uma introdução . 2. ed. Rio de Janeiro: IMPA, 2010. 343 p. (Projeto Euclides Projeto Euclides)	Físico
1278	9783642053702	SCHECK, Florian. Mechanics: From Newton's Laws to Deterministic Chaos. Graduate Texts in Physics. Springer, 2010. ISBN: 978-3-642-05369-6 (Print) 978-3-642-05370-2 (Online). http://dx.doi.org/10.1007/978-3-642-05370-2	Virtual
1237	8536501200	SOUSA, Daniel Rodrigues. Microcontroladores ARM7 - (Philips - família LPC213x) - O poder dos 32 Bits - Teoria e Prática. 1. ed. Erica, 2006. ISBN: 8536501200	Físico
1272	9780321228628	Holzmann, G.J., The Spin Model Checker: Primer and Reference Manual (2003), Addison-Wesley. 	Físico
1273	0000000000	C. A. R. Hoare. Communicating Sequential Processes. 2004. Disponível Online em: http://www.usingcsp.com/cspbook.pdf	Virtual
1271	0139484728	DAVIES, Jim Davies; WOODCOCK, Jim (1996). Using Z: Specification, Refinement and Proof. Prentice Hall International Series in Computer Science. Disponível Online em: http://www.usingz.com/text/online/	Virtual
976	9788577804023	Hair-HAIR, Joseph F.  et al. Análise multivariada de dados.   688 p.     6. ed.	Físico
1274	857041451X	MINGOTI, Sueli Aparecida. Análise de dados através de métodos de estatística multivariada: uma abordagem aplicada. Belo Horizonte: Editora UFMG, 2005. 295p. : (Didática.8)	Físico
1275	9788535230468	FÁVERO, Luiz Paulo et al. Análise de dados: modelagem multivariada para tomada de decisões . Rio de Janeiro, RJ: Elsevier, Campus, 2009. xx, 646 p.	Físico
1276	9783642133121	EVERITT, Brian; HOTHORN, Torsten. An introduction to applied multivariate analysis with R. Springer Science & Business Media, 2011. http://dx.doi.org/10.1007/978-1-4419- 9650-3	Virtual
1277	9780387781891	IZENMAN, A. J. Modern multivariate statistical techniques. New York: Springer, 2008. http://dx.doi.org/10.1007/978-0-387-78189-1	Virtual
1289	9788540502833	LUPTON, Ellen. Pensar com tipos. São Paulo: Cosac Naify, 2013, ISBN: 9788540502833	Físico
1290	9788575032398	LUPTON, Ellen; PHILLIPS, Jennifer Cole. Novos fundamentos do design. São Paulo: Cosac Naify, 2008, ISBN: 9788575032398.	Físico
1291	9788574581262	PEDROSA, Israel. O universo da cor. Rio de Janeiro: SENAC Nacional, 2003. ISBN10: 8574581267, ISBN13: 9788574581262	Físico
1292	9788577805228	AMBROSE, Gavin; HARRIS, Paul. Grids. Porto Alegre: Bookman, 2010, ISBN: 9788577805228	Físico
1293	9788540507067	BRINGHURST, Robert. Elementos do estilo tipográfico. São Paulo: Cosac Naify, 2015, ISBN: 9788540507067	Físico
1294	9788586695391	VILLAS-BOAS, André. Identidade e cultura: Design Gráfico . 2. ed. Teresópolis, RJ: 2AB, 2009. 175p. ISBN: 9788586695391	Físico
1295	9788577805839	SAMARA, Timothy. Evolução do Design: da teoria à prática. Porto Alegre: Bookman, 2010, ISBN: 9788577805839	Físico
1296	9788579171796	NAKATA, M.; SILVA. J.  Desenho para design - Uma contribuição do desenho de observação na formação dos designers. 1ª edição. Canal 6 editora. 2011, ISBN13: 9788579171796	Físico
1297	9788578276126	KANDINSKY, Wassily. Ponto e linha sobre plano. 2ª edição. WMF Martins Fontes. ISBN13: 9788578276126	Físico
1298	9788574582672	PEDROSA, Israel. Da Cor a Cor Inexistente. Editora Senac São Paulo. 10ª edição. 2009. ISBN13: 9788574582672	Físico
1299	9788578277857	PARRAMON. Fundamentos do Desenho Artístico. Ed. WMF Martins Fontes. 2ª edição. 2014. ISBN 9788578277857	Físico
1300	9788580500141	HALL, A. Fundamentos essenciais da ilustração. Editora Rosari. 1ª edição. 2012. ISBN13: 9788580500141	Físico
1301	9788564249165	JUBRAN, A. Anatomia e Animais - Série Desenho À Mão Livre. Editora Criativo. 2011. 1ª edição. ISBN 9788564249165	Físico
1310	9788582600382	ADOBE SYSTEMS. Adobe Photoshop CS6: classroom in a book. Porto Alegre: Bookman, 2013. ISBN: 9788582600382	Físico
1311	9788539603084	ANDRADE, Marcos Serafim de. Adobe photoshop CS6. São Paulo: Ed. SENAC São Paulo, 2013. 598 p., il., 23 cm. (Nova série informática). ISBN 9788539603084 (espiral). 	Físico
1312	9788536504292	ALVES, William Pereira. Adobe Illustrator CS6: descobrindo e conquistando. 1. ed. São Paulo: Érica, 2012. 216 p., il., 25 cm. Bibliografia: p. 211. ISBN 9788536504292	Físico
1313	9788578275402	ARCHER, Michael. Arte Contemporânea – Uma História Concisa. 2ª edição (Col. Mundo da Arte) São Paulo: WMF Martins Fontes. 2012. ISBN13: 9788578275402	Físico
1314	9788571642515	ARGAN. Giulio Carlo. Arte moderna: do Iluminismo aos movimentos contemporâneos. São Paulo: Companhia das Letras, 1992. ISBN10: 8571642516 ISBN13: 9788571642515	Físico
1315	9788521611851	GOMBRICH, Ernst Hans. A História da Arte. 16ª edição. São Paulo: LTC (Grupo Gen). 2000. ISBN10: 8521611854 ISBN13: 9788521611851	Físico
1316	9788508113194	GRAÇA, Proença. História da Arte – Ensino Médio - Integrado. 17ª edição. São Paulo: Ática. 2007. ISBN13: 9788508113194	Físico
1317	9788533601543	JANSON, Horst Woldemar. História geral da Arte - 3 volumes. 3ª edição. (Coleção a). São Paulo: Martins Fontes. 2001. ISBN10: 8533601549 ISBN13: 9788533601543	Físico
1318	9788571101425	STANGOS, Nikos. Conceitos da arte moderna. Rio de Janeiro: Jorge Zahar, 1994. ISBN13: 9788571101425	Físico
1319	9788533623651	BAUMGART, Fritz. Breve História da Arte. 2ª edição. São Paulo: Martins Fontes, 2007. ISBN10: 8533623658 ISBN13: 9788533623651	Físico
1320	8571108137	BARBOSA. Lívia. Sociedade de Consumo. Rio de Janeiro: Jorge Zahar Editor, 2004. 68p. ISBN: 8571108137	Físico
1322	9788521204565	CARDOSO, Rafael. Uma Introdução à História do Design. São Paulo: Edgard Blücher, 3a ed. Rev. Amp. 2008. P. 276. ISBN: 9788521204565	Físico
1323	9788575034952	FORTY, Adrian. Objeto de desejo – design e sociedade desde 1750. São Paulo: Cosac Naify, 2007. 334 p. ISBN 9788575034952	Físico
1324	9788539103942	BRAGA, Marcos; MOREIRA,  Ricardo. Histórias do Design no Brasil. Editora Annablume. 1ª edição. 2012. ISBN 9788539103942	Físico
1325	9788521205609	CARA, Milena. Do Desenho Industrial ao Design no Brasil - Coleção Pensando o Design. Edgard Blucher. 2010. 1ª edição. ISBN: 9788521205609	Físico
1326	9788580500134	ROYO, J. Design digital. Editora Rosari. 1ª edição. 2011. ISBN: 9788580500134	Físico
1327	9788521205098	SCHENAIDER, Beat. Design ‐ uma introdução: o design no contexto social, cultural e econômico. São Paulo: Blucher, 2010. ISBN: 9788521205098	Físico
1328	9788521622857	BHUYAN, MANABENDRA. INSTRUMENTAÇAO INTELIGENTE- PRINCIPIOS E APLICAÇOES. LTC. 1 Edição. 2013. ISBN 9788521622857	Físico
1329	9788536500713	THOMAZINI, DANIEL; ALBUQUERQUE, PEDRO URBANO BRAGA DE. SENSORES INDUSTRIAIS - FUNDAMENTOS E APLICAÇOES. ERICA. 6 Edição.  2011. ISBN 9788536500713	Físico
1330	9788590581727	DIAS, CARLOS ALBERTO. TECNICAS AVANÇADAS DE INSTRUMENTAÇAO E CONTROLE DE PROCESSOS INDUSTRIAIS. TECHNICAL BOOKS. 2 Edição. 2012. ISBN 9788590581727	Físico
1509	0124159966	ABBOTT, Doug. Linux for Embedded and Real-time Applications. 3a. Edição. Newnes. ISBN: 0124159966	Físico
1279	9783642139901	SCHERER, Philipp O. J. Computational Physics: Simulation of Classical and Quantum Systems. Springer, 2010. ISBN: 978-3-642-13989-5 (Print) 978-3-642-13990-1 (Online). http://dx.doi.org/10.1007/978-3-642-13990-1	Virtual
1280	9788533623828	DONDIS, Donis A. Sintaxe da linguagem visual. 3ª edição. São Paulo: Martins Fontes, 2007. (Coleção a) ISBN10: 8533623828. ISBN13: 9788533623828	Físico
1281	9788533606357	MUNARI, Bruno. Design e comunicação visual. 4ª edição. São Paulo: Martins Fontes. 2001. (Coleção a) ISBN 10: 8533606354 ISBN13: 9788533606357	Físico
1282	9788578272586	WONG, W. Princípios de forma e desenho. 2ª edição. São Paulo: WMF Martins Fontes, 2010. ISBN10: 8578272587 ISBN13: 9788578272586	Físico
1283	9788522101481	ARNHEIM, Rudolf. Arte & percepção visual: uma psicologia da visão criadora. 11ª edição. São Paulo: Thomson Pioneira / Cengage, 1998. ISBN10: 8522101485 ISBN13: 9788522101481	Físico
1284	9788521304265	HURLBURT, Allen. LayOut: o design da página impressa. São Paulo: Nobel, 2002.  ISBN10: 8521304269 ISBN13: 9788521304265	Físico
1285	9788588343924	HELLER, Steven.  Linguagens do Design: Compreendendo o Design Gráfico. 2ª edição. São Paulo: Rosari, 2010. ISBN13: 9788588343924	Físico
1287	9788521205463	FARINA, Modesto. Psicodinâmica das cores em comunicação. 6ª edição. São Paulo: Edgard Blucher, 2011. ISBN13: 9788521205463 	Físico
1288	857238037X	RIBEIRO, Milton. Planejamento Visual Gráfico. 8ª edição. Brasília: LGE Editora (atual LER Editora), 2003. ISBN10: 857238037X	Físico
1302	9788560499175	FIELD, Syd. Roteiro: os fundamentos do roteirismo. Curitiba: Arte & Letra, 2009. ISBN-10: 8560499172 ISBN-13: 9788560499175 	Físico
1303	9788571394964	MURRAY, J. H. Hamlet no holodeck: o futuro da narrativa no ciberespaço. São Paulo: Itaú Cultural: Unesp, 2003. ISBN-10: 8571394962 ISBN-13: 9788571394964 	Físico
1304	9788521207009	ROGERS, Scott. Level Up - Um Guia Para o Design de Grandes Jogos. São Paulo: Blucher. 2013. ISBN-10: 852120700X ISBN-13: 9788521207009 	Físico
1305	9788532305404	COMPARATO, Doc. Da criação ao roteiro: teoria e prática. 3ª edição. São Paulo: Summus Editorial, 2009. ISBN-10: 8532305407 ISBN-13: 9788532305404	Físico
1306	9788572443623	FERRARI, Pollyana (org.). Hipertexto, hipermídia: as novas ferramentas da comunicação digital. 2ª ed., 1ª reimpressão. São Paulo: Contexto, 2014. ISBN-10: 8572443622 ISBN-13: 9788572443623	Físico
1307	9788522106325	NOVAK, Jeannie. Desenvolvimento de Games. Tradução da 2a Edição Norte-Americana. São Paulo: Cengage Learning. 2010. ISBN-10: 8522106320 ISBN-13: 9788522106325	Físico
1308	9788522106790	SANTAELLA, Lucia; FEITOZA, Mirna. Mapa do jogo: a diversidade cultural dos games. São Paulo: Cengage, 2009. ISBN-10: 8522106797 ISBN-13: 9788522106790	Físico
1309	9788540701526	Wells, Paul; Quinn, Joanna; Les Mills. Desenho para Animação. tradução: Mariana Bandarra. Porto Alegre: Bookman, 2012. ISBN-10: 8540701529 ISBN-13: 9788540701526	Físico
1335	8521615116	HOLTZAPPLE, Mark Thomas; REECE, W. Dan. Introdução à engenharia. Rio de Janeiro, RJ: LTC, 2006. xii, 200 p. ISBN 8521615116	Físico
1336	9788532806420	BAZZO, Walter Antonio; PEREIRA, Luiz Teixeira do Vale. Introdução à Engenharia: conceitos, ferramentas e comportamentos. 4. ed. Florianopolis: Ed. da UFSC, 2013. 296 p. (Didática) ISBN 9788532806420	Físico
1337	9788582600306	BROOKSHEAR, J. Glenn. Ciência da computação: uma visão abrangente. 11. ed. Porto Alegre: Bookman, 2013. 561 p. ISBN 9788582600306	Físico
1338	9788521617266	BROCKMAN, Jay B. Introdução à engenharia: modelagem e solução de problemas. Rio de Janeiro: Livros Técnicos e Científicos, c2010. xvii, 294 p. ISBN 9788521617266	Físico
1339	9788575282298	COCIAN, Luis Fernando Espinosa. Descobrindo a Engenharia. A Profissão.  Canoas, RS: Ed. do Autor, 2009. 344 p.: il. ISBN: 9788575282298	Físico
1331	9788536504018	RAMOS, JADEILSON DE SANTANA BEZERRA. INSTRUMENTAÇAO ELETRONICA SEM FIO - TRANSMITINDO DADOS COM MODULOS XBEE ZIGBEE E PIC16F877A. ERICA. 2012. 1 Edição. ISBN 9788536504018	Físico
1332	9788571932456	BEGA, EGIDIO ALBERTO. INSTRUMENTAÇAO INDUSTRIAL. INTERCIENCIA. 3 Edição. 2011. ISBN 9788571932456	Físico
1333	9788582600917	DUNN, WILLIAM C. FUNDAMENTOS DE INSTRUMENTAÇAO INDUSTRIAL E CONTROLE DE PROCESSOS. BOOKMAN COMPANHIA ED. 1 Edição. 2013. ISBN 9788582600917	Físico
1334	9788575223352	BRITO, S.H.B.  Laboratórios de Tecnologias Cisco em Infraestrutura de Redes. 2. ED. Novatec. 2014. ISBN: 978-85-7522-335-2	Físico
1340	9788575224083	MENEZES, N. Introdução à Programação com Python. Editora Novatec. 2ª edição. 2014. ISBN: 9788575224083	Físico
1341	9788576087434	BARRY, Paul. Use A Cabeça ! – Python. Alta Books. 1ª edição. 2012. ISBN 9788576087434	Físico
1342	9788576084730	GRIFFITHS, David. Use a Cabeça ! Programação. Alta Books. 1ª edição. 2010. ISBN 9788576084730	Físico
157	9780596510046	ORAM, Andy; WILSON, Greg. BEAUTIFUL code: leading programmers explain how they think. California: O´Reilly, 2007. xxi, 593 p.	Físico
1343	9788576088561	CLARK, R.; MURPHY, C.; STUDHOLME, O.; MANIAN, D. Introdução ao HTML5 e CSS3. Alta Books. 1ª edição. 2014. ISBN: 9788576088561.	Físico
1344	9788576088622	FREEMAN, E.; FREEMAN, E. Use a Cabeça! HTML e CSS. Alta Books. 1 ª edição. 2015. ISBN: 9788576088622	Físico
1345	9788575224366	SMITH, B. Json Básico. Novatec. 1ª edição. 2015. ISBN: 9788575224366	Físico
1346	9788575223284	BIBEAULT, Bear; RESIG, John. Segredos do Ninja Javascript. Editora Novatec. 1ª edição. 2013. ISBN 9788575223284	Físico
1347	9788575222614	SILVA, M.. HTML5 - A Linguagem de Marcação que Revolucionou a Web. Editora Novatec. 1ª edição. 2011. ISBN: 9788575222614	Físico
1348	9788576088455	FREEMAN, E.; CASTILHONE, L. Use a Cabeça! Programação em HTML5. Alta Books. 1ª edição. 2014. 9788576088455	Físico
1349	0000000001	Extensible Markup Language (XML). Especificação disponível em: http://www.w3.org/XML/	Virtual
1350	0534201121	CHENEY, Ward; KINCAID, David (David Ronald). Numerical mathematics and computing. 3rd. ed. Pacific Grove, CA: Books/Cole, c1994. 578p. ISBN 0534201121	Físico
1351	9780124080829	YIU, JOSEPH. The Definitive Guide to ARM® Cortex®-M3 and Cortex®-M4 Processors. NEWNES. 3 Edição. 2013. ISBN 9780124080829	Físico
1352	9780750687096	JASIO, LUCIO DI. Programming 32-bit Microcontrollers in C: Exploring the PIC32. NEWNES. 1 Edição. 2008. ISBN 9780750687096	Físico
1353	9780123854773	YIU, JOSEPH. THE DEFINITIVE GUIDE TO THE ARM CORTEX-M0. NEWNES. 1 Edição. 2011. ISBN 9780123854773	Físico
1354	9780080982960	MARTIN, Trevor. The Designer's Guide to the Cortex-M Processor Family: A Tutorial Approach. NEWNES. 1 Edição. 2013. ISBN 9780080982960	Físico
1355	9788536501055	OLIVEIRA, André Schneider; ANDRADE, Fernando Souza. Sistemas Embarcados - Hardware e Firmware na Prática.  Erica.  2 edição. 2010. ISBN 9788536501055	Físico
1356	9788536502670	GIMENEZ, SALVADOR PINILLOS. Microcontroladores 8051 - Teoria e Prática. Erica. 1 Edição. 2010. ISBN 9788536502670	Físico
1357	9780321928986	BIRN, Jeremy. Digital Lighting and Rendering. New York: New Riders, 20062013. ISBN: 978-0321928986	Físico
1358	9780393730838	O'ROURKE, Michael. Principles of Three-Dimensional Computer Animation: Modeling, Rendering and Animating with 3D computer graphics. New York: W. W. Norton and Company, 2003. ISBN-13: 978-0393730838	Físico
1359	9780240520957	CHILD, John; GALER, Mark. Photographic Lighting: Essential Skills. Oxford: Focal Press/Elsevier, 2008. ISBN-10: 0240520955, ISBN-13: 978-0240520957	Físico
1360	9789727227440	Ribeiro, Nuno. Multimédia e Tecnologias Interativas. 5ª edição. 2012. São Paulo: Lidel – Zamboni. ISBN10: 9727227449 ISBN13: 9789727227440	Físico
1361	9788576570844	JENKIS, Henry. Cultura da Convergência. 2ª edição. São Paulo: Editora Aleph, 2009. ISBN13: 9788576570844	Físico
1371	9788574521312	CAMPOS, Ibere M.  Redes Windows:     teoria e prática.   524 p.         Rio de Janeiro, RJ: Brasport, 2003.	Físico
1374	9788571931367	POLYA, George; ARAUJO, Heitor Lisboa de.  A arte de resolver problemas:     um novo aspecto do metodo matematico .   vii, 203p. Rio de Janeiro: Interciência, 2006. 9788571931367	Físico
1364	9788535214505	BRAGA, Fabiane; GOMES, Elisabeth. Inteligência Competitiva. 2ª ed. Campus, 2004. ISBN-10: 853521450X.  ISBN-13: 978-8535214505.	Físico
1365	9788535212686	KAPLAN, Robert S.; NORTON, David, P. Mapas Estratégicos. Balanced Scorecard, Campus, 2004. ISBN-10: 853521268X. ISBN-13: 978-8535212686	Físico
1366	9788502044074	O´BRIEN, James A.  Sistemas de informação e as decisões gerenciais na era da internet.       431 p.       2. ed.  São Paulo, SP: Saraiva, c2004.	Físico
1363	978853520352	DAVENPORT, Thomas H. PRUSAK, Laurence. Conhecimento Empresarial – como as empresas gerenciam o seu capital intelectual. Elsevier, 2003. ISBN: 978853520352.	Físico
1368	9781848829640	SALEMBIER, Pascal; RANDALL, David  (Ed.).  From CSCW to Web 2.0:     European developments in collaborative design : selected papers from COOP08.   xvii, p. 220 p.         London: New York: Springer, 2010.	Físico
1369	9788577803347	TURBAN, Efraim et al. Business Intelligence: um enfoque gerencial para a inteligência do negócio. Porto Alegre: Bookman, 2009. 254 p. ISBN: 9788577803347	Físico
1370	9788580550757	BALTZAN, Paige; PHILLIPS, Amy. Sistemas de Informação. McGraw-Hill, 2012. ISBN: 9788580550757	Físico
1372	9788580422856	FURTADO, Elizabeth Sucupira.  Qualidade de interação de sistemas e novas abordagens para avaliação.       198 p.         Curitiba, PR: CRV, 2012.	Físico
1373	9780131112414	JOHNSON, Deborah G.  Computer ethics:     analyzing information technology.   viii, 200 p.         New Jersey: Prentice Hall, 2009.	Físico
1375	9788577806409	HOTEK, Mike.  Kit de treinamento MCTS - Exame 70-432:     Microsoft SQL Server 2008 : implementação e manutenção.   664p. + 1 CD-ROM    (Kits de treinamento Microsoft.)      Porto Alegre, RS: Bookman, 2010.	Físico
1376	9788576083603	EVANS, Eric.  Domain-driven design:     atacando as complexidades no coração do software.   499 p.         Rio de Janeiro, RJ: Alta Books, 2009.	Físico
1367	9780596008031	Há 4 exemplares disponíveis da edição 2006: TIDWELL, Jenifer. Designing interfaces. Sebastopol, Ca: O´Reilly Media, 2006. xx, 331 p. ISBN 9780596008031	Físico
1377	9789727223404	COSTA, Ernesto; SIMÕES, Anabela.  inteligência artificial:     fundamentos e aplicações.   610 p.       3. ed.  Lisboa, Portugual: FCA - Editora de Informática, 2008.	Físico
1378	9780321180612	WELCH-ABERNATHY, Dameon D.  Essential Check Point FireWall-1 NG:     an installation, configuration, and troubleshooting guide.   xxxv, 612 p         Boston: Addison-Wesley, 2004.	Físico
1379	9788522107896	CHAPMAN, Stephen J.  Programação em MATLAB para engenheiros.       xvii, 410 p.       2. ed.  São Paulo, SP: Cengage Learning, 2010.	Físico
1381	9788582600245	MENEZES, Paulo Blauth.  Matemática discreta para computação e informática.       xxi, 348 p.   (Livros didáticos informática ufrgs ; 16).     4. ed.  Porto Alegre: Bookman, 2013.	Físico
1383	9781558606593	McREYNOLDS, Morgan; BLYTHE, David. Advanced Graphics Programming Using OpenGL (The Morgan Kaufmann Series in Computer Graphics). Morgan Kaufmann, 2005. ISBN-10: 1558606599. ISBN-13: 978-1558606593	Físico
1393	9788566250220	SILVEIRA, P.; ALMEIDA, A. Lógica de Programação: Crie seus primeiros programas usando Javascript e HTML. Casa do Código. 1ª edição. 2013. ISBN: 9788566250220	Físico
1394	9780970579522	BERGIN, Joseph; STEHLIK, Mark; ROBERTS, Jim; PATTIS, Rich. Monty Karel: A Gentle Introduction to the Art of Object-Oriented Programming in Python. Dreamsongs Press. 1. ed. 2013. ISBN-10: 0970579527 ISBN-13: 978-0970579522	Físico
1395	9781430204961	HARMES, Ross; DIAZ, Dustin SPRINGERLINK (ONLINE SERVICE). Pro JavaScript Design Patterns. Springer eBooks Berkeley, CA: Apress, Inc., 2008. ISBN 9781430204961. Disponível em : <http://dx.doi.org/10.1007/978-1-4302-0496-1>. Acesso em : 21 set. 2010. OSMANI, Addy. Learning Javascript Design Patterns. OREILLY & Assoc. 1.ed. 2012	Virtual
1405	9781592538065	MEIRELLES, Isabel. Design for Information. London: Rockport Publishers, 2013. ISBN-10: 1592538061 ISBN-13: 978-1592538065	Físico
1406	9783836528795	RENDGEN, Sandra. Information Graphics. New York: Taschen, 2012. ISBN-10: 3836528797 ISBN-13: 9783836528795	Físico
1407	9781589482616	BERTIN, Jacques. Semiology of Graphics: Diagrams, Networks, Maps. California: Esri Press Redland CA, 2010. ISBN-10: 1589482611 ISBN-13: 978-1589482616	Físico
1408	9780907259473	BURKE, Christopher. Isotype: Design and Contexts 1925–1971. London: Hyphen Press, 2014. ISBN-10: 0907259472 ISBN-13: 9780907259473	Físico
1409	9783836548403	DEBSCHITZ, Thilo. Fritz Khan. New York: Taschen, 2013. ISBN-10: 3836548402 ISBN-13: 978-3836548403	Físico
1410	9780521735353	MAYER, R. E.. Multimedia Learning. 2nd ed. New York: Cambridge University Press, 2009.  ISBN-10: 0521735351. ISBN-13: 9780521735353	Físico
1411	9780789749499	SMICIKLAS, Mark. The Power of Infographics. New York: Que Publishing, 2012. ISBN 0789749491. ISBN-13 978-0789749499	Físico
1412	9780470944882	YAU, Nathan. Visualize This: The Flowing Data Guide to Design. Wiley Press. Denver. 2011.  ISBN-10: 0470944889. ISBN-13: 978-0470944882	Físico
1428	9788521203889	VOLPATO, Neri; AHRENS, Carlos Henrique (Editor). Prototipagem rápida: tecnologias e aplicações . São Paulo: Blucher, 2007.. 272p. ISBN-10: 8521203888. ISBN-13: 9788521203889	Físico
1430	9789812778970	CHUA, C.K.; LEONG, K.F.; LIM, C.S., Rapid Prototyping: Principles and Applications. 3rd ed. World Scientifc, 2010. ISBN: 9812778977, ISBN-13: 9789812778970	Físico
1431	9781631888694	COOK, Eric. Prototyping. 1 ed. Cherry Lake Publishing, 2015. 32 pg. ISBN 1631888692. ISBN-13: 978-1631888694	Físico
994	9788582600061	PREECE, Jennifer; ROGERS, Yvonne; SHARP, Helen. Design de interação: além da interação humano-computador . 3. ed. Porto Alegre, RS: Bookman, 2013. xiv, 585 p. ISBN 9788582600061	Físico
1432	9781558608702	SNYDER, Carolyn. Paper prototyping: The fast and easy way to design and refine user interfaces. Morgan Kaufmann, 2003.  ISBN-10: 1558608702. ISBN-13: 9781558608702	Físico
1433	9781499738063	MARDAN, Azat. Rapid Prototyping with JS: Agile JavaScript Development. CreateSpace Independent Publishing, 2014. ISBN-10: 1499738064 ISBN-13: 978-1499738063	Físico
1434	9783642768224	BUDDE, Reinhard et al. Prototyping: an approach to evolutionary system development. Softcover reprint of the original 1st ed. 1992. Springer, 2011. ISBN-10: 3642768229 ISBN-13: 978-3642768224	Físico
1440	9788565837194	FLANAGAN, David. JAVASCRIPT – O Guia Definitivo. Bookman, 6ª ED./2012, 856583719x/9788565837194	Físico
394	9788588639379	DEMANA, Franklin D. et al. Pré-cálculo. São Paulo, SP: Addison-Wesley, 2009. xv, 380 p. ISBN 9788588639379	Físico
1441	9788581430966	DEMANA, Franklin D.; WAITS, Bert K.; FOLEY, Gregory D.; KENNEDY, Daniel. Pré-cálculo. 2a. ed. São Paulo, SP: Pearson, 2013. 472 p. ISBN 9788581430966	Físico
1017	8570562691	IEZZI, Gelson. Fundamentos de matemática elementar, 3: trigonometria : 123 exercícios resolvidos, 385 exercícios propostos com resposta, 236 testes de vestibulares com resposta. 7. ed. São Paulo, SP: Atual, 1993. 303 p. ISBN 8570562691	Físico
1211	9788429150155	APOSTOL, Tom M. Cálculo I, Cálculo com funções de uma variável, com uma introdução à Álgebra Linear. Reverté, 2 ed. 2004. ISBN 9788429150155 volume 1	Físico
1442	9788521612575	GUIDORIZZI, Hamilton Luiz. Um curso de cálculo. 5. ed. Rio de Janeiro: Livros Técnicos e Científicos, 2002. 4 v. ISBN 9788521612575 volume 3	Físico
1461	1587050749	GUMASTE, Ashwin;  ANTONY, Tony. DWDM Network Designs and Engineering Solutions; 2012; Cisco Press;  ISBN: 1587050749	Físico
1463	9788580553970	KEISER, Gerd. Comunicações Por Fibras Ópticas;  4ªed. 2014; Bookman; ISBN: 9788580553970	Físico
1464	9788575022849	FILIPPETTI, Marco Aurélio. CCNA 5.0: guia completo de estudo. Florianópolis: Visual Books, 2014. 544 p. ISBN: 9788575022849	Físico
1465	9788580551686	FOROUZAN, B. A.; FIROUZ, M. Redes de Computadores: Uma Abordagem Top-down. 1a ed. 2013. McGraw-Hill. ISBN: 9788580551686	Físico
1466	9781598299441	DE SOUZA, Clarisse Sieckenius, Leitão, Carla Faria. Semiotic engineering methods for scientific research in HCI. Synthesis Lectures on Human-Centered Informatics 2.1 (2009): 1-122. ISBN13: 9781598299441	Físico
1380	9788588041042	ALTERNATIVAS não convencionais para transmissão de energia elétrica:  estudos técnicos e econômicos.   366 p.         Brasília, DF: ANEEL, 2012.	Físico
1026	139780486402581	PAPADIMITRIOU, Christos H.; STEIGLITZ, Kenneth. Combinatorial optimization:   algorithms and complexity. xvi, 496 p. 1998. ISBN: 139780486402581 	Físico
1382	9783540718444	KORTE, Bernhard; VYGEN, Jens SPRINGERLINK (ONLINE SERVICE). Combinatorial Optimization :  Theory and Algorithms . Springer e-books Fourth Edition. Berlin, Heidelberg: Springer-Verlag Berlin Heidelberg,  2008.   (Algorithms  and  Combinatorics,  21)  ISBN  9783540718444.  Disponível  em: <http://dx.doi.org/10.1007/978-3-540-71844-4>. Acesso em : 21 set. 2010.	Virtual
1384	9788575223666	LOWDERMILK, Travis. Design Centrado no Usuário. 1 ed. Novatec, 2013. 184 pg. ISBN 8575223666. ISBN-13 978-8575223666	Físico
1385	9788535238624	BROWN, Tim; KATZ, Barry. Design Thinking. Uma Metodologia Poderosa Para Decretar o Fim das Velhas Ideias. 1 ed. Elsevier, 2010.  272 pg. ISBN 853523862X. ISBN-13 978-8535238624	Físico
1386	9781118083468	KUMAR, Vijay. 101 Design Methods: A Structured Approach for Driving Innovation in Your Organization. 1 ed. Wiley, 2012. 336 pg. ISBN 1118083466. ISBN-13 978-1118083468	Físico
1387	9788532605535	OSTROWER, Fayga. Criatividade e Processos de Criação. 24 ed. Vozes, 2009. 190 pg. ISBN 8532605532. ISBN-13 9788532605535	Físico
1388	9788567389257	OSTERWALDER, Alexander. Value Proposition Design. 1 ed. HSM, 2015 . 320 pg. ISBN 8567389259. ISBN-13 978-8567389257	Físico
1390	9788575223321	BEAZLEY, D., JONES, K.B. Python Cookbook. 3ª ed. Novatec. 2013. ISBN: 978-85-7522-332-1	Físico
1391	8573079800	DEITEL & ASSOCIATES, Perl – Como Programar.  1ªEdição. Bookman.  ISBN: 8573079800	Físico
1392	9788573937008	KOPCZYNSK, Tyson, Windows PowerShell – Autorizado. 1ªEdição. Ciência Moderna. ISBN: 9788573937008	Físico
1396	9813083891	SMITH, Peter J. Into Statistics. Springer, 2001. ISBN: 9813083891.	Físico
1397	9788536503660	MARIN, Paulo S. Data Centers - Desvendando cada passo: conceitos, projeto, infraestrutura física e eficiência energética. São Paulo, SP : Érica, 2011. ISBN: 9788536503660	Físico
1398	9788588343436	FUENTES, Rodolfo. A prática do Design Gráfico: uma metodologia criativa. São Paulo: Ed Rosari, 2006. ISBN-10: 8588343436.  ISBN-13: 9788588343436	Físico
1399	9788588343405	MELO, Chico Homem de. O projeto: desde antes do começo até depois do fim. In: Signofobia. São Paulo: Edições Rosari, 2005. ISBN: 9788588343405	Físico
1400	9788587864215	LEITE, Ricardo de Souza. Ver é compreender: design como ferramenta estratégica de negócio. Rio de Janeiro, Editora Senac Rio, 2003. ISBN: 9788587864215	Físico
1401	9788575035931	FLUSSER, Vilém. O mundo codificado: por uma filosofia do design e da comunicação. São Paulo: Cosac & Naify, 2007. ISBN-10: 8575035932. ISBN-13: 9788575035931	Físico
1402	9789724413631	MUNARI, Bruno. Das coisas nascem coisas. (reimpressão). São Paulo, Edições 70, 2014. ISBN: 9789724413631	Físico
1403	9788588343115	VALESE, Adriana et al. Faces do Design. São Paulo: Edições Rosari, 2003.  ISBN-10: 8588343118. ISBN-13: 9788588343115	Físico
1404	9788521204381	PHILLIPS, Peter. Briefing: a gestão do projeto de design. São Paulo: Editora Edgar Blücher, 2008. ISBN-10: 8521204388. ISBN-13: 9788521204381	Físico
1413	9788523206581	LEMOS, André. JOSGRILBERG, Fábio (Org) Comunicação e mobilidade: aspectos socioculturais das tecnologias móveis de comunicação no Brasil. Salvador: EDUFBA, 2009. IBSN 10: 8-523-20658-2, ISBN 13: 978-8-523-20658-1.	Físico
1414	9780124095144	MENDOZA, Adrian. Mobile user experience: patterns to make sense of it all. Waltham: Morgan Kaufmann, 2014, ISBN 13: 978-0-124-09514-4	Físico
1415	9780321683687	GARRETT, Jesse James. The elements of user experience: user-centered design for the web and beyond. New Riders: Berkeley, 2011. IBSN 10: 0-321-68368-4; ISBN 13: 978-0-321-68368-7	Físico
1416	9780321961570	BANGA, Cameron; WEINHOLD, Josh. Essential mobile interaction design: perfecting interface design in mobile apps. Upper Saddle River: Addison-Wesley, 2014, ISBN 10: 0-321-96157-9, ISBN 13: 978-0-321-96157-0	Físico
1417	9781420053890	FURHT, Borko. Handbook of mobile broadcasting: DVB-H, DMB, ISDB-T and Mediaflo. Boca Raton: CRC Press, 2015, ISBN 13: 978-1-420-05389-0	Físico
1418	9780133819598	GREENDERG, Saul; CARPENDALE, Sheelagh; MARQUARDT, Nicolai; BUXTON, Bill. Sketching user experiences: the workbook. Waltham: Elsevier, 2012, ISBN 13: 978-0 133-81959-8	Físico
1419	9781847193438	MEHTA, Nirav. Mobile Web Development. Birmingham: Packt Publishing, 2008, ISBN 13: 978-1-847-19343-8.	Físico
1420	9780123820945	RESMINI, Andrea; ROSATI, Luca. Pervasive information architecture: designing cross-channel user experiences.  Burlington: Morgan Kaufmann, 2011, ISBN 13: 978-0-123-82094-5	Físico
1421	9788535274561	FINOCCHIO JUNIOR, J; DUCROQUET, S. Project Model Canvas. Gerenciamento de Projetos sem Burocracia. 1 ed. Elsevier, 2013. 232 pg. ISBN 8535274561. ISBN-13 978-8535274561	Físico
1422	9781938377006	FEW, Stephen. Information dashbord design: displaying data for at-a-glance monitoring. Burlingame: Analytics Press, 2013, ISBN 13: 978-1-938-37700-6	Físico
1423	9781616890773	BOHNACKER,H.; GROSS, B.;LAUB,J. Generative Design: Visualize, Program and Create with Processing. New York: Princeton Architectural Press, 2012. ISBN-10: 1-616-89077-0, ISBN-13: 978-1-616-89077-3	Físico
1424	0750663529	LOVE, Steve. Understanding Mobile Human-Computer Interaction. Jordan Hill: Elsevier, 2005, ISBN 10: 0-750-66352-9	Físico
1425	9788573597110	GOSCIOLA, Vicente. Roteiro para as Novas Mídias. São Paulo: Senac, 2003, ISBN 10: 8-573-59711-9, ISBN 13: 978-8-573-59711-0	Físico
1426	9780262632553	MANOVICH, Lev. The Language of New Media. Cambrige: MIT Press, 2000. ISBN-10: 0-262-63255-1,   ISBN-13: 978-0-262-63255-3	Físico
1427	9780321834737	CAIRO, Alberto. The Functional Art: An Introduction to Information graphics and visualization. Berkeley: New Riders, 2013, ISBN-10: 0-321-83473-9, ISBN-13: 978-0-321-83473-7	Físico
1435	9788565837842	NOBLE, Ian. Pesquisa Visual. Introdução às Metodologias de Pesquisa em Design Gráfico. 2 ed. Bookman, 2013. 224 pg. ISBN 856583784X. ISBN-13 978-8565837842	Físico
1436	9788574527208	MEI, PAULO. PM Mind Map®: a gestão descomplicada de projetos. Brasport. 2015.144 pg. ISBN-13 978-85-7452-720-8	Físico
1437	9780596516253	SCOTT, Bill; NEIL, Theresa. Designing Web Interfaces. 1 ed. O'Reilly Media, 2009. ISBN 0596516258. ISBN-13 978-0596516253	Físico
1438	9788575223192	NEIL, Theresa. Padrões de Design Para Aplicativos Móveis. 1 ed. Novatec, 2012. 208 pg. ISBN 8575223194. ISBN-13 978-8575223192	Físico
1439	9788540701465	BEST, Kathryn. Fundamentos de Gestão do Design. Porto Alegre: Bookman, 2012. ISBN10: 85-407-0146-4, ISBN13: 9788540701465	Físico
1443	9788586303579	GOMES FILHO, João. Gestalt do objeto: sistema de leitura visual da forma. 9.ed. São Paulo: Escrituras, 2009. ISBN: 9788586303579	Físico
1444	978972441389	JOLY, Martine— Introdução à Análise da Imagem, Lisboa, Ed. 70, 2007. ISBN: 978972441389	Físico
1445	9788587918680	MORRIS,  Charles G. e MAISTO, Albert A. Introdução à psicologia. 6ª edição. São Paulo, 2004. ISBN: 9788587918680	Físico
1446	8573211520	SANTAELLA, Lucia. Matrizes da Linguagem e Pensamento, São Paulo: Iluminuras: FAPESP 2001.  P. 432. ISBN: 8573211520	Físico
1447	9788533624306	VYGOTSKI, L.S. Pensamento e Linguagem. 4ª ed. São Paulo , Martins Fontes, 2008. p.194 ISBN13: 9788533624306	Físico
1448	0723812190218	BURDEA, Grigore Burdea; COIFFET, Philippe. Virtual Reality Techonology, 2 edition, Wiley-IEEE Press, 2003. ISBN-10: 0471360899. ISBN-13: 072-3812190218	Físico
1449	9781852339586	KIM, Gerard. Designing Virtual Reality Systems: The Structured Approach. Springer-Verlag, 2005. ISBN- 10: 1852339586, ISBN-13: 978-1852339586.	Físico
1450	9781568813035	McMENEMY, Karen; FERGUSON, Stuart. A Hitchhikers Guide to Virtual Reality. A.K. Peters/CRC Press, 2007. ISBN-10: 1568813031. ISBN-13: 978-1568813035	Físico
1451	8586919470	SANTOS, Gildasio Mendes dos. A realidade do virtual. Campo Grande (MG): Ed. UCDB, 2001. 93p ISBN 8586919470	Físico
1452	9788573260366	LÉVY, Pierre. O que é o virtual? São Paulo: Editora 34, 2011. 159 p. (Coleção Trans). ISBN: 9788573260366	Físico
1453	9788580429060	LANDAU, L. CUNHA, G. HAGUENAUER, C. (orgs.) Pesquisas em Realidade Virtual e Aumentada. Curitiba: Editora CRV. 2014. ISBN: 9788580429060	Físico
1454	9781491922835	PARISI, Tony. Learning Virtual Reality: Developing Immersive Experiences and Applications for Desktop, Web, and Mobile. 1st Edition. USA: O’Reilly, 2015. ISBN-10: 1491922834. ISBN-13: 9781491922835	Físico
1455	8585490276	PARENTE, Andre. Imagem máquina: a era das tecnologias do virtual . 4. ed. Rio de Janeiro: Ed.34, 2011. 301 p. (TRANS) ISBN 8585490276	Físico
1457	8576691086	KIRNER, C.; SISCOUTTO, R. Realidade Virtual e Aumentada: Conceitos, Projeto e Aplicações. Editora SBC – Sociedade Brasileira de Computação, Porto Alegre, 2007. Livro do pré-simpósio, IX Symposium on Virtual and Augmented Reality, Petrópolis – RJ, 2007. ISBN: 8576691086. [recurso eletrônico] http://www.de.ufpb.br/~labteve/publi/2007_svrps.pdf 	Virtual
322	9780521865715	MANNING, Christopher D.; RAGHAVAN, Prabhakar; SCHÜTZE, Hinrich. Introduction to information retrieval. New York, NY: Cambridge at the University Press, 2009. xxi, 482 p. ISBN 9780521865715	Físico
1458	0321416910	BAEZA-YATES, Ricardo; RIBEIRO-NETO, Berthier. Modern Information Retrieval: The Concepts and Technology behind Search. New York: ACM Press, 2ª Ed., 2011. ISBN: 0321416910	Físico
1459	1402030045	GROSSMAN, David A.; FRIEDER, Ophir. Information Retrieval: Algorithms and Heuristics. Springer, 2ª Ed., 2004. ISBN: 1402030045	Físico
1460	9780262026512	BUETTCHER, Stefan; CLARKE, Charles L. A.; Cormack, Gordon V. Information Retrieval: Implementing and Evaluating Search Engines. MIT Press; 1ª Ed., 2010. ISBN: 9780262026512	Físico
596	9788580630534	RIOS, Emerson; BASTOS, Aderson; CRISTALLI, Ricardo de Souza; MOREIRA FILHO, Trayahú Rodrigues. Base de conhecimento em teste de software. 3. ed. São Paulo: Martins Fontes, 2012. 263p. ISBN: 9788580630534	Físico
1468	9780521736275	TANAKA-ISHII, Kumiko. Semiotics of programming. Cambridge University Press, 2010. ISBN: 9780521736275	Físico
1469	8585596600	NOTH, Winfried. A semiótica no século XX. São Paulo: Annablume, 1996. ISBN-10: 8585596600	Físico
1470	9788586695315	NIEMEYER, Lucy. Elementos de semiótica aplicados ao design. Editora 2ab, 2010. (1ª edição, 5ª tiragem).  ISBN-10: 8586695319. ISBN-13: 9788586695315 	Físico
1471	8515032732	VOLLI, Ugo. Manual de semiótica. São Paulo: Edições Loyola, 2008. ISBN-13: 9788515032730 ISBN-10: 8515032732	Físico
1472	9788527301701	COELHO NETTO, J. Teixeira. Semiótica, informação e comunicação: diagrama da teoria do signo. (Coleção Debates Vol. 168). São Paulo: Editora Perspectiva, 2010. 7ª edição (1ª reimpressão). ISBN-13: 9788527301701	Físico
1473	8573210567	SANTAELLA, Lúcia; NOTH, Winfried. Imagem: cognição, semiótica, mídia. Iluminuras, 2009. 4ª edição. ISBN10: 8573210567	Físico
1474	9788522102761	SANTAELLA, Lúcia. Semiótica aplicada. Cengage Learning Editores, 2002.  ISBN-10: 8522102767. ISBN-13: 9788522102761	Físico
1475	851101103X	SANTAELLA, Lúcia. O que é semiótica (Coleção primeiros passos Vol. 103). São Paulo, Brasiliense (1983). ISBN 851101103X	Físico
1476	9788527302463	PLAZA, Júlio. Tradução intersemiótica. (Coleção estudos Vol. 93) São Paulo: Editora Perspectiva, 2013. 2ª edição (1ª reimpressão). ISBN-10: 8527302462. ISBN-13: 9788527302463	Físico
1477	9798576051106	HILDEBRANDT, R; KOETTER, P. B.; TAYLOR, C.  SERVIDOR DE EMAIL LINUX 1/2006  Prentice Hall. ISBN: 8576051109 ISBN-13:  9798576051106	Físico
1478	9788576055044	OPPENHEIM, A. V.; WILLSKY; A.S., NAWABI, S.H. Sinais e Sistemas. 2 ed. Pearson Education - Br, 2010. ISBN: 9788576055044	Físico
1479	8560031138	LATHI, B. P. Sinais e Sistemas Lineares. 2 ed, Bookman, 2007. ISBN: 8560031138	Físico
1480	9780471707899	HAYKIN, S. Sinais e Sistemas. 2 ed, Wiley, 2005. ISBN: 9780471707899	Físico
1481	9788577809387	HSU, Hwei P  Sinais e Sistemas.  2 Edição. Bookman. ISBN: 9788577809387	Físico
1482	9788577260386	ROBERTS, M. J. Fundamentos Em Sinais E Sistemas.  MCGRAW HILL - ARTMED. 1 Edição. ISBN  9788577260386	Físico
1483	9788521613640	GIROD, Bernd. SINAIS E SISTEMAS. LTC. 1 Edição. ISBN 9788521613640	Físico
1484	9780123948120	CHAPARRO, Luis. Signals and Systems using MATLAB, Second Edition.  Academic Press. 2 Edição.  ISBN 9780123948120	Físico
1485	9780133506471	PHILLIPS, Charles L.; PARR, John; RISKIN, Eve. Signals, Systems, & Transforms. Prentice Hall. 5 Edição. ISBN  9780133506471	Físico
1486	9788576058106	OGATA, K. Engenharia de Controle Moderno. 5 ed., Pearson Education – Br, 2011. IBSN: 9788576058106	Físico
1487	9788521619956	DORF, R. C. Sistemas de Controle Modernos , 12 ed., LTC, 2013. IBSN: 9788521619956	Físico
1488	0070161860	D’AZZO, J. J.; HOUPIS, C. H. Linear Control System Analysis and Design: Conventional and Modern, McGraw-Hill, 1988. ISBN: 0070161860	Físico
1489	8573933089	CAMPOS, M. M.; SAITO, K. Sistemas Inteligentes em Controle e Automação de Processos, 1 ed., Ciência Moderna, 2004. ISBN: 8573933089	Físico
1490	9788582602331	DISTEFANO, J. J.; STUBBERUD, A. R.; WILLIANS, I. J. Sistemas de Controle, 2ed, Bookman, 2014. ISBN: 9788582602331	Físico
1491	0131866141	PHILLIPS, C. L. ; HARBOR, R. D. Feedback Control System, Prentice-Hall, 2010. IBSN: 0131866141	Físico
1492	0195117778	CHENG, C. Linear System Theory and Design, 3 ed., Oxford University Press, 1998. IBSN: 0195117778	Físico
1493	9780470768648	LAPLANTE, Phillip A.; OVASKA, Seppo J. Real-Time Systems Design and Analysis: Tools for the Practitioner. Wiley-IEEE Press. 4 Edição. ISBN 9780470768648	Físico
1494	9781461430193	BUTTAZZO, Giorgio C. Hard Real-Time Computing Systems: Predictable Scheduling Algorithms and Applications (Real-Time Systems Series). Springer. 3 Edição. ISBN 9781461430193	Físico
1495	9788536301723	SHAW, Alan C. Sistemas e Software de Tempo Real. Bookman. 1 Edição. ISBN 9788536301723	Físico
1496	9780471184065	CHENG, Albert M. K. Real-Time Systems: Scheduling, Analysis, and Verification. Wiley-Interscience. 1 Edição. ISBN 9780471184065	Físico
1497	9781441982360	KOPETZ, Hermann. Real-Time Systems: Design Principles for Distributed Embedded Applications (Real-Time Systems Series). Springer. 2 Edição. ISBN 9781441982360	Físico
230	9788535224061	SILBERSCHATZ, Abraham; GALVIN, Peter B.; GAGNE, Greg. Sistemas operacionais com Java. 7. ed. rev. atual. Rio de Janeiro, RJ: Elsevier, 2008. xx, 673 p. ISBN 9788535224061	Físico
1124	9788521622055	SILBERSCHATZ, Abraham; GALVIN, Peter B.; GAGNE, Greg. Fundamentos de sistemas operacionais. Rio de Janeiro: LTC, c2013. xvi, 432 p. ISBN 9788521622055	Físico
1498	9780470185315	CHU, Pong P. FPGA Prototyping by VHDL Examples: Xilinx Spartan-3 Version. Wiley-Interscience. 1 Edição. ISBN 9780470185315	Físico
1499	9780387726700	HAMBLEN, James O.; FURMAN, Michael D.; HALL, Tyson S. Rapid Prototyping Of Digital Systems - SOPC Edition. Springer. 1 Edição. ISBN 9780387726700	Físico
1248	9788521620549	D´amore, Roberto. Vhdl - Descrição e Síntese de Circuitos Digitais - 2. ed. 2012. ISBN: 9788521620549	Físico
1500	9781118008881	CHU, Pong P. Embedded SoPC Design with Nios II Processor and VHDL Examples. Wiley-Interscience. 1 Edição. ISBN 9781118008881	Físico
1501	9781558607668	FISHER, JOSEPH , A. Embedded computing: a VLIW approach to Architecture, compilers and tools. 1 Edição. Morgan Kaufmann. ISBN 9781558607668	Físico
1502	9788577801077	FLOYD, Thomas L.. Sistemas Digitais - Fundamentos e Aplicações. 9 edição. Bookman. ISBN 9788577801077 (ou 9788560031931?)	Físico
1503	9780750687065	SAMEK, Miro. Practical Uml Statecharts In C/C++. Newnes. 2 ed. ISBN 9780750687065	Físico
1504	9780750676069	GANSSLE, Jack. The Firmware Handbook. Newnes. 1 ed. ISBN 9780750676069	Físico
1506	9780750686440	GANSSLE, Jack. The Art of Designing Embedded Systems. Newnes. 2 Edição. ISBN 9780750686440	Físico
174	9788575221938	GUEDES, Gilleanes T. A. UML 2: uma abordagem prática. 1. ed. São Paulo, SP: Novatec, 2009. 485 p. ISBN: 9788575221938	Físico
1507	9788575222812	GUEDES, Gilleanes T. A. UML 2: uma abordagem prática. 2. ed. Novatec, 2011. ISBN 9788575222812	Físico
267	9788577805211	OLIVEIRA, Rômulo Silva de; CARISSIMI, Alexandre da Silva; TOSCANI, Simão Sirineo; UFRGS. Sistemas operacionais. 4. ed. Porto Alegre: Bookman, 2010. 374 p. (Livros didáticos. 11)	Físico
1508	9780137017836	HALLINAN, Christopher. Embedded Linux Primer: A Practical Real-World Approach. 2 ed. Prentice Hall. ISBN 9780137017836	Físico
1526	03043975	GIRARD, Jean-Yves, Linear logic, Theoretical Computer Science, Volume 50, Issue 1, 1987, Pages 1-101, ISSN 03043975, http://dx.doi.org/10.1016/0304-3975(87)90045-4	Virtual
1527	9783540775331	KOHLENBACH, Ulrich. Applied Proof Theory: Proof Interpretations and Their Use in Mathematics. Springer eBooks Berlin, Heidelberg: Springer-Verlag Berlin Heidelberg, 2008. (Springer Monographs in Mathematics,) ISBN 9783540775331. http://dx.doi.org/10.1007/978-3-540-77533-1	Virtual
1510	8576571625	JENKINS, Henry. FORD, Sam. GREEN, Joshua. Cultura da Conexão: criando valor e significado por meio da mídia propagável. 2014. São Paulo. Ed. Aleph. ISBN: 8576571625	Físico
1511	852050650X	RECUERO, Raquel. A conversação em rede: comunicação mediada pelo computador e redes sociais na internet. 2012. Florianópolis. Ed. Sulina. ISBN 852050650X	Físico
1512	8534936374	SANTAELLA, Lucia. Comunicação Ubíqua. 2013. São Paulo. Ed. Paulus. ISBN 8534936374	Físico
1513	8575593072	ASSANGE, Julian. APPELBAUM, Jacob. MULLER-MAGUHN, Andy. ZIMMERMANN, Jeremie. Cypherpunks: Liberdade e o Futuro da Internet. Trad. Cristina Yamagami. 2013. São Paulo. Ed. Boitempo Editorial. 200p. ISBN: 8575593072	Físico
1514	0300199007	BOYD, Danah. It's complicated: the social lives of networked teens. 2015. EUA. Ed. Yale University Press. ISBN: 0300199007	Físico
1515	8522513740	BRITTO, Sergio Branco Walter. O que é Creative Commons? 2013. Rio de Janeiro. Ed. FGV. ISBN 8522513740	Físico
1516	8561773618	FELICE, Massimo di. LEMOS, Ronaldo. A vida em rede. 2014. Ed. Papirus. 7Mares. 144p. ISBN: 8561773618	Físico
1517	9758523209599	SANTANA, Bianca; ROSSINI, Carolina; PRETTO, Nelson de Lucca (org.). Recursos Educacionais Abertos: práticas colaborativas políticas públicas. Salvador: Edufba; São Paulo: Casa da Cultura Digital. 2012. 246 p. ISBN 9758523209599	Físico
1518	9788576053682	DIAS, Reinaldo. Introdução à Sociologia. 2 ed. São Paulo: Pearson Prentice Hall. 2010. ISBN: 9788576053682	Físico
1519	9788522452170	MARCONI, Marina de Andrade; PRESOTTO, Zelia Maria Neves. Antropologia: uma introdução. 7.ed. São Paulo: Atlas, 2008. 331p. ISBN: 9788522452170	Físico
1520	9788535918717	FREUD, Sigmund  Psicologia das Massas e Análise do Eu e Outros Textos (1920-1923). São Paulo: Companhia Das Letras. 2011. (Coleção obras completas) ISBN: 9788535918717	Físico
1521	9788563899262	GIDDENS Anthony. Sociologia. 6 ed. Porto Alegre: Penso, 2012. ISBN-10: 8563899260. ISBN-13: 9788563899262	Físico
1522	9788571104389	LARAIA, Roque de Barros. Cultura: um conceito antropólogico . 24. ed. Rio de Janeiro: Zahar, 2009. 117p. (Etnologia) ISBN 9788571104389	Físico
1523	9788571109360	BARBOSA, Andréa; CUNHA, Edgar Teodoro da. Antropologia e imagem. Rio de Janeiro: J. Zahar, 2006.(Coleção Passo-a-Passo Ciências Sociais) ISBN-10: 8571109362 ISBN-13: 9788571109360	Físico
1524	9788511070309	LAPLANTINE F. Aprender Antropologia. 8 ed. São Paulo: Brasiliense. 2009. ISBN-10: 8511070303 ISBN-13: 9788511070309	Físico
1525	9788521613336	GEERTZ, Clifford. Interpretação das Culturas. 1 ed. 13ª Reimp. São Paulo: LTC. 2008. ISBN 9788521613336	Físico
1528	9783540727804	JUNGNICKEL, Dieter SPRINGERLINK (ONLINE SERVICE). Graphs, Networks and Algorithms. Springer e- books Berlin, Heidelberg: Springer-Verlag Berlin Heidelberg, 2008. (Algorithms and Computation in Mathematics, 5) ISBN 9783540727804. Disponível em: <http://dx.doi.org/10.1007/978-3-540-72780- 4>. Acesso em: 21 set. 2010	Físico
1530	9788586695346	NIEMEYER, Lucy. Tipografia: uma apresentação. Rio de Janeiro: 2AB, 2010. ISBN10: 8586695343, ISBN13: 9788586695346	Físico
1531	9788577807703	SAMARA, Timothy. Guia De Tipografia: Manual Prático para o Uso de Tipos no Design Gráfico. Porto Alegre: Bookman, 2011. ISBN10: 85-7780-770-3, ISBN13: 9788577807703	Físico
1533	9788577808748	AMBROSE, Gavin; HARRIS, Paul. Tipografia. Porto Alegre: Bookman, 2011. ISBN10: 85-7780-874-2, ISBN13: 9788577808748	Físico
1534	9788577803712	CLAIR, Kate; BUSIC-SNYDER, Cynthia. Manual de tipografia: a história, a técnica e a arte. 2 ed. Porto Alegre: Bookman, 2008. ISBN10: 85-7780-371-6, ISBN13: 9788577803712	Físico
1535	9788521205357	SALTZ, Ina. Design e tipografia: 100 fundamentos do design com tipos. São Paulo: Blucher, 2010. ISBN10: 85-212-0535-X, ISBN13: 9788521205357	Físico
1536	9788521206156	SPIEKERMAN, Erik. A Linguagem Invisível da Tipografia: Escolher, Combinar e Expressar com Tipos. São Paulo: Blucher, 2011. ISBN10: 85-212-0615-1, ISBN13:  9788521206156	Físico
1532	9788537808290	GARFIELD, Simon. Esse É Meu Tipo. Um Livro Sobre Fontes. 1 ed. Zahar, 2012. ISBN 8537808296. ISBN-13 9788537808290	Físico
1537	9788586695643	FARIAS, Priscila L. Tipografia Digital: o impacto das novas tecnologias. Rio de Janeiro: 2AB, 2013. ISBN10: 85-86695-64-5, ISBN13: 9788586695643	Físico
1538	8573939311	OLIVEIRA, Ulysses. Programando em C, v.2: A Biblioteca Padrao de C. Ciencia Moderna 1a. Edição. ISBN 8573939311	Físico
1539	9781461431428	JIMÉNEZ, Manuel.; PALOMERA, Rogelio. Introduction to Embedded Systems: Using Microcontrollers and the MSP430. Springer; 2014 edition. ISBN 978-1461431428	Físico
1540	0596005903	CORBET, Jonathan. Linux Device Drivers. Oreilly. 3a. Edição. ISBN 0596005903	Físico
1544	0133805913	STALLINGS, William. Operating Systems: Internals and Design Principles. Prentice Hall; 8a. Edição 2014. ISBN 0133805913	Físico
1541	193435662X	GRENNING, James W. Test Driven Development for Embedded C. Pragmatic Bookshelf; 1a edição. 2011. ISBN 193435662X	Físico
1542	1449302149	WHITE, Elecia. Making Embedded Systems: Design Patterns for Great Software. O'Reilly Media; 1a. Edição 2011. ISBN: 1449302149	Físico
1545	9780132830713	SAVITCH, Walter. C++ Absolute. Addison-Wesley; 5a. edição (Março, 2012). ISBN 9780132830713	Físico
1546	1842657828	GANGULY. A. K. Embedded Systems: Design, Programming and Applications. Alpha Science. ISBN 1842657828	Físico
1547	9788575224595	CYBIS, Walter de Abreu; BETIOL, Adriana Holtz.; FAUST, Richard. Ergonomia e usabilidade: conhecimentos, métodos e aplicações . 3. ed. São Paulo: Novatec, 2015. 496 p. ISBN: 9788575224595	Físico
1548	9780123852410	HARTSON, Rex; PYLA, Pardha S. The UX Book: Process and guidelines for ensuring a quality user experience. Elsevier, 2012. ISBN-10: 0123852412. ISBN-13: 9780123852410	Físico
1550	9780321815385	UNGER, Russ; CHANDLER, Carolyn. A Project Guide to UX Design: For user experience designers in the field or in the making. 2 ed. New Riders, 2012. ISBN-10: 0321815386 ISBN-13: 9780321815385	Físico
1551	9781848212589	PELACHAUD, Catherine. Emotion-Oriented Systems. London: Wiley-ISTE, 2011.  ISBN-10: 1848212585. ISBN-13: 9781848212589	Físico
1552	9788575223895	ZAKAS, Nicholas. Princípios de Orientação a Objetos em JavaScript. 1 ed. Novatec, 2014. 128 pg. ISBN 8575223895. ISBN-13 9788575223895	Físico
1553	9781500615994	COVERT, Abby. How to make sense of any mess: information architecture for everybody. CreateSpace Independent Publishing Platform, 2014, ISBN-10: 1-500-61599-4, ISBN-13: 9781500615994	Físico
1554	9780596527341	MORVILLE, Peter; ROSENFELD, Louis. Information Architecture for the World Wide Web: Designing Large-Scale Web Sites. Newton: O'Reilly Media, 2008, ISBN-10: 0-596-52734-9, ISBN-13: 9780596527341	Físico
1555	9788574190624	DUARTE, Fábio. Arquitetura e Tecnologias de Informação: da revolução industrial á revolução digital. São Paulo: Annablume Editora, 2007, ISBN-10: 8-574-19062-4, ISBN-13: 9788574190624	Físico
1556	9781449323172	HINTON, Andrew. Understanding Context: Environment, Language, and Information Architecture. Sebastopol: O’Reilly Media, 2015, ISBN-10: 1-449-32317-0, ISBN-13: 9781449323172	Físico
1557	9780956174062	SPENCER, Donna. A Practical Guide to Information Architecture. Penarth: Five Simple Steps LLP, 2010, ISBN-10: 0-956-17406-X, ISBN-13: 9780956174062	Físico
1558	9780321600806	WODTKE, Christina; GOVELLA, Austin. Information Architecture: Blueprints for the Web. Berkeley: New Riders, 2009, ISBN-10: 0-321-60080-0, ISBN-13: 9780321600806	Físico
1559	9780321616951	ZELDMAN, Jeffrey. MARCOTTE, Ethan. Designing with web standards. Berkeley: New Riders, 2009, ISBN-10: 0-321-61695-2, ISBN-13: 9780321616951	Físico
1560	9788530808181	MARSCARELLO, Fernando. História do cinema mundial. 7. ed. Campinas: Papirus, 2015. 432 p. (Coleção campo imagético) ISBN 8530808185 (broch.). ISBN- 13 9788530808181	Físico
1561	9788571109858	CAMPOS, Flávio de. Roteiro de cinema e televisão: a arte e a técnica de imaginar, perceber e narrar uma estória. 1. ed. Rio de Janeiro, RJ: Zahar, 2007. 408 p. ISBN 8571109850. ISBN-13 9788571109858	Físico
1562	9788577809004	CHONG, A. Animação digital. 1 ed. Porto Alegre: Bookman, 2011. 176p. (Coleção Animação Básica). ISBN 8577809005. ISBN-13 9788577809004	Físico
1563	9788539601615	LUCENA JÚNIOR, Alberto. Arte da animação: técnica e estética através da história. 3. Ed. São Paulo, SP: SENAC, 2011. ISBN: 8539601613 ISBN13: 9788539601615	Físico
1564	9788520923146	CARRIÈRE, Jean-Claude. A linguagem secreta do cinema. São Paulo: Saraiva De Bolso, 2014. ISBN-10: 8520923143. ISBN-13: 9788520923146	Físico
1565	9788598271354	RODRIGUES, Chris. O cinema e a produção. 3 ed. Rio de Janeiro, RJ: lamparina, 2007. 260 p. ISBN 8598271357. ISBN-13 9788598271354	Físico
1566	9788530807320	STAM, Robert. Introdução à teoria do cinema. 5. ed. Campinas, SP: Papirus, 2015. 400 p. ISBN10: 8530807324 ISBN-13: 9788530807320	Físico
1567	9788532307064	BALLERINI, F. Cinema brasileiro no século 21: reflexões de cineastas, produtores, distribuidores, exibidores, artistas, críticos e legisladores sobre os rumos da cinematografia nacional. 1 ed. São Paulo: Summus Editorial. 2012. ISBN 853230706X. ISBN-13 9788532307064	Físico
1573	9788579361098	BENYON, David. Interação humano-computador. 2. ed. São Paulo: Pearson, 2011. ISBN10: 8579361095. ISBN13: 9788579361098	Físico
1574	9783642086311	BORGHOFF, U. M.; SCHLICHTER, J. H. Computer-Supported Cooperative Work: introduction to distributed applications. 1 ed. Springer, 2010. 529 pg. ISBN10: 3642086314. ISBN13: 9783642086311	Físico
1575	9781852337186	CRABTREE, Andy. Designing Collaborative Systems: A Practical Guide to Ethnography (Computer Supported Cooperative Work). Londres: Springer-Verlag, 2003. ISBN10: 1852337184. ISBN13: 9781852337186	Físico
1576	9780471805991	PREECE, Jenny. Online communities: Designing usability and supporting sociability. Wiley, 2000. ISBN10: 0471805998. ISBN13: 9780471805991	Físico
1582	9788521203544	IIDA, Itiro. Ergonomia. São Paulo: Edgard Blucher, 2005, ISBN-10: 8-521-20354-3, ISBN-13: 9788521203544	Físico
1583	9788561556167	SANTA ROSA, José Guilherme; MORAES, Anamaria. Design participativo: técnicas para inclusão de usuários no processo de ergodesign de interfaces. Rio de Janeiro: Rio Book´s, 2012, ISBN 10:  8.561.55616.1. ISBN 13:  9788561556167	Físico
1584	9788576088509	KRUG, Steve. Não me faça pensar: uma abordagem do bom senso à navegabilidade na web. São Paulo: Marketbooks, 2014, ISBN-10: 8-576-08850-9, ISBN-13: 9788576088509	Físico
1585	9788586695490	MORAES, Anamaria de. Ergonomia: conceitos e Aplicações. Rio de Janeiro: 2AB Editora, 2010, ISBN-10: 8-586-69549-1, ISBN-13: 9788586695490	Físico
1586	9788586695469	SANTA ROSA, José Guilherme; MORAES, Anamaria. Avaliação e projeto no design de interfaces. Teresópolis: 2AB, 2010, ISBN-10: 8-586-69546-7, ISBN-13: 9788586695469	Físico
1587	9788532520838	NORMAN, Donald A. O Design do Dia-a-dia. Rio de Janeiro: Rocco, 2006, ISBN-10: 8-532-52083-9,  ISBN-13: 9788532520838	Físico
1588	9780465051366	NORMAN, Donald. Emotional Design: Why We Love (or Hate) Everyday Things. New York:Basic Books, 2004, ISBN-10: 0-465-05136-7, ISBN-13: 9780465051366	Físico
1589	9788573598841	HEDGECOE, John. O novo manual de fotografia: guia completo para todos os formatos. São Paulo: Editora SENAC SP, 4ª ed, 2009. ISBN10: 85-7359-884-0, ISBN13:9788573598841	Físico
1590	9788584520107	PRAKEL, David. Fundamentos da fotografia criativa. São Paulo: Gustavo Gili Brasil, 2ª ed, 2015. ISBN10: 8584520104, ISBN13: 9788584520107	Físico
1591	9788574583334	FATORELLI, Antônio. Fotografia contemporânea: Entre o cinema, o vídeo e as novas tecnologias. Rio de Janeiro: SENAC Nacional, 2013. ISBN10: 85-7458-333-2, ISBN13: 9788574583334	Físico
1592	9788573596236	ANG, Tom. Fotografia Digital: uma introdução. São Paulo: SENAC São Paulo, 2ª ed, 2012. ISBN10: 8573596236, ISBN13: 9788573596236	Físico
1593	9788530802462	DUBOIS, Philippe. O ato fotográfico e outros ensaios. Campinas, SP: Papirus, 14ª ed, 2015. ISBN10: 8530802462, ISBN13: 9788530802462	Físico
1594	9788579601002	ANG, Tom. Fotografia Digital Passo a Passo. 2 ed. Europa, 2012. 360 pg. ISBN 8579601002. ISBN-13 9788579601002	Físico
1595	9788574582801	MARTINS, Nelson. Fotografia: da analógica à digital. São Paulo: Editora SENAC SP, 2010. ISBN10: 8574582808, ISBN13: 9788574582801	Físico
1596	9788565985758	WEBB, Jeremy. O design da fotografia. São Paulo: Gustavo Gili Brasil, 2015. ISBN10: 85-65985-75-X, ISBN13: 9788565985758	Físico
1602	9788543004471	KOTLER, Philip; ARMSTRONG, Gary. Princípios de marketing. 15. ed. São Paulo, SP: Pearson Education do Brasil, 2015. ISBN 9788543004471	Físico
1603	9788575222751	ADOLPHO, C. Os 8 Ps do Marketing Digital. São Paulo: Novatec, 2011. ISBN: 9788575222751	Físico
1604	9788522499946	LAS CASAS, Alexandre Luzzi. Marketing De Nichos. São Paulo: Atlas, 2015. ISBN-10: 8522499942. ISBN-13: 9788522499946	Físico
1605	9788522453979	LAS CASAS, Alexandre Luzzi. Marketing: conceitos, exercicios, casos. 8.ed. São Paulo: Atlas, 2009. ISBN-10: 8522453977. ISBN-13: 9788522453979	Físico
1568	9788535262278	VIEIRA, Darli; BOURAS, Abdelaziz. Gestão de Projeto do Produto. 1 ed. Elsevier Acadêmico, 2012. 240 pg. ISBN 853526227X. ISBN-13 9788535262278	Físico
1569	9788555191091	TORRES, Joaquim. Gestão de produtos de software. 1 ed. Casa do código, 2015. 425 pg. ISBN-13 9788555191091	Físico
1570	9780061766084	BROWN, Tim. Change by Design: How Design Thinking Transforms Organizations and Inspires Innovation. 1 ed. HarperBusiness, 2009. 272 pg. ISBN 0061766089. ISBN-13: 9780061766084	Físico
1571	9788581780047	RIES, Eric; SZLAK, Carlos. A Startup Enxuta. 1 ed. LeYa, 2012. 288 pg. ISBN 8581780040. ISBN-13: 9788581780047	Físico
1572	9780231158381	LIEDTKA, Jeanne; OGILVIE, Tim. Designing for Growth: A Design Thinking Tool Kit for Managers. 1 ed. Columbia Business School Publishing, 2011. 227 pg. ISBN 0231158386. ISBN-13 9780231158381	Físico
1577	9788580500097	KNIGHT, Carolyn; GLASER, Jessica. Design gráfico e digital: Prática e ideias criativas. São Paulo: Rosari, 2012. ISBN10: 85-8050-009-5, ISBN13: 9788580500097	Físico
1578	9788540500983	CARDOSO, Rafael. Design para um mundo complexo. São Paulo: Cosac Naify, 2012. ISBN10: 85-405-0098-1, ISBN13: 9788540500983	Físico
1579	9788588343399	MOURA, Mônica (org.). Faces do Design 2: ensaios sobre arte, cultura visual, design gráfico e novas mídias. São Paulo: Rosari, 2009. ISBN10: 85-88343-39-8, ISBN13: 9788588343399	Físico
1580	9788580500202	SKOLOS, Nancy; WEDELL, Thomas. O processo do design gráfico: do problema à solução. São Paulo: Rosari, 2012. ISBN10: 85-8050-020-6, ISBN13: 9788580500202	Físico
1581	9788588343030	WOLLNER, Alexandre. Textos recentes e escritos históricos. São Paulo: Rosari, 2003. ISBN10: 85-88343-03-7, ISBN13: 9788588343030	Físico
1598	9781449363215	WRIGHT, Will; KOSTER, Raph. A Theory of Fun for Game Design. 2 ed. O'Reilly Media. 2013. ISBN 1449363210. ISBN-13: 9781449363215	Físico
1599	9781466598645	SCHELL, Jesse. The Art of Game Design: A book of lenses. 2 ed. CRC Press. 2014. ISBN 1466598646. ISBN-13: 9781466598645	Físico
1600	9781118877166	ROGERS, Scott. Level Up! the Guide to Great Video Game Design. 2 ed. John Wiley & Sons 2014. ISBN 1118877160. ISBN-13: 9781118877166 	Físico
1601	9788566250381	CÁSSIO, Éderson. Desenvolva jogos com HTML5 Canvas e JavaScript. Casa do código, 2014. ISBN 9788566250381	Físico
1610	9780240521176	BROOKER, Darren. Essential CG Lighting Techniques with 3ds Max. Oxford: Focal Press/Elsevier, 2008. ISBN-10: 024052117X ISBN-13: 9780240521176	Físico
1611	9780240814711	CHOPINE, Ami. 3D Art Essentials: The Fundamentals of 3D Modeling, Texturing, and Animation. Oxford: Focal Press, 2011. ISBN-10: 0240814711 ISBN-13: 9780240814711	Físico
1612	9780735709188	DEMERS, Owen. Digital Texturing & Painting. New York: New Riders, 2002. ISBN-10: 0735709181 ISBN-13: 9780735709188	Físico
1613	9781584500384	GALLARDO, Arnold. 3D Lighting: History, Concepts and Techniques. Rockland: Charles River Media, 2000. ISBN-10: 1584500387 ISBN-13: 9781584500384	Físico
1614	9780415719407	HUNTER, Fil; BIVER, Steve; FUQUA, Paul. Light: Science & Magic. 5 ed. New York: Focal Press/Elsevier, 2012. ISBN-10: 0415719402 ISBN-13: 9780415719407	Físico
1615	9788575223581	NUDELMAN, Greg. Padrões de Projeto Para o Android. 1 ed. Novatec, 2013. 456 pg. ISBN 8575223585. ISBN-13 9788575223581	Físico
1616	9781449379704	TIDWELL, Jenifer. Designing Interfaces. 2 ed. O'Reilly Media, 2011. 578 pg. ISBN 1449379702. ISBN-13 9781449379704	Físico
1617	9781449340384	LEVIN, Michal. Designing Multi-Device Experiences: An Ecosystem Approach to User Experiences Across Devices. 1 ed. O'Reilly Media, 2014. 305 pg. ISBN 1449340385. ISBN-13 9781449340384	Físico
1618	9781508893448	MCCALLISTER, Jonathan. Mobile Apps Made Simple: The Ultimate Guide to Quickly Creating, Designing and Utilizing Mobile Apps for Your Business. 2 ed. Createspace, 2014. 68 pg. ISBN 1508893446. ISBN-13 9781508893448	Físico
1619	9780133888218	DUTSON, Phil. Responsive Mobile Design: Designing for Every Device. 1 ed. Addison-Wesley Professional, 2014. 256 pg. ISBN 0133888215. ISBN-13 9780133888218	Físico
1621	9788566250237	LOPES, Sérgio. A Web Mobile Programe para um mundo de muitos dispositivos. 2 ed. Casa do código, 2014. 275 pg. ISBN 8566250230. ISBN-13 9788566250237	Físico
1622	9781449363635	NEIL, Theresa. Mobile Design Pattern Gallery: Ui Patterns for Smartphone Apps. 1 ed. O'Reilly Media, 2014. 408 pg. ISBN 1449363636. ISBN-13 9781449363635	Físico
1627	9781615192250	ALMOSSAWI, Ali; GIRALDO, Alejandro. An Illustrated Book of Bad Arguments Hardcover. 1 ed. The Experiment, 2014. 64 pg. ISBN 1615192255. ISBN-13 9781615192250	Físico
1628	9780544456860	MUNROE, Randall. What If?: Serious Scientific Answers to Absurd Hypothetical Questions. 1ed. Mariner Books, 2014. 320 pg. ISBN 0544456866. ISBN-13 9780544456860	Físico
1629	9781477532355	BAKER, Thomas. How to Coach a Debate Team (Volume 1). 1 ed. CreateSpace Independent Publishing Platform, 2012. 70 pg. ISBN-10: 1477532358. ISBN-13: 9781477532355	Físico
1429	9788575224533	MELO, Adriana; RICARDO Abelheira. Design Thinking & Thinking Design. São Paulo: Novatec, 2015. ISBN: 9788575224533	Físico
1389	9781440588334	CHRISTENSEN, Tanner. The Creativity Challenge: Design, Experiment, Test, Innovate, Build, Create, Inspire, and Unleash Your Genius. 1 ed. Adams Media, 2015. 208 pg. ISBN 1440588333. ISBN-13 9781440588334	Físico
510	9788535247589	DORNELAS, Jose Carlos Assis. Empreendedorismo: transformando idéiais em negócios . 4. ed. rev. atual. Rio de Janeiro, RJ: Elsevier, 2012. 260 p. ISBN: 9788535247589	Físico
299	9788577260270	RAMAKRISHNAN, Raghu; GEHRKE, Johannes. Sistemas de Gerenciamento de banco de dados. São Paulo, SP: McGraw-Hill, 2008. xxvii, 884 p. ISBN: 9788577260270	Físico
1630	1234567890123	Não solicitar mais livros para esta disciplina.	Físico
326	9788531405754	MASIERO, Paulo Cesar. Ética em computação. São Paulo, SP: EDUSP, 2008. 213 p. (Acadêmica ; 32) ISBN 9788531405754	Físico
1635	9780321796981	EDWARDS, C. Henry; PENNEY, David E.; CALVIS, David. Differential Equations and Boundary Value Problems: Computing and Modeling. 5. Ed,  2014, ISBN 9780321796981	Físico
480	857605065X	OLIVEIRA, Fátima Bayma. Tecnologia da informação e da comunicação: desafios e propostas estratégicas para o desenvolvimento dos negócios. São Paulo, SP: Prentice Hall, 2006. 240p. ISBN 857605065X.	Físico
1606	9788535269666	COBRA, Marcos. Administração de marketing no Brasil. 4. Ed. Rio de Janeiro: Elsevier, 2014. 560p. ISBN-10: 85-352-6966-5 ISBN-13: 9788535269666	Físico
1607	9788535284218	KIM, W. A Estratégia do Oceano Azul. 1 ed, Elsevier,2015. 312 pg. ISBN 8535284214. ISBN-13 9788535284218	Físico
1608	9788575223987	CAMARGO, Camila Porto de. Facebook Marketing: Tudo que você precisa saber para gerar negócios na maior rede social do mundo.  São Paulo: Novatec Editora, 2014. ISBN-13 9788575223987	Físico
1609	9788577260683	PETER, J. Paul; OLSON, Jerry C. Comportamento do Consumidor e Estratégia de Marketing. 8 ed. Porto Alegre: McGraw-Hill, 2009. 576p. ISBN: 9788577260683	Físico
1623	9788555190469	ALMEIDA, Flavio. Mean. Full stack JavaScript para aplicações web com MongoDB, Express, Angular e Node. 1 ed. Casa do código, 2015. 377 pg. ISBN 8555190460. ISBN-13 9788555190469	Físico
1624	9788575222669	STEFANOV, Stoyan. Padrões JavaScript. 1ed. Novatec, 2010. 240 pg. ISBN 857522266X. ISBN-13 9788575222669	Físico
1625	9781617290756	BENSON, Gregory; MIKOWSKI, Michael; POWELL, Josh. Single Page Web Applications: JavaScript End-To-End. 1 ed. Manning Publications, 2013. 407 pg. ISBN 1617290750. ISBN-13 9781617290756	Físico
1626	9781491950296	ELLIOTT, Eric. Programming JavaScript Applications: Robust Web Architecture with Node, HTML5, and Modern JS Libraries. 1ed. O'Reilly Media, 2014. 254 pg. ISBN 1491950293. ISBN-13 9781491950296	Físico
1631	9788537807163	BAUMAN, Zygmunt. A Ética é possível num mundo de consumidores? Rio de Janeiro: Zahar, 2011. ISBN-10: 8537807168. ISBN-13: 9788537807163	Físico
1632	9788522114269	BENNETT, Carole. Ética Profissional. 2 ed. Rio de Janeiro: Senac, 2012. (Série Profissional) ISBN-10: 8522114269. ISBN-13: 9788522114269	Físico
1634	9788598070247	FLEISHER, Soraya. SCHUCH,  Patrice (Orgs.) Ética e regulamentação na pesquisa antropológica. Brasília: LetrasLivres : Editora Universidade de Brasília, 2010. ISBN: 9788598070247. http://www.anis.org.br/livro/etica-e-regulamentacao-na-pesquisa-antropologica [recurso eletrônico]	Virtual
1633	9788598070209	DINIZ, Debora, SUGAI, Andréa, GUILHEM, Dirce, SQUINCA, Flávia (Orgs); Ética em pesquisa: temas globais. Brasília: LetrasLivres e Editora UnB, 2008. ISBN: 9788598070209. http://www.anis.org.br/livro/etica-em-pesquisa-temas-globais [recurso eletrônico]	Virtual
470	9788563308030	HILLIER, Frederick S.; LIEBERMAN, Gerald J. Introdução à pesquisa operacional. 8. ed. Porto Alegre: Bookman, 2010. 852 p. ISBN 9788563308030	Físico
1193	9780321815736	BASS, Len; CLEMENTS, Paul; KAZMAN, Rick. Software architecture in practice. 3rd ed. Upper Saddle River, NJ: Addison-Wesley, c2013. xix, 589 p. (SEI series in software engineering). ISBN 9780321815736 (enc.).	Físico
974	139788522108459	FEDELI, Ricardo Daniel.; POLLONI, Enrico Giulio Franco; PERES, Fernando Eduardo. Introdução à ciência da computação. 2. ed. atual. São Paulo, SP: Cengage Learning, 2010. xvi, 250 p. ISBN 139788522108459 (broch.)	Físico
375	853704582	IEZZI, Gelson; HAZZAN, Samuel. Fundamentos de matemática elementar: 4 : seqüências, matrizes, determinantes, sistemas . 7. ed. São Paulo, SP: Atual, 2004. 232 p. ISBN 853704582 (broch.).	Físico
1152	8575220861	JANDL JÚNIOR, Peter. Java 5: guia de consulta rápida. São Paulo: Novatec, 2006. 136 p. ISBN 8575220861 (broch.).	Físico
991	9788522470969	ROSSETTI, José Paschoal; ANDRADE, Adriana. Governança corporativa: fundamentos, desenvolvimento e tendências . 6. ed. atual. e ampl. São Paulo, SP: Atlas, 2012. 602 p. ISBN 9788522470969.	Físico
1636	0000000000213	FERREIRA, Mardson da Silva. Avaliação de soluções BPM para implantação de gestão de processos na Universidade Federal do Ceará Campus Quixadá. 2013. 60 f. TCC (graduação em Sistemas de Informação) - Universidade Federal do Ceará, Campus Quixadá, Quixadá, 2013. Disponível em: <http://www.repositoriobib.ufc.br/000012/00001269.pdf>. Acesso em: 4 set. 2014.	Virtual
1637	9788576801030	PAVANI JUNIOR, O.; SCUCUGLIA, R. Mapeamento e gestão por processos – BPM. São Paulo: M. Books, 2011. ISBN: 9788576801030	Físico
313	9788535212525	AZEVEDO, Eduardo.; CONCI, Aura. Computação gráfica: geração de imagens . v.1 Rio de Janeiro: Elsevier, Campus, c2003. 353 p. + 1 DVD ISBN 9788535212525 (broch.).	Físico
1638	1234567890432	Falta título_	Físico
211	8576080621	HORSTMANN, Cay S.; CORNELL, Gary. Core Java 2: volume I : fundamentos . Rio de Janeiro, RJ: Alta Books, c2005. viii, 580 p. ISBN 8576080621 (broch.).	Físico
1321	9788521205234	BURDEK, Bernhard E.. Design: história, teoria e prática do Design de produtos; tradução Freddy Van Camp. São Paulo: Edgard Blucher, 2ª edição. 2010. 496 p. ISBN: 9788521205234	Físico
1167	9788576911203	DOCÊNCIA universitária:  saberes e práticas em construção.   432 p. Belém, PA: Instituto Federal do Pará, Universidade da Amazônia, 2011.	Físico
1001	8570562667	IEZZI, Gelson; DOLCE, Osvaldo; MURAKAMI, Carlos. Fundamentos de matemática elementar, 2: logaritmos : 55 exercícios resolvidos, 352 exercícios propostos com resposta, 238 testes de vestibulares com resposta. 8. ed. São Paulo: Atual, 1993. 188 p. ISBN 8570562667	Físico
1639	1234567804	Falta título__	Físico
1640	1235465789	Falta título___	Físico
519	8521614004	MONTGOMERY, Douglas C. Introdução ao controle estatístico da qualidade. 4. ed. Rio de Janeiro, RJ: Livros Técnicos e Científicos, c2004. xiv, 513 p. ISBN 8521614004 (broch.).	Físico
149	9780471692089	BRAUDE, Eric J.; BERNSTEIN, Michael E. Software engineering: modern approaches. 2nd ed. Hoboken, N.J.: John Wiley & Sons, c2011. xvi, 782 p. ISBN 9780471692089 (enc.).	Físico
60	9788521615965	OLIFER, Natalia; OLIFER, Victor. Redes de computadores: princípios, tecnologias e protocolos para o projeto de redes . Rio de Janeiro: LTC, 2008. xvi, 576 p. ISBN 9788521615965 (broch.).	Físico
\.


--
-- Name: titulos_id_t_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('titulos_id_t_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id, cpf) FROM stdin;
1	12312312312
2	32132132132
3	12345678910
4	11111111199
5	00000000000
6	76875083353
7	60563903309
8	48924202472
9	89708440310
10	96949082304
11	91718562349
12	00884821382
13	02735438305
14	06053494364
15	04111162312
16	02735438309
17	77014308300
18	03306484970
19	95131922372
\.


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 1, false);


--
-- Name: acervodocumento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY acervodocumento
    ADD CONSTRAINT acervodocumento_pkey PRIMARY KEY (id_ad);


--
-- Name: bibliografias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bibliografias
    ADD CONSTRAINT bibliografias_pkey PRIMARY KEY (id_componente, id_titulo);


--
-- Name: curriculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY curriculo
    ADD CONSTRAINT curriculo_pkey PRIMARY KEY (id_c);


--
-- Name: curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_crs);


--
-- Name: componentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY componentes
    ADD CONSTRAINT componentes_pkey PRIMARY KEY (id_c);


--
-- Name: exemplarconflitante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exemplarconflitante
    ADD CONSTRAINT exemplarconflitante_pkey PRIMARY KEY (id_ef);


--
-- Name: exemplares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exemplares
    ADD CONSTRAINT exemplares_pkey PRIMARY KEY (id_e);


--
-- Name: integracao_curricular_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY integracao_curricular
    ADD CONSTRAINT integracao_curricular_pkey PRIMARY KEY (id_componente, id_curriculo);


--
-- Name: meta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY meta
    ADD CONSTRAINT meta_pkey PRIMARY KEY (id_mt);


--
-- Name: titulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY titulos
    ADD CONSTRAINT titulos_pkey PRIMARY KEY (id_t);


--
-- Name: uk_898atepo5gx8dqj60c07k766b; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT uk_898atepo5gx8dqj60c07k766b UNIQUE (cpf);


--
-- Name: uk_nbvcapk9uu3j8b59tor0pvsh2; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY meta
    ADD CONSTRAINT uk_nbvcapk9uu3j8b59tor0pvsh2 UNIQUE (nome);


--
-- Name: uk_q7bajv2sbno5q0qhl1jecj6wc; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exemplarconflitante
    ADD CONSTRAINT uk_q7bajv2sbno5q0qhl1jecj6wc UNIQUE (cod_ef);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: fk_1tmxfs9ljri58klhitjb5feg4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY integracao_curricular
    ADD CONSTRAINT fk_1tmxfs9ljri58klhitjb5feg4 FOREIGN KEY (id_componente) REFERENCES componentes(id_c);


--
-- Name: fk_81q8idg6ru2jejml0c2w0w934; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY integracao_curricular
    ADD CONSTRAINT fk_81q8idg6ru2jejml0c2w0w934 FOREIGN KEY (id_curriculo) REFERENCES curriculo(id_c);


--
-- Name: fk_a8on50ml0vfolr510by5igb0a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acervodocumento
    ADD CONSTRAINT fk_a8on50ml0vfolr510by5igb0a FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_cfrilqaeetvafd91296m5uhie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--




--
-- Name: fk_i9vo7th0sv2yt1jtvcw8wnfan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curriculo
    ADD CONSTRAINT fk_i9vo7th0sv2yt1jtvcw8wnfan FOREIGN KEY (id_curso) REFERENCES curso(id_crs);


--
-- Name: fk_s0b4rmty76ma7kdk22t36c6w8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exemplares
    ADD CONSTRAINT fk_s0b4rmty76ma7kdk22t36c6w8 FOREIGN KEY (id_titulo) REFERENCES titulos(id_t);


--
-- Name: fk_s5ciuds1t47cfptmbtqsp9a0i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bibliografias
    ADD CONSTRAINT fk_s5ciuds1t47cfptmbtqsp9a0i FOREIGN KEY (id_titulo) REFERENCES titulos(id_t);


--
-- Name: fk_t7xao48bkov9y3lfmc42v697y; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bibliografias
    ADD CONSTRAINT fk_t7xao48bkov9y3lfmc42v697y FOREIGN KEY (id_componente) REFERENCES componentes(id_c);


UPDATE componentes set tipo='DISCIPLINA';

UPDATE integracao_curricular set natureza='Obrigatória';

SELECT pg_catalog.setval(pg_get_serial_sequence('componentes', 'id_c'), (SELECT MAX(id_c) FROM componentes)+1);

SELECT pg_catalog.setval(pg_get_serial_sequence('curriculo', 'id_c'), (SELECT MAX(id_c) FROM curriculo)+1);

SELECT pg_catalog.setval(pg_get_serial_sequence('curso', 'id_crs'), (SELECT MAX(id_crs) FROM curso)+1);

SELECT pg_catalog.setval(pg_get_serial_sequence('exemplarconflitante', 'id_ef'), (SELECT MAX(id_ef) FROM exemplarconflitante)+1);

SELECT pg_catalog.setval(pg_get_serial_sequence('exemplares', 'id_e'), (SELECT MAX(id_e) FROM exemplares)+1);

SELECT pg_catalog.setval(pg_get_serial_sequence('meta', 'id_mt'), (SELECT MAX(id_mt) FROM meta)+1);

SELECT pg_catalog.setval(pg_get_serial_sequence('titulos', 'id_t'), (SELECT MAX(id_t) FROM titulos)+1);

SELECT pg_catalog.setval(pg_get_serial_sequence('usuario', 'id'), (SELECT MAX(id) FROM usuario)+1);

--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

