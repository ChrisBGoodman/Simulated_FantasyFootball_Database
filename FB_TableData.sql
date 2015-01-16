
DROP TABLE Conference CASCADE CONSTRAINTS;
DROP TABLE Team CASCADE CONSTRAINTS;
DROP TABLE Player CASCADE CONSTRAINTS;
DROP TABLE Rankings CASCADE CONSTRAINTS;
DROP TABLE Owner CASCADE CONSTRAINTS;
DROP TABLE Schedule CASCADE CONSTRAINTS;
DROP TABLE Staff CASCADE CONSTRAINTS;
DROP TABLE StaffRole CASCADE CONSTRAINTS;
DROP TABLE Off_Stats CASCADE CONSTRAINTS;
DROP TABLE D_Stats CASCADE CONSTRAINTS;
DROP TABLE K_Stats CASCADE CONSTRAINTS;


CREATE TABLE Conference
(Cname CHAR(9),
numTeams  NUMBER(2),
CONSTRAINT Conference_Cname_pk PRIMARY KEY(Cname));

CREATE TABLE Team
(TName VARCHAR2(20),
Conference CHAR(9),
SName VARCHAR2(32),
Street VARCHAR2(32),
City VARCHAR2(15),
State CHAR(2),
Zip CHAR(5),
CONSTRAINT Team_TName_pk PRIMARY KEY(TName),
CONSTRAINT Team_Conference_fk FOREIGN KEY(Conference) REFERENCES Conference(Cname));

CREATE TABLE Player
(PlayerID VARCHAR2(8),
Fname VARCHAR2(12),
Lname  VARCHAR2(16),
Position CHAR(2),
TID VARCHAR2(20),
CONSTRAINT Player_PlayerID_pk PRIMARY KEY(PlayerID),
CONSTRAINT Player_TID_fk FOREIGN KEY(TID) REFERENCES Team(TName));

CREATE TABLE Rankings
(TID VARCHAR2(20),
O_Rank NUMBER(2),
D_Rank NUMBER(2),
P_Rank NUMBER(2),
Wins NUMBER(2),
Loss NUMBER(2),
Tie NUMBER(2),
CONSTRAINT Rankings_P_Rank_pk PRIMARY KEY(P_Rank),
CONSTRAINT Rankings_O_Rank_uk UNIQUE(O_Rank),
CONSTRAINT Rankings_D_Rank_uk UNIQUE(D_Rank),
CONSTRAINT Rankings_TID_fk FOREIGN KEY(TID) REFERENCES Team(TName));

CREATE TABLE Owner
(Fname VARCHAR2(18),
Lname VARCHAR2(10),
Age NUMBER(2),
TeamOwned VARCHAR2(20),
YearsOwned NUMBER(2),
CONSTRAINT Owner_Fname_Lname_pk PRIMARY KEY(Fname, Lname),
CONSTRAINT Owner_TeamOwned_fk FOREIGN KEY(TeamOwned) REFERENCES Team(TName));


CREATE TABLE Schedule
(TID VARCHAR2(20),
WeekNum NUMBER(2),
Opp VARCHAR2(20),
Home_Away CHAR(4),
Result VARCHAR2(5),
CONSTRAINT Schedule_WeekNum_TID_pk PRIMARY KEY(TID, WeekNum),
CONSTRAINT Schedule_TID_fk FOREIGN KEY(TID) REFERENCES Team(TName));

CREATE TABLE Staff
(SID VARCHAR2(6),
Fname VARCHAR2(10),
Lname VARCHAR2(10),
TID VARCHAR2(20),
--gmName VARCHAR2(10),
CONSTRAINT Staff_SID_pk PRIMARY KEY(SID),
CONSTRAINT Staff_TID_fk FOREIGN KEY(TID) REFERENCES Team(TName));


CREATE TABLE StaffRole
(SID VARCHAR2(6),
Position VARCHAR2(35),
CONSTRAINT StaffRole_SID_position_pk PRIMARY KEY(SID, Position),
CONSTRAINT StaffRole_SID_fk FOREIGN KEY(SID) REFERENCES Staff(SID));

CREATE TABLE Off_Stats
(PID VARCHAR2(8), 
Weeknum NUMBER(2),
Proj_Pts NUMBER(5),
Actual_Pts NUMBER(5),
Pass_yds NUMBER(3),
P_40_Yd NUMBER(3),
P_40_Td NUMBER(3),
Int NUMBER(3),
Trgts NUMBER(3),
Rec NUMBER(3),
Rec_40_Yd NUMBER(3),
Rec_40_Td NUMBER(3),
Fum NUMBER(3),
Rec_TD NUMBER(3),
Two_Pt NUMBER(3),
Rush_Att NUMBER(3),
Rush_yd NUMBER(3),
Rush_Td NUMBER(3),
R_40_Yd NUMBER(3),
R_40_Td NUMBER(3),
CONSTRAINT Off_Stats_Weeknum_PID_pk PRIMARY KEY(PID, Weeknum),
CONSTRAINT Off_Stats_PID_fk FOREIGN KEY(PID) REFERENCES Player(PlayerID));

CREATE TABLE D_Stats
(PID VARCHAR2(8),
Weeknum NUMBER(2),
Proj_Pts NUMBER(5),
Actual_Pts NUMBER(5),
Pts_Allow NUMBER(3),
Sacks NUMBER(3),
Safety NUMBER(3),
Int NUMBER(3),
Fum_Rec NUMBER(3),
Def_Td NUMBER(3),
Ret_Td NUMBER(3),
Blk_Kick NUMBER(3),
CONSTRAINT D_Stats_Weeknum_PID_pk PRIMARY KEY(PID, Weeknum),
CONSTRAINT D_Stats_PID_fk FOREIGN KEY(PID) REFERENCES Player(PlayerID));

CREATE TABLE K_Stats
(PID VARCHAR2(8),
Weeknum NUMBER(2),
Proj_Pts NUMBER(5),
Actual_Pts NUMBER(5),
Zero_19 NUMBER(3),
Twenty_29 NUMBER(3),
Thirty_39 NUMBER(3),
Forty_49 NUMBER(3),
Fifty_Plus NUMBER(3),
PAT NUMBER(3),
CONSTRAINT K_Stats_PID_Weeknum_pk PRIMARY KEY(PID, Weeknum),
CONSTRAINT K_Stats_PID_fk FOREIGN KEY(PID) REFERENCES Player(PlayerID));



--CONFERENCE TABLE

insert into Conference
values('AFC North',4);
 
insert into Conference
values('AFC South',4);
 
insert into Conference
values('AFC East',4);

insert into Conference
values('AFC West',4);

insert into Conference
values('NFC North',4);
 
insert into Conference
values('NFC South',4);
 
insert into Conference
values('NFC East',4);
 
insert into Conference
values('NFC West',4);


--TEAM TABLE

insert into Team
values('San Francisco 49ers','NFC West','Levi Stadium','4900 Marie P. DeBartolo Way','Santa Clara','CA',95054);

insert into Team
values('Chicago Bears','NFC North','Solder Field','1410 S. Museum Campus Drive','Chicago','IL',60605);
 
insert into Team
values('Cincinnati Bengals','AFC North','Paul Brown Stadium','One Paul Brown Stadium','Cincinnati','OH',45202);
 
insert into Team
values('Buffalo Bills', 'AFC East','Ralph Wilson Stadium','One Bills Drive','Orchard Park','NY',14217);
 
insert into Team
values('Denver Broncos','AFC West','Sports Authority Field','1701 Bryant St.','Denver','CO',80204);
 
insert into Team
values('Cleveland Browns', 'AFC North','FirstEnergy Stadium','100 Alfred Lerner Way','Cleveland','OH',44114);
 
insert into Team
values('Tampa Bay Buccaneers', 'NFC South','Raymond James Stadium','4201 N. Dale Mabry','Tampa','FL',33607);
 
insert into Team
values('Arizona Cardinals','NFC West','University of Phoenix Stadium','One Cardinals Drive','Glendale','AZ',85305);
 
insert into Team
values('San Diego Chargers','AFC West','Qualcomm Stadium','9449 Friars Rd.','San Diego','CA',92108);
 
insert into Team
values('Kansas City Chiefs','AFC West','Arrowhead Stadium','One Arrowhead Drive','Kansas City','MO',64129);
 
insert into Team
values('Indianappolis Colts','AFC South','Lucas Oil Stadium','500 S. Capitol Ave.','Indiannapolis','IN',46225);
 
insert into Team
values('Dallas Cowboys','NFC East','ATT Stadium','One ATT Way','Arlingtron','TX',76011);
 
insert into Team
values('Miami Dolphins','AFC East','Sun Life Stadium','347 Don Shula Drive','Miami Gardens','FL',33056);
 
insert into Team
values('Philadelphia Eagles', 'NFC East','Lincoln Financial Field','One Lincoln Financial Field Way','Philadelphia','PA',19148);
 
insert into Team
values('Atlanta Falcons','NFC South','Gerogia Dome','One Georgia Dome Drive','Atlanta','GA',30313);
 
insert into Team
values('New York Giants','NFC East','MetLife Stadium','102 Route 120','East Rutherford','NJ',07073);
 
insert into Team
values('Jacksonville Jaguars','AFC South','EverBank Field','One EverBank Field Drive','Jacksonville','FL',32202);
 
insert into Team
values('New York Jets','AFC East','MetLife Stadium','102 Route 120','East Rutherford','NJ',07073);
 
