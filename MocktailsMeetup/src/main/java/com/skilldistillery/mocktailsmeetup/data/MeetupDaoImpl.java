package com.skilldistillery.mocktailsmeetup.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mocktailsmeetup.entities.Meetup;

@Service
@Transactional
public class MeetupDaoImpl implements MeetupDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Meetup findById(int meetupId) {
		return em.find(Meetup.class, meetupId);
	}

}
