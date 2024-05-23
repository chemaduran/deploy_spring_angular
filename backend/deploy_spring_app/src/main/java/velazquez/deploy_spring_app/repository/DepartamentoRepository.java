package velazquez.deploy_spring_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import velazquez.deploy_spring_app.model.Departamento;

@Repository
public interface DepartamentoRepository extends JpaRepository<Departamento, Long> {

  Departamento findByNombre(String nombre);
}
