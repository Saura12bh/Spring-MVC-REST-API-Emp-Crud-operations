package org.springMvc.service;

import java.util.List;

import org.springMvc.model.Emp;

public interface EmpService {

	public void saveEmp(Emp e);
	public List<Emp> display();
	public List<Emp> search(int eid);
}
