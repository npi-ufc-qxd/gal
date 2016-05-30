-- Remove restrição de semestre de oferta menor que 11
ALTER TABLE integracao_curricular DROP CONSTRAINT integracao_curricular_semestre_oferta_check1;