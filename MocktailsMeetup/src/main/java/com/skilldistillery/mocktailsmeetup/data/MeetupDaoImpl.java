package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

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

	@Override
	public Meetup updateMeetup(int id, Meetup meetup) {
		Meetup updated = em.find(Meetup.class, id);
		updated.setTitle(meetup.getTitle());
		updated.setDescription(meetup.getDescription());
		updated.setMeetupDate(meetup.getMeetupDate());
		updated.setStartTime(meetup.getStartTime());
		updated.setEndTime(meetup.getEndTime());
		updated.setMaxAttendees(meetup.getMaxAttendees());
//		updated.setAddress(meetup.getAddress());
		
		return updated;
	}
	
	@Override
	public boolean deleteMeetup(int id) {
		
		boolean isDeleted = false;
		Meetup meetup = em.find(Meetup.class, id);
		if (meetup != null) {
			em.remove(meetup);
		}
		em.flush();
		isDeleted = !em.contains(meetup);
		
		return isDeleted;
	}
	
	@Override
	public List<Meetup> findAll() {
		String jpql = "SELECT m FROM Meetup m";
		return em.createQuery(jpql, Meetup.class).getResultList();

	}
	
	public Meetup createYourOwn(Meetup meetup) {
		em.persist(meetup);
		return meetup;
	}

	@Override
	public Meetup createMeetup(Meetup meetup) {
		System.out.println(meetup.getAddress() + " " + meetup.getOwner());
		em.persist(meetup.getAddress());
		em.persist(meetup);
		return em.find(Meetup.class, meetup.getId());
	}
	
	
}
