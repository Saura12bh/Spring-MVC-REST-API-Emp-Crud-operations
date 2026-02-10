package org.springMvc.controller;

import java.util.List;

import org.springMvc.model.Emp;
import org.springMvc.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

	// service class object
	@Autowired
	EmpService empService;

	@RequestMapping("/")
	public String home() {
		return "index";
	}

	/*
	 * jr apn request param use kel tr
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping("/save") public String save(@RequestParam("eid") Integer
	 * eid, @RequestParam("ename") String ename,
	 * 
	 * @RequestParam("sal") Integer sal) { Emp e=new Emp(); e.setEid(eid);
	 * e.setEname(ename); e.setSal(sal); //then we pass to service pn error ahe ki
	 * apn tikde int bnvl ani as copy krtoy empService.saveEmp(e); return
	 * "Emp save Successfully"; }
	 */

	// jr apn @requestbody annotation use kel tr
	// @requestbody->@RequestBody frontend कडून आलेला JSON data Java chya pojo
	// object मध्ये convert करण्यासाठी वापरला जातो
	
	@ResponseBody
	@PostMapping("/save")
	public String save(@RequestBody Emp e)
	{
		empService.saveEmp(e);
		return "Emp save Successfully";
	}
	
	@ResponseBody
	@GetMapping("/display")
	public List<Emp> display()
	{
		List<Emp>list=empService.display();
		return list;
	}
}