insert into Team
values('Detroit Lions','NFC North','Ford Field','2000 Brush St.','Detroit','MI',48226);
 
insert into Team
values('Green Bay Packers','NFC North','Lambeau Field','1265 Lombardi Ave.','Green Bay','WI',54307);
 
insert into Team
values('Carolina Panthers','NFC South','Bank of America Stadium','800 S. Mint St.','Charlotte','NC',28202);
 
insert into Team
values('New England Patriots','AFC East','Gillette Stadium','One Patriot Place','Foxborough','MA',02035);
 
insert into Team
values('Oakland Raiders', 'AFC West','O.co Coliseum','7000 Coliseum Way','Oakland','CA',94621);
 
insert into Team
values('St. Louis Rams','NFC West','Edward Jones Dome','901 N. Broadway','St. Louis','MO',63101);
 
insert into Team
values('Baltimore Ravens','AFC North','MT Bank Stadium','1101 Russell St.','Baltimore','MD',21230);
 
insert into Team
values('Washington Redskins','NFC East','FedEx Field','1600 FedEx Way','Landover','MA',20785);
 
insert into Team
values('New Orleans Saints','AFC South','Mercedes-Benz Superdome','Sugar Bowl Drive','New Orleans','LA',70112);
 
insert into Team
values('Seattle Seahawks','NFC West','CenturyLink Field','800 Occidental Ave. S.','Seattle','WA',98134);
 
insert into Team
values('Pittsburgh Steelers','AFC North','Heinz Field','100 Art Rooney Ave.','Pittsburgh','PA',15212);

insert into Team
values('Houston Texans','AFC South','NRG Stadium','Two Reliant Park','Houston','TX',77054);
 
insert into Team
values('Tenessee Titans','AFC South','LP Field','One Titans Way','Nashville','TN',37213);

insert into Team
values('Minnesota Vikings','NFC North','TCF Bank Stadium','420 23rd Ave. S.E.','Minneapolis','MN',55455);




--OWNER Table


insert into Owner
values('Jed','York',34,'San Francisco 49ers',5);

insert into Owner
values('Virginia','McCaskey',91,'Chicago Bears',31);

insert into Owner
values('Mike','Brown',79,'Cincinnati Bengals',23);

insert into Owner
values('Terry','Pegula',63,'Buffalo Bills',0);

insert into Owner
values('Pat','Bowlen',70,'Denver Broncos',30);

insert into Owner
values('Jimmy','Haslem',60,'Cleveland Browns',2);

insert into Owner
values('Malcom','Glazer',85,'Tampa Bay Buccaneers',19);

insert into Owner
values('Bill','Bidwell',83,'Arizona Cardinals',42);

insert into Owner
values('Alex','Spanos',91,'San Diego Chargers',30);

insert into Owner
values('Clark','Hunt',49,'Kansas City Chiefs',20);

insert into Owner
values('Jim','Irsay',55,'Indianappolis Colts',17);

insert into Owner
values('Jerry','Jones',72,'Dallas Cowboys',25);

insert into Owner
values('Stephen','Ross',74,'Miami Dolphins',5);

insert into Owner
values('Jeffrey','Lurie',63,'Philadelphia Eagles',20);

insert into Owner
values('Arthur','Blank',72,'Atlanta Falcons',10);

insert into Owner
values('Steve','Tisch',65,'New York Giants',9);

insert into Owner
values('Shahid','Khan',64,'Jacksonville Jaguars',2);

insert into Owner
values('Woody','Johnson IV',67,'New York Jets',14);

insert into Owner
values('Martha','Ford',66,'Detroit Lions',0);

insert into Owner
values('Green Bay Packers','Inc.',91,'Green Bay Packers',91);

insert into Owner
values('Jerry','Richardson',78,'Carolina Panthers',21);

insert into Owner
values('Robert','Kraft',73,'New England Patriots',20);

insert into Owner
values('Mark','Davis',59,'Oakland Raiders',3);

insert into Owner
values('Stan','Kroenke',67,'St. Louis Rams',4);

insert into Owner
values('Steve','Bisciotti',54,'Baltimore Ravens',10);

insert into Owner
values('Dan','Snyder',50,'Washington Redskins',15);

insert into Owner
values('Tom','Benson',87,'New Orleans Saints',29);

insert into Owner
values('Paul','Allen',61,'Seattle Seahawks',17);

insert into Owner
values('Dan','Rooney',82,'Pittsburgh Steelers',26);

insert into Owner
values('Bob','McNair',77,'Houston Texans',15);

insert into Owner
values('Thomas','Smith',60,'Tenessee Titans',1);

insert into Owner
values('Zygi','Wilf',64,'Minnesota Vikings',9);



--RANKINGS table


insert into Rankings
values('San Francisco 49ers',24,5,4,12,4,0);

insert into Rankings
values('Chicago Bears',8,30,15,8,8,0);

insert into Rankings
values('Cincinnati Bengals',10,3,7,11,5,0);

insert into Rankings
values('Buffalo Bills',19,10,25,6,10,0);

insert into Rankings
values('Denver Broncos',1,19,2,13,3,0);

insert into Rankings
values('Cleveland Browns',17,9,28,4,12,0);

insert into Rankings
values('Tampa Bay Buccaneers',32,17,27,4,12,0);

insert into Rankings
values('Arizona Cardinals',12,6,9,10,6,0);

insert into Rankings
values('San Diego Chargers',5,23,12,9,7,0);

insert into Rankings
values('Kansas City Chiefs',21,24,10,11,5,0);

insert into Rankings
values('Indianappolis Colts',15,20,8,11,5,0);

insert into Rankings
values('Dallas Cowboys',16,32,17,8,8,0);

insert into Rankings
values('Miami Dolphins',27,21,18,8,8,0);

insert into Rankings
values('Philadelphia Eagles',2,29,11,10,6,0);

insert into Rankings
values('Atlanta Falcons',14,28,26,4,12,0);

insert into Rankings
values('New York Giants',28,8,23,7,9,0);

insert into Rankings
values('Jacksonville Jaguars',31,27,29,4,12,0);

insert into Rankings
values('New York Jets',25,11,19,8,8,0);

insert into Rankings
values('Detroit Lions',6,16,21,7,9,0);

insert into Rankings
values('Green Bay Packers',3,25,13,8,7,1);

insert into Rankings
values('Carolina Panthers',26,2,3,12,4,0);

insert into Rankings
values('New England Patriots',7,26,5,12,4,0);

insert into Rankings
values('Oakland Raiders',23,22,30,4,12,0);

insert into Rankings
values('St. Louis Rams',30,15,20,7,9,0);

insert into Rankings
values('Baltimore Ravens',29,12,16,8,8,0);

insert into Rankings
values('Washington Redskins',9,18,31,3,13,0);

insert into Rankings
values('New Orleans Saints',4,4,6,11,5,0);

insert into Rankings
values('Seattle Seahawks',18,1,1,13,3,0);

insert into Rankings
values('Pittsburgh Steelers',20,13,14,8,8,0);

insert into Rankings
values('Houston Texans',11,7,32,2,14,0);

insert into Rankings
values('Tenessee Titans',22,14,22,7,9,0);

insert into Rankings
values('Minnesota Vikings',13,31,24,5,10,1);



--PLAYERS table

insert into Player
values('NEQB1','Tom','Brady','QB','New England Patriots');

insert into Player
values('NEQB2','Jimmy','Garoppolo','QB','New England Patriots');

insert into Player
values('NERB1','Shane','Vereen','RB','New England Patriots');

insert into Player
values('NERB2','Steven','Ridley','RB','New England Patriots');

insert into Player
values('NERB3','Jonas','Gray','RB','New England Patriots');

insert into Player
values('NERB7','LeGarrette','Blount','RB','New England Patriots');

insert into Player
values('NERB4','James','White','RB','New England Patriots');

insert into Player
values('NERB5','James','Develin','RB','New England Patriots');

insert into Player
values('NERB6','Brandon','Bolden','RB','New England Patriots');

insert into Player
values('NEWR1','Brandon','LaFell','WR','New England Patriots');

insert into Player
values('NEWR2','Julian','Edelman','WR','New England Patriots');

insert into Player
values('NEWR3','Danny','Amendola','WR','New England Patriots');

insert into Player
values('NEWR4','Brian','Tyms','WR','New England Patriots');

insert into Player
values('NEWR5','Aaron','Dobson','WR','New England Patriots');

insert into Player
values('NETE1','Rob','Gronkowski','TE','New England Patriots');

insert into Player
values('NETE2','Tim','Wright','TE','New England Patriots');

insert into Player
values('NETE3','Michel','Hoomanawanui','TE','New England Patriots');

insert into Player
values('NEDE1','Patriots','Defense','DE','New England Patriots');

insert into Player
values('NEKI1','Stephen','Gostkowski','KI','New England Patriots');





insert into Player
values('MIAQB1','Ryan','Tannehill','QB','Miami Dolphins');

insert into Player
values('MIARB1','Lamar','Miller','RB','Miami Dolphins');

insert into Player
values('MIARB2','Daniel','Thomas','RB','Miami Dolphins');

insert into Player
values('MIARB3','Knowshon','Moreno','RB','Miami Dolphins');

insert into Player
values('MIARB4','Damien','Williams','RB','Miami Dolphins');

insert into Player
values('MIAWR1','Mike','Wallace','WR','Miami Dolphins');

