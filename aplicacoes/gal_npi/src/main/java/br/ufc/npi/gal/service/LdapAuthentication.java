package br.ufc.npi.gal.service;

import static br.ufc.quixada.npi.ldap.model.Constants.LOGIN_INVALIDO;

import java.util.Collection;

import javax.inject.Inject;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;

import br.ufc.npi.gal.model.Usuario;

import br.ufc.quixada.npi.ldap.model.Constants;
import br.ufc.quixada.npi.ldap.service.UsuarioService;

public class LdapAuthentication implements AuthenticationProvider{
	
	@Inject
	private UsuarioService usuarioService;
	
	@Inject
	private UsuarioServiceGal usuarioServiceGal;

	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {
		String username = authentication.getName();
        String password = (String) authentication.getCredentials();
        
        br.ufc.quixada.npi.ldap.model.Usuario user = usuarioService.getByCpf(username);
        
        Collection<? extends GrantedAuthority> authorities = user.getAffiliations();
        
        if (user == null || !usuarioService.autentica(username, password) || authorities.isEmpty()) {
        	throw new BadCredentialsException(LOGIN_INVALIDO);
        }
        
        RegistrarUsuario(user);
        
        return new UsernamePasswordAuthenticationToken(user, password, authorities);
	}

	private void RegistrarUsuario(br.ufc.quixada.npi.ldap.model.Usuario user) {
		if(usuarioServiceGal.getUsuarioByLogin(user.getCpf())==null) {
			Usuario usuario = new Usuario();
			usuario.setCpf(user.getCpf());
			usuario.setEmail(user.getEmail());
			usuario.setNome(user.getNome());
			usuario.setSiape(user.getSiape());
			usuarioServiceGal.save(usuario);
		}
	}

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return true;
	}

}
