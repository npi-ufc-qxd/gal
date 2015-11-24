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

import br.ufc.quixada.npi.ldap.model.Constants;
import br.ufc.quixada.npi.ldap.model.Usuario;
import br.ufc.quixada.npi.ldap.service.UsuarioService;

public class LdapAuthentication implements AuthenticationProvider{
	
	@Inject
	private UsuarioService usuarioService;
	
	@Inject
	private UsuarioServiceGal usuarioServiceGal;

	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {
		Boolean usuarioValido;
		String username = authentication.getName();
        String password = (String) authentication.getCredentials();
        
        Usuario user = usuarioService.getByCpf(username);
        
        Collection<? extends GrantedAuthority> authorities = user.getAffiliations();
        System.out.println(authentication.getAuthorities()+ " " + user.getAuthorities().toString() + " "+ usuarioService.autentica(username, password));
        
        for (GrantedAuthority grantedAuthority : authorities) {
        	usuarioValido = true;
            if (grantedAuthority.getAuthority().equals("BIBLIOTECARIO") || grantedAuthority.getAuthority().equals("COORDENADOR_CURSO")) {
            	usuarioValido = true;
                break;
            }
        }
        
        if (user == null || !usuarioService.autentica(username, password) || authorities.isEmpty()) {
        	System.out.println("lol");
        	throw new BadCredentialsException(LOGIN_INVALIDO);
        }
		
        
        return new UsernamePasswordAuthenticationToken(user, password, authorities);
	}

	@Override
	public boolean supports(Class<?> arg0) {
		return true;
	}

}
