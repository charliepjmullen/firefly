package com.dit.arearatingsystem.web;


import com.dit.arearatingsystem.model.Event;
import com.dit.arearatingsystem.model.User;
import com.dit.arearatingsystem.parser.ParseCrimeStatistics;
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
	

	
	

	ParseCrimeStatistics parseCrime = new ParseCrimeStatistics();
	ParseHousePrices parseHousePrice = new ParseHousePrices();
	AddReview addReviewMethod = new AddReview();
	SeeAllReviews seeReveiwsMethod = new SeeAllReviews();
	SeeAllEvents seeEvents = new SeeAllEvents();
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

       return "redirect:/welcome";
        
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
    	
    	   /*ArrayList<Event> events = seeEvents.getAllEvents();
           System.out.println(events);
           
           model.addAttribute("events", events);*/
    	
        return "welcome";
    }
	
	
/*
	
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
	
/*	@RequestMapping(value = "/", method = RequestMethod.GET) 
	public  String getEvents(@Valid Event event, BindingResult bindingResult, Model model) {
		
		  Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	      String username = loggedInUser.getName(); // Authentication for
	      User user = userRepository.findByUsername(username);
	      
		
          
		

          ArrayList<Event> events = seeEvents.getAllEvents();
          System.out.println(events);
        
          
          
	      
		return "welcome";		
	}*/
	
	@RequestMapping(value = "/infopage")
	public String infopage() {
		return "infopage";
	}
}