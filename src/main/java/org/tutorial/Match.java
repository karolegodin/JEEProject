package org.tutorial;

public class Match {

	// Variables de classe
	private int id;
	private String nom_joueur1;
	private String nom_joueur2;
	private String date;
	private int court;
	
	public Match(int idmatch, String nom1, String nom2, String date, int court) {
		this.id = idmatch;
		this.nom_joueur1= nom1;
		this.nom_joueur2 = nom2;
		this.date= date;
		this.court= court;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom_joueur1() {
		return nom_joueur1;
	}
	public void setNom_joueur1(String id_joueur1) {
		this.nom_joueur1 = id_joueur1;
	}
	public String getNom_joueur2() {
		return nom_joueur2;
	}
	public void setNom_joueur2(String id_joueur2) {
		this.nom_joueur2 = id_joueur2;
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
