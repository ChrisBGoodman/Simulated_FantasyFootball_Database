import java.util.HashMap;


public class Kicker {
	private String PID;
	private String Fname;
	private String Lname;
	private String Team;
	private String Pos;
	
	private String Result;
	private String Opposition;
	
	private int stats[];
	private double points;
	private int week;
	
	private HashMap<String, String> teams;
	
	public Kicker(){
		initVars();
		initHashMap();
	}
	
	public void initVars(){
		PID = new String();
		Fname = new String();
		Lname = new String();
		Team = new String();
		Pos = new String();
		Result = new String();
		Opposition = new String();
		stats = new int[10];
		week = 0;
		points = 0;
	}
	
	public void initHashMap(){
		teams = new HashMap<String, String>();
		
		teams.put("SF", "San Francisco 49ers");
		teams.put("Chi", "Chicago Bears");
		teams.put("Cin", "Cincinnati Bengals");
		teams.put("Buf", "Buffalo Bills");
		teams.put("Den", "Denver Broncos");
		teams.put("Cle", "Cleveland Browns");
		teams.put("TB", "Tampa Bay Buccaneers");
		teams.put("Ari", "Arizona Cardinals");
		teams.put("SD", "San Diego Chargers");
		teams.put("KC", "Kansas City Chiefs");
		teams.put("Ind", "Indianappolis Colts");
		teams.put("Dal", "Dallas Cowboys");
		teams.put("Mia", "Miami Dolphins");
		teams.put("Phi", "Philadelphia Eagles");
		teams.put("Atl", "Atlanta Falcons");
		teams.put("NYG", "New York Giants");
		teams.put("Jax", "Jacksonville Jaguars");
		teams.put("NYJ", "New York Jets");
		teams.put("Det", "Detroit Lions");
		teams.put("GB", "Green Bay Packers");
		teams.put("Car", "Carolina Panthers");
		teams.put("NE", "New England Patriots");
		teams.put("Oak", "Oakland Raiders");
		teams.put("StL", "St. Louis Rams");
		teams.put("Bal", "Baltimore Ravens");
		teams.put("Was", "Washington Redskins");
		teams.put("NO", "New Orleans Saints");
		teams.put("Sea", "Seattle Seahawks");
		teams.put("Pit", "Pittsburgh Steelers");
		teams.put("Hou", "Houston Texans");
		teams.put("Ten", "Tenessee Titans");
		teams.put("Min", "Minnesota Vikings");
	}
	
	public void setIDNTP(String s, int i){
		//System.out.println("Name Marker Encountered");
		
		String value = new String("");
			
		//GetID
		while(Character.isDigit(s.charAt(i))){
			value = value.concat(Character.toString(s.charAt(i)));
			i++;
		}
		
		PID = value;
		//Find Next Value in Line
		int j = 0;

		while(j < 2){
			value = "";
				
			while(i < s.length() && s.charAt(i) != '>') i++;
			
			i++;
			
			while(i < s.length() && s.charAt(i) != '<'){
				value = value.concat(Character.toString(s.charAt(i)));
				i++;
			}
			
			if(!((value.equals("")) || (value.equals(" ")))){
				if(j == 0){
					Fname = Character.toString(value.charAt(0));
					int k = 1;
					while(value.charAt(k) != ' ') k++;
					k++;
					Lname = value.substring(k, value.length());
				}
				else{
					int k = 0;
					while(value.charAt(k) != ' '){
						Team = Team.concat(Character.toString(value.charAt(k)));
						k++;
					}
					
					Team = teams.get(Team);
					
					while(value.charAt(k) == ' ' || value.charAt(k) == '-') k++;
					Pos = value.substring(k, value.length());
				}
				j++;
			}
		}
		
		//output.format("%s", " Namecheck Finished! ");
	}
	
	public int setResultOpp(String s, int i){
		
		//System.out.println("Opposition Marker Encountered");
		int j = 0;
		
		while(j < 3){
			String value = new String("");
				
			while(i < s.length() && s.charAt(i) != '>') i++;
			
			i++;
			
			while(i < s.length() && s.charAt(i) != '<'){
				value = value.concat(Character.toString(s.charAt(i)));
				i++;
			}
			
			if(!((value.equals("")) || (value.equals(" ")))){
				if(j == 0){
					//System.out.print(value + " ");
					if(value.equals(" Bye")) return(-1);
					else Result = value;
				}
				else if(j == 2){
					//System.out.print(value + " ");
					Opposition = teams.get(value);
				}
		
				j++;
			}
		}
		return(1);
		//output.format("%s", " OppCheck Finished! ");
	}
	
	public int setStats(String s, int i){
		
		//System.out.println("Stat Marker Encountered");
		int j = 0;
		while(j < 10){
			
			String value = new String("");
				
			while(i < s.length() && s.charAt(i) != '>') i++;
			
			i++;
			
			while(i < s.length() && s.charAt(i) != '<'){
				value = value.concat(Character.toString(s.charAt(i)));
				i++;
			}
			
			if(!((value.equals("")) || (value.equals(" ")))){
				if(j == 0){
					if(value.equals("-") || value.equals("0.00")) return(-1);
					else points = Double.parseDouble(value);
				}
				else if(j == 1){
					int k = 0;
					String st = new String("");
					while(Character.isDigit(value.charAt(k))){
						st = st.concat(Character.toString(value.charAt(k)));
						k++;
					}
					if(value.equals("-")) stats[j] = 0;
					else stats[j] = Integer.parseInt(st);
				}
				else{
					if(value.equals("-")) stats[j] = 0;
					else stats[j] = Integer.parseInt(value);
				}
				//System.out.print(value + ", ");
				j++;
			}
		}
		return(1);
		//output.format("%s", " Statcheck Finished! ");
	}
	
	public void setWeek(int w){
		week = w;
	}
	
	public String getID(){
		return(PID);
	}
	public String getFn(){
		return(Fname);
	}
	public String getLn(){
		return(Lname);
	}
	public String getTeam(){
		return(Team);
	}
	public String getPos(){
		return(Pos);
	}
	public String getResult(){
		return(Result);
	}
	public String getOpp(){
		return(Opposition);
	}
	public int getWeek(){
		return(week);
	}
	public int[] getStats(){
		return(stats);
	}
	public double getPoints(){
		return(points);
	}
}
