package velazquez.deploy_spring_app.services;


import velazquez.deploy_spring_app.model.Profesor;

import java.util.Optional;

public interface ProfesorService {

  public Optional<Profesor> findProfesorById(Long id);

  public Profesor getProfesorByName(String nombre);

  public Profesor actualizarProfesor(Profesor profesor);

  public Profesor insertarProfesor(Profesor profesor);
}
