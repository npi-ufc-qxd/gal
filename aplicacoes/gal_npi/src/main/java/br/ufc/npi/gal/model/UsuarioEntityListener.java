package br.ufc.npi.gal.model;

import java.util.Optional;

import javax.persistence.PostLoad;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import br.ufc.quixada.npi.ldap.model.Usuario;
import br.ufc.quixada.npi.ldap.service.UsuarioService;

public class UsuarioEntityListener {
	private Usuario usuario;
	
	@PostLoad
	public void loadUsuario(br.ufc.npi.gal.model.Usuario user) {
		@SuppressWarnings("resource")
		Usuario aux = new Usuario();
		BeanFactory context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UsuarioService usuarioService = (UsuarioService) context.getBean(UsuarioService.class);
		usuario = usuarioService.getByCpf(user.getCpf());
		
		if(usuario!=null) {
			user.setEmail(usuario.getEmail());
			user.setNome(usuario.getNome());
			user.setSiape(usuario.getSiape());
		} else {
			user.setNome(user.getCpf());
		}
	}

}
