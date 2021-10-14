package lt.pigustralas.breakdown.web.user;

import lt.pigustralas.breakdown.AuthorizedUser;
import lt.pigustralas.breakdown.model.User;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

@RestController
@RequestMapping("/profile")
public class ProfileUIController extends AbstractUserController {

    @GetMapping
    public User profile(ModelMap model, @AuthenticationPrincipal AuthorizedUser authUser) {
//        model.addAttribute("user", authUser.getUser());
        return super.get(authUser.getId());
    }

//    @PostMapping
//    public String updateProfile(User user, BindingResult result, SessionStatus status, @AuthenticationPrincipal AuthorizedUser authUser) {
//        if (result.hasErrors()) {
//            return "profile";
//        }
//        super.update(user, authUser.getId());
//        authUser.setUser(user);
//        status.setComplete();
//        return "redirect:/meals";
//    }

    @GetMapping("/register")
    public String register(ModelMap model) {
        model.addAttribute("user", new User());
        model.addAttribute("register", true);
        return "profile";
    }

    @PostMapping("/register")
    public String saveRegister(User user, BindingResult result, SessionStatus status, ModelMap model) {
        if (result.hasErrors()) {
            model.addAttribute("register", true);
            return "profile";
        }
        super.create(user);
        status.setComplete();
        return "redirect:/login?message=app.registered&username=" + user.getEmail();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void enable(@AuthenticationPrincipal AuthorizedUser authUser, @RequestParam boolean enabled) {
        super.enable(authUser.getId(), enabled);
    }
}