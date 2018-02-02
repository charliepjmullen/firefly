package com.dit.arearatingsystem.web;

import com.dit.arearatingsystem.model.Area;
import com.dit.arearatingsystem.model.GardaStation;
import com.dit.arearatingsystem.model.User;
import com.dit.arearatingsystem.repository.GardaStationRepository;
import com.dit.arearatingsystem.repository.UserRepository;
import com.dit.arearatingsystem.service.SecurityService;
import com.dit.arearatingsystem.service.UserService;
import com.dit.arearatingsystem.validator.UserValidator;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        return "welcome";
    }
    
	 @RequestMapping(value = "/results", method = RequestMethod.POST
			 , produces = {"application/json"}
             ,  consumes = {"application/x-www-form-urlencoded"}
     )
	 public @ResponseBody  String Submit(GardaStation gardaStation, @RequestParam("latitude") double latitude,@RequestParam("longitude") double longitude) {

		 System.out.println(" ");
	    System.out.println("Latitude: " + latitude + " Longitude: " + longitude + " from the client side");
	    
	    //String kevinst = "Kevin Street";
	    
	    //parseCrime.ParseCrime(kevinst);
	    
	   
	  //m  gardaStation = gardaStationRepository.findByGarda_Station_LatitudeAndGarda_Station_Longitude(latitude, longitude);

	    //System.out.println( gardaStation.getGardaStation_name());
	    
//	    String parseGardaStation = gardaStation.getGardaStation_name();
//	    parseCrime.ParseCrime(parseGardaStation);
	    
	    

		return "/";
	 }
    
	@RequestMapping(value = "/savedAreasMap", method = RequestMethod.GET)
	public String savedAreas(@Valid Area area, BindingResult bindingResult, Model model) {
		
		return "savedAreas";
	}
	
	@RequestMapping(value = "/saveAreaToProfile", method = RequestMethod.POST)
	public String saveAreaToProfile(@Valid Area area, @RequestParam("latitude") double latitude,@RequestParam("longitude") double longitude, 
			@RequestParam("address") String address, @RequestParam("username") String username) {
		
		System.out.println("Latitude: " + latitude + " Longitude: " + longitude + " Address:" + address +  " Usernaame: " + username +" from the client side");
		
		return "/savedAreas";
	}
}