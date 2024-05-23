package velazquez.deploy_spring_app.services;


import velazquez.deploy_spring_app.model.Alumno;

import java.util.List;
import java.util.Optional;

public interface AlumnoService {

  public List<Alumno> getAllAlumnos();

  public Optional<Alumno> findAlumnoById(Long id);
}
