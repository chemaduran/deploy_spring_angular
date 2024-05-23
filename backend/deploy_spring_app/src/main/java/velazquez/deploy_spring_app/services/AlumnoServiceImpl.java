package velazquez.deploy_spring_app.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import velazquez.deploy_spring_app.model.Alumno;
import velazquez.deploy_spring_app.repository.AlumnoRepository;

@Service
public class AlumnoServiceImpl implements AlumnoService {

  @Autowired
  AlumnoRepository alumnoRepo;

  @Override
  public Optional<Alumno> findAlumnoById(Long id) {

    return alumnoRepo.findById(id);
  }

  @Override
  public List<Alumno> getAllAlumnos() {

    return alumnoRepo.findAll();
  }
}
