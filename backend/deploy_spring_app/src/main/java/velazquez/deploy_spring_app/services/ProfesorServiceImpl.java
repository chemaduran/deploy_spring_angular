package velazquez.deploy_spring_app.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import velazquez.deploy_spring_app.model.Profesor;
import velazquez.deploy_spring_app.repository.ProfesorRepository;

@Service
public class ProfesorServiceImpl implements ProfesorService {

  @Autowired
  ProfesorRepository profRepo;

  @Override
  public Optional<Profesor> findProfesorById(Long id) {
    return profRepo.findById(id);
  }

  @Override
  public Profesor actualizarProfesor(Profesor profesor) {
    if (profesor == null || profesor.getId() == null) {
      return null;
    }

    return profRepo.save(profesor);
  }

  @Override
  public Profesor getProfesorByName(String nombre) {
    if (nombre != null) {
        return profRepo.findByNombre(nombre);
    }
    return null;
  }

  @Override
  public Profesor insertarProfesor(Profesor profesor) {
    if (profesor != null && getProfesorByName(profesor.getNombre()) == null) {
        return profRepo.save(profesor);
    }
    return null;
  }
}
