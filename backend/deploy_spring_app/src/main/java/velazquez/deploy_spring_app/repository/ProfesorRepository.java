package velazquez.deploy_spring_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import velazquez.deploy_spring_app.model.Profesor;

@Repository
public interface ProfesorRepository extends JpaRepository<Profesor, Long> {

      Profesor findByNombre(String nombre);
}
