import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Formatter;
import java.util.Scanner;


public class Parser {

	public static void main(String[] args) throws IOException {
		
		File Oflist[];
		File Kflist[];
		File Dflist[];
		File ofile;
		File kfile;
		File dfile;
		FileReader input;
		//Formatter output = new Formatter("output.txt");;
		Formatter newfile;
		Formatter output;
		Scanner s = new Scanner(System.in);
		String wait = new String();
		ArrayList<Offense> off = new ArrayList<Offense>();
		ArrayList<Defense> def = new ArrayList<Defense>();
		ArrayList<Kicker> kick = new ArrayList<Kicker>();
		int check;
		int offCount = 0;
		int defCount = 0;
		int kickCount = 0;
		
		String nameMarker = new String("a class=\"Nowrap\" href=\"http://sports.yahoo.com/nfl/players/");
		String nameMarker2 = new String("a class=\"Nowrap name\" href=\"http://sports.yahoo.com/nfl/players/");
		String nameMarker3 = new String("a class=\"Nowrap name\" href=\"http://sports.yahoo.com/nfl/teams/");
		String oppMarker = new String("div class=\"ysf-player-detail Nowrap Grid-u Fz-xxs Lh-xs Ta-start\"");
		String statMarker = new String("td style=\"width: 30px;\" class=\"Alt Fw-b Ta-end Nowrap Selected\"");
		String statMarker2 = new String("td style=\"width: 30px;\" class=\"Alt Fw-b Ta-end Nowrap\"");
		String statMarker3 = new String("td style=\"width: 30px;\" class=\"Alt Fw-b Ta-end Nowrap Selected Selected\"");
		
		ofile = new File("Offense");
		Oflist = ofile.listFiles();
		kfile = new File("Kickers");
		Kflist = kfile.listFiles();
		dfile = new File("Defense");
		Dflist = dfile.listFiles();
		
		/*for(int m = 0; m < Oflist.length; m++){
			check = 1;
			//Initialize Source File
			input = new FileReader(Oflist[m]);
			BufferedReader br = new BufferedReader(input);
			newfile = new Formatter("newfile.txt");
				
			String tmp = new String();
			tmp = br.readLine();
			
			while(tmp != null){
				newfile.format("%s %n", tmp, "/n");
				tmp = br.readLine();
			}
			
			input.close();
			newfile.close();
			
			//Initialize Source File
			input = new FileReader("newfile.txt");
			br = new BufferedReader(input);
			
			//output.format("%s %n", "ID, Name, Team, Pos, Result, Opp, Owned, Pts, Owned, ProjR, ActR, PYds, PTD, PInt, P_40, P40_TD, Ratt, RYds, RTD, 40_Att, 40_TD, Re_Tgt, Re_Rec, Re_Yds, Re_TD, Re_40, Re_40TD, Ret_TD, 2PT, Fum");
			
			tmp = br.readLine();
			int k = 1;
			int i = 0;
			boolean xml = false;
			
			while(tmp != null){
				
				//System.out.println("Parsing Line #" + k);
				//System.out.println(tmp);
				String value = new String();
				String quote = new String();
				
				if(tmp.isEmpty()){
					System.out.println("Line " + k + "is empty!");
				}
				
				else if(xml == true){
					i = 0;
					while(i < tmp.length()){
						if(tmp.charAt(i) == '<'){
							value = "";
							i++;
							while(i < tmp.length() && tmp.charAt(i) != '>'){
								value = value.concat(Character.toString(tmp.charAt(i)));
								i++;
							}
						}
						//System.out.println("Value: " + value);
						//wait = s.next();
						if(value.equals("/script")){
							//System.out.println("End of script found!");
							xml = false;
							//wait = s.next();
							break;
						}
						//System.out.println(i);
						i++;
					}
					
					tmp = br.readLine();
					i = 0;
					k++;
				}
					
				if(xml == false){
					while(i < tmp.length()){
						value = "";
						
						if(tmp.charAt(i) == '<'){
							//digits
							//System.out.println("Found '<'!");
							i++;
							while(i < tmp.length() && tmp.charAt(i) != '>'){
								value = value.concat(Character.toString(tmp.charAt(i)));
								i++;
								if(value.equals(nameMarker) || value.equals(nameMarker2) || value.equals(nameMarker3)) break;
							}
							
							for(int j = 0; j < value.length(); j++){
								if(value.charAt(j) == '\"'){
									quote = "";
									while((j+1) < value.length() && value.charAt(j + 1) != '\"'){
										quote = quote.concat(Character.toString(value.charAt(j+1)));
										j++;
									}
									j++;
									//System.out.println("\"" + quote + "\"");
									if(quote.equals("text/javascript")){
										//System.out.println("XML Script Found on Line " + k + "!");
										//System.out.println("Line: " + tmp);
										xml = true;
										break;
									}
								}
							}
							
							//System.out.println(value);
							
							if(xml == false && (value.equals(nameMarker) || value.equals(nameMarker2) || value.equals(nameMarker3))){
								//System.out.println(1);
								off.add(new Offense());
								String week = new String();
								int l = 9;
								while(Oflist[m].getPath().charAt(l) != '-'){
									week = week.concat(Character.toString(Oflist[m].getPath().charAt(l)));
									l++;
								}
								off.get(offCount).setWeek(Integer.parseInt(week));
								off.get(offCount).setIDNTP(tmp, i, Oflist[m].getPath());
								
								
								//System.out.println(off.get(offCount).getID() + " " + off.get(offCount).getFn() + " " + off.get(offCount).getLn() + " " + off.get(offCount).getTeam() + " " + off.get(offCount).getPos());
							}
								
							else if(xml == false && value.equals(oppMarker)){
								//System.out.println(2);
								check = off.get(offCount).setResultOpp(tmp, i);
								//System.out.println(off.get(offCount).getResult() + " " + off.get(offCount).getOpp());
							}
								
							else if(xml == false && (value.equals(statMarker) || value.equals(statMarker2) || value.equals(statMarker3))){
								//System.out.println(3);
								check = off.get(offCount).setStats(tmp, i);
								
								/*System.out.print(off.get(offCount).getPoints() + ", ");
								int stats[] = off.get(offCount).getStats();
								for(int j = 0; j < stats.length; j++){
									System.out.print(stats[j] + ", ");
								}
								System.out.println();
								offCount++;
								
							}
							
						}
						
						i++;
						//System.out.println(i);
					}
					if(check == -1){
						offCount--;
						off.remove(offCount);
						break;
					}
					if(xml == false){
						k++;
						//System.out.println("Reading New Line!");
						tmp = br.readLine();
						i = 0;
					}
				}
			}
			input.close();
		}
		//output.close();
		
		for(int m = 0; m < Kflist.length; m++){
			check = 1;
			//Initialize Source File
			input = new FileReader(Kflist[m]);
			BufferedReader br = new BufferedReader(input);
			newfile = new Formatter("newfile.txt");
				
			String tmp = new String();
			tmp = br.readLine();
			
			while(tmp != null){
				newfile.format("%s %n", tmp, "/n");
				tmp = br.readLine();
			}
			
			input.close();
			newfile.close();
			
			//Initialize Source File
			input = new FileReader("newfile.txt");
			br = new BufferedReader(input);
			
			//output.format("%s %n", "ID, Name, Team, Pos, Result, Opp, Owned, Pts, Owned, ProjR, ActR, PYds, PTD, PInt, P_40, P40_TD, Ratt, RYds, RTD, 40_Att, 40_TD, Re_Tgt, Re_Rec, Re_Yds, Re_TD, Re_40, Re_40TD, Ret_TD, 2PT, Fum");
			
			tmp = br.readLine();
			int k = 1;
			int i = 0;
			boolean xml = false;
			
			while(tmp != null){
				
				//System.out.println("Parsing Line #" + k);
				//System.out.println(tmp);
				String value = new String();
				String quote = new String();
				
				if(tmp.isEmpty()){
					System.out.println("Line " + k + "is empty!");
				}
				
				else if(xml == true){
					i = 0;
					while(i < tmp.length()){
						if(tmp.charAt(i) == '<'){
							value = "";
							i++;
							while(i < tmp.length() && tmp.charAt(i) != '>'){
								value = value.concat(Character.toString(tmp.charAt(i)));
								i++;
							}
						}
						//System.out.println("Value: " + value);
						//wait = s.next();
						if(value.equals("/script")){
							//System.out.println("End of script found!");
							xml = false;
							//wait = s.next();
							break;
						}
						//System.out.println(i);
						i++;
					}
					
					tmp = br.readLine();
					i = 0;
					k++;
				}
					
				if(xml == false){
					while(i < tmp.length()){
						value = "";
						
						if(tmp.charAt(i) == '<'){
							//digits
							//System.out.println("Found '<'!");
							i++;
							while(i < tmp.length() && tmp.charAt(i) != '>'){
								value = value.concat(Character.toString(tmp.charAt(i)));
								i++;
								if(value.equals(nameMarker) || value.equals(nameMarker2) || value.equals(nameMarker3)) break;
							}
							
							for(int j = 0; j < value.length(); j++){
								if(value.charAt(j) == '\"'){
									quote = "";
									while((j+1) < value.length() && value.charAt(j + 1) != '\"'){
										quote = quote.concat(Character.toString(value.charAt(j+1)));
										j++;
									}
									j++;
									//System.out.println("\"" + quote + "\"");
									if(quote.equals("text/javascript")){
										//System.out.println("XML Script Found on Line " + k + "!");
										//System.out.println("Line: " + tmp);
										xml = true;
										break;
									}
								}
							}
							
							//System.out.println(value);
							
							if(xml == false && (value.equals(nameMarker) || value.equals(nameMarker2) || value.equals(nameMarker3))){
								//System.out.println(1);
								kick.add(new Kicker());
								String week = new String();
								int l = 9;
								while(Kflist[m].getPath().charAt(l) != '-'){
									week = week.concat(Character.toString(Kflist[m].getPath().charAt(l)));
									l++;
								}
								kick.get(kickCount).setWeek(Integer.parseInt(week));
								kick.get(kickCount).setIDNTP(tmp, i);
								
								
								//System.out.println(kick.get(kickCount).getID() + " " + kick.get(kickCount).getFn() + " " + kick.get(kickCount).getLn() + " " + kick.get(kickCount).getTeam() + " " + kick.get(kickCount).getPos());
							}
								
							else if(xml == false && value.equals(oppMarker)){
								//System.out.println(2);
								check = kick.get(defCount).setResultOpp(tmp, i);
								//System.out.println(kick.get(kickCount).getResult() + " " + kick.get(kickCount).getOpp());
							}
								
							else if(xml == false && (value.equals(statMarker) || value.equals(statMarker2) || value.equals(statMarker3))){
								//System.out.println(3);
								check = kick.get(kickCount).setStats(tmp, i);
								
								/*System.out.print(kick.get(kickCount).getPoints() + ", ");
								int stats[] = kick.get(kickCount).getStats();
								for(int j = 0; j < stats.length; j++){
									System.out.print(stats[j] + ", ");
								}
								System.out.println();
								kickCount++;
								
							}
							
						}
						
						i++;
						//System.out.println(i);
					}
					if(check == -1){
						kickCount--;
						kick.remove(kickCount);
						break;
					}
					if(xml == false){
						k++;
						//System.out.println("Reading New Line!");
						tmp = br.readLine();
						i = 0;
					}
				}
			}
			input.close();
		}
		*/
		for(int m = 0; m < Dflist.length; m++){
			check = 1;
			//Initialize Source File
			input = new FileReader(Dflist[m]);
			BufferedReader br = new BufferedReader(input);
			newfile = new Formatter("newfile.txt");
				
			String tmp = new String();
			tmp = br.readLine();
			
			while(tmp != null){
				newfile.format("%s %n", tmp, "/n");
				tmp = br.readLine();
			}
			
			input.close();
			newfile.close();
			
			//Initialize Source File
			input = new FileReader("newfile.txt");
			br = new BufferedReader(input);
			
			//output.format("%s %n", "ID, Name, Team, Pos, Result, Opp, Owned, Pts, Owned, ProjR, ActR, PYds, PTD, PInt, P_40, P40_TD, Ratt, RYds, RTD, 40_Att, 40_TD, Re_Tgt, Re_Rec, Re_Yds, Re_TD, Re_40, Re_40TD, Ret_TD, 2PT, Fum");
			
			tmp = br.readLine();
			int k = 1;
			int i = 0;
			boolean xml = false;
			
			while(tmp != null){
				
				//System.out.println("Parsing Line #" + k);
				//System.out.println(tmp);
				String value = new String();
				String quote = new String();
				
				if(tmp.isEmpty()){
					System.out.println("Line " + k + "is empty!");
				}
				
				else if(xml == true){
					i = 0;
					while(i < tmp.length()){
						if(tmp.charAt(i) == '<'){
							value = "";
							i++;
							while(i < tmp.length() && tmp.charAt(i) != '>'){
								value = value.concat(Character.toString(tmp.charAt(i)));
								i++;
							}
						}
						//System.out.println("Value: " + value);
						//wait = s.next();
						if(value.equals("/script")){
							//System.out.println("End of script found!");
							xml = false;
							//wait = s.next();
							break;
						}
						//System.out.println(i);
						i++;
					}
					
					tmp = br.readLine();
					i = 0;
					k++;
				}
					
				if(xml == false){
					while(i < tmp.length()){
						value = "";
						
						if(tmp.charAt(i) == '<'){
							//digits
							//System.out.println("Found '<'!");
							i++;
							while(i < tmp.length() && tmp.charAt(i) != '>'){
								value = value.concat(Character.toString(tmp.charAt(i)));
								i++;
								if(value.equals(nameMarker) || value.equals(nameMarker2) || value.equals(nameMarker3)) break;
							}
							
							for(int j = 0; j < value.length(); j++){
								if(value.charAt(j) == '\"'){
									quote = "";
									while((j+1) < value.length() && value.charAt(j + 1) != '\"'){
										quote = quote.concat(Character.toString(value.charAt(j+1)));
										j++;
									}
									j++;
									//System.out.println("\"" + quote + "\"");
									if(quote.equals("text/javascript")){
										//System.out.println("XML Script Found on Line " + k + "!");
										//System.out.println("Line: " + tmp);
										xml = true;
										break;
									}
								}
							}
							
							//System.out.println(value);
							
							if(xml == false && (value.equals(nameMarker) || value.equals(nameMarker2) || value.equals(nameMarker3))){
								//System.out.println(1);
								def.add(new Defense());
								String week = new String();
								int l = 9;
								while(Dflist[m].getPath().charAt(l) != '-'){
									week = week.concat(Character.toString(Dflist[m].getPath().charAt(l)));
									l++;
								}
								def.get(defCount).setWeek(Integer.parseInt(week));
								check = def.get(defCount).setIDNTP(tmp, i, Dflist[m].getPath());
								
								
								System.out.println(def.get(defCount).getID() + " " + def.get(defCount).getFn() + " " + def.get(defCount).getTeam() + " " + def.get(defCount).getPos());
							}
								
							else if(xml == false && value.equals(oppMarker) && check != -1){
								//System.out.println(2);
								check = def.get(defCount).setResultOpp(tmp, i);
								//System.out.println(def.get(defCount).getResult() + " " + def.get(defCount).getOpp());
							}
								
							else if(xml == false && check != -1 && (value.equals(statMarker) || value.equals(statMarker2) || value.equals(statMarker3))){
								//System.out.println(3);
								def.get(defCount).setStats(tmp, i);
								
								System.out.print(def.get(defCount).getPoints() + ", ");
								int stats[] = def.get(defCount).getStats();
								for(int j = 0; j < stats.length; j++){
									System.out.print(stats[j] + ", ");
								}
								System.out.println();
								defCount++;
								
							}
							
						}
						
						i++;
						//System.out.println(i);
					}
					if(check == -1){
						def.remove(defCount);
						break;
					}
					if(xml == false){
						k++;
						//System.out.println("Reading New Line!");
						tmp = br.readLine();
						i = 0;
					}
				}
			}
			input.close();
		}
		
		output = new Formatter("output.txt");
		
		ArrayList<String> o = new ArrayList<String>();
		ArrayList<String> k = new ArrayList<String>();
		ArrayList<String> d = new ArrayList<String>();
		
		/*for(int m = 0; m < off.size(); m++){
			if(!o.contains(off.get(m).getID())){
			output.format("%s %n %s %n", "INSERT into Player", "values('" + off.get(m).getID() + "', '" + off.get(m).getFn() + "', '" + off.get(m).getLn() + "', '" + off.get(m).getPos() + "', '" + off.get(m).getTeam() + "');");
			o.add(off.get(m).getID());}
		}
		for(int m = 0; m < kick.size(); m++){
			if(!k.contains(kick.get(m).getID())){
				//System.out.println("INSERT into Player values('" + kick.get(m).getID() + "', '" + kick.get(m).getFn() + "', '" + kick.get(m).getLn() + "', '" + kick.get(m).getPos() + "', '" + kick.get(m).getTeam() + "');");
			output.format("%s %n %s %n", "INSERT into Player", "values('" + kick.get(m).getID() + "', '" + kick.get(m).getFn() + "', '" + kick.get(m).getLn() + "', '" + kick.get(m).getPos() + "', '" + kick.get(m).getTeam() + "');");
			k.add(kick.get(m).getID());}
		}
		for(int m = 0; m < def.size(); m++){
			if(!d.contains(def.get(m).getID())){
			System.out.println("INSERT into Player values('" + def.get(m).getID() + "', '" + def.get(m).getFn() + "', '" + def.get(m).getPos() + "', '" + def.get(m).getTeam() + "');");
			output.format("%s %n %s %n", "INSERT into Player", "values('" + def.get(m).getID() + "', '" + def.get(m).getFn() + "', '" + def.get(m).getPos() + "', '" + def.get(m).getTeam() + "');");
			d.add(def.get(m).getID());}
		}*/
		/*for(int m = 0; m < off.size(); m++){
			int stats[] = off.get(m).getStats();
			output.format("%s %n %s", "INSERT into Off_Stats", "values('" + off.get(m).getID() + "', '" + off.get(m).getWeek() + "', '" + off.get(m).getPoints() + "', '");
			for(int h = 4; h < 23; h++){
				if(h < 22) output.format("%s", stats[h] + "', '");
				else output.format("%s %n", stats[h] + "');");
			}
		}
		for(int m = 0; m < kick.size(); m++){
			int stats[] = kick.get(m).getStats();
			output.format("%s %n %s", "INSERT into K_Stats", "values('" + kick.get(m).getID() + "', '" + kick.get(m).getWeek() + "', '" + kick.get(m).getPoints() + "', '");
			for(int h = 4; h < 10; h++){
				if(h < 9) output.format("%s", stats[h] + "', '");
				else output.format("%s %n", stats[h] + "');");
			}
		}
		for(int m = 0; m < def.size(); m++){
			int stats[] = def.get(m).getStats();
			output.format("%s %n %s", "INSERT into D_Stats", "values('" + def.get(m).getID() + "', '" + def.get(m).getWeek() + "', '" + def.get(m).getPoints() + "', '");
			for(int h = 4; h < 12; h++){
				if(h < 11) output.format("%s", stats[h] + "', '");
				else output.format("%s %n", stats[h] + "');");
			}
		}*/
		for(int m = 0; m < def.size(); m++){
			output.format("%s %n %s %n", "INSERT into Schedule", "values('" + def.get(m).getTeam() + "', '" + def.get(m).getWeek() + "', '" + def.get(m).getOpp() + "', '', '" + def.get(m).getResult() + "');");
		}
		
		output.close();
	}
	}
	
	
	

