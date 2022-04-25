package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import com.skilldistillery.mocktailsmeetup.entities.Meetup;

public interface MeetupDAO {
	Meetup findById(int meetupId);

	Meetup updateMeetup(int id, Meetup meetup);

	boolean deleteMeetup(int id);

	List<Meetup> findAll();
}
