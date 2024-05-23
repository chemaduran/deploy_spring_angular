package velazquez.deploy_spring_app.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

  @GetMapping("/login")
  public String login(@RequestParam(required = false, name = "logout") String logout, Model model) {
    model.addAttribute("logout", logout);
    return "login_custom";
  }

  @GetMapping("/logout")
  public String logout(
      @RequestParam(required = false, name = "logout") String logout,
      Model model,
      HttpSession session) {
    session.invalidate();
    model.addAttribute("logout", logout);
    return "login_custom";
  }
}
