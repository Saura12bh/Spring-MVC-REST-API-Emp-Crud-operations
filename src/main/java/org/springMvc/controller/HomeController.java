package org.springMvc.controller;

import org.springMvc.model.Emp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home()
	{
		return "index";
	}
	
	@ResponseBody
	@PostMapping("/save")
	public String save(@RequestParam("name") String name,@RequestParam("salary") Integer salary)
	{
		return null;
	}

}
