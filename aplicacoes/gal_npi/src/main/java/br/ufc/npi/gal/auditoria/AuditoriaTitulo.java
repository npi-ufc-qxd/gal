package br.ufc.npi.gal.auditoria;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.envers.DefaultRevisionEntity;
import org.hibernate.envers.RevisionEntity;
import org.hibernate.envers.RevisionNumber;
import org.hibernate.envers.RevisionTimestamp;


@Entity
@RevisionEntity(InformacoeRevisaoTitulo.class)
public class AuditoriaTitulo extends DefaultRevisionEntity{
	@RevisionNumber
	@Id
	@GeneratedValue
	private int id;
	@RevisionTimestamp
	Date data;
}