insert into Player
values('MIAWR2','Jarvis','Landry','WR','Miami Dolphins');

insert into Player
values('MIAWR3','Brian','Hartline','WR','Miami Dolphins');

insert into Player
values('MIAWR4','Rishad','Matthews','WR','Miami Dolphins');

insert into Player
values('MIAWR5','Brandon','Gibson','WR','Miami Dolphins');

insert into Player
values('MIATE1','Charles','Clay','TE','Miami Dolphins');

insert into Player
values('MIATE2','Dion','Sims','TE','Miami Dolphins');

insert into Player
values('MIATE3','Harold','Hoskins','TE','Miami Dolphins');

insert into Player
values('MIADE1','Miami','Defense','DE','Miami Dolphins');

insert into Player
values('MIAKI1','Caleb','Sturgis','KI','Miami Dolphins');





insert into Player
values('BUFQB1','Kyle','Orton','QB','Buffalo Bills');

insert into Player
values('BUFQB2','EJ','Manuel','QB','Buffalo Bills');

insert into Player
values('BUFRB1','Fred','Jackson','RB','Buffalo Bills');

insert into Player
values('BUFRB2','C.J.','Spiller','RB','Buffalo Bills');

insert into Player
values('BUFRB3','Anthony','Dixon','RB','Buffalo Bills');

insert into Player
values('BUFRB4','Bryce','Brown','RB','Buffalo Bills');

insert into Player
values('BUFRB5','Frank','Summers','RB','Buffalo Bills');

insert into Player
values('BUFRB6','MarQueis','Gray','RB','Buffalo Bills');

insert into Player
values('BUFWR1','Sammy','Watkins','WR','Buffalo Bills');

insert into Player
values('BUFWR2','Robert','Woods','WR','Buffalo Bills');

insert into Player
values('BUFWR3','Chris','Hogan','WR','Buffalo Bills');

insert into Player
values('BUFWR4','Mike','Williams','WR','Buffalo Bills');

insert into Player
values('BUFWR5','Marquise','Goodwin','WR','Buffalo Bills');

insert into Player
values('BUFTE1','Scott','Chandler','TE','Buffalo Bills');

insert into Player
values('BUFTE2','Chris','Gragg','TE','Buffalo Bills');

insert into Player
values('BUFTE3','Lee','Smith','TE','Buffalo Bills');

insert into Player
values('BUFDE1','Buffalo','Defense','DE','Buffalo Bills');

insert into Player
values('BUFKI1','Dan','Carpenter','KI','Buffalo Bills');





insert into Player
values('NYJQB1','Geno','Smith','QB','New York Jets');

insert into Player
values('NYJQB2','Michael','Vick','QB','New York Jets');

insert into Player
values('NYJQB3','Matt','Simms','QB','New York Jets');

insert into Player
values('NYJRB1','Chris','Ivory','RB','New York Jets');

insert into Player
values('NYJRB2','Chris','Johnson','RB','New York Jets');

insert into Player
values('NYJRB3','Bilal','Powell','RB','New York Jets');

insert into Player
values('NYJRB4','Tommy','Bohanon','RB','New York Jets');

insert into Player
values('NYJRB5','John','Conner','RB','New York Jets');

insert into Player
values('NYJWR1','Eric','Decker','WR','New York Jets');

insert into Player
values('NYJWR2','Percy','Harvin','WR','New York Jets');

insert into Player
values('NYJWR3','Jeremy','Kerley','WR','New York Jets');

insert into Player
values('NYJWR4','Greg','Salas','WR','New York Jets');

insert into Player
values('NYJWR5','T.J.','Graham','WR','New York Jets');

insert into Player
values('NYJWR6','Chris','Owusu','WR','New York Jets');

insert into Player
values('NYJWR7','David','Nelson','WR','New York Jets');

insert into Player
values('NYJTE1','Jace','Amaro','TE','New York Jets');

insert into Player
values('NYJTE2','Jeff','Cumberland','TE','New York Jets');

insert into Player
values('NYJTE3','Zach','Sudfeld','TE','New York Jets');

insert into Player
values('NYJDE1','Jets','Defense','DE','New York Jets');

insert into Player
values('NYJKI1','Nick','Folk','KI','New York Jets');





insert into Player
values('DENQB1','Peyton','Manning','QB','Denver Broncos');

insert into Player
values('DENRB1','Ronnie','Hillman','RB','Denver Broncos');

insert into Player
values('DENRB2','C.J.','Anderson','RB','Denver Broncos');

insert into Player
values('DENRB3','Juwan','Thompson','RB','Denver Broncos');

insert into Player
values('DENRB4','Montee','Ball','RB','Denver Broncos');

insert into Player
values('DENWR1','Demaryius','Thomas','WR','Denver Broncos');

insert into Player
values('DENWR2','Emmanuel','Sanders','WR','Denver Broncos');

insert into Player
values('DENWR3','Wes','Welker','WR','Denver Broncos');

insert into Player
values('DENWR4','Andre','Caldwell','WR','Denver Broncos');

insert into Player
values('DENWR5','Isaiah','Burse','WR','Denver Broncos');

insert into Player
values('DENTE1','Julius','Thomas','TE','Denver Broncos');

insert into Player
values('DENTE2','Jacob','Tamme','TE','Denver Broncos');

insert into Player
values('DENTE3','Virgil','Green','TE','Denver Broncos');

insert into Player
values('DENDE1','Broncos','Defense','DE','Denver Broncos');

insert into Player
values('DENKI1','Brandon','McManus','KI','Denver Broncos');





insert into Player
values('SDQB1','Philip','Rivers','QB','San Diego Chargers');

insert into Player
values('SDRB1','Brandon','Oliver','RB','San Diego Chargers');

insert into Player
values('SDRB2','Ryan','Mathews','RB','San Diego Chargers');

insert into Player
values('SDRB3','Donald','Brown','RB','San Diego Chargers');

insert into Player
values('SDRB4','Danny','Woodhead','RB','San Diego Chargers');

insert into Player
values('SDRB5','Ronnie','Brown','RB','San Diego Chargers');

insert into Player
values('SDRB6','Shaun','Draughn','RB','San Diego Chargers');

insert into Player
values('SDWR1','Malcom','Floyd','WR','San Diego Chargers');

insert into Player
values('SDWR2','Eddie','Royal','WR','San Diego Chargers');

insert into Player
values('SDWR3','Keenan','Allen','WR','San Diego Chargers');

insert into Player
values('SDWR4','Sevi','Ajirotutu','WR','San Diego Chargers');

insert into Player
values('SDTE1','Antonio','Gates','TE','San Diego Chargers');

insert into Player
values('SDTE2','Ladarius','Green','TE','San Diego Chargers');

insert into Player
values('SDTE3','John','Phillips','TE','San Diego Chargers');

insert into Player
values('SDDE1','Chargers','Defense','DE','San Diego Chargers');

insert into Player
values('SDKI1','Nick','Novak','KI','San Diego Chargers');




insert into Player
values('KCQB1','Alex','Smith','QB','Kansas City Chiefs');

insert into Player
values('KCRB1','Jamaal','Charles','RB','Kansas City Chiefs');

insert into Player
values('KCRB2','Knile','Davis','RB','Kansas City Chiefs');

insert into Player
values('KCRB3','Joe','McKnight','RB','Kansas City Chiefs');

insert into Player
values('KCRB4','DeAnthony','Thomas','RB','Kansas City Chiefs');

insert into Player
values('KCRB5','Anthony','Sherman','RB','Kansas City Chiefs');

insert into Player
values('KCRB6','Cyrus','Gray','RB','Kansas City Chiefs');

insert into Player
values('KCWR1','Dwayne','Bowe','WR','Kansas City Chiefs');

insert into Player
values('KCWR2','Jason','Avant','WR','Kansas City Chiefs');

insert into Player
values('KCWR3','Donnie','Avery','WR','Kansas City Chiefs');

insert into Player
values('KCWR4','Junior','Hemingway','WR','Kansas City Chiefs');

insert into Player
values('KCWR5','A.J.','Jenkins','WR','Kansas City Chiefs');

insert into Player
values('KCWR6','Albert','Wilson','WR','Kansas City Chiefs');

insert into Player
values('KCWR7','Frankie','Hammond','WR','Kansas City Chiefs');

insert into Player
values('KCTE1','Travis','Kelce','TE','Kansas City Chiefs');

insert into Player
values('KCTE2','Anthony','Fasano','TE','Kansas City Chiefs');

insert into Player
values('KCTE3','Demetrius','Harris','TE','Kansas City Chiefs');

insert into Player
values('KCDE1','Chiefs','Defense','DE','Kansas City Chiefs');

insert into Player
values('KCKI1','Cairo','Santos','KI','Kansas City Chiefs');





insert into Player
values('OAKQB1','Derek','Car','QB','Oakland Raiders');

insert into Player
values('OAKQB2','Matt','McGloin','QB','Oakland Raiders');

insert into Player
values('OAKQB3','Matt','Schaub','QB','Oakland Raiders');

insert into Player
values('OAKRB1','Darren','McFadden','RB','Oakland Raiders');

insert into Player
values('OAKRB2','Latavius','Murray','RB','Oakland Raiders');

insert into Player
values('OAKRB3','Marcel','Reece','RB','Oakland Raiders');

insert into Player
values('OAKRB4','Maurice','Jones-Drew','RB','Oakland Raiders');

