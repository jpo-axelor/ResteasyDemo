package com.axelor.RestDemo.db;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Contact implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "contact_id")
	private Integer id;

	private String name;

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "contact_id") // Unidirectional Mapping
	private List<Phone> phone = new ArrayList<Phone>();

	@OneToOne(mappedBy ="contact" , cascade = CascadeType.ALL)
	private Book book;

	// Constructors
	public Contact() {
	}

	public Contact(String name, List<Phone> phone) {
		this.name = name;
		this.phone = phone;
	}

	public Contact(String name, List<Phone> phone, Book book) {
		super();
		this.name = name;
		this.phone = phone;
		this.book = book;
	}

// Getters n Setters
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Phone> getPhone() {
		return phone;
	}

	public void setPhone(List<Phone> phone) {
		this.phone = phone;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	

}
