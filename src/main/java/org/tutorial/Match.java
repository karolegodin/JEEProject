package org.tutorial;

public class Match {

	// Variables de classe
	private int id;
	private int id_joueur1;
	private int id_joueur2;
	private String date;
	private int court;
	
	public Match(int idmatch, int id1, int id2, String date, int court) {
		this.id = idmatch;
		this.id_joueur1= id1;
		this.id_joueur2 = id2;
		this.date= date;
		this.court= court;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_joueur1() {
		return id_joueur1;
	}
	public void setId_joueur1(int id_joueur1) {
		this.id_joueur1 = id_joueur1;
	}
	public int getId_joueur2() {
		return id_joueur2;
	}
	public void setId_joueur2(int id_joueur2) {
		this.id_joueur2 = id_joueur2;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getCourt() {
		return court;
	}
	public void setCourt(String court) {
		court = court;
	}
	
	
}
