package com.dit.arearatingsystem.web;

import com.dit.arearatingsystem.model.Area;  
import com.dit.arearatingsystem.model.Commutes;
import com.dit.arearatingsystem.model.Event;
import com.dit.arearatingsystem.model.GardaStation;
import com.dit.arearatingsystem.model.HousePrice;
import com.dit.arearatingsystem.model.User;
import com.dit.arearatingsystem.parser.ParseCrimeStatistics;
import com.dit.arearatingsystem.repository.AreaRepository;
import com.dit.arearatingsystem.repository.CommutesRepository;
import com.dit.arearatingsystem.repository.GardaStationRepository;
import com.dit.arearatingsystem.repository.HousePriceRepository;
import com.dit.arearatingsystem.repository.UserRepository;
import com.dit.arearatingsystem.service.SecurityService;
import com.dit.arearatingsystem.service.UserService;
import com.dit.arearatingsystem.validator.UserValidator;
import com.dit.arearatingsystem.parser.*;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.dit.arearatingsystem.model.Review;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
    
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	GardaStationRepository gardaStationRepository;
	
	@Autowired
	AreaRepository areaRepository;
	
	@Autowired
	CommutesRepository commutesRepository;
	
	@Autowired
	HousePriceRepository housePriceRepository;
	
	

	ParseCrimeStatistics parseCrime = new ParseCrimeStatistics();
	ParseHousePrices parseHousePrice = new ParseHousePrices();
	AddReview addReviewMethod = new AddReview();
	SeeAllReviews seeReveiwsMethod = new SeeAllReviews();
	AddEvent addEventMethod = new AddEvent();

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        /*return "redirect:/welcome";*/
        return "commuteplanner";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }
	
	
