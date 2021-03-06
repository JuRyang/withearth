package com.withearth.member.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.withearth.member.walking.domain.SearchParam;
import com.withearth.member.walking.service.CourseListService;

@Controller
public class CourseListController {

	@Autowired
	private CourseListService listService;
	
	@GetMapping(value="/member/loc/courselist")
	public String courseList(
			@RequestParam("idx") int idx,
			SearchParam param,
			Model model) {
		
		System.out.println(param);
		
		
		model.addAttribute("listView", listService.getListView(param, idx));
		model.addAttribute("courseCnt", listService.getCourseTotalCount(idx));
		
		return "/loc/courselist";
	}
}