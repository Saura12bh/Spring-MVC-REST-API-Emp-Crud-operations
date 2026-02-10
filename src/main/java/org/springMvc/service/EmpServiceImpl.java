package org.springMvc.service;

import org.springMvc.model.Emp;
import org.springMvc.repo.EmpRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("empService")
public class EmpServiceImpl implements EmpService{

	@Autowired
	EmpRepo empRepo;
	@Override
	public void saveEmp(Emp e) {
		empRepo.saveEmp(e);
	}

}
