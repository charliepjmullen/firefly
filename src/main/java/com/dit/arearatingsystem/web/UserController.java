package com.dit.arearatingsystem.web;

import com.dit.arearatingsystem.model.Area;
import com.dit.arearatingsystem.model.Commutes;
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
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	// THIS REQUEST HANDLES ALLOWING THE USER TO ADD AN AREA TO THEIR LIST OF SAVED AREAS
	@RequestMapping(value = "/saveAreaToProfile", method = RequestMethod.POST)
	public @ResponseBody String saveAreaToProfile(Area area, @RequestParam("latitude") double latitude,
			                                                 @RequestParam("longitude") double longitude, 
			                                                 @RequestParam("areaName") String areaName, 
			                                                 @RequestParam("schools") double schools, 
			                                                 @RequestParam("parks") double university, 
			                                                 @RequestParam("bar") double bars, 
			                                                 @RequestParam("gym") double gym,
			                                                 @RequestParam("restaurant") double restaurant) {
		
		  Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for 

	      areaRepository.save(area);
	      User user = userRepository.findByUsername(username);
	      
	      System.out.println(username + " just saved " +"Area: " + area);

		  
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
	
	@RequestMapping(value = "/deletearea", method = RequestMethod.POST)
	public String deleteArea(@Valid Area area, BindingResult bindingResult, Model model) {
		 
		  Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for 

	      User user = userRepository.findByUsername(username);
	      System.out.println("User: " + user + "Area:" + area);
	      user.deleteArea(area);
	      userRepository.save(user);
	      
	      System.out.println(user + " deleted " + area);
		  return "savedAreas";
	}
	
	
	
	@RequestMapping(value = "/parseHousePrice", method = RequestMethod.POST)
	public String housePricePage(@Valid HousePrice housePriceObject/*, @RequestParam("latitude") double latitude,@RequestParam("longitude") double longitude*/,BindingResult bindingResult, Model model) {
		
/*		housePriceObject = new HousePrice();
		double latitude = 53.3498053;
		double longitude = -6.260309699999993;
		// Pass this value
		double housePrice = parseHousePrice.ParseHousePrice(latitude, longitude);
		
		List<Double> housePriceList = parseHousePrice.getList();
		//Pass this value
		int number_of_houses = housePriceList.size();
		

		housePriceObject.setHousePrice(housePrice);
		housePriceObject.setNumber_of_houses(number_of_houses);
		
		System.out.println("The average house price for this area is: " + housePrice + " based on " + number_of_houses + " property prices in this area");
		

		List<HousePrice> housepricesList = new ArrayList<HousePrice>();
		housepricesList.add(housePriceObject);
        
		housePriceRepository.save(housePriceObject);
		
		 
	      for (int i = 0; i < housepricesList.size(); i++) {
	    	  	model.addAttribute("housepricesList", housepricesList);
	    	  	//model.addAttribute("housepricelistsize", number_of_houses);
	      }*/

		return "NewFile";
	}
	
	
	
	
	
	
	@RequestMapping(value = "/parseHousePrice2", method = RequestMethod.GET) 
    public String printHousePricePage(@Valid HousePrice housePriceObject, BindingResult bindingResult, Model model) { 
		
		  Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for 

	      housePriceRepository.save(housePriceObject);
	      User user = userRepository.findByUsername(username);
	      
	      List<Area> savedAreas = user.getSavedAreas();
	      for (int i = 0; i < savedAreas.size(); i++) {
	    	  model.addAttribute("savedAreas", savedAreas);
	      }
	      
		return "houseprice";
	}
	
	@RequestMapping(value = "/gardaStation", method={RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String Submit(@RequestBody @RequestParam("gardastationname") String gardaStation_name, Model model) {

		System.out.println(" ");
	    System.out.println("Garda Station: " + gardaStation_name);
	    
	    System.out.println("About to parse....");
	    double rating =  parseCrime.ParseCrime(gardaStation_name);
	    System.out.println("Parsed");
	    
	    System.out.println("Crime Rating: " + rating);
	    
	    model.addAttribute("rating", rating);
	    
		return "/";
	 }
	
	@RequestMapping(value = "/commuteCheckerPage", method = RequestMethod.GET)
	public String commuteChecker(@Valid Commutes commutes, BindingResult bindingResult, Model model) {
		
		 Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for 

	      commutesRepository.save(commutes);
	      User user = userRepository.findByUsername(username);
	      
	      List<Commutes> savedCommutes = user.getSavedCommutes();
	      for (int i = 0; i < savedCommutes.size(); i++) {
	    	  model.addAttribute("savedCommutes", savedCommutes);
	      }
	      
		return "commuteChecker";
	}
	
/*	@RequestMapping(value = "/crimestats", method={RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String crimeStatistics(@ModelAttribute GardaStation gardaStation, @RequestParam("gardastationname") String gardaStation_name, Model model) throws IOException {

		System.out.println(" ");
	    System.out.println("Garda Station: " + gardaStation_name);
	    
	    System.out.println("About to parse....");
	    double rating =  parseCrime.ParseCrime(gardaStation_name);
	    System.out.println("Parsed");
	    
	    System.out.println("Crime Rating: " + rating);
	    
	    model.addAttribute("rating", rating);
	    
		return "crimestats";
	}
	
	@RequestMapping(value = "/houseprice", method={RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String housePrice(HousePrice housePrice, @RequestParam("latitude") double latitude,@RequestParam("longitude") double longitude, Model model) {
		
		double housePriceAverage = parseHousePrice.ParseHousePrice(latitude, longitude);
		
		List<Double> housePriceList = parseHousePrice.getList();
		int housePriceListSize = housePriceList.size();
		
		System.out.println("The average house price for this area is: " + housePriceAverage + " based on " + housePriceListSize + " property prices in this area");
		
		model.addAttribute("houseprice", housePriceAverage);
		model.addAttribute("housepricelistsize", housePriceListSize);
		return "houseprice";
	}*/
	
	@RequestMapping(value = "/commuteplanner", method = RequestMethod.GET) 
	public String CommutePlanner(@Valid Commutes commutes, BindingResult bindingResult, Model model) {
		
		/* Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for 

	      commutesRepository.save(commutes);
	      User user = userRepository.findByUsername(username);
	      
	      List<Commutes> savedCommutes = user.getSavedCommutes();
	      for (int i = 0; i < savedCommutes.size(); i++) {
	    	  model.addAttribute("savedCommutes", savedCommutes);
	      }*/
	      
		return "commuteplanner";
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
	

	
}