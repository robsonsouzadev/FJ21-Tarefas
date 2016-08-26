package br.com.caelum.tarefas.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.caelum.tarefas.modelo.Tarefa;

public class BuscaTarefas {
	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("tarefas");
		EntityManager manager = factory.createEntityManager();

		Query query = manager.createQuery("select t from Tarefa as t where t.finalizado = :finalizado");
		query.setParameter("finalizado", true);

		List<Tarefa> lista = query.getResultList();

		for (Tarefa tarefa : lista) {
			System.out.println(tarefa.getDescricao());
		}

		manager.close();
	}
}