CREATE TABLE bibliografias_aud
(
  id_componente integer NOT NULL,
  id_titulo integer NOT NULL,
  rev integer NOT NULL,
  revtype smallint,
  prioridade integer,
  tipo_bibliografia character varying(255),
  CONSTRAINT bibliografias_aud_pkey PRIMARY KEY (id_componente, id_titulo, rev),
  CONSTRAINT fk_j848g65gwlo0u87frj9xm7qoo FOREIGN KEY (id_titulo)
      REFERENCES titulos (id_t) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_jio5ggb5lrcfhmtdnh9yryg1j FOREIGN KEY (rev)
      REFERENCES revisionauditoriatitulo (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT uk_81al5asr4enwcd8sgx1bk7uy6 UNIQUE (rev)
);