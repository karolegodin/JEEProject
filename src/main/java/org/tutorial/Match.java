package org.tutorial;
import java.util.*;


public class Match {

	// Variables de classe
	private int id;
	private String nom_joueur1;
	private String nom_joueur2;
	private Date date;
	private String duree;
	private String heure;
	private int court;
	private String status;
	private String score;
	
	public Match(int idmatch, String nom1, String nom2, Date date, String duree, String heure, int court, String score, String status) {
		this.id = idmatch;
		this.nom_joueur1= nom1;
		this.nom_joueur2 = nom2;
		this.date= date;
		this.duree = duree;
		this.heure = heure;
		this.court= court;
		this.score=score;
		this.status=status;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getCourt() {
		return court;
	}
	public void setCourt(int court) {
		this.court = court;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDuree() {
		return duree;
	}

	public void setDuree(String duree) {
		this.duree = duree;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getHeure() {
		return heure;
	}

	public void setHeure(String heure) {
		this.heure = heure;
	}
	
	
}
