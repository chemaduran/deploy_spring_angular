package velazquez.deploy_spring_app.dto;

import velazquez.deploy_spring_app.model.Asignatura;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class GradoDTO implements Serializable {
  private Long id;

  private String nombre;

  private Set<Asignatura> asignaturasGrado = new HashSet<>();

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getNombre() {
    return nombre;
  }

  public void setNombre(String nombre) {
    this.nombre = nombre;
  }

  public Set<Asignatura> getAsignaturasGrado() {
    return asignaturasGrado;
  }

  public void setAsignaturasGrado(Set<Asignatura> asignaturasGrado) {
    this.asignaturasGrado = asignaturasGrado;
  }
}
