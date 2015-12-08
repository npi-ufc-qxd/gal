package br.ufc.npi.gal.repository.jpa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;

import br.ufc.npi.gal.model.Disciplina;
import br.ufc.npi.gal.repository.DisciplinaRepository;
import br.ufc.quixada.npi.enumeration.QueryType;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

@Named
public class JpaDisciplinaRepository extends JpaGenericRepositoryImpl<Disciplina> implements DisciplinaRepository {

	@Override
	public Disciplina getDisciplinaByNome(String nome) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("nome", nome);
		List<Disciplina> result = find(QueryType.JPQL, "from Disciplina where nome = :nome", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public Disciplina getDisciplinaByCodigo(String codigo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("codigo", codigo);
		List<Disciplina> result = find(QueryType.JPQL, "from Disciplina where codigo = :codigo", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public Disciplina getOutraDisciplinaByNome(Integer id, String nome) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("nome", nome);
		params.put("id", id);
		List<Disciplina> result = find(QueryType.JPQL, "from Disciplina where id != :id and nome = :nome", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public Disciplina getOutraDisciplinaByCodigo(Integer id, String codigo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("codigo", codigo);
		params.put("id", id);
		List<Disciplina> result = find(QueryType.JPQL, "from Disciplina where id != :id and codigo = :codigo", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	public List<Disciplina> getTodasDisciplinas(){
		List<Disciplina> result = find(QueryType.JPQL, "from Disciplina order by nome asc", null);
		if(result != null && !result.isEmpty()) {
			return result;
		}
		return null;
	}
}
