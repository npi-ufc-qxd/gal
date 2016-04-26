package br.ufc.npi.gal.auditoria;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.envers.DefaultRevisionEntity;
import org.hibernate.envers.RevisionEntity;

@Entity
@RevisionEntity(InformacoeRevisaoTitulo.class)
public class AuditoriaTitulo extends DefaultRevisionEntity{
	@Id
    private static final long serialVersionUID = 0829486158L;

    private String username;

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}