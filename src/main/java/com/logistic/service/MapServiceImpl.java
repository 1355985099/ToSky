package com.logistic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logistic.mapper.MapMapper;

import com.logistic.pojo.Dept;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	private MapMapper mapMapper;
	
	@Override
	public List<Dept> findMap() {
		
		return mapMapper.findMap();
	}

}
