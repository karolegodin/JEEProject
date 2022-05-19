package org.tutorial;

public class Player {

	// Variables de classe

	private String first_name;
	private String last_name;
	private String category;
	private String country;
	private int world_rank;
	private String main_hand;
	private int age;
	private int NbMatchesRemportes;
	private int DureeJeu;
	private int NbJeuxGagnes;
	private int NbSetsPerdus;
	private int NbMatchesPerdus;

	// Constructor
	public Player(String f_name, String l_name, String cat, String country, int w_rank, String m_hand, int age){
		this.first_name=f_name;
		this.last_name=l_name;
		this.category=cat;
		this.country=country;
		this.world_rank=w_rank;
		this.main_hand=m_hand;
		this.age=age;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
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
	public String getMain_hand() {
		return main_hand;
	}
	public void setMain_hand(String main_hand) {
		this.main_hand = main_hand;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	// Nombre de matches remportés
		public int getNbMatchesRemportes()
		{
			return NbMatchesRemportes;
		}
		public void setNbMatchesRemportes(int NbMatchesRemportes)
		{
			this.NbMatchesRemportes = NbMatchesRemportes;
		}
		
		// Durée totale de jeu
		public int getDureeJeu()
		{
			return DureeJeu;
		}
		public void setDureeJeu(int DureeJeu)
		{
			this.DureeJeu = DureeJeu;
		}
		
		// Nombre de jeux gagnés
		public int getNbJeuxGagnes()
		{
			return NbJeuxGagnes;
		}
		public void setNbJeuxGagnes(int NbJeuxGagnes)
		{
			this.NbJeuxGagnes = NbJeuxGagnes;
		}
		
		// Nombre de sets perdus
		public int getNbSetsPerdus()
		{
			return NbSetsPerdus;
		}
		public void setNbSetsPerdus(int NbSetsPerdus)
		{
			this.NbSetsPerdus = NbSetsPerdus;
		}
		
		// Nombre de matches perdus
		public int getNbMatchesPerdus()
		{
			return NbMatchesPerdus;
		}
		public void setNbMatchesPerdus(int NbMatchesPerdus)
		{
			this.NbMatchesPerdus = NbMatchesPerdus;
		}

	
}
