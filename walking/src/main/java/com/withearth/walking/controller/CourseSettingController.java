package com.withearth.walking.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.withearth.walking.domain.Course;
import com.withearth.walking.domain.CourseSettingRequest;
import com.withearth.walking.service.CourseSettingService;

@Controller
@RequestMapping("/course")
public class CourseSettingController {

	@Autowired
	private CourseSettingService courseSetService;
	
	// 코스 설정 페이지
	@RequestMapping(value="/loc/walkingservice", method = RequestMethod.GET)
	public String getcourseSet() {
		
		return "/loc/walkingservice";
		
	}
	
	
	  // 코스 설정 후 완료 안내 페이지
	  
	  @RequestMapping(value="/loc/walkingservice", method = RequestMethod.POST)
	  @ResponseBody
	  public String courseSetView( 
			  CourseSettingRequest setRequest,
			  HttpServletRequest request, 
			  Model model ) {
	  
		  System.out.println(setRequest);
		  
		  int result = courseSetService.courseSet(setRequest, request);
		  
		  model.addAttribute("result", result);
		  
		  
			/*
			 * List<Course> presult = courseSetService.pointCourse();
			 * model.addAttribute("pointresult", presult); System.out.println("포인트 결과: " +
			 * presult);
			 */
		  
		  return String.valueOf(result) ;  // 문자열로 반환 
	  }
	 
}
