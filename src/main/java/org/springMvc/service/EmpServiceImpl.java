package org.springMvc.service;

import java.util.List;

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
	@Override
	public List<Emp> display() {
		return empRepo.display();
	}
	@Override
	public List<Emp> search(int eid) {
		// TODO Auto-generated method stub
		return empRepo.search(eid);
	}
	@Override
	public void delete(int eid) {
		empRepo.delete(eid);
	}
	@Override
	public void update(Emp e) {
		empRepo.update(e);
	}

}