insert into Player
values('OAKWR1','James','Jones','WR','Oakland Raiders');

insert into Player
values('OAKWR2','Andre','Holmes','WR','Oakland Raiders');

insert into Player
values('OAKWR3','Brice','Butler','WR','Oakland Raiders');

insert into Player
values('OAKWR4','Rod','Streater','WR','Oakland Raiders');

insert into Player
values('OAKWR5','Kembrell','Thompkins','WR','Oakland Raiders');

insert into Player
values('OAKWR6','Vincent','Brown','WR','Oakland Raiders');

insert into Player
values('OAKWR7','Denarius','Moore','WR','Oakland Raiders');

insert into Player
values('OAKTE1','Mychal','Rivera','TE','Oakland Raiders');

insert into Player
values('OAKTE2','Brian','Leonhardt','TE','Oakland Raiders');

insert into Player
values('OAKTE3','David','Ausberry','TE','Oakland Raiders');

insert into Player
values('OAKDE1','Raiders','Defense','DE','Oakland Raiders');

insert into Player
values('OAKKI1','Sebastian','Janikowski','KI','Oakland Raiders');




insert into Player
values('ARIQB1','Carson','Palmer','QB','Arizona Cardinals');

insert into Player
values('ARIQB2','Drew','Stanton','QB','Arizona Cardinals');

insert into Player
values('ARIQB3','Logan','Thomas','QB','Arizona Cardinals');

insert into Player
values('ARIRB1','Andre','Ellington','RB','Arizona Cardinals');

insert into Player
values('ARIRB2','Stepfan','Taylor','RB','Arizona Cardinals');

insert into Player
values('ARIRB3','Jonathan','Dwyer','RB','Arizona Cardinals');

insert into Player
values('ARIRB4','Marion','Grice','RB','Arizona Cardinals');

insert into Player
values('ARIRB5','Robert','Hughes','RB','Arizona Cardinals');

insert into Player
values('ARIWR1','John','Brown','WR','Arizona Cardinals');

insert into Player
values('ARIWR2','Larry','Fitzgerald','WR','Arizona Cardinals');

insert into Player
values('ARIWR3','Michael','Floyd','WR','Arizona Cardinals');

insert into Player
values('ARIWR4','Ted','Ginn Jr','WR','Arizona Cardinals');

insert into Player
values('ARIWR5','Jaron','Brown','WR','Arizona Cardinals');

insert into Player
values('ARIWR6','Solomon','Patton','WR','Arizona Cardinals');

insert into Player
values('ARITE1','John','Carlson','TE','Arizona Cardinals');

insert into Player
values('ARITE2','Rob','Housler','TE','Arizona Cardinals');

insert into Player
values('ARITE3','Troy','Niklas','TE','Arizona Cardinals');

insert into Player
values('ARIDE1','Cardinals','Defense','DE','Arizona Cardinals');

insert into Player
values('ARIKI1','Chandler','Catanzaro','KI','Arizona Cardinals');




insert into Player
values('SFQB1','Collin','Kaepernick','QB','San Francisco 49ers');

insert into Player
values('SFQB2','Blaine','Gabbert','QB','San Francisco 49ers');

insert into Player
values('SFRB1','Frank','Gore','RB','San Francisco 49ers');

insert into Player
values('SFRB2','Carlos','Hyde','RB','San Francisco 49ers');

insert into Player
values('SFRB3','Bruce','Miller','RB','San Francisco 49ers');

insert into Player
values('SFWR1','Anquan','Boldin','WR','San Francisco 49ers');

insert into Player
values('SFWR2','Michael','Crabtree','WR','San Francisco 49ers');

insert into Player
values('SFWR3','Stevie','Johnson','WR','San Francisco 49ers');

insert into Player
values('SFWR4','Brandon','Lloyd','WR','San Francisco 49ers');

insert into Player
values('SFWR5','Bruce','Ellington','WR','San Francisco 49ers');

insert into Player
values('SFTE1','Vernon','Davis','TE','San Francisco 49ers');

insert into Player
values('SFTE2','Derek','Carrier','TE','San Francisco 49ers');

insert into Player
values('SFDE1','49ers','Defense','DE','San Francisco 49ers');

insert into Player
values('SFKI1','Phil','Dawson','KI','San Francisco 49ers');




insert into Player
values('SEAQB1','Russell','Wilson','QB','Seattle Seahawks');

insert into Player
values('SEARB1','Marshawn','Lynch','RB','Seattle Seahawks');

insert into Player
values('SEARB2','Robert','Turbin','RB','Seattle Seahawks');

insert into Player
values('SEARB3','Christine','Michael','RB','Seattle Seahawks');

insert into Player
values('SEARB4','Derrick','Coleman','RB','Seattle Seahawks');

insert into Player
values('SEAWR1','Doug','Baldwin','WR','Seattle Seahawks');

insert into Player
values('SEAWR2','Jermaine','Kearse','WR','Seattle Seahawks');

insert into Player
values('SEAWR3','Ricardo','Lockette','WR','Seattle Seahawks');

insert into Player
values('SEAWR4','Paul','Richardson','WR','Seattle Seahawks');

insert into Player
values('SEAWR5','Bryan','Walters','WR','Seattle Seahawks');

insert into Player
values('SEAWR6','Kevin','Norwood','WR','Seattle Seahawks');

insert into Player
values('SEATE1','Cooper','Helfet','TE','Seattle Seahawks');

insert into Player
values('SEATE2','Luke','Wilson','TE','Seattle Seahawks');

insert into Player
values('SEATE3','Tony','Moeaki','TE','Seattle Seahawks');

insert into Player
values('SEATE4','Zach','Miller','TE','Seattle Seahawks');

insert into Player
values('SEADE1','Seahawks','Defense','DE','Seattle Seahawks');

insert into Player
values('SEAKI1','Steven','Hauschka','KI','Seattle Seahawks');



insert into Player
values('STLQB1','Austin','Davis','QB','St. Louis Rams');

insert into Player
values('STLQB2','Shaun','Hill','QB','St. Louis Rams');

insert into Player
values('STLRB1','Benjamin','Cunningham','RB','St. Louis Rams');

insert into Player
values('STLRB2','Tre','Mason','RB','St. Louis Rams');

insert into Player
values('STLRB3','Zac','Stacy','RB','St. Louis Rams');

insert into Player
values('STLRB4','Trey','Watts','RB','St. Louis Rams');

insert into Player
values('STLWR1','Kenny','Britt','WR','St. Louis Rams');

insert into Player
values('STLWR2','Brian','Quick','WR','St. Louis Rams');

insert into Player
values('STLWR3','Tavon','Austin','WR','St. Louis Rams');

insert into Player
values('STLWR4','Tavon','Austin','WR','St. Louis Rams');

insert into Player
values('STLWR5','Stedman','Bailey','WR','St. Louis Rams');

insert into Player
values('STLWR6','Austin','Pettis','WR','St. Louis Rams');

insert into Player
values('STLWR7','Chris','Givens','WR','St. Louis Rams');

insert into Player
values('STLTE1','Jared','Cook','TE','St. Louis Rams');

insert into Player
values('STLTE2','Lance','Kendricks','TE','St. Louis Rams');

insert into Player
values('STLDE1','Rams','Defense','DE','St. Louis Rams');

insert into Player
values('STLKI1','Greg','Zuerlein','KI','St. Louis Rams');




insert into Player
values('ATLQB1','Matt','Ryan','QB','Atlanta Falcons');

insert into Player
values('ATLRB1','Steven','Jackson','RB','Atlanta Falcons');

insert into Player
values('ATLRB2','Antone','Smith','RB','Atlanta Falcons');

insert into Player
values('ATLRB3','Jacquizz','Rodgers','RB','Atlanta Falcons');

insert into Player
values('ATLRB4','Devonta','Freeman','RB','Atlanta Falcons');

insert into Player
values('ATLRB5','Patrick','DiMarco','RB','Atlanta Falcons');

insert into Player
values('ATLWR1','Julio','Jones','WR','Atlanta Falcons');

insert into Player
values('ATLWR2','Roddy','White','WR','Atlanta Falcons');

insert into Player
values('ATLWR3','Devin','Hester','WR','Atlanta Falcons');

insert into Player
values('ATLWR4','Harry','Douglas','WR','Atlanta Falcons');

insert into Player
values('ATLWR5','Eric','Weems','WR','Atlanta Falcons');

insert into Player
values('ATLWR6','Courtney','Roby','WR','Atlanta Falcons');

insert into Player
values('ATLTE1','Levine','Toilolo','TE','Atlanta Falcons');

insert into Player
values('ATLTE2','Bear','Pascoe','TE','Atlanta Falcons');

insert into Player
values('ATLDE1','Falcons','Defense','DE','Atlanta Falcons');

insert into Player
values('ATLKI1','Matt','Bryant','KI','Atlanta Falcons');




insert into Player
values('CARQB1','Cam','Newton','QB','Carolina Panthers');

insert into Player
values('CARQB2','Derek','Anderson','QB','Carolina Panthers');

insert into Player
values('CARQB3','Joe','Webb','QB','Carolina Panthers');

insert into Player
values('CARRB1','Jonathan','Stewart','RB','Carolina Panthers');

insert into Player
values('CARRB2','DeAngelo','Williams','RB','Carolina Panthers');

insert into Player
values('CARRB3','Fozzy','Whittaker','RB','Carolina Panthers');

