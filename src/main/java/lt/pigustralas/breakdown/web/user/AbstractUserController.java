package lt.pigustralas.breakdown.web.user;

import lt.pigustralas.breakdown.model.User;
import lt.pigustralas.breakdown.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static lt.pigustralas.breakdown.util.validation.ValidationUtil.assureIdConsistent;
import static lt.pigustralas.breakdown.util.validation.ValidationUtil.checkNew;

public abstract class AbstractUserController {

    @Autowired
    private UserService service;

    public List<User> getAll() {
        return service.getAll();
    }

    public User get(int id) {
        return service.get(id);
    }

    public User create(User user) {
        checkNew(user);
        return service.create(user);
    }

    public void delete(int id) {
        service.delete(id);
    }

    public void update(User user, int id) {
        assureIdConsistent(user, id);
        service.update(user);
    }

    public User getByMail(String email) {
        return service.getByEmail(email);
    }

    public void enable(int id, boolean enabled) {
        service.enable(id, enabled);
    }
}
