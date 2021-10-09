package lt.pigustralas.breakdown.web;

import lt.pigustralas.breakdown.model.User;
import lt.pigustralas.breakdown.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RootController {

    @Autowired
    private UserService service;

    @GetMapping("/")
    public String root() {
        return "redirect:activeorders";
    }

    //    @Secured("ROLE_ADMIN")
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/users")
    public String getUsers() {
        return "users";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/orders")
    public String getOrders() {
        return "orders";
    }

    @GetMapping("/activeorders")
    public String getActiveOrders() {
        User user = service.get(SecurityUtil.get().getUser().getId());
        if (user.getOrder()!=null){
            return "myOrder";
        }
        return "activeOrders";
    }

    @GetMapping("/myorder")
    public String getMyOrder() {
        return "myOrder";
    }
}
