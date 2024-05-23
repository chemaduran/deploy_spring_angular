package velazquez.deploy_spring_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import velazquez.deploy_spring_app.model.Asignatura;

@Repository
public interface AsignaturaRepository extends JpaRepository<Asignatura, Long> {}
