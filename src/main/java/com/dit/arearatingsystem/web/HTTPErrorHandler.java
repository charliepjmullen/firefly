package com.dit.arearatingsystem.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HTTPErrorHandler {

	  
	 @RequestMapping(value="/404")
	 public String error404(){
	  return "/404";
	 }
	  
	
}
