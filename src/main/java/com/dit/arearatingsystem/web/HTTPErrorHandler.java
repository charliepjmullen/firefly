package com.dit.arearatingsystem.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HTTPErrorHandler {

	  
	 @RequestMapping(value="/404", method= RequestMethod.GET)
	 public String error404get(){
	  return "404";
	 }
	  
	 @RequestMapping(value="/404", method= RequestMethod.POST)
	 public String error404post(){
	  return "redirect:/404";
	 }
}
