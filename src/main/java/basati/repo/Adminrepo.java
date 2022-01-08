package basati.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import basati.model.Admin;

public interface Adminrepo extends JpaRepository<Admin,Integer> {

	public boolean existsByEmail(String email);
	
}