/*	// THIS REQUEST HANDLES ALLOWING THE USER TO ADD AN AREA TO THEIR LIST OF SAVED AREAS
	@RequestMapping(value = "/saveAreaToProfile", method = RequestMethod.POST)
	public @ResponseBody String saveAreaToProfile(Area area, @RequestParam("latitude") double latitude,
			                                                 @RequestParam("longitude") double longitude, 
			                                                 @RequestParam("areaName") String areaName, 
			                                                 @RequestParam("schools") double schools, 
			                                                 @RequestParam("bars") double bars, 
			                                                 @RequestParam("gym") double gym,
			                                                 @RequestParam("restaurant") double restaurant) {
		  
		  Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for 

	      double house_price = parseHousePrice.ParseHousePrice(latitude, longitude);
	      System.out.println(house_price);
	      area.setHouse_price(house_price);
	      areaRepository.save(area);
	      User user = userRepository.findByUsername(username);
	      
	      System.out.println(username + " just saved " +"Area: " + area + "Bar: " + bars);
	      System.out.println("Bar: " + bars);

		  
	      user.addArea(area);
	      userRepository.save(user);

		return "savedAreas";
	}
	
	
	@RequestMapping(value = "/savedAreasMap", method = RequestMethod.GET)
	public String savedAreas(@Valid Area area, BindingResult bindingResult, Model model) { 
		  Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for 

	      areaRepository.save(area);
	      User user = userRepository.findByUsername(username);
	      
	      List<Area> savedAreas = user.getSavedAreas();
	      for (int i = 0; i < savedAreas.size(); i++) {
	    	  model.addAttribute("savedAreas", savedAreas);
	      }
	      
	      
		return "savedAreas";
	}
	
	@RequestMapping(value = "/deletearea/{areaId}", method = RequestMethod.GET)
	public String deleteArea(@PathVariable("areaId") Long areaId) {
		 
		  Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for 

	      User user = userRepository.findByUsername(username);
	      Area area = areaRepository.findByAreaId(areaId);
	      
	      System.out.println(username + " just deleted " + area.getAreaName());
	      
	      user.deleteArea(area);
	      userRepository.save(user);
	      
	      System.out.println(areaId);  
		  return "areadeleted";
	}
	
	
	@RequestMapping(value = "/map/{areaId}", method = RequestMethod.GET)
	public String viewonmap(@PathVariable("areaId") Long areaId, Model model) {
		 
		  Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for 

	      User user = userRepository.findByUsername(username);
	      Area area = areaRepository.findByAreaId(areaId);
	      
	      double latitude = area.getLatitude();
	      double longitude = area.getLongitude();
	      String address = area.getAreaName();
	      
	     
	      
	      System.out.println("Latitude: " + latitude + " Longitude: " + longitude + " Address: " + address);
	      
	      model.addAttribute("address", address);
	      model.addAttribute("latitude", latitude);
	      model.addAttribute("longitude", longitude);
	      
		  return "viewaddress";
	}
	
	
	
	@RequestMapping(value = "/parseHousePrice", method = RequestMethod.POST)
	public String housePricePage(@Valid HousePrice housePriceObject, @RequestParam("latitude") double latitude,@RequestParam("longitude") double longitude,BindingResult bindingResult, Model model) {
		
		housePriceObject = new HousePrice();
		// Pass this value
		double housePrice = parseHousePrice.ParseHousePrice(latitude, longitude);
		
		List<Double> housePriceList = parseHousePrice.getList();
		//Pass this value
		int number_of_houses = housePriceList.size();
		

		housePriceObject.setHousePrice(housePrice);
		housePriceObject.setNumber_of_houses(number_of_houses);
		
		System.out.println("The average house price for this area is: " + housePrice + " based on " + number_of_houses + " property prices in this area");
		
		housePriceRepository.deleteAll();
		housePriceRepository.save(housePriceObject);
		
		return "NewFile";
	}
	
	
	
	@RequestMapping(value = "/parseHousePrice2", method = RequestMethod.GET) 
    public String printHousePricePage(@Valid HousePrice housePriceObject, BindingResult bindingResult, Model model) { 

	      List<HousePrice> housePrice = new ArrayList<>();
	     
	      housePrice = housePriceRepository.findAll();
	      
	      double averagehouseprice = 380579.4;
	      double housepercent2 = 0;
	      double housepercent = 0;
	      double houseprice = 0;
	      String cheap_or_expensive = "";
	      String minus = "-";
	      
	      for (HousePrice house : housePrice) {
	    	  houseprice = house.getHousePrice();
	      }
	      
	      if(houseprice > averagehouseprice) {
	    	  cheap_or_expensive = "more expensive ";
	    	  housepercent2 = (houseprice - averagehouseprice)/averagehouseprice * 100;
	    	  housepercent =  Math.round(housepercent2 * 100.0) / 100.0;
	      } else if (houseprice < averagehouseprice) {
	    	  cheap_or_expensive = "cheaper ";
	    	  housepercent2 = (houseprice - averagehouseprice)/houseprice * 100;
	    	  housepercent =  Math.round(housepercent2 * 100.0) / 100.0;
	      } else if (houseprice == averagehouseprice) {
	    	  cheap_or_expensive = "the exact same ";
	    	  housepercent2 = 100;
	      }
	      
	      String housepricestatement = ("The houses in this area are " + housepercent + "% " + cheap_or_expensive + " than the PPR average property value.");
	      
	      
	      if(housepricestatement.contains("-")) {
	    	  char[] ca = minus.toCharArray();
	    	    for (char c : ca) {
	    	    	housepricestatement = housepricestatement.replace(""+c, "");
	    	    }
	      }
	      System.out.println(housepricestatement);

	      model.addAttribute("housepricestatement", housepricestatement);
	      model.addAttribute("housePrice", housePrice);
	      
	     
		return "houseprice";
	}
	

	@RequestMapping(value = "/commuteCheckerPage/{latitude}/{longitude}/{address}", method = RequestMethod.GET)
	public String commuteChecker(@Valid Commutes commutes, @PathVariable("address") String address, @PathVariable("latitude") double latitude, 
			                                               @PathVariable("longitude") double longitude, BindingResult bindingResult, Model model) {
		
		
		System.out.println(" Latitude " + latitude + " Longitude " + longitude + " address " + address);
		 Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for 

	      commutesRepository.save(commutes);
	      User user = userRepository.findByUsername(username);
	      
	      List<Commutes> savedCommutes = user.getSavedCommutes();
	      for (int i = 0; i < savedCommutes.size(); i++) {
	    	  model.addAttribute("savedCommutes", savedCommutes);
	      }
	      
	      model.addAttribute("latitude", latitude);
	      model.addAttribute("longitude", longitude);
	      model.addAttribute("address", address);
	      
		return "commuteChecker";
	}
	
	@RequestMapping(value = "/crimestats", method=RequestMethod.POST)
	public String crimeStatistics(@Valid GardaStation gardaStationObject, @RequestParam("gardastationname") String gardaStation_name, BindingResult bindingResult,Model model) {


		System.out.println("crime stats 1");
		System.out.println(" ");
	    System.out.println("Garda Station: " + gardaStation_name);
	    double crime_rating =  parseCrime.ParseCrime(gardaStation_name);
	    System.out.println("Crime Rating: " + crime_rating);
	    
	    gardaStationObject.setGardaStation_name(gardaStation_name);
	    gardaStationObject.setCrime_rating(crime_rating);
	    
	    gardaStationRepository.deleteAll();
		gardaStationRepository.save(gardaStationObject);
		
		
	    
	    
		return "crimestats";
	}
	
	@RequestMapping(value = "/crimeStats2", method = RequestMethod.GET) 
    public String printCrimeStatsPage(@Valid GardaStation gardaStationObject, BindingResult bindingResult, Model model) { 

		  System.out.println("crime stats 2");
		  
	      List<GardaStation> gardaStationList = new ArrayList<>();
	    
          gardaStationList = gardaStationRepository.findAll();
          
          List<GardaStation> gardaStationList2 = gardaStationList;
          
	      
	      model.addAttribute("gardaStationList", gardaStationList);
	      
		return "crimestats";
	}
	
	
	@RequestMapping(value = "/commuteplanner", method = RequestMethod.GET) 
	public String CommutePlanner(@Valid Commutes commutes,  BindingResult bindingResult, Model model) {
		
		

	      
		return "commuteplanner";
	}
	
	
	@RequestMapping(value = "/commuteplanner3", method = RequestMethod.GET) 
	public String CommutePlanner2(@Valid Commutes commutes,  BindingResult bindingResult, Model model) {
		
		

	      
		return "commutePlanner2";
	}
	
	@RequestMapping(value = "/commuteplanner2", method = RequestMethod.GET) 
	public String CommutePlanner2(@Valid Commutes commutes, @RequestParam("address")String address, BindingResult bindingResult, Model model) {
		
		
		System.out.println(address);

		String address2 = address;
		
		model.addAttribute("address2", address2);
	      
		return "commuteChecker";
	}
	
	@RequestMapping(value = "/savecommutes", method = RequestMethod.POST) 
	public @ResponseBody String saveCommutesToUser(Commutes commutes, @RequestParam("address") String address, @RequestParam("addressnickname") String addressnickname) {
		
		  Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for 

	      commutesRepository.save(commutes);
	      User user = userRepository.findByUsername(username);
	      
	      System.out.println(username + " just saved | Area: " + commutes + "|called: " + address + "|nickname: " + addressnickname);

		  
	      user.addCommute(commutes);
	      userRepository.save(user);
		
		return "welcome";
	}
	
	@RequestMapping(value = "/skip", method = RequestMethod.GET) 
	public String Skip() {
		return "welcome";
	}
	
	@RequestMapping(value = "/login2", method = RequestMethod.GET) 
	public String Login2() {
		return "login2";
	}
	
	
	@RequestMapping(value = "/map/savedAreasMap", method = RequestMethod.GET) 
	public String saveAreaRedirect(@Valid Area area, BindingResult bindingResult, Model model) {
		
		  Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for 

	      areaRepository.save(area);
	      User user = userRepository.findByUsername(username);
	      
	      List<Area> savedAreas = user.getSavedAreas();
	      for (int i = 0; i < savedAreas.size(); i++) {
	    	  model.addAttribute("savedAreas", savedAreas);
	      }
		return "savedAreas";
	}
	
	@RequestMapping(value = "/review/{latitude}/{longitude}/{address}", method = RequestMethod.GET) 
	public  String Review(@Valid Review review,  @PathVariable("address") String address, @PathVariable("latitude") double latitude, 
            @PathVariable("longitude") double longitude, BindingResult bindingResult, Model model) {
		

		
System.out.println(" Latitude " + latitude + " Longitude " + longitude + " address " + address );

	      
	      
		return "review";
	}
	
	@RequestMapping(value = "/addreview/{address}/{latitude}/{longitude}", method = RequestMethod.GET) 
	public  String addReview(@Valid Review review, @RequestParam("comment") String comment, @PathVariable("address") String address, @PathVariable("latitude") double latitude, 
            @PathVariable("longitude") double longitude, BindingResult bindingResult, Model model) {
		
		  Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for
	      User user = userRepository.findByUsername(username);
	      
		
          System.out.println(" Latitude " + latitude + " Longitude " + longitude + " address " + address + "user: " + user.getUsername() + "comment" + comment);
		

          addReviewMethod.addReview( comment,  longitude,  latitude,  address,  username);

          
	      
		return "welcome";		
	}
	
	@RequestMapping(value = "/readreview/{latitude}/{longitude}", method = RequestMethod.GET) 
	public  String readReview(@Valid Review review,  @PathVariable("latitude") double latitude, 
            @PathVariable("longitude") double longitude, BindingResult bindingResult, Model model) {
		
		  Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for
	      User user = userRepository.findByUsername(username);
	      
		
          System.out.println(" Latitude " + latitude + " Longitude " + longitude + "user: " + user.getUsername());
		

          ArrayList<Review> reviews = seeReveiwsMethod.getAllReviews(latitude, longitude);

          model.addAttribute("reviews", reviews);
	      
		return "seeallreviews";		
	}
	*/
	// The inclusion of a 404 page removes the logo from the navbar but otherwise works fine
	@RequestMapping(value = "/*")
	public String error() {
		return "404";
	}
	
	@RequestMapping(value = "/addeventpage")
	public String addEvent() {
		return "AddEvent";
	}
	
	@RequestMapping(value = "/addevent", method = RequestMethod.GET) 
	public String addEvent(@Valid Event event, BindingResult bindingResult, Model model, @RequestParam("description") String description, @RequestParam("eventname") String eventname
			              , @RequestParam("addressBox") String address, @RequestParam("latitude") String latitude, @RequestParam("longitude") String longitude,
			                @RequestParam("eventdate") String date, @RequestParam("start-time") String starttime, @RequestParam("end-time") String endtime) {
		
		  Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for
	      User user = userRepository.findByUsername(username);
	      
	      System.out.println("\nEvent name " + eventname + 
	    		  			 "\nComment " + description +
	    		  			 "\nHost:  " + username+ 
	    		  			 "\nAddress: " + address + 
	    		  			 "\nDate: " + date + 
	    		  			 "\nLatitude" + latitude + 
	    		  			 "\nLongitude" + longitude + 
	    		  			 "\nStart Time: " + starttime +
	    		  			 "\nEnd Time:" + endtime);
	      
	      int attendees = 0;
	      
        /*
		
			
          addReviewMethod.addReview( comment,  longitude,  latitude,  address,  username);
*/
	      addEventMethod.addEvent(eventname, description, username, address, date, starttime, endtime, longitude, latitude);
          
	      
		return "welcome";		
	}
	
	@RequestMapping(value = "/landingpage", method = RequestMethod.GET) 
	public String LandingPage() {
		return "LandingPage";
	}
}