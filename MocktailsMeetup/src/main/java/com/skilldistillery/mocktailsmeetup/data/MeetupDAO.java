package com.skilldistillery.mocktailsmeetup.data;

import com.skilldistillery.mocktailsmeetup.entities.Meetup;

public interface MeetupDAO {
	Meetup findById(int meetupId);
}