insert into Player
values('CARRB4','Chris','Ogbonnaya','RB','Carolina Panthers');

insert into Player
values('CARRB5','Darrin','Reaves','RB','Carolina Panthers');

insert into Player
values('CARRB6','Mike','Tolbert','RB','Carolina Panthers');

insert into Player
values('CARWR1','Kelvin','Benjamin','WR','Carolina Panthers');

insert into Player
values('CARWR2','Jerricho','Cotchery','WR','Carolina Panthers');

insert into Player
values('CARWR3','Philly','Brown','WR','Carolina Panthers');

insert into Player
values('CARWR4','Brenton','Bersin','WR','Carolina Panthers');

insert into Player
values('CARTE1','Greg','Olsen','TE','Carolina Panthers');

insert into Player
values('CARTE2','Ed','Dickson','TE','Carolina Panthers');

insert into Player
values('CARTE3','Brandon','Williams','TE','Carolina Panthers');

insert into Player
values('CARDE1','Panthers','Defense','DE','Carolina Panthers');

insert into Player
values('CARKI1','Graham','Gano','KI','Carolina Panthers');




insert into Player
values('NOQB1','Drew','Brees','QB','New Orleans Saints');

insert into Player
values('NORB1','Mark','Ingram','RB','New Orleans Saints');

insert into Player
values('NORB2','Pierre','Thomas','RB','New Orleans Saints');

insert into Player
values('NORB3','Khiry','Robinson','RB','New Orleans Saints');

insert into Player
values('NORB4','Travis','Cadet','RB','New Orleans Saints');

insert into Player
values('NORB5','Austin','Johnson','RB','New Orleans Saints');

insert into Player
values('NORB6','Brian','Leonard','RB','New Orleans Saints');

insert into Player
values('NORB7','Erik','Lorig','RB','New Orleans Saints');

insert into Player
values('NOWR1','Brandin','Cooks','WR','New Orleans Saints');

insert into Player
values('NOWR2','Marques','Colston','WR','New Orleans Saints');

insert into Player
values('NOWR3','Kenny','Stills','WR','New Orleans Saints');

insert into Player
values('NOWR4','Joseph','Morgan','WR','New Orleans Saints');

insert into Player
values('NOWR5','Robert','Meachem','WR','New Orleans Saints');

insert into Player
values('NOWR6','Nick','Toon','WR','New Orleans Saints');

insert into Player
values('NOWR7','Jalen','Saunders','WR','New Orleans Saints');

insert into Player
values('NOTE1','Jimmy','Graham','TE','New Orleans Saints');

insert into Player
values('NOTE2','Josh','Hill','TE','New Orleans Saints');

insert into Player
values('NOTE3','Benjamin','Watson','TE','New Orleans Saints');

insert into Player
values('NODE1','Saints','Defense','DE','New Orleans Saints');

insert into Player
values('NOKI1','Shayne','Graham','KI','New Orleans Saints');




insert into Player
values('TBQB1','Josh','McCown','QB','Tampa Bay Buccaneers');

insert into Player
values('TBQB2','Mike','Glennon','QB','Tampa Bay Buccaneers');

insert into Player
values('TBRB1','Bobby','Rainey','RB','Tampa Bay Buccaneers');

insert into Player
values('TBRB2','Doug','Martin','RB','Tampa Bay Buccaneers');

insert into Player
values('TBRB3','Charles','Sims','RB','Tampa Bay Buccaneers');

insert into Player
values('TBRB4','Jorvorskie','Lane','RB','Tampa Bay Buccaneers');

insert into Player
values('TBRB5','Mike','James','RB','Tampa Bay Buccaneers');

insert into Player
values('TBWR1','Mike','Evans','WR','Tampa Bay Buccaneers');

insert into Player
values('TBWR2','Vincent','Jackson','WR','Tampa Bay Buccaneers');

insert into Player
values('TBWR3','Loius','Murphy','WR','Tampa Bay Buccaneers');

insert into Player
values('TBWR4','Robert','Herron','WR','Tampa Bay Buccaneers');

insert into Player
values('TBWR5','Russell','Shepard','WR','Tampa Bay Buccaneers');

insert into Player
values('TBTE1','Austin','Seferian-Jenkins','TE','Tampa Bay Buccaneers');

insert into Player
values('TBTE2','Brandon','Myers','TE','Tampa Bay Buccaneers');

insert into Player
values('TBTE3','Luke','Stocker','TE','Tampa Bay Buccaneers');

insert into Player
values('TBDE1','Buccaneers','Defense','DE','Tampa Bay Buccaneers');

insert into Player
values('TBKI1','Patrick','Murray','KI','Tampa Bay Buccaneers');





insert into Player
values('CHIQB1','Jay','Cutler','QB','Chicago Bears');

insert into Player
values('CHIRB1','Matt','Forte','RB','Chicago Bears');

insert into Player
values('CHIRB2','KaDeem','Carey','RB','Chicago Bears');

insert into Player
values('CHIWR1','Alshon','Jeffery','WR','Chicago Bears');

insert into Player
values('CHIWR2','Brandon','Marshall','WR','Chicago Bears');

insert into Player
values('CHIWR3','Josh','Morgan','WR','Chicago Bears');

insert into Player
values('CHIWR4','Chris','Williams','WR','Chicago Bears');

insert into Player
values('CHIWR5','Santonio','Holmes','WR','Chicago Bears');

insert into Player
values('CHIWR6','Marquess','Wilson','WR','Chicago Bears');

insert into Player
values('CHITE1','Martellus','Bennet','TE','Chicago Bears');

insert into Player
values('CHITE2','Dante','Rosario','TE','Chicago Bears');

insert into Player
values('CHIDE1','Bears','Defense','DE','Chicago Bears');

insert into Player
values('CHIKI1','Robbie','Gould','KI','Chicago Bears');




insert into Player
values('DETQB1','Matthew','Stafford','QB','Detroit Lions');

insert into Player
values('DETRB1','Joique','Bell','RB','Detroit Lions');

insert into Player
values('DETRB2','Theo','Riddick','RB','Detroit Lions');

insert into Player
values('DETRB3','Reggie','Bush','RB','Detroit Lions');

insert into Player
values('DETRB4','Jed','Collins','RB','Detroit Lions');

insert into Player
values('DETRB5','George','Winn','RB','Detroit Lions');

insert into Player
values('DETWR1','Golden','Tate','WR','Detroit Lions');

insert into Player
values('DETWR2','Calvin','Johnson','WR','Detroit Lions');

insert into Player
values('DETWR3','Jeremy','Ross','WR','Detroit Lions');

insert into Player
values('DETWR4','Corey','Fuller','WR','Detroit Lions');

insert into Player
values('DETWR5','Ryan','Broyles','WR','Detroit Lions');

insert into Player
values('DETTE1','Eric','Ebron','TE','Detroit Lions');

insert into Player
values('DETTE2','Joseph','Fauria','TE','Detroit Lions');

insert into Player
values('DETTE3','Brandon','Pettigrew','TE','Detroit Lions');

insert into Player
values('DETDE1','Lions','Defense','DE','Detroit Lions');

insert into Player
values('DETKI1','Matt','Prater','KI','Detroit Lions');




insert into Player
values('GBQB1','Aaron','Rodgers','QB','Green Bay Packers');

insert into Player
values('GBQB2','Matt','Flynn','QB','Green Bay Packers');

insert into Player
values('GBRB1','Eddie','Lacy','RB','Green Bay Packers');

insert into Player
values('GBRB2','James','Starks','RB','Green Bay Packers');

insert into Player
values('GBRB3','John','Kuhn','RB','Green Bay Packers');

insert into Player
values('GBRB4','DuJuan','Harris','RB','Green Bay Packers');

insert into Player
values('GBWR1','Jordy','Nelson','WR','Green Bay Packers');

insert into Player
values('GBWR2','Randall','Cobb','WR','Green Bay Packers');

insert into Player
values('GBWR3','Davante','Adams','WR','Green Bay Packers');

insert into Player
values('GBWR4','Jarrett','Boykin','WR','Green Bay Packers');

insert into Player
values('GBWR5','Jeff','Janis','WR','Green Bay Packers');

insert into Player
values('GBTE1','Andrew','Quarless','TE','Green Bay Packers');

insert into Player
values('GBTE2','Richard','Rodgers','TE','Green Bay Packers');

insert into Player
values('GBTE3','Brandon','Bostick','TE','Green Bay Packers');

insert into Player
values('GBDE1','Packers','Defense','DE','Green Bay Packers');

insert into Player
values('GBKI1','Mason','Crosby','KI','Green Bay Packers');




insert into Player
values('MINQB1','Teddy','Bridgewater','QB','Minnesota Vikings');

insert into Player
values('MINQB2','Matt','Cassel','QB','Minnesota Vikings');

insert into Player
values('MINQB3','Christian','Ponder','QB','Minnesota Vikings');

insert into Player
values('MINRB1','Matt','Asiata','RB','Minnesota Vikings');

insert into Player
values('MINRB2','Jerick','McKinnon','RB','Minnesota Vikings');

insert into Player
values('MINRB3','Ben','Tate','RB','Minnesota Vikings');

insert into Player
values('MINRB4','Adrian','Peterson','RB','Minnesota Vikings');

insert into Player
values('MINRB5','Joe','Banyard','RB','Minnesota Vikings');

