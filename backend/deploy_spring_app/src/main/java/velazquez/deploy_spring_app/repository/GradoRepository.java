package velazquez.deploy_spring_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import velazquez.deploy_spring_app.model.Grado;

@Repository
public interface GradoRepository extends JpaRepository<Grado, Long> {
    Grado findByNombre(String nombre);
}
