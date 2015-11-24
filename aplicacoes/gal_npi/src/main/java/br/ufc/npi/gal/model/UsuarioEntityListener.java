package br.ufc.npi.gal.model;

import java.util.Optional;

import javax.persistence.PostLoad;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import br.ufc.quixada.npi.ldap.model.Usuario;
import br.ufc.quixada.npi.ldap.service.UsuarioService;

public class UsuarioEntityListener implements ApplicationContextAware {
	private Usuario usuario;
	
	private static ApplicationContext context;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@PostLoad
	public void loadUsuario(Usuario user) {
		context.getAutowireCapableBeanFactory().autowireBean(this);
		Usuario usuario = usuarioService.getByCpf(user.getCpf());
		
		if(usuario!=null) {
			user.setEmail(usuario.getEmail());
			user.setNome(usuario.getNome());
			user.setSiape(usuario.getSiape());
		} else {
			user.setNome(user.getCpf());
		}
	}
	
	public ApplicationContext getApplicationContext() {
        return context;
    }

	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		context = applicationContext;
		
	}

}
