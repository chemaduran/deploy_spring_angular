package velazquez.deploy_spring_app.services;


import velazquez.deploy_spring_app.model.Departamento;

import java.util.List;

public interface DepartamentoService {

  public List<Departamento> getAllDepartments();

  public Departamento getDepartamentByName(String nombre);

  public Departamento insertarDepartamento(Departamento departamento);

  public Departamento actualizarDepartamento(Departamento departamento);

  public Departamento findDepartamentoById(Long id);
}
