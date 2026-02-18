package org.springMvc.service;

import java.util.List;

import org.springMvc.exception.EmpNotFound;
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
		
		 List<Emp> list = empRepo.display();

		    if(list.isEmpty()) {
		        throw new EmpNotFound("No employees found in database");
		    }

		return empRepo.display();
	}
	@Override
	public List<Emp> search(int eid) {
		// TODO Auto-generated method stub
		return empRepo.search(eid);
	}
	@Override
	public void delete(int eid) {
		
		List<Emp>list=empRepo.search(eid);
		if(list.isEmpty())
		{
			throw new EmpNotFound("emp with "+eid+" not found");
		}
		empRepo.delete(eid);
	}
	
	@Override
	public void update(Emp e) {
		List<Emp>list=empRepo.search(e.getEid());
		if(list.isEmpty())
		{
			throw new EmpNotFound("emp with "+e.getEid()+" not found");
		}
		empRepo.update(e);
	}

}
