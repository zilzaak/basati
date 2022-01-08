package basati.repo;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import basati.model.Serialmake;

public interface Serialmakerepo extends JpaRepository<Serialmake,Integer> {

	boolean existsBySerialAndDeptAndRollnoAndSemester(String serial,String dept,String roll,String semester);

	boolean existsByDeptAndRollnoAndSemester(String dept, String rollno, String semester);

	public List<Serialmake> findByDeptAndRollnoAndSemester(String dept, String rollno, String semester);

}
