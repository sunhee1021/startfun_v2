package com.weis.startfun.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.weis.startfun.admin.service.AdminMemberService;

@RestController
@RequestMapping("/admin/")
public class AdminChartController {

		@Autowired
		private AdminMemberService service;
		
		@RequestMapping(value="chart.do", method=RequestMethod.POST)
		public List<Map<String, Object>> chartProject(){
			List<Map<String, Object>> chartProject = service.chartProject();
			
			return chartProject;
		}
}