insert into Player
values('MINRB6','Jeromoe','Felton','RB','Minnesota Vikings');

insert into Player
values('MINWR1','Greg','Jennings','WR','Minnesota Vikings');

insert into Player
values('MINWR2','Cordarrelle','Patterson','WR','Minnesota Vikings');

insert into Player
values('MINWR3','Jarius','Wright','WR','Minnesota Vikings');

insert into Player
values('MINWR4','Charles','Johnson','WR','Minnesota Vikings');

insert into Player
values('MINWR5','Adam','Thielen','WR','Minnesota Vikings');

insert into Player
values('MINTE1','Chase','Ford','TE','Minnesota Vikings');

insert into Player
values('MINTE2','Kyle','Rudolph','TE','Minnesota Vikings');

insert into Player
values('MINTE3','Rhett','Ellison','TE','Minnesota Vikings');

insert into Player
values('MINDE1','Vikings','Defense','DE','Minnesota Vikings');

insert into Player
values('MINKI1','Blair','Walsh','KI','Minnesota Vikings');



insert into Player
values('DALQB1','Tony','Romo','QB','Dallas Cowboys');

insert into Player
values('DALQB2','Brandon','Weeden','QB','Dallas Cowboys');

insert into Player
values('DALRB1','DeMarco','Murray','RB','Dallas Cowboys');

insert into Player
values('DALRB2','Joseph','Randle','RB','Dallas Cowboys');

insert into Player
values('DALRB3','Lance','Dunbar','RB','Dallas Cowboys');

insert into Player
values('DALWR1','Dez','Bryant','WR','Dallas Cowboys');

insert into Player
values('DALWR2','Terrance','Williams','WR','Dallas Cowboys');

insert into Player
values('DALWR3','Cole','Beasely','WR','Dallas Cowboys');

insert into Player
values('DALWR4','Dwayne','Harris','WR','Dallas Cowboys');

insert into Player
values('DALWR5','Devin','Street','WR','Dallas Cowboys');

insert into Player
values('DALTE1','Jason','Witten','TE','Dallas Cowboys');

insert into Player
values('DALTE2','Gavin','Escobar','TE','Dallas Cowboys');

insert into Player
values('DALTE3','James','Hanna','TE','Dallas Cowboys');

insert into Player
values('DALDE1','Cowboys','Defense','DE','Dallas Cowboys');

insert into Player
values('DALKI1','Dan','Bailey','KI','Dallas Cowboys');




insert into Player
values('NYGQB1','Eli','Manning','QB','New York Giants');

insert into Player
values('NYGQB2','Ryan','Nassib','QB','New York Giants');

insert into Player
values('NYGRB1','Rashad','Jennings','RB','New York Giants');

insert into Player
values('NYGRB2','Andre','Williams','RB','New York Giants');

insert into Player
values('NYGRB3','Peyton','Hillis','RB','New York Giants');

insert into Player
values('NYGRB4','Orleans','Darkwa','RB','New York Giants');

insert into Player
values('NYGRB5','Michael','Cox','RB','New York Giants');

insert into Player
values('NYGWR1','Odell','Beckham Jr.','WR','New York Giants');

insert into Player
values('NYGWR2','Ruben','Randle','WR','New York Giants');

insert into Player
values('NYGWR3','Victor','Cruz','WR','New York Giants');

insert into Player
values('NYGWR4','Preston','Parker','WR','New York Giants');

insert into Player
values('NYGWR5','Corey','Washington','WR','New York Giants');

insert into Player
values('NYGWR6','Jerrel','Jernigan','WR','New York Giants');

insert into Player
values('NYGTE1','Larry','Donnell','TE','New York Giants');

insert into Player
values('NYGTE2','Daniel','Fells','TE','New York Giants');

insert into Player
values('NYGTE3','Adrien','Robinson','TE','New York Giants');

insert into Player
values('NYGDE1','Giants','Defense','DE','New York Giants');

insert into Player
values('NYGKI1','Josh','Brown','KI','New York Giants');




insert into Player
values('PHIQB1','Nick','Foles','QB','Philadelphia Eagles');

insert into Player
values('PHIQB2','Mark','Sanchez','QB','Philadelphia Eagles');

insert into Player
values('PHIRB1','LeSean','McCoy','RB','Philadelphia Eagles');

insert into Player
values('PHIRB2','Darren','Sproles','RB','Philadelphia Eagles');

insert into Player
values('PHIRB3','Chris','Polk','RB','Philadelphia Eagles');

insert into Player
values('PHIWR1','Jeremy','Maclin','WR','Philadelphia Eagles');

insert into Player
values('PHIWR2','Jordan','Matthews','WR','Philadelphia Eagles');

insert into Player
values('PHIWR3','Riley','Cooper','WR','Philadelphia Eagles');

insert into Player
values('PHIWR4','Josh','Huff','WR','Philadelphia Eagles');

insert into Player
values('PHIWR5','Jeff','Maehl','WR','Philadelphia Eagles');

insert into Player
values('PHIWR6','Brad','Smith','WR','Philadelphia Eagles');

insert into Player
values('PHITE1','Zach','Ertz','TE','Philadelphia Eagles');

insert into Player
values('PHITE2','Brent','Celek','TE','Philadelphia Eagles');

insert into Player
values('PHITE3','James','Casey','TE','Philadelphia Eagles');

insert into Player
values('PHITE4','Trey','Burton','TE','Philadelphia Eagles');

insert into Player
values('PHIDE1','Eagles','Defense','DE','Philadelphia Eagles');

insert into Player
values('PHIKI1','Cody','Parkey','KI','Philadelphia Eagles');




insert into Player
values('WSHQB1','Kirk','Cousins','QB','Washington Redskins');

insert into Player
values('WSHQB2','Robert','Griffin III','QB','Washington Redskins');

insert into Player
values('WSHQB3','Colt','McCoy','QB','Washington Redskins');

insert into Player
values('WSHRB1','Alfred','Morris','RB','Washington Redskins');

insert into Player
values('WSHRB2','Roy','Helu','RB','Washington Redskins');

insert into Player
values('WSHRB3','Darrel','Young','RB','Washington Redskins');

insert into Player
values('WSHRB4','Silas','Redd','RB','Washington Redskins');

insert into Player
values('WSHWR1','DeSean','Jackson','WR','Washington Redskins');

insert into Player
values('WSHWR2','Pierre','Garcon','WR','Washington Redskins');

insert into Player
values('WSHWR3','Andre','Roberts','WR','Washington Redskins');

insert into Player
values('WSHWR4','Ryan','Grant','WR','Washington Redskins');

insert into Player
values('WSHTE1','Niles','Paul','TE','Washington Redskins');

insert into Player
values('WSHTE2','Jordan','Reed','TE','Washington Redskins');

insert into Player
values('WSHTE3','Logan','Paulsen','TE','Washington Redskins');

insert into Player
values('WSHDE1','Redskins','Defense','DE','Washington Redskins');

insert into Player
values('WSHKI1','Kai','Forbath','KI','Washington Redskins');







--Staff Table

insert into Staff
values('BUFGM', 'Doug', 'Whaley','Buffalo Bills');

insert into Staff
values('BUFHC', 'Doug', 'Marrone','Buffalo Bills');

insert into Staff
values('BUFOC', 'Nathaniel', 'Hackett','Buffalo Bills');

insert into Staff
values('BUFDC', 'Jim', 'Schwartz','Buffalo Bills');

insert into StaffRole
values('BUFGM','General Manager');

insert into StaffRole
values('BUFHC','Head Coach');

insert into StaffRole
values('BUFOC','Offensive Coordinator');

insert into StaffRole
values('BUFDC','Defensive Coordinator');


insert into Staff
values('NEGM', 'Bill', 'Belicheck','New England Patriots');

insert into Staff
values('NEOC', 'Josh', 'McDaniels','New England Patriots');

insert into Staff
values('NEDC', 'Matt', 'Patricia','New England Patriots');

insert into StaffRole
values('NEGM','General Manager');

insert into StaffRole
values('NEGM','Head Coach');

insert into StaffRole
values('NEOC','Offensive Coordinator');


insert into StaffRole
values('NEOC','Quarterbacks Coach');

insert into StaffRole
values('NEDC','Defensive Coordinator');



insert into Staff
values('MIAGM', 'Dennis', 'Hickey','Miami Dolphins');

insert into Staff
values('MIAHC', 'Joe', 'Philbin','Miami Dolphins');

insert into Staff
values('MIAOC', 'Bill', 'Lazor','Miami Dolphins');

insert into Staff
values('MIADC', 'Kevin', 'Coyle','Miami Dolphins');

insert into StaffRole
values('MIAGM','General Manager');

insert into StaffRole
values('MIAHC','Head Coach');

insert into StaffRole
values('MIAOC','Offensive Coordinator');

insert into StaffRole
values('MIADC','Defensive Coordinator');



insert into Staff
values('NYJGM', 'John', 'Idzik','New York Jets');

insert into Staff
values('NYJHC', 'Rex', 'Ryan','New York Jets');

insert into Staff
values('NYJOC', 'Marty', 'Mornhinweg','New York Jets');

insert into Staff
values('NYJDC', 'Dennis', 'Thurman','New York Jets');

insert into StaffRole
values('NYJGM','General Manager');

insert into StaffRole
values('NYJHC','Head Coach');

insert into StaffRole
values('NYJOC','Offensive Coordinator');

insert into StaffRole
values('NYJDC','Defensive Coordinator');



