package basati.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import basati.model.Department;



public interface Departmentrepo extends JpaRepository<Department,Integer> {

	public boolean existsByDeptAndSemesterAndRollnoAndSubcode(String x, String s, String r,String c);
	
	public List<Department> findByDeptAndSemesterAndSubcodeOrderByRollnoAsc(String x, String s,String c);
	public List<Department> findByDeptAndSemesterAndRollno(String dept, String semester, String rollno);
	
	public List<Department> findByDeptAndSemesterOrderByRollnoAsc(String dept, String semester);
	
	public List<Department> findBySessionOrderByRollnoAsc(String session);
	public List<Department> findBySessionAndDeptOrderByRollnoAsc(String session, String dept);
	public List<Department> findBySessionAndDeptAndSemesterOrderByRollnoAsc(String session, String dept,
			String semester);
	public List<Department> findBySessionAndDeptAndSemesterAndSubcodeOrderByRollnoAsc(String session, String dept,
			String semester, String subcode);
	public List<Department> findBySubcodeOrderByRollnoAsc(String subcode);
	public List<Department> findByDeptAndSubcodeOrderByRollnoAsc(String dept, String subcode);
	public List<Department> findByDeptOrderByRollnoAsc( String dept);

	public List<Department> findBySemesterOrderByRollnoAsc(String semester);

	public List<Department> findBySessionAndDeptAndSubcodeOrderByRollnoAsc(String session, String dept, String subcode);

	public List<Department> findBySessionAndDeptAndSemester(String session, String dept, String semester);

}
