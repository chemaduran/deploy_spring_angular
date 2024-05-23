package velazquez.deploy_spring_app.services;

import velazquez.deploy_spring_app.model.Grado;

import java.util.List;


public interface GradoService {
  List<Grado> getAllGrades();

  Grado findGradoById(Long id);
}
