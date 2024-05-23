package velazquez.deploy_spring_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import velazquez.deploy_spring_app.model.Usuario;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

  Usuario findByUserName(String userName);
}