insert into Staff
values('BALGM', 'Ozzie', 'Newsome','Baltimore Ravens');

insert into Staff
values('BALHC', 'John', 'Harbaugh','Baltimore Ravens');

insert into Staff
values('BALOC', 'Gary', 'Kubiak','Baltimore Ravens');

insert into Staff
values('BALDC', 'Dean', 'Pees','Baltimore Ravens');

insert into StaffRole
values('BALGM','General Manager');

insert into StaffRole
values('BALGM','Vice President');

insert into StaffRole
values('BALHC','Head Coach');

insert into StaffRole
values('BALOC','Offensive Coordinator');

insert into StaffRole
values('BALDC','Defensive Coordinator');



insert into Staff
values('CINGM', 'Duke', 'Tobin','Cincinnati Bengals');

insert into Staff
values('CINHC', 'Marvin', 'Lewis','Cincinnati Bengals');

insert into Staff
values('CINOC', 'Hue', 'Jackson','Cincinnati Bengals');

insert into Staff
values('CINDC', 'Paul', 'Guenther','Cincinnati Bengals');


insert into StaffRole
values('CINGM','General Manager');

insert into StaffRole
values('CINHC','Head Coach');

insert into StaffRole
values('CINOC','Offensive Coordinator');

insert into StaffRole
values('CINDC','Defensive Coordinator');



insert into Staff
values('CLEGM', 'Ray', 'Farmer','Cleveland Browns');

insert into Staff
values('CLEHC', 'Mike', 'Pettine','Cleveland Browns');

insert into Staff
values('CLEOC', 'Kyle', 'Shanahan','Cleveland Browns');

insert into Staff
values('CLEDC', 'Jim', 'ONeil','Cleveland Browns');


insert into StaffRole
values('CLEGM','General Manager');

insert into StaffRole
values('CLEHC','Head Coach');

insert into StaffRole
values('CLEOC','Offensive Coordinator');

insert into StaffRole
values('CLEDC','Defensive Coordinator');


insert into Staff
values('PITTGM', 'Kevin', 'Colbert','Pittsburgh Steelers');

insert into Staff
values('PITTHC', 'Mike', 'Tomlin','Pittsburgh Steelers');

insert into Staff
values('PITTDC', 'Dick', 'LeBeau','Pittsburgh Steelers');

insert into Staff
values('PITTOC', 'Todd', 'Haley','Pittsburgh Steelers');


insert into StaffRole
values('PITTGM','General Manager');

insert into StaffRole
values('PITTHC','Head Coach');

insert into StaffRole
values('PITTOC','Offensive Coordinator');

insert into StaffRole
values('PITTDC','Defensive Coordinator');



insert into Staff
values('HOUGM', 'Rick', 'Smith','Houston Texans');

insert into Staff
values('HOUHC', 'Bill', 'OBrien','Houston Texans');

insert into Staff
values('HOUDC', 'Romeo', 'Crennel','Houston Texans');


insert into StaffRole
values('HOUGM','General Manager');

insert into StaffRole
values('HOUHC','Head Coach');

insert into StaffRole
values('HOUHC','Offensive Coordinator');

insert into StaffRole
values('HOUDC','Defensive Coordinator');


insert into Staff
values('INDGM', 'Ryan', 'Grigson','Indianappolis Colts');

insert into Staff
values('INDHC', 'Chuck', 'Pagano','Indianappolis Colts');

insert into Staff
values('INDOC', 'Pep', 'Hamilton','Indianappolis Colts');

insert into Staff
values('INDDC', 'Greg', 'Manusky','Indianappolis Colts');


insert into StaffRole
values('INDGM','General Manager');

insert into StaffRole
values('INDHC','Head Coach');

insert into StaffRole
values('INDOC','Offensive Coordinator');

insert into StaffRole
values('INDDC','Defensive Coordinator');



insert into Staff
values('JAXGM', 'David', 'Caldwell','Jacksonville Jaguars');

insert into Staff
values('JAXHC', 'Gus', 'Bradley','Jacksonville Jaguars');

insert into Staff
values('JAXOC', 'Jedd', 'Fisch','Jacksonville Jaguars');

insert into Staff
values('JAXDC', 'Bob Babich', 'Thurman','Jacksonville Jaguars');


insert into StaffRole
values('JAXGM','General Manager');

insert into StaffRole
values('JAXHC','Head Coach');

insert into StaffRole
values('JAXOC','Offensive Coordinator');

insert into StaffRole
values('JAXDC','Defensive Coordinator');



insert into Staff
values('TENGM', 'Ruston', 'Webster','Tenessee Titans');

insert into Staff
values('TENHC', 'Ken', 'Whisenhunt','Tenessee Titans');

insert into Staff
values('TENOC', 'Jason', 'Michael','Tenessee Titans');

insert into Staff
values('TENDC', 'Ray', 'Horton','Tenessee Titans');


insert into StaffRole
values('TENGM','General Manager');

insert into StaffRole
values('TENGM','Vice President');

insert into StaffRole
values('TENHC','Head Coach');

insert into StaffRole
values('TENOC','Offensive Coordinator');

insert into StaffRole
values('TENDC','Defensive Coordinator');



insert into Staff
values('DENGM', 'John', 'Elway','Denver Broncos');

insert into Staff
values('DENHC', 'John', 'Fox','Denver Broncos');

insert into Staff
values('DENOC', 'Adam', 'Gase','Denver Broncos');

insert into Staff
values('DENDC', 'Jack', 'Del Rio','Denver Broncos');

insert into StaffRole
values('DENGM','General Manager');

insert into StaffRole
values('DENGM', 'Vice President');

insert into StaffRole
values('DENHC','Head Coach');

insert into StaffRole
values('DENOC','Offensive Coordinator');

insert into StaffRole
values('DENDC','Defensive Coordinator');



insert into Staff
values('KCGM', 'John', 'Dorsey','Kansas City Chiefs');

insert into Staff
values('KCHC', 'Andy', 'Reid','Kansas City Chiefs');

insert into Staff
values('KCOC', 'Doug', 'Pederson','Kansas City Chiefs');

insert into Staff
values('KCDC', 'Bob', 'Sutton','Kansas City Chiefs');

insert into StaffRole
values('KCGM','General Manager');

insert into StaffRole
values('KCHC','Head Coach');

insert into StaffRole
values('KCHC','Vice President');

insert into StaffRole
values('KCOC','Offensive Coordinator');

insert into StaffRole
values('KCDC','Defensive Coordinator');


insert into Staff
values('OAKGM', 'Reggie', 'McKenzie','Oakland Raiders');

insert into Staff
values('OAKHC', 'Tony', 'Sparano','Oakland Raiders');

insert into Staff
values('OAKOC', 'Greg', 'Olsen','Oakland Raiders');

insert into Staff
values('OAKDC', 'Jason', 'Tarver','Oakland Raiders');

insert into StaffRole
values('OAKGM','General Manager');

insert into StaffRole
values('OAKHC','Head Coach');

insert into StaffRole
values('OAKHC','Offensive Line Coach');

insert into StaffRole
values('OAKOC','Offensive Coordinator');

insert into StaffRole
values('OAKDC','Defensive Coordinator');



insert into Staff
values('SDGM', 'Tom', 'Telesco','San Diego Chargers');

insert into Staff
values('SDHC', 'Mike', 'McCoy','San Diego Chargers');

insert into Staff
values('SDOC', 'Frank', 'Reich','San Diego Chargers');

insert into Staff
values('SDDC', 'John', 'Pagano','San Diego Chargers');

insert into StaffRole
values('SDGM','General Manager');

insert into StaffRole
values('SDHC','Head Coach');

insert into StaffRole
values('SDOC','Offensive Coordinator');

insert into StaffRole
values('SDDC','Defensive Coordinator');




insert into Staff
values('DALGM', 'Jerry', 'Jones','Dallas Cowboys');

insert into Staff
values('DALHC', 'Jason', 'Garret','Dallas Cowboys');

insert into Staff
values('DALOC', 'Scott', 'Linehan','Dallas Cowboys');

insert into Staff
values('DALOC2', 'Bill', 'Callahan','Dallas Cowboys');

insert into Staff
values('DALDC', 'Rod', 'Marinelli','Dallas Cowboys');

insert into StaffRole
values('DALGM','General Manager');

insert into StaffRole
values('DALGM','Owner');

insert into StaffRole
values('DALGM','President');

insert into StaffRole
values('DALHC','Head Coach');

insert into StaffRole
values('DALOC','Passing Game Coordinator');

insert into StaffRole
values('DALOC2','Running Game Coordinator');

insert into StaffRole
values('DALOC2','Offensive Line Coach');

insert into StaffRole
values('DALDC','Defensive Coordinator');

insert into StaffRole
values('DALDC','Defensive Line Coach');


insert into Staff
values('PHIGM', 'Howie', 'Roseman','Philadelphia Eagles');

insert into Staff
values('PHIHC', 'Chip', 'Kelly','Philadelphia Eagles');

insert into Staff
values('PHIOC', 'Pat', 'Shurmur','Philadelphia Eagles');

insert into Staff
values('PHIDC', 'Billy', 'Davis','Philadelphia Eagles');

insert into StaffRole
values('PHIGM','General Manager');

insert into StaffRole
values('PHIHC','Head Coach');

insert into StaffRole
values('PHIOC','Offensive Coordinator');

