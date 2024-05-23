package velazquez.deploy_spring_app.services;


import velazquez.deploy_spring_app.model.Asignatura;

import java.util.List;
import java.util.Optional;

public interface AsignaturaService {

  public List<Asignatura> getAllAsignaturas();

  public Optional<Asignatura> findAsignaturaById(Long id);
}
