package com.skilldistillery.mocktailsmeetup.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Address {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private Integer id;
	
	@Column
	private String street;
	
	@Column
	private String city;
	
	
	@Column(name="state_abbr")
	private String stateAbbr;
	
	@Column(name="postal_code")
	private String postalCode;
	
// ----- END Fields -----------------------------
	
	public Address() {
		super();
	}
	
// --- END no-arg Constructor----------------- 	
	

	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
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
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", street=" + street + ", city=" + city + ", stateAbbr=" + stateAbbr
				+ ", postalCode=" + postalCode + "]";
	}
	
	
	
}
