package velazquez.deploy_spring_app.model;

import jakarta.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
public class Grado {
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Id
  @Column(name = "id")
  private Long id;

  @Column(name = "nombre")
  private String nombre;

  public Set<Asignatura> getAsignaturasGrado() {
    return asignaturasGrado;
  }

  @OneToMany(mappedBy = "grado", cascade = CascadeType.ALL, orphanRemoval = true)
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

  // Métodos helpers para la relación bidireccional
  public void addAsignatura(Asignatura asignatura) {
    asignaturasGrado.add(asignatura);
    asignatura.setGrado(this);
  }

  public void removeAsignatura(Asignatura asignatura) {
    asignaturasGrado.remove(asignatura);
    asignatura.setGrado(null);
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Grado grado = (Grado) o;
    return id == grado.id && Objects.equals(nombre, grado.nombre);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, nombre);
  }
}
