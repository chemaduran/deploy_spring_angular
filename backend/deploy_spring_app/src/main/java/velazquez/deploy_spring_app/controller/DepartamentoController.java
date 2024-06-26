package velazquez.deploy_spring_app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import velazquez.deploy_spring_app.dto.DepartamentoDTO;
import velazquez.deploy_spring_app.model.Departamento;
import velazquez.deploy_spring_app.model.Profesor;
import velazquez.deploy_spring_app.services.DepartamentoServiceImpl;
import velazquez.deploy_spring_app.services.ProfesorServiceImpl;


@Controller
public class DepartamentoController {

  @Autowired
  DepartamentoServiceImpl departamentoService;

  @Autowired
  ProfesorServiceImpl profesorService;

  @RequestMapping("/departments")
  public String departaments(Model model) {

    List<Departamento> departamentos = departamentoService.getAllDepartments();

    model.addAttribute("contenido", "PRODUCTOS");
    model.addAttribute("departamentos", departamentos);
    return "departments";
  }

  @GetMapping("/departments/add")
  public String addDepartmentGet(
      @RequestParam(required = false, name = "error") String error,
      @RequestParam(required = false, name = "dpto") String nombre,
      Model model) {

    DepartamentoDTO dpto = new DepartamentoDTO();

    model.addAttribute("dpto", dpto);
    model.addAttribute("error", error);
    model.addAttribute("previo", nombre);
    return "addDepartment";
  }

  @PostMapping("/departments/add")
  public String addDepartmentPost(@ModelAttribute DepartamentoDTO dpto, Model model) {

    Departamento dptoBD = new Departamento();
    dptoBD.setNombre(dpto.getNombre());

    if (departamentoService.insertarDepartamento(dptoBD) == null) {
      return "redirect:/departments/add?error=Existe&dpto=" + dpto.getNombre();
    }

    return "redirect:/departments";
  }

  @GetMapping("/departments/edit")
  public String editDpto(@RequestParam(name = "dpto") String dpto, Model model) {

    Departamento department = departamentoService.findDepartamentoById(Long.parseLong(dpto));
    model.addAttribute("department", department);
    return "editDepartament";
  }

  @PostMapping("/departments/edit")
  public String updateDpto(@ModelAttribute Departamento dpto) {

    if (departamentoService.actualizarDepartamento(dpto) == null) {
      return "redirect:/departments/edit?error=error&dpto" + dpto.getId();
    }
    return "redirect:/departments";
  }

  @GetMapping("/departments/profesores")
  public String profesoresDepartamento(
      @RequestParam(required = false, name = "dpto") String dpto, Model model) {

    Departamento dptoEntity = departamentoService.findDepartamentoById(Long.parseLong(dpto));

    if (dpto == null || dptoEntity == null) {
      return "redirect:/departments";
    }

    model.addAttribute("departamento", dptoEntity);

    return "profesoresDepartment";
  }

  @GetMapping("/departments/profesor/delete")
  public String borrarProfesorDepartamento(
      @RequestParam(required = false, name = "prof") String prof, Model model) {

    Profesor profEntity = profesorService.findProfesorById(Long.parseLong(prof)).get();
    Long dptoId = profEntity.getDepartamento().getId();

    profEntity.setDepartamento(null);

    profesorService.actualizarProfesor(profEntity);

    return "redirect:/departments/profesores?dpto=" + dptoId;
  }
}
