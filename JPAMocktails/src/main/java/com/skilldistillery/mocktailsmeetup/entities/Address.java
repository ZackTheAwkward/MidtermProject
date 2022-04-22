package com.skilldistillery.mocktailsmeetup.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Address {
<<<<<<< HEAD
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private Integer id;
	
	@Column
	private String street;
	
	@Column
	private String city;
	
=======

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String street;
	
	
	private String city;
>>>>>>> 31b692b508eabadf97e3336ae53ed6ba89e9a939
	
	@Column(name="state_abbr")
	private String stateAbbr;
	
	@Column(name="postal_code")
	private String postalCode;
	
<<<<<<< HEAD
// ----- END Fields -----------------------------
	
=======

>>>>>>> 31b692b508eabadf97e3336ae53ed6ba89e9a939
	public Address() {
		super();
	}
	
<<<<<<< HEAD
// --- END no-arg Constructor----------------- 	
	

	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
=======
	

	@Override
	public String toString() {
		return "Address: " + street + ", " + city + ", " + stateAbbr + ", " + postalCode;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
>>>>>>> 31b692b508eabadf97e3336ae53ed6ba89e9a939
		this.id = id;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getStateAbbr() {
		return stateAbbr;
	}

	public void setStateAbbr(String stateAbbr) {
		this.stateAbbr = stateAbbr;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Address other = (Address) obj;
<<<<<<< HEAD
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", street=" + street + ", city=" + city + ", stateAbbr=" + stateAbbr
				+ ", postalCode=" + postalCode + "]";
=======
		return id == other.id;
>>>>>>> 31b692b508eabadf97e3336ae53ed6ba89e9a939
	}
	
	
	
<<<<<<< HEAD
=======
	
	
>>>>>>> 31b692b508eabadf97e3336ae53ed6ba89e9a939
}
