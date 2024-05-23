package velazquez.deploy_spring_app.services;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import velazquez.deploy_spring_app.model.Grado;
import velazquez.deploy_spring_app.repository.GradoRepository;

@Service
public class GradoServiceImpl implements GradoService {

  @Autowired
  GradoRepository gradoRepo;

  @Override
  public List<Grado> getAllGrades() {
    List<Grado> gradosBD = gradoRepo.findAll();

    if (!gradosBD.isEmpty()) {
      return gradosBD;
    }

    return new ArrayList<Grado>();
  }

  @Override
  public Grado findGradoById(Long id) {
    return gradoRepo.findById(id).orElse(null);
  }
}
