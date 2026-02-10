package org.springMvc.repo;

import java.util.List;

import org.springMvc.model.Emp;

public interface EmpRepo {

	public void saveEmp(Emp e);
	public List<Emp> display();
	public List<Emp> search(int eid);
}
