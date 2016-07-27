CREATE TABLE IF NOT EXISTS revisionauditoriatitulo
(
  id integer NOT NULL,
  timestemp bigint NOT NULL,
  username character varying(255),
  mudanca character varying(255),
  data timestamp without time zone,
  CONSTRAINT revisionauditoriatitulo_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS titulos_aud
(
  id_t integer NOT NULL,
  rev integer NOT NULL,
  revtype smallint,
  autor character varying(255),
  cadastrado_biblioteca boolean,
  edicao character varying(255),
  isbn character varying(13),
  nome_titulo character varying(255),
  pagina character varying(255),
  publicador character varying(255),
  ref_artigo character varying(255),
  sub_titulo character varying(255),
  tipo_titulo character varying(255),
  titulo character varying(255),
  titulo_revista character varying(255),
  titulo_n character varying(255),
  CONSTRAINT titulos_aud_pkey PRIMARY KEY (id_t, rev),
  CONSTRAINT fk_np8n415y2lo20ptg9hhv4ey97 FOREIGN KEY (rev)
      REFERENCES revisionauditoriatitulo (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);