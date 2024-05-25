package com.user.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.user.dto.User;

public class UserDao {
	
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("swarup");
	
	EntityManager em = emf.createEntityManager();
	
	EntityTransaction et = em.getTransaction();
	
	public void saveUser(User u)
	{	
		et.begin();
		em.persist(u);
		et.commit();
	}
	
	public User fetchUserByEmailAndPassword(String email, String password)
	{
		
		Query query = em.createQuery("select s from User s where s.email = ?1 and s.password = ?2");
		
		query.setParameter(1, email);
		query.setParameter(2, password);
		
		List<User> user = query.getResultList();
		
		if(user.size() != 0)
		{
			return user.get(0);
		}
	
		return null;
	}
	
	public User fetchUserById(int id)
	{
		
		User user = em.find(User.class, id);
		
		return user;
	}
	
	public List<User> fetchAllUser()
	{
		
		Query query = em.createQuery("select s from User s");
		
		List<User> users = query.getResultList();
		
		return users;
	}
	
	public void updateUserById(User user)
	{
		
		et.begin();
		em.merge(user);
		et.commit();
	}
	
	public void updateUserPasswordById(int id, String password)
	{
		
		User user = em.find(User.class, id);
		
		user.setPassword(password);
		
		et.begin();
		em.merge(user);
		et.commit();
	}
	
	public void deleteUserById(int id)
	{
		User user = em.find(User.class, id);
		
		et.begin();
		em.remove(user);
		et.commit();
	}
}