insert into StaffRole
values('PHIDC','Defensive Coordinator');



insert into Staff
values('NYGGM', 'Jerry', 'Reese','New York Giants');

insert into Staff
values('NYGHC', 'Tom', 'Coughlin','New York Giants');

insert into Staff
values('NYGOC', 'Ben', 'McAdoo','New York Giants');

insert into Staff
values('NYGDC', 'Perry', 'Fewell','New York Giants');

insert into StaffRole
values('NYGGM','General Manager');

insert into StaffRole
values('NYGGM','Vice President');

insert into StaffRole
values('NYGHC','Head Coach');

insert into StaffRole
values('NYGOC','Offensive Coordinator');

insert into StaffRole
values('NYGDC','Defensive Coordinator');



insert into Staff
values('WASGM', 'Bruce', 'Allen','Washington Redskins');

insert into Staff
values('WASHC', 'Jay','Gruden','Washington Redskins');

insert into Staff
values('WASOC', 'Sean', 'McVay','Washington Redskins');

insert into Staff
values('WASDC', 'Jim', 'Haslett','Washington Redskins');


insert into StaffRole
values('WASGM','General Manager');

insert into StaffRole
values('WASGM','President');

insert into StaffRole
values('WASHC','Head Coach');

insert into StaffRole
values('WASOC','Offensive Coordinator');

insert into StaffRole
values('WASOC','Quarterbacks Coach');

insert into StaffRole
values('WASDC','Defensive Coordinator');


insert into Staff
values('CHIGM', 'Phil', 'Emery','Chicago Bears');

insert into Staff
values('CHIHC', 'Marc', 'Trestman','Chicago Bears');

insert into Staff
values('CHIOC', 'Aaron', 'Kromer','Chicago Bears');

insert into Staff
values('CHIDC', 'Mel', 'Tucker','Chicago Bears');

insert into StaffRole
values('CHIGM','General Manager');

insert into StaffRole
values('CHIHC','Head Coach');

insert into StaffRole
values('CHIOC','Offensive Coordinator');

insert into StaffRole
values('CHIDC','Defensive Coordinator');



insert into Staff
values('DETGM', 'Martin', 'Mayhew','Detroit Lions');

insert into Staff
values('DETHC', 'Jim', 'Caldwell','Detroit Lions');

insert into Staff
values('DETOC', 'Joe', 'Lombardi','Detroit Lions');

insert into Staff
values('DETDC', 'Teryl', 'Austin','Detroit Lions');

insert into StaffRole
values('DETGM','General Manager');

insert into StaffRole
values('DETGM','Vice President');

insert into StaffRole
values('DETHC','Head Coach');

insert into StaffRole
values('DETOC','Offensive Coordinator');

insert into StaffRole
values('DETDC','Defensive Coordinator');


insert into Staff
values('GBGM', 'Ted', 'Thompson','Green Bay Packers');

insert into Staff
values('GBHC', 'Mike', 'McCarthy','Green Bay Packers');

insert into Staff
values('GBOC', 'Tom', 'Clements','Green Bay Packers');

insert into Staff
values('GBDC', 'Dom', 'Capers','Green Bay Packers');

insert into StaffRole
values('GBGM','General Manager');

insert into StaffRole
values('GBGM','Vice President');

insert into StaffRole
values('GBGM','Director of Football Operations');

insert into StaffRole
values('GBHC','Head Coach');

insert into StaffRole
values('GBOC','Offensive Coordinator');

insert into StaffRole
values('GBDC','Defensive Coordinator');



insert into Staff
values('MINGM', 'Rick', 'Spielman','Minnesota Vikings');

insert into Staff
values('MINHC', 'Mike', 'Zimmer','Minnesota Vikings');

insert into Staff
values('MINOC', 'Norv', 'Turner','Minnesota Vikings');

insert into Staff
values('MINDC', 'George', 'Edwards','Minnesota Vikings');

insert into StaffRole
values('MINGM','General Manager');

insert into StaffRole
values('MINHC','Head Coach');

insert into StaffRole
values('MINOC','Offensive Coordinator');

insert into StaffRole
values('MINDC','Defensive Coordinator');




insert into Staff
values('ATLGM', 'Thomas', 'Dimitroff','Atlanta Falcons');

insert into Staff
values('ATLHC', 'Mike', 'Smith','Atlanta Falcons');

insert into Staff
values('ATLOC', 'Dirk', 'Koetter','Atlanta Falcons');

insert into Staff
values('ATLDC', 'Mike', 'Nolan','Atlanta Falcons');

insert into StaffRole
values('ATLGM','General Manager');

insert into StaffRole
values('ATLHC','Head Coach');

insert into StaffRole
values('ATLOC','Offensive Coordinator');

insert into StaffRole
values('ATLDC','Defensive Coordinator');




insert into Staff
values('CARGM', 'Dave', 'Gettleman','Carolina Panthers');

insert into Staff
values('CARHC', 'Ron', 'Rivera','Carolina Panthers');

insert into Staff
values('CAROC', 'Mike','Shula','Carolina Panthers');

insert into Staff
values('CARDC', 'Sean', 'McDermott','Carolina Panthers');

insert into StaffRole
values('CARGM','General Manager');

insert into StaffRole
values('CARHC','Head Coach');

insert into StaffRole
values('CAROC','Offensive Coordinator');

insert into StaffRole
values('CARDC','Defensive Coordinator');




insert into Staff
values('NOGM', 'Mickey', 'Loomis','New Orleans Saints');

insert into Staff
values('NOHC', 'Sean', 'Payton','New Orleans Saints');

insert into Staff
values('NOOC', 'Pete', 'Carmichael','New Orleans Saints');

insert into Staff
values('NODC', 'Rob', 'Ryan','New Orleans Saints');

insert into StaffRole
values('NOGM','General Manager');

insert into StaffRole
values('NOGM','Vice President');

insert into StaffRole
values('NOHC','Head Coach');

insert into StaffRole
values('NOOC','Offensive Coordinator');

insert into StaffRole
values('NODC','Defensive Coordinator');



insert into Staff
values('TBGM', 'Jason', 'Licht','Tampa Bay Buccaneers');

insert into Staff
values('TBHC', 'Lovie', 'Smith','Tampa Bay Buccaneers');

insert into Staff
values('TBOC', 'Jeff', 'Tedford','Tampa Bay Buccaneers');

insert into Staff
values('TBDC', 'Leslie', 'Frazier','Tampa Bay Buccaneers');

insert into StaffRole
values('TBGM','General Manager');

insert into StaffRole
values('TBHC','Head Coach');

insert into StaffRole
values('TBOC','Offensive Coordinator');

insert into StaffRole
values('TBDC','Defensive Coordinator');



insert into Staff
values('ARIGM', 'Steve', 'Keim','Arizona Cardinals');

insert into Staff
values('ARIHC', 'Bruce', 'Arians','Arizona Cardinals');

insert into Staff
values('ARIOC', 'Harold', 'Goodwin','Arizona Cardinals');

insert into Staff
values('ARIDC', 'Todd', 'Bowles','Arizona Cardinals');

insert into StaffRole
values('ARIGM','General Manager');

insert into StaffRole
values('ARIHC','Head Coach');

insert into StaffRole
values('ARIOC','Offensive Coordinator');

insert into StaffRole
values('ARIOC','Offensive Line Coach');

insert into StaffRole
values('ARIDC','Defensive Coordinator');




insert into Staff
values('STLGM', 'Les', 'Snead','St. Louis Rams');

insert into Staff
values('STLHC', 'Jeff', 'Fisher','St. Louis Rams');

insert into Staff
values('STLOC', 'Marty', 'Mornhinweg','St. Louis Rams');

insert into Staff
values('STLDC', 'Dennis', 'Thurman','St. Louis Rams');

insert into StaffRole
values('STLGM','General Manager');

insert into StaffRole
values('STLHC','Head Coach');

insert into StaffRole
values('STLHC','Vice President');

insert into StaffRole
values('STLOC','Offensive Coordinator');

insert into StaffRole
values('STLDC','Defensive Coordinator');




insert into Staff
values('SFGM', 'Trent', 'Baalke','San Francisco 49ers');

insert into Staff
values('SFHC', 'Jim', 'Harbaugh','San Francisco 49ers');

insert into Staff
values('SFOC', 'Greg', 'Roman','San Francisco 49ers');

insert into Staff
values('SFDC', 'Vic', 'Fangio','San Francisco 49ers');

insert into StaffRole
values('SFGM','General Manager');

insert into StaffRole
values('SFHC','Head Coach');

insert into StaffRole
values('SFOC','Offensive Coordinator');

insert into StaffRole
values('SFDC','Defensive Coordinator');



insert into Staff
values('SEAGM', 'John', 'Schneider','Seattle Seahawks');

insert into Staff
values('SEAHC', 'Pete', 'Carrol','Seattle Seahawks');

insert into Staff
values('SEAOC', 'Darrell', 'Bevell','Seattle Seahawks');

insert into Staff
values('SEADC', 'Dan', 'Quinn','Seattle Seahawks');


insert into StaffRole
values('SEAGM','General Manager');

insert into StaffRole
values('SEAGM','Vice President');

insert into StaffRole
values('SEAHC','Head Coach');

insert into StaffRole
values('SEAHC','President');

insert into StaffRole
values('SEAOC','Offensive Coordinator');

insert into StaffRole
values('SEADC','Defensive Coordinator');

