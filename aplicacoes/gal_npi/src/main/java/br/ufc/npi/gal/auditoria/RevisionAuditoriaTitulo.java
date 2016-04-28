package br.ufc.npi.gal.auditoria;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.envers.RevisionEntity;
import org.hibernate.envers.RevisionNumber;
import org.hibernate.envers.RevisionTimestamp;

@Entity
@Table(name="revisionauditoriatitulo")
@RevisionEntity(InformacoeRevisaoTitulo.class)
public class RevisionAuditoriaTitulo{
    @Id
    @GeneratedValue
    @RevisionNumber
	private int id;
    
    @RevisionTimestamp
    private long timestemp;
    
    private String username;

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}