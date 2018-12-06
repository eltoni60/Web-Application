-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.87-community-nt


CREATE DATABASE IF NOT EXISTS moviestoredb;
USE moviestoredb;

--
-- Definition of table `card`
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `cardID` int(10) unsigned NOT NULL auto_increment,
  `accountID` int(10) unsigned default NULL,
  `creditCardCCV` int(10) unsigned default NULL,
  `creditCardNumber` text,
  `cardHolderFirstName` varchar(45) default NULL,
  `cardHolderLastName` varchar(45) default NULL,
  `expYear` int(10) unsigned default NULL,
  `expMonth` int(10) unsigned default NULL,
  `ccType` varchar(45) default NULL,
  PRIMARY KEY  (`cardID`),
  KEY `FK_card_1` (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `card`
--


INSERT INTO `card` (`accountID`,`creditCardCCV`,`creditCardNumber`,`cardHolderFirstName`,`cardHolderLastName`,`expYear`,`expMonth`,`ccType`) VALUES 
 (10001,12345,'3994781776575320','Richard','Shelby',2009,11,'AmericanExpress\r'),
 (10002,12345,'1933667408756440','Jeff','Sessions',2011,10,'Discover\r'),
 (10003,12345,'9751105946061040','Ted','Stevens',2011,5,'Visa\r'),
 (10004,12345,'1202366155621340','Lisa','Murkowski',2010,5,'Discover\r'),
 (10005,12345,'8035362684046050','John','McCain',2012,9,'AmericanExpress\r'),
 (10006,12345,'1876408666555860','Jon','Kyl',2008,9,'Discover\r'),
 (10007,12345,'7979756355328080','Blanche','Lincoln',2009,7,'MasterCard\r'),
 (10008,12345,'6295809193605710','Mark','Pryor',2008,9,'MasterCard\r'),
 (10009,12345,'5991223319790250','Dianne','Feinstein',2009,4,'Visa\r'),
 (10010,12345,'4919623420034730','Barbara','Boxer',2012,7,'Visa\r'),
 (10011,12345,'2568476161496700','Wayne','Allard',2010,3,'Visa\r'),
 (10012,12345,'8648458933928500','Ken','Salazar',2015,2,'Discover\r'),
 (10013,12345,'9892984032195930','Chris','Dodd',2013,8,'Discover\r'),
 (10014,12345,'3590389378753280','Joe','Lieberman',2016,8,'AmericanExpress\r'),
 (10015,12345,'7389010056583180','Joe','Biden',2009,11,'MasterCard\r'),
 (10016,12345,'4238545958242720','Tom','Carper',2011,1,'Visa\r'),
 (10017,12345,'9542286651415390','Bill','Nelson',2009,9,'Discover\r'),
 (10018,12345,'7389010056583180','Mel','Martinez',2010,6,'MasterCard\r'),
 (10019,12345,'4087388550889250','Dick','Durbin',2009,6,'MasterCard\r'),
 (10020,12345,'5997601199766710','Barack','Obama',2013,1,'Visa\r');



--
-- Definition of table `level`
--

DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `levelName` varchar(15) NOT NULL default '',
  `levelNoDvdPerMonth` int(10) unsigned default NULL,
  `levelChargePerMonth` varchar(45) default NULL,
  PRIMARY KEY  USING BTREE (`levelName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--


INSERT INTO `level` (`levelName`,`levelNoDvdPerMonth`,`levelChargePerMonth`) VALUES 
 ('Gold',2,'$6.95 \r'),
 ('Platinum',3,'$9.95 \r'),
 ('Silver',1,'$3.95 \r');



--
-- Definition of table `member`
--

DROP TABLE IF EXISTS `subscriber`;
CREATE TABLE `subscriber` (
  `accountID` int(10) unsigned NOT NULL auto_increment,
  `levelName` varchar(15) default 'Silver',
  `firstName` varchar(45) default NULL,
  `lastName` varchar(45) default NULL,
  `billAddressLine1` varchar(45) default NULL,
  `billAddressLine2` varchar(45) default NULL,
  `billCity` varchar(45) default NULL,
  `billState` varchar(45) default NULL,
  `billZipCode` varchar(10) default NULL,
  `phoneNumber` varchar(20) default NULL,
  `emailAddress` varchar(45) default NULL,
  `memberPassword` varchar(45) default NULL,
  `accountCreateDate` date default NULL,
  `accountStatus` varchar(6) default 'trial',
  PRIMARY KEY  (`accountID`)
) ENGINE=InnoDB AUTO_INCREMENT=10021 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--


INSERT INTO `subscriber` (`accountID`,`levelName`,`firstName`,`lastName`,`billAddressLine1`,`billAddressLine2`,`billCity`,`billState`,`billZipCode`,`phoneNumber`,`emailAddress`,`memberPassword`,`accountCreateDate`,`accountStatus`) VALUES 
 (10001,'silver','Richard','Shelby','422 Princeton Ct.','','Birmingham','AL','56231','(555) 555-0001','rshelby@yahoo.com','sesame','2007-01-01', 'active'),
 (10002,'gold','Jeff','Sessions','68 Hanover Dr.','Apt 2','Mobile','AL','56498','(555) 555-0002','jsessions@yahoo.com','sesame','2007-01-01', 'active'),
 (10003,'platinum','Ted','Stevens','1001 S. Limerick Dr.','','Anchorage','AK', '45678','(555) 555-1112','tstevens@yahoo.com','sesame','2007-01-01', 'acive'),
 (10004,'silver','Lisa','Murkowski','78 Bay Rd.','','Anchorage','AK','45678','(555) 558-4621','lmurkowski@yahoo.com','sesame','2007-01-01', 'active'),
 (10005,'gold','John','McCain','3042 W. Sunset Blvd','','Phoenix','AZ','98576','(555) 982-3861','jmccain@yahoo.com','sesame','2008-01-01', 'active'),
 (10006,'platinum','Jon','Kyl','893 E.Rocky Rd.','Suite 701','Phoenix','AZ','584652','(555) 465-7312','jkyl@yahoo.com','sesame','2006-01-01', 'active'),
 (10007,'silver','Blanche','Lincoln','3753 N. Pulaski Rd','','Helena','AR', '512349','(555) 643-1248','blincoln@yahoo.com','sesame','2006-01-01', 'active'),
 (10008,'gold','Mark','Pryor','9 Faith Hill','Apt 7','Boumont','AR','76454','(555) 643-1279','mpryor@yahoo.com','sesame','2008-01-01', 'active'),
 (10009,'platinum','Dianne','Feinstein','239 Seaside Rd.','','Pasadena','CA','425687','(555) 976-4542','dfeinstein@yahoo.com','sesame','2008-01-01', 'active'),
 (10010,'silver','Barbara','Boxer','678 S. Wales Street','','San Francisco','CA','124867','(555) 643-4789','bboxer@yahoo.com','sesame','2006-01-01', 'active'),
 (10011,'gold','Wayne','Allard','3833 N. Pinecone Way','','Denver','CO','78663','(555) 982-3572','wallard@yahoo.com','sesame','2008-01-01', 'active'),
 (10012,'platinum','Ken','Salazar','1232 E. 5th Street','','Boulder','CO','30454','(892) 352-8758','ksalazar@yahoo.com','sesame','2008-01-01', 'active'),
 (10013,'silver','Chris','Dodd','89','','New Haven','CT','34222','(304) 985-7129','cdodd@yahoo.com','sesame','2007-01-01', 'active'),
 (10014,'gold','Joe','Lieberman','468 Kane Court','','Bridgeport','CT','39845','(398) 457-1029','jlieberman@yahoo.com','sesame','2007-01-01', 'active'),
 (10015,'platinum','Joe','Biden','9485 Diversey Ave.','','Wellington','DE','2435','(239) 482-9762','jbiden@yahoo.com','sesame','2007-01-01', 'active'),
 (10016,'silver','Tom','Carper','12 Peacock Circle','','Monterrey','DE','24872','(239) 847-5120','tcarper@yahoo.com','sesame','2008-01-01', 'active'),
 (10017,'gold','Bill','Nelson','4820 Futon Rd.','','Miami','FL','20841','(304) 920-9678','bnelson@yahoo.com','sesame','2007-01-01', 'active'),
 (10018,'platinum','Mel','Martinez','248 Beachside Drive','','Pensacola','FL','60948','(789) 465-8927','mmartinez@yahoo.com','sesame','2008-01-01', 'active'),
 (10019,'silver','Dick','Durbin','300 E. Wacker Dr.','','Chicago','IL','60001','(312) 394-8762','ddurbin@yahoo.com','sesame','2008-01-01', 'active'),
 (10020,'gold','Barack','Obama','32 S. State Street','','Chicago','IL','60001','(312) 389-4762','bobama@yahoo.com','sesame','2008-01-01', 'active');


--
-- Definition of table `movie`
--

DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `movieID` int(10) unsigned NOT NULL auto_increment,
  `movieGenre` varchar(45) default NULL,
  `movieTitle` varchar(45) default NULL,
  `movieDescription` text,
  `movieYearReleased` varchar(10) default NULL,
  `movieImage` varchar(45) default NULL,
  `movieTrailer` varchar(255) default NULL,
  `movieReleaseDate` date default NULL,
  `movieMPAARating` varchar(10) default NULL,
  `director` varchar(45) NOT NULL,
  `actor1` varchar(45) NOT NULL,
  `actor2` varchar(45) NOT NULL,
  PRIMARY KEY  (`movieID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movieID`,`movieGenre`,`movieTitle`,`movieDescription`,`movieYearReleased`,`movieImage`,`movieTrailer`,`movieReleaseDate`,`movieMPAARating`,`director`,`actor1`,`actor2`) VALUES 
 (1,'Drama','11:14','Tells the seemingly random yet vitally connected story of a set of incidents that all converge one evening at 11:14pm. The story follows the chain of events of five different characters and five different storylines that all converge to tell the story of murder and deceit.','2003','1114.jpg','http://www.imdb.com/video/screenplay/vi2326987033/','2004-08-20','R','Greg Marcks','Henry Thomas','Blake Heron\r'),
 (2,'Drama','21 Grams','A freak accident brings together a critically ill mathematician (Penn) a grieving mother (Watts) and a born-again ex-con (Del Toro).','2003','21Grams.jpg','http://www.imdb.com/video/screenplay/vi3383951641/','2003-12-26','R','Alejandro González Iñárritu','Sean Penn','Naomi Watts\r'),
 (3,'Drama','25th Hour','Cornered by the DEA convicted New York drug dealer Montgomery Brogan (Norton) reevaluates his life in the 24 remaining hours before facing a seven-year jail term.','2002','25thHour.jpg','http://www.imdb.com/video/screenplay/vi3350397209/','2003-01-10','R','Spike Lee','Edward Norton','Philip Seymour Hoffman\r'),
 (4,'Drama','A Beautiful Mind','After a brilliant but asocial mathematician accepts secret work in cryptography his life takes a turn to the nightmarish.','2001','ABeautifulMind.jpg','http://www.imdb.com/video/screenplay/vi2279866649/','2002-01-04','PG-13','Ron Howard','Russell Crowe','Ed Harris\r'),
 (5,'Drama','A Bronx Tale','A father becomes worried when a local gangster befriends his son in the Bronx in the 1960s.','1993','ABronxTale.jpg','http://www.youtube.com/watch?v=1bkIqZfviXU','1993-09-29','R','Robert De Niro','Chazz Palminteri','Lillo Brancato\r'),
 (6,'Drama','A Few Good Men','Neo military lawyer Kaffee defends Marines accused of murder; they contend they were acting under orders.','1992','AFewGoodMen.jpg','http://www.imdb.com/video/screenplay/vi2142503193/','1992-12-11','R','Rob Reiner','Jack Nicholson','Tom Cruise\r'),
 (7,'Sci-Fi','Alien','A mining ship investigating a suspected SOS lands on a distant planet. The crew discovers some strange creatures and investigates.','1979','Alien.jpg','http://www.imdb.com/video/imdb/vi1497801241/','1979-05-25','R','Ridley Scott','Tom Skerritt','Sigourney Weaver\r'),
 (8,'Sci-Fi','Alien³','Ripley continues to be stalked by a savage alien after her escape pod crashes on a prison planet.','1992','Alien3.jpg','http://www.imdb.com/video/screenplay/vi1520474905/','1992-05-22','R','David Fincher','Sigourney Weaver','Charles Dutton\r'),
 (9,'Sci-Fi','Aliens','The planet from Alien (1979) has been colonized but contact is lost. This time the rescue team has impressive firepower enough?','1986','Aliens.jpg','http://www.imdb.com/video/screenplay/vi368744473/','1986-07-18','R','James Cameron','Sigourney Weaver','Carrie Henn\r'),
 (10,'Drama','Always Outnumbered','An ex-con moves to L.A. to find work and creates a disturbance by fighting for a position.','1998','AlwaysOutnumbered.jpg','http://www.youtube.com/watch?v=bMgLHo1phOw','1998-03-21','R','Michael Apted','Laurence Fishburne','Daniel Williams\r'),
 (11,'Drama','Amadeus','The incredible story of Wolfgang Amadeus Mozart told in flashback mode by Antonio Salieri - now confined to an insane asylum.','1984','Amadeus.jpg','http://www.imdb.com/video/screenplay/vi2535496985/','1984-09-19','R','Milos Forman','F. Murray Abraham','Tom Hulce\r'),
 (12,'Drama','American Beauty','Lester Burnham a depressed suburban father in a mid-life crisis decides to turn his hectic life around after developing an infatuation for his daughter\'s attractive friend.','1999','AmericanBeauty.jpg','http://www.imdb.com/video/screenplay/vi917897497/','1999-10-01','R','Sam Mendes','Kevin Spacey','Annette Bening\r'),
 (13,'Drama','American History X','A former neo-nazi skinhead (Norton) tries to prevent his younger brother (Furlong) from going down the same wrong path that he did.','1998','AmericanHistoryX.jpg','http://www.imdb.com/video/screenplay/vi854001177/','1998-10-30','R','Tony Kaye','Edward Norton','Edward Furlong\r'),
 (14,'Drama','Amistad','AMISTAD is about a 1839 mutiny aboard a slave ship that is traveling towards the Northeast Coast of America. Much of the story involves a court-room 1 about the free-man who led the revolt.','1997','Amistad.jpg','http://www.imdb.com/video/screenplay/vi2161771289/','1997-12-10','R','Steven Spielberg','Morgna Freeman','Nigel Hawthorne\r'),
 (15,'Drama','Amores perros','A horrific car accident connects three stories each involving characters dealing with loss regret and life\'s harsh realities all in the name of love.','2000','AmoresPerros.jpg','http://www.youtube.com/watch?v=XToRtfQbeHg','2000-06-16','R','Alejandro González Iñárritu','Emilio Echevarría','Gael García Bernal\r'),
 (16,'Comedy','Anger Management','Sandler plays a businessman who is wrongly sentenced to an anger-management program where he meets an aggressive instructor.','2003','AngerManagement.jpg','http://www.imdb.com/video/screenplay/vi3853910297/','2003-04-11','PG-13','Peter Segal','Jack Nicholson','Adam Sandler\r'),
 (17,'Drama','Any Given Sunday','Any Given Sunday is a behind the scenes look at the life and death struggles of modern day gladiators and those who lead them.','1999','AnyGivenSunday.jpg','http://www.youtube.com/watch?v=RN7sKvaHDlA','1999-12-22','R','Oliver Stone','Al Pacino','Cameron Diaz\r'),
 (18,'Comedy','Arizona Dream','An Innuit hunter races his sled home with a fresh-caught halibut. This fish pervades the entire film...','1993','ArizonaDream.jpg','http://www.youtube.com/watch?v=5xgHBIHUqfc','1994-09-09','R','Emir Kusturica','Johnny Depp','Jerry Lewis\r'),
 (19,'Drama','Arlington Road','A college professor begins to suspect that his neighbour is a terrorist.','1999','ArlingtonRd.jpg','http://www.youtube.com/watch?v=nk2CPzIgBRo','1999-07-09','R','Mark Pellington','Jeff Bridges','Tim Robbins\r'),
 (20,'Comedy','As Good as It Gets','A single mother/waitress a misanthropic author and a gay artist form an unlikely friendship','1997','AsGoodAsItGets.jpg','http://www.youtube.com/watch?v=BXHxg6Ug9GM','1997-12-25','PG-13','James Brooks','Jack Nicholson','Helen Hunt\r'),
 (21,'Action','Assassins','Robert Rath (Sylvester Stallone) is a seasoned hitman who just wants out of the business with no back talk...','1995','Assassins.jpg','http://www.imdb.com/video/screenplay/vi4038525209/','1995-10-06','R','Richard Donner','Sylverster Stallone','Antonio Banderas\r'),
 (22,'Drama','At First Sight','A blind man has an operation to regain his sight at the urging of his girlfriend and must deal with the changes to his life.','1999','AtFirstSight.jpg','http://www.youtube.com/watch?v=os50D-aOZQo','1999-01-15','R','Irwin Winkler','Val Kilmer','Mira Sorvino\r'),
 (23,'Drama','Autumn in New York','Romantic 1 about an aging playboy who falls for a sweet but terminally ill young woman.','2000','AutumnInNewYork.jpg','http://www.youtube.com/watch?v=zACckn8ie-8','2000-08-11','PG-13','Joan Chen','Richard Gere','Winona Ryder\r'),
 (24,'Drama','Awakenings','The victims of an encephalitis epidemic many years ago have been catatonic ever since but now a new drug offers the prospect of reviving them.','1990','Awakenings.jpg','http://www.imdb.com/video/screenplay/vi1387790617/','1990-12-20','PG-13','Penny Marshall','Robert De Niro','Julie Kavner\r'),
 (25,'Drama','Babel','Tragedy strikes a married couple on vacation in the Moroccan desert touching off an interlocking story involving four different families.','2006','Babel.jpg','http://www.imdb.com/video/screenplay/vi2058879257/','2006-11-10','R','Alejandro González Iñárritu','Brad Pitt','Cate Blanchett\r'),
 (26,'Drama','Bang Bang You\'re Dead','For the most part it\'s a tale of a kid Trevor who gets picked on a lot a school. Not as much as he used to...','2002','BangBangYourDead.jpg','http://www.cinemagia.ro/trailer/bang-bang-youre-dead-5882/','2002-10-13','R','Guy Ferland','Ben Foster','Thomas Cavanagh\r'),
 (27,'Drama','Basic','A DEA agent investigates the disappearance of a legendary Army ranger drill sergeant and several of his cadets during a training exercise gone severely awry.','2003','Basic.jpg','http://www.imdb.com/video/screenplay/vi112787737/','2003-03-28','R','John McTiernan','John Travolta','Samuel L. Jackson\r'),
 (28,'Drama','Basic Instinct','A police detective is in charge of the investigation of a brutal murder in which a beautiful and seductive woman could be involved.','1992','BasicInstinct.jpg','http://www.imdb.com/video/screenplay/vi129564953/','1992-03-20','R','Paul Verhoeven','Michael Douglas','Sharon Stone\r'),
 (29,'Drama','Before Sunset','It\'s nine years after Jesse and Celine first met; now they encounter one another on the French leg of Jesse\'s book tour.','2004','BeforeSunset.jpg','http://www.imdb.com/video/screenplay/vi2813919513/','2004-06-17','R','Richard Linklater','Ethan Hawke','Julie Delpy\r'),
 (30,'Comedy','Being John Malkovich','A puppeteer discovers a portal that leads literally into the head of the movie star John Malkovich.','1999','BeingJohnMalkovich.jpg','http://www.imdb.com/video/screenplay/vi3778520089/','1999-11-24','R','Spike Jonze','Cameron Diaz','John Malkovich\r'),
 (31,'Drama','Best Laid Plans','Ever feel like the world is conspiring against you... You don\'t have to tell me where you\'ve been... Everyone sucks but us... keeping a relationship alive can be murder.','1999','BestLaidPlans.jpg','http://www.imdb.com/video/screenplay/vi364511513/','1999-05-14','R','Mike Barker','Alessandro Nivola','Reese Witherspoon\r'),
 (32,'Sci-Fi','Bicentennial Man','An android endeavors to become human as he gradually acquires emotions.','1999','BicentennialMan.jpg','http://www.imdb.com/video/screenplay/vi783941913/','1999-12-17','PG','Chris Columbus','Robin Williams ','Embeth Davidtz\r'),
 (33,'Drama','Big Fish','A story about a son trying to learn more about his dying father by reliving stories and myths his father told him about himself.','2003','BigFish.jpg','http://www.imdb.com/video/screenplay/vi1522139417/','2004-01-09','PG-13','Tim Burton','Ewan McGregor','Albert Finney\r'),
 (34,'Drama','Birdy','Two friends arrive back from Vietnam scarred in different ways. One has physical injuries the other...','1984','Birdy.jpg','http://www.imdb.com/video/screenplay/vi1840906521/','1984-12-21','R','Alan Parker','Matthew Modine','Nicholas Cage\r'),
 (35,'Comedy','Birthday Girl','A thirtysomething bank clerk from St Albans has his small-town life exploded by the arrival of his Russian mail-order bride.','2001','BirthdayGirl.jpg','http://www.imdb.com/video/screenplay/vi1743691289/','2002-02-01','R','Jez Butterworth','Nicole Kidman','Ben Chaplin\r'),
 (36,'Drama','Blow','The story of George Jung the man who established the American cocaine market in the 1970\'s.','2001','Blow.jpg','http://www.imdb.com/video/screenplay/vi3504603417/','2001-04-06','R','Ted Demme','Johnny Depp','Penélope Cruz\r'),
 (37,'Horror','Book of Shadows: Blair Witch 2','College students at a Boston college become fascinated by the events of the three missing filmmakers in Maryland so they decide to go into the same woods and find out what really happened.','2000','BlairWitch2.jpg','http://www.imdb.com/video/screenplay/vi3300524313/','2000-10-27','R','Joe Berlinger','Kim Director','Kurt Loder\r'),
 (38,'Drama','Boss of Bosses','The story of the rise and fall of the powerful New York City organized crime boss Paul Castellano.','2001','BossOfBosses.jpg','http://www.youtube.com/watch?v=shSjnxcY1I8','2005-07-19','R','Dwight Little','Angela Alvarado ','Chazz Palminteri\r'),
 (39,'Drama','Bounce','A man switches plane tickets with another man who dies in that plane in a crash. The man falls in love with the deceased one\'s wife.','2000','Bounce.jpg','http://www.imdb.com/video/screenplay/vi2548997657/','2000-11-15','PG-13','Don Roos','Ben Affleck','Gweneth Paltrow\r'),
 (40,'Drama','Bringing Out the Dead','Frank Pierce is a paramedic working Gotham\'s Hell\'s Kitchen. He\'s become burned out and haunted by visions of the people he\'s tried to save.','1999','BringingOutTheDead.jpg','http://www.imdb.com/video/screenplay/vi1002176793/','1999-10-22','R','Martin Scorsese','Nicholas Cage','Patricia Arquette\r'),
 (41,'Comedy','Buffalo \'66','Billy is released after five years in prison. In the next moment he kidnaps teenage student Layla and visits his parents with her...','1998','Buffallo66.jpg','http://www.imdb.com/video/screenplay/vi1102840089/','1998-06-26','R','Vincent Gallo','Christina Ricci','Mickey Rourke\r'),
 (42,'Drama','Carandiru','Film based on real life experiences of doctor Drauzio Varella inside dreadful State penitentiary Carandiru...','2003','Carandiru.jpg','http://www.imdb.com/video/screenplay/vi3971744025/','2003-04-11','R','Hector Babenco','Luis Carlos Vasconelos','Milton Gonçalves\r'),
 (43,'Drama','Carlito\'s Way','A Puerto-Rican ex-con just released from prison pledges to stay away from drugs and violence despite the pressure around him and lead on to a better life outside of NYC.','1993','CarlitosWay.jpg','http://www.imdb.com/video/screenplay/vi431816985/','1993-11-10','R','Brian DePalma','Sean Penn','Al Pacino\r'),
 (44,'Drama','Carne trémula','After leaving jail Víctor is still in love with Elena but she\'s married to the former cop -now basketball player- who became paralysed by a shot from Víctor\'s gun...','1997','CarneTremula.jpg','http://www.cinemagia.ro/trailer/carne-tremula-6117/','1998-01-16','R','Pedro Almodóvar','Penélope Cruz','Javier Bardem\r'),
 (45,'Drama','Casino','Greed deception money power and murder occur between two mobster best friends and a trophy wife over a gambling empire.','1995','Casino.jpg','http://www.imdb.com/video/screenplay/vi1035796761/','1995-11-22','R','Martin Scorsese','Robert De Niro','Joe Pesci\r'),
 (46,'Drama','Cast Away','A FedEx executive must transform himself physically and emotionally to survive a crash landing on a deserted island.','2000','CastAway.jpg','http://www.youtube.com/watch?v=2TWYDogv4WQ','2000-12-22','PG-13','Robert Zemeckis','Tom Hanks','Lari White\r'),
 (47,'Drama','Catch Me If You Can','A true story about Frank Abagnale Jr. who before his 19th birthday successfully conned millions of dollars worth of checks as a Pan Am pilot doctor and legal prosecutor.','2002','CatchMeIfYouCan.jpg','http://www.imdb.com/video/screenplay/vi1220346137/','2002-12-25','PG-13','Steven Spielberg','Tom Hanks','Leonarod DiCaprio\r'),
 (48,'Drama','Changing Lanes','The story of what happens one day in New York when a young lawyer and a businessman share a small automobile accident on F.D.R. Drive and their mutual road rage escalates into a feud...','2002','ChangingLanes.jpg','http://www.imdb.com/video/screenplay/vi1824325913/','2002-04-12','R','Roger Michell','Samuel L. Jackson','Ben Affleck\r'),
 (49,'Drama','Cidade de Deus','Two boys growing up in a violent neighborhood of Rio de Janeiro take different paths: one becomes a photographer the other a drug dealer.','2002','CityOfGod.jpg','http://www.imdb.com/video/screenplay/vi3639516697/','2002-08-30','R','Fernando Meirelles','Alexandre Rodrigues','Leandro Firmino\r'),
 (50,'Drama','City by the Sea','Vincent Lamarca whose father was executed for a 1950s kidnapping of a child grew up to become a police officer only to see his own son become a murderer.','2002','CityByTheSea.jpg','http://www.imdb.com/video/screenplay/vi2663252249/','2002-09-06','R','Michael Caton-Jones','Robert De Niro','Frances McDormand\r'),
 (51,'Action','The Avengers','Nick Fury of S.H.I.E.L.D. brings together a team of super humans to form The Avengers to help save the Earth from Loki and his army.','2012','the_avengers.jpg','http://www.youtube.com/watch?v=eOrNdBpGMv8','2012-09-25','PG-13','Joss Whedon','Robert Downey Jr.','Chris Evans'),
 (52,'Action','Terminator 2: Judgment Day','The cyborg who once tried to kill Sarah Connor is dead, and another T-101 must now protect her teenage son, John Connor, from an even more powerful and advanced Terminator, the T-1000.','1991','Terminator2.jpg','http://www.youtube.com/watch?v=oL1RE8JXaIw','1997-10-22','R','James Cameron','Arnold Schwarzenegger','Linda Hamilton'),
 (53,'Sci-Fi','Prometheus','A team of explorers discover a clue to the origins of mankind on Earth, leading them on a journey to the darkest corners of the universe. There, they must fight a terrifying battle to save the future of the human race. ','2012','prometheus.jpg','http://www.youtube.com/watch?v=sftuxbvGwiU','2012-10-09','R','Ridley Scott','Noomi Rapace','Logan-Marshall-Green');


ALTER TABLE movie DROP movieYearReleased;
--
-- Definition of table `movieperson`
--

DROP TABLE IF EXISTS `filmCrew`;
CREATE TABLE `filmCrew` (
  `movieID` int(10) unsigned NOT NULL auto_increment,
  `crewID` varchar(45) NOT NULL default '',
  `actor` tinyint(1) default NULL,
  `producer` tinyint(1) default NULL,
  `director` tinyint(1) default NULL,
  PRIMARY KEY  USING BTREE (`movieID`,`crewID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movieperson`
--

INSERT INTO `filmCrew` (`movieID`,`crewID`,`actor`,`producer`,`director`) VALUES 
 (1,'1',0,0,1),
 (1,'485',1,0,0),
 (1,'486',1,0,0),
 (1,'487',1,0,0),
 (1,'488',1,0,0),
 (1,'489',1,0,0),
 (1,'490',1,0,0),
 (1,'491',1,0,0),
 (1,'492',1,0,0),
 (1,'493',1,0,0),
 (1,'494',1,0,0),
 (2,'2',0,0,1),
 (2,'495',1,0,0),
 (2,'496',1,0,0),
 (2,'497',1,0,0),
 (2,'498',1,0,0),
 (2,'499',1,0,0),
 (2,'500',1,0,0),
 (3,'3',0,0,1),
 (3,'501',1,0,0),
 (3,'502',1,0,0),
 (3,'503',1,0,0),
 (3,'504',1,0,0),
 (3,'505',1,0,0),
 (3,'506',1,0,0),
 (4,'4',0,0,1),
 (4,'507',1,0,0),
 (4,'508',1,0,0),
 (4,'509',1,0,0),
 (4,'510',1,0,0),
 (4,'511',1,0,0),
 (4,'512',1,0,0),
 (5,'5',0,0,1),
 (5,'513',1,0,0),
 (5,'514',1,0,0),
 (5,'515',1,0,0),
 (6,'483',1,0,0),
 (6,'517',1,0,0),
 (6,'519',1,0,0),
 (6,'520',1,0,0),
 (6,'521',1,0,0),
 (6,'6',0,0,1),
 (7,'522',1,0,0),
 (7,'523',1,0,0),
 (7,'524',1,0,0),
 (7,'525',1,0,0),
 (7,'526',1,0,0),
 (7,'527',1,0,0),
 (7,'7',0,0,1),
 (8,'523',1,0,0),
 (8,'531',1,0,0),
 (8,'532',1,0,0),
 (8,'533',1,0,0),
 (8,'534',1,0,0),
 (8,'535',1,0,0),
 (8,'8',0,0,1),
 (9,'523',1,0,0),
 (9,'536',1,0,0),
 (9,'537',1,0,0),
 (9,'538',1,0,0),
 (9,'539',1,0,0),
 (9,'9',0,0,1),
 (10,'10',0,0,1),
 (10,'542',1,0,0),
 (10,'543',1,0,0),
 (10,'544',1,0,0),
 (10,'545',1,0,0),
 (10,'546',1,0,0),
 (11,'11',0,0,1),
 (11,'547',1,0,0),
 (11,'548',1,0,0),
 (11,'549',1,0,0),
 (11,'550',1,0,0),
 (11,'551',1,0,0),
 (11,'552',1,0,0),
 (12,'12',0,0,1),
 (12,'553',1,0,0),
 (12,'554',1,0,0),
 (12,'555',1,0,0),
 (12,'556',1,0,0),
 (12,'557',1,0,0),
 (12,'558',1,0,0),
 (13,'13',0,0,1),
 (13,'501',1,0,0),
 (13,'559',1,0,0),
 (13,'560',1,0,0),
 (13,'561',1,0,0),
 (13,'562',1,0,0),
 (13,'563',1,0,0),
 (13,'564',1,0,0),
 (14,'14',0,0,1),
 (14,'565',1,0,0),
 (14,'566',1,0,0),
 (14,'567',1,0,0),
 (15,'2',0,0,1),
 (15,'568',1,0,0),
 (15,'569',1,0,0),
 (15,'570',1,0,0),
 (15,'571',1,0,0),
 (16,'15',0,0,1),
 (16,'483',1,0,0),
 (16,'572',1,0,0),
 (16,'573',1,0,0),
 (16,'574',1,0,0),
 (17,'16',0,0,1),
 (17,'575',1,0,0),
 (17,'576',1,0,0),
 (17,'577',1,0,0),
 (17,'578',1,0,0),
 (17,'579',1,0,0),
 (17,'580',1,0,0),
 (18,'17',0,0,1),
 (18,'581',1,0,0),
 (18,'582',1,0,0),
 (18,'583',1,0,0),
 (19,'18',0,0,1),
 (19,'584',1,0,0),
 (19,'585',1,0,0),
 (19,'586',1,0,0),
 (19,'587',1,0,0),
 (20,'19',0,0,1),
 (20,'483',1,0,0),
 (20,'588',1,0,0),
 (20,'589',1,0,0),
 (20,'590',1,0,0),
 (21,'20',0,0,1),
 (21,'592',1,0,0),
 (21,'593',1,0,0),
 (21,'594',1,0,0),
 (22,'21',0,0,1),
 (22,'595',1,0,0),
 (22,'596',1,0,0),
 (22,'597',1,0,0),
 (23,'22',0,0,1),
 (23,'598',1,0,0),
 (23,'599',1,0,0),
 (23,'600',1,0,0),
 (24,'23',0,0,1),
 (24,'5',1,0,1),
 (24,'601',1,0,0),
 (24,'602',1,0,0),
 (25,'2',0,0,1),
 (25,'603',1,0,0),
 (25,'604',1,0,0),
 (26,'24',0,0,1),
 (26,'493',1,0,0),
 (26,'605',1,0,0),
 (27,'25',0,0,1),
 (27,'610',1,0,0),
 (27,'611',1,0,0),
 (28,'26',0,0,1),
 (29,'27',0,0,1),
 (29,'612',1,0,0),
 (29,'613',1,0,0),
 (30,'28',0,0,1),
 (30,'576',1,0,0),
 (30,'614',1,0,0),
 (30,'615',1,0,0),
 (31,'29',0,0,1),
 (31,'616',1,0,0),
 (31,'617',1,0,0),
 (32,'30',0,0,1),
 (32,'602',1,0,0),
 (32,'622',1,0,0),
 (32,'623',1,0,0),
 (33,'31',0,0,1),
 (33,'624',1,0,0),
 (33,'625',1,0,0),
 (33,'626',1,0,0),
 (33,'627',1,0,0),
 (34,'32',0,0,1),
 (34,'628',1,0,0),
 (34,'629',1,0,0),
 (35,'33',0,0,1),
 (35,'630',1,0,0),
 (35,'631',1,0,0),
 (36,'34',0,0,1),
 (36,'581',1,0,0),
 (36,'632',1,0,0),
 (36,'633',1,0,0),
 (37,'35',0,0,1),
 (37,'634',1,0,0),
 (37,'635',1,0,0),
 (38,'36',0,0,1),
 (38,'637',1,0,0),
 (39,'37',0,0,1),
 (39,'638',1,0,0),
 (39,'639',1,0,0),
 (40,'38',0,0,1),
 (40,'629',1,0,0),
 (40,'640',1,0,0),
 (40,'641',1,0,0),
 (41,'39',0,0,1),
 (41,'642',1,0,0),
 (41,'643',1,0,0),
 (42,'40',0,0,1),
 (42,'644',1,0,0),
 (42,'645',1,0,0),
 (43,'41',0,0,1),
 (43,'495',1,0,0),
 (43,'575',1,0,0),
 (43,'646',1,0,0),
 (44,'42',0,0,1),
 (44,'632',1,0,0),
 (44,'647',1,0,0),
 (44,'648',1,0,0),
 (45,'38',0,0,1),
 (45,'5',1,0,1),
 (45,'516',1,0,0),
 (45,'578',1,0,0),
 (45,'611',1,0,0),
 (46,'43',0,0,1),
 (46,'649',1,0,0),
 (46,'650',1,0,0),
 (47,'14',0,0,1),
 (47,'649',1,0,0),
 (47,'651',1,0,0),
 (47,'652',1,0,0),
 (47,'653',1,0,0),
 (48,'44',0,0,1),
 (48,'609',1,0,0),
 (48,'638',1,0,0),
 (49,'45',0,0,1),
 (49,'654',1,0,0),
 (49,'655',1,0,0),
 (50,'46',0,0,1),
 (50,'5',1,0,1),
 (50,'656',1,0,0);



--
-- Definition of table `person`
--

DROP TABLE IF EXISTS `crew`;
CREATE TABLE `crew` (
  `crewID` int(10) unsigned NOT NULL auto_increment,
  `crewFirstName` varchar(45) default NULL,
  `crewLastName` varchar(45) default NULL,
  PRIMARY KEY  (`crewID`)
) ENGINE=InnoDB AUTO_INCREMENT=657 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--


INSERT INTO `crew` (`crewID`,`crewFirstName`,`crewLastName`) VALUES 
 (1,'Greg','Marcks'),
 (2,'Alejandro','González Iñárritu'),
 (3,'Spike','Lee'),
 (4,'Ron','Howard'),
 (5,'Robert','De Niro'),
 (6,'Rob','Reiner'),
 (7,'Ridley','Scott'),
 (8,'David','Fincher'),
 (9,'James','Cameron'),
 (10,'Michael','Apted'),
 (11,'Milos','Forman'),
 (12,'Sam','Mendes'),
 (13,'Tony','Kaye'),
 (14,'Steven','Spielberg'),
 (15,'Peter','Segal'),
 (16,'Oliver','Stone'),
 (17,'Emir','Kusturica'),
 (18,'Mark','Pellington'),
 (19,'James','Brooks'),
 (20,'Richard','Donner'),
 (21,'Irwin','Winkler'),
 (22,'Joan','Chen'),
 (23,'Penny','Marshall'),
 (24,'Guy','Ferland'),
 (25,'John','McTiernan'),
 (26,'Paul','Verhoeven'),
 (27,'Richard','Linklater'),
 (28,'Spike','Jonze'),
 (29,'Mike','Barker'),
 (30,'Chris','Columbus'),
 (31,'Tim','Burton'),
 (32,'Alan','Parker'),
 (33,'Jez','Butterworth'),
 (34,'Ted','Demme'),
 (35,'Joe','Berlinger'),
 (36,'Dwight','Little'),
 (37,'Don','Roos'),
 (38,'Martin','Scorsese'),
 (39,'Vincent','Gallo'),
 (40,'Hector','Babenco'),
 (41,'Brian','De Palma'),
 (42,'Pedro','Almodóvar'),
 (43,'Robert','Zemeckis'),
 (44,'Roger','Michell'),
 (45,'Fernando','Meirelles'),
 (46,'Michael','Caton-Jones'),
 (480,'Fred','Flintstone'),
 (481,'Barney','Rubble'),
 (482,'John','Smith'),
 (483,'Jack','Nicholson'),
 (484,'Clint','Eastwood'),
 (485,'Henry','Thomas'),
 (486,'Blake','Heron'),
 (487,'Barbara','Hershey'),
 (488,'Clark','Gregg'),
 (489,'Hilary','Swank'),
 (490,'Shawn','Hatosy'),
 (491,'Stark','Sands'),
 (492,'Colin','Hanks'),
 (493,'Ben','Foster'),
 (494,'Patrick','Swayze'),
 (495,'Sean','Penn'),
 (496,'Naomi','Watts'),
 (497,'Danny','Huston'),
 (498,'Carly','Nahon'),
 (499,'Claire','Pakis'),
 (500,'Benicio','Del Toro'),
 (501,'Edward','Norton'),
 (502,'Philip','Seymour Hoffman'),
 (503,'Barry','Pepper'),
 (504,'Rosario','Dawson'),
 (505,'Anna','Paquin'),
 (506,'Brian','Cox'),
 (507,'Russell','Crowe'),
 (508,'Ed','Harris'),
 (509,'Jennifer','Connelly'),
 (510,'Christopher','Plummer'),
 (511,'Paul','Bettany'),
 (512,'Judd','Hirsch'),
 (513,'Chazz','Palminteri'),
 (514,'Lillo','Brancato'),
 (515,'Francis','Capra'),
 (516,'Joe','Pesci'),
 (517,'Tom','Cruise'),
 (519,'Demi','Moore'),
 (520,'Kevin','Bacon'),
 (521,'Kiefer','Sutherland'),
 (522,'Tom','Skerritt'),
 (523,'Sigourney','Weaver'),
 (524,'Veronica','Cartwright'),
 (525,'Harry','Dean Stanton'),
 (526,'John','Hurt'),
 (527,'Ian','Holm'),
 (531,'Charles','Dutton'),
 (532,'Charles','Dance'),
 (533,'Paul','McGann'),
 (534,'Brian','Glover'),
 (535,'Ralph','Brown'),
 (536,'Carrie','Henn'),
 (537,'Michael','Biehn'),
 (538,'Lance','Henriksen'),
 (539,'Paul','Reiser'),
 (542,'Laurence','Fishburne'),
 (543,'Daniel','Williams'),
 (544,'Bill','Cobbs'),
 (545,'Natalie','Cole'),
 (546,'Laurie','Metcalf'),
 (547,'F. Murray','Abraham'),
 (548,'Tom','Hulce'),
 (549,'Elizabeth','Berridge'),
 (550,'Roy','Dotrice'),
 (551,'Simon','Callow'),
 (552,'Christine','Ebersole'),
 (553,'Kevin','Spacey'),
 (554,'Annette','Bening'),
 (555,'Thora','Birch'),
 (556,'Wes','Bentley'),
 (557,'Mena','Suvari'),
 (558,'Scott','Bakula'),
 (559,'Edward','Furlong'),
 (560,'Beverly','D\'Angelo'),
 (561,'Avery','Brooks'),
 (562,'Jennifer','Lien'),
 (563,'Stacy','Keach'),
 (564,'Elliott','Gould'),
 (565,'Morgan','Freeman'),
 (566,'Nigel','Hawthorne'),
 (567,'Anthony','Hopkins'),
 (568,'Emilio','Echevarría'),
 (569,'Gael','García Bernal'),
 (570,'Goya','Toledo'),
 (571,'Álvaro','Guerrero'),
 (572,'Adam','Sandler'),
 (573,'Marisa','Tomei'),
 (574,'Luis','Guzmán'),
 (575,'Al','Pacino'),
 (576,'Cameron','Diaz'),
 (577,'Dennis','Quaid'),
 (578,'James','Woods'),
 (579,'Jamie','Foxx'),
 (580,'LL','Cool J'),
 (581,'Johnny','Depp'),
 (582,'Jerry','Lewis'),
 (583,'Faye','Dunaway'),
 (584,'Jeff','Bridges'),
 (585,'Tim','Robbins'),
 (586,'Joan','Cusack'),
 (587,'Hope','Davis'),
 (588,'Helen','Hunt'),
 (589,'Greg','Kinnear'),
 (590,'Cuba','Gooding Jr.'),
 (592,'Sylvester','Stallone'),
 (593,'Antonio','Banderas'),
 (594,'Julianne','Moore'),
 (595,'Val','Kilmer'),
 (596,'Mira','Sorvino'),
 (597,'Kelly','McGillis'),
 (598,'Richard','Gere'),
 (599,'Winona','Ryder'),
 (600,'Anthony','LaPaglia'),
 (601,'Julie','Kavner'),
 (602,'Robin','Williams'),
 (603,'Brad','Pitt'),
 (604,'Cate','Blanchett'),
 (605,'Thomas','Cavanagh'),
 (607,'John','Travolta'),
 (608,'Connie','Nielsen'),
 (609,'Samuel L.','Jackson'),
 (610,'Michael','Douglas'),
 (611,'Sharon','Stone'),
 (612,'Ethan','Hawke'),
 (613,'Julie','Delpy'),
 (614,'John','Malkovich'),
 (615,'John','Cusack'),
 (616,'Alessandro','Nivola'),
 (617,'Reese','Witherspoon'),
 (622,'Embeth','Davidtz'),
 (623,'Sam','Neill'),
 (624,'Ewan','McGregor'),
 (625,'Albert','Finney'),
 (626,'Billy','Crudup'),
 (627,'Jessica','Lange'),
 (628,'Matthew','Modine'),
 (629,'Nicolas','Cage'),
 (630,'Nicole','Kidman'),
 (631,'Ben','Chaplin'),
 (632,'Penélope','Cruz'),
 (633,'Paul','Reubens'),
 (634,'Kim','Director'),
 (635,'Kurt','Loder'),
 (637,'Angela','Alvarado'),
 (638,'Ben','Affleck'),
 (639,'Gwyneth','Paltrow'),
 (640,'Patricia','Arquette'),
 (641,'John','Goodman'),
 (642,'Christina','Ricci'),
 (643,'Mickey','Rourke'),
 (644,'Luiz Carlos','Vasconcelos'),
 (645,'Milton','Gonçalves'),
 (646,'John','Leguizamo'),
 (647,'Javier','Bardem'),
 (648,'Francesca','Neri'),
 (649,'Tom','Hanks'),
 (650,'Lari','White'),
 (651,'Leonardo','DiCaprio'),
 (652,'Christopher','Walken'),
 (653,'Martin','Sheen'),
 (654,'Alexandre','Rodrigues'),
 (655,'Leandro','Firmino'),
 (656,'Frances','McDormand');



--
-- Definition of table `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `accountID` int(10) unsigned NOT NULL,
  `movieID` int(10) unsigned NOT NULL default '0',
  `queueSequence` int(10) unsigned default NULL,
  `movieTitle` varchar(45) NOT NULL,
  PRIMARY KEY  USING BTREE (`accountID`,`movieID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`accountID`,`movieID`,`queueSequence`,`movieTitle`) VALUES 
(10001, 1, 1, "11:14"),
(10001, 2, 2, "21 Grams"),
(10002, 3, 1, "25th Hour");

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `accountID` int(10) unsigned NOT NULL,
  `user1` int(10) default 0,
  `user2` int(10) default 0,
  `user3` int(10) default 0,
  PRIMARY KEY  USING BTREE (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into users (accountID, user1, user2, user3) values 
(10001, 1, 0, 0), 
(10002, 2, 0, 0),
(10003, 3, 0, 0), 
(10004, 4, 0, 0),
(10005, 5, 0, 0), 
(10006, 6, 0, 0),
(10007, 7, 0, 0), 
(10008, 8, 0, 0),
(10009, 9, 0, 0), 
(10010, 10, 0, 0),
(10011, 11, 0, 0), 
(10012, 12, 0, 0),
(10013, 13, 0, 0), 
(10014, 14, 0, 0),
(10015, 15, 0, 0), 
(10016, 16, 0, 0),
(10017, 17, 0, 0), 
(10018, 18, 0, 0),
(10019, 19, 0, 0), 
(10020, 20, 0, 0);

DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
	`userid` int(10) auto_increment primary key,
	`userName` varchar(10) NOT NULL,
    `genrePreference` varchar(45) default 'None',
    `favorite1` int(10) default 0,
    `favorite2` int(10) default 0,
    `favorite3` int(10) default 0,
    `crewPerson` int(10) default 0,
    `recent1` int(10) default 0,
    `recent2` int(10) default 0,
    `recent3` int(10) default 0,
    `ageRestriction` enum('yes', 'no') default 'no'
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
INSERT INTO favorites (userName) select firstName from subscriber;


ALTER TABLE subscriber add constraint chk_levelName check (levelName IN ('silver', 'gold', 'platinum'));
ALTER TABLE subscriber add constraint chk_accountStatus check(accountStatus IN ('active', 'canceled', 'trial'));
ALTER TABLE favorites add constraint chk_favorites check(favorite1 IN (movie.movieID));
ALTER TABLE favorites add constraint chk_favorites check(favorite2 IN (movie.movieID));
ALTER TABLE favorites add constraint chk_favorites check(favorite3 IN (movie.movieID));

alter table movie add column views int default 1;
alter table movie add column ratingSum float(2, 1) default 1;
alter table movie add column ratingCount float(2, 1) default 1;
alter table movie add column ratingAvg float(2, 1) as (ratingSum /ratingCount);

Drop table if exists `quotes`;
create table `quotes` (
`quoteID` int auto_increment primary key,
`quoteString` text not null,
`movieTitle` text not null);
update favorites set genrePreference = "Drama", favorite1 = 1, favorite2 = 2, favorite3 = 3, crewPerson = 31, recent1 = 4, recent2 = 5, recent3 = 6 where userID = 1;
update favorites set genrePreference = "Drama", favorite1 = 1, favorite2 = 2, favorite3 = 3, crewPerson = 31, recent1 = 4, recent2 = 5, recent3 = 6 where userID = 2;
update favorites set genrePreference = "Drama", favorite1 = 1, favorite2 = 2, favorite3 = 3, crewPerson = 31, recent1 = 4, recent2 = 5, recent3 = 6 where userID = 3;
update favorites set genrePreference = "Drama", favorite1 = 1, favorite2 = 2, favorite3 = 3, crewPerson = 31, recent1 = 4, recent2 = 5, recent3 = 6 where userID = 4;
update favorites set genrePreference = "Drama", favorite1 = 1, favorite2 = 2, favorite3 = 3, crewPerson = 31, recent1 = 4, recent2 = 5, recent3 = 6 where userID = 5;
update favorites set genrePreference = "Drama", favorite1 = 1, favorite2 = 2, favorite3 = 3, crewPerson = 31, recent1 = 4, recent2 = 5, recent3 = 6 where userID = 6;
update favorites set genrePreference = "Drama", favorite1 = 1, favorite2 = 2, favorite3 = 3, crewPerson = 31, recent1 = 4, recent2 = 5, recent3 = 6 where userID = 7;
update favorites set genrePreference = "Drama", favorite1 = 1, favorite2 = 2, favorite3 = 3, crewPerson = 31, recent1 = 4, recent2 = 5, recent3 = 6 where userID = 8;
update favorites set genrePreference = "Drama", favorite1 = 1, favorite2 = 2, favorite3 = 3, crewPerson = 31, recent1 = 4, recent2 = 5, recent3 = 6 where userID = 9;
update favorites set genrePreference = "Drama", favorite1 = 1, favorite2 = 2, favorite3 = 3, crewPerson = 31, recent1 = 4, recent2 = 5, recent3 = 6 where userID = 10;
