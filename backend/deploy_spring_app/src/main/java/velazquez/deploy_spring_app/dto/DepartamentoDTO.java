package velazquez.deploy_spring_app.dto;

import java.io.Serializable;

public class DepartamentoDTO implements Serializable {
  private String nombre;

  public DepartamentoDTO() {}

  public String getNombre() {
    return nombre;
  }

  public void setNombre(String nombre) {
    this.nombre = nombre;
  }
}
