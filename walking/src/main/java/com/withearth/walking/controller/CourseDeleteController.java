package com.withearth.walking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.withearth.walking.service.CourseDeleteService;

@Controller
public class CourseDeleteController {

	@Autowired
	private CourseDeleteService deleteService;
	
	@RequestMapping("/loc/coursedelete")
	public String deleteCourse(
			@RequestParam("course_idx") int course_idx,
			Model model
			) {
		
		// 결과 -> 0또는 1
		model.addAttribute("result", deleteService.deleteCourse(course_idx));
		
		return "/loc/coursedelete";
		
	}
	
}
