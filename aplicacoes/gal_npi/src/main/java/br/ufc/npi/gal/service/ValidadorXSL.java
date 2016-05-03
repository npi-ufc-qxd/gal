package br.ufc.npi.gal.service;

import org.springframework.web.multipart.MultipartFile;

import jxl.Sheet;

public interface ValidadorXSL {

	public abstract boolean isEmpty(MultipartFile multipartFile);
	
	public abstract boolean isXLS(MultipartFile multipartFile);
	
	public boolean dadosValidos(Sheet sheet);
}
