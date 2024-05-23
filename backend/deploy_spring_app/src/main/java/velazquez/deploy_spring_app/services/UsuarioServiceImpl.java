package velazquez.deploy_spring_app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import velazquez.deploy_spring_app.model.Usuario;
import velazquez.deploy_spring_app.repository.UsuarioRepository;

@Service
public class UsuarioServiceImpl implements UsuarioService {

  @Autowired
  UsuarioRepository userRepo;

  @Override
  public Usuario insertUsuario(Usuario usuario) {

    if (usuario != null) {
      return userRepo.save(usuario);
    }

    return null;
  }
}
