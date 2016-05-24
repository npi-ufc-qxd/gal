package br.ufc.npi.gal.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.envers.RevisionEntity;
import org.hibernate.envers.RevisionNumber;
import org.hibernate.envers.RevisionTimestamp;

import br.ufc.npi.gal.auditoria.InformacoeRevisao;

@Entity
@Table(name="revisionauditoriatitulo")
@RevisionEntity(InformacoeRevisao.class)
public class RevisionAuditoria{
	@Id
    @GeneratedValue
    @RevisionNumber
	private int id;
    
    @RevisionTimestamp
    private long timestemp;
    
    private String username;
    
    private Date data;
    
    private String mudanca;
    
    public int getId() {
		return id;
	}

	public String getMudanca() {
		return mudanca;
	}

	public void setMudanca(String mudanca) {
		this.mudanca = mudanca;
	}

	public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public long getTimestemp() {
		return timestemp;
	}

	public void setTimestemp(long timestemp) {
		this.timestemp = timestemp;
	}

	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public void conversao(){
		this.data = new Date(this.timestemp);
	}
}