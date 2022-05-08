package org.tutorial;

public class Player {

	// Variables de classe
	private int id;
	private String first_name;
	private String last_name;
	private boolean category;
	private String country;
	private int world_rank;
	private boolean main_hand;
	private int age;
	
	// Constructor
	public Player(int id, String f_name, String l_name, boolean cat, String country, int w_rank, boolean m_hand, int age){
		this.id=id;
		this.first_name=f_name;
		this.last_name=l_name;
		this.category=cat;
		this.country=country;
		this.world_rank=w_rank;
		this.main_hand=m_hand;
		this.age=age;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public boolean isCategory() {
		return category;
	}
	public void setCategory(boolean category) {
		this.category = category;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getWorld_rank() {
		return world_rank;
	}
	public void setWorld_rank(int world_rank) {
		this.world_rank = world_rank;
	}
	public boolean getMain_hand() {
		return main_hand;
	}
	public void setMain_hand(boolean main_hand) {
		this.main_hand = main_hand;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
}
