package lt.pigustralas.breakdown.web.order;

import lt.pigustralas.breakdown.model.Order;
import lt.pigustralas.breakdown.service.OrderService;
import lt.pigustralas.breakdown.web.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static lt.pigustralas.breakdown.util.validation.ValidationUtil.assureIdConsistent;
import static lt.pigustralas.breakdown.util.validation.ValidationUtil.checkNew;

public abstract class AbstractOrderController {

    @Autowired
    private OrderService service;

    public Order get(int id) {
        return service.get(id);
    }

    public Order getCurrentOrder() {
        int userId = SecurityUtil.authUserId();
        return service.getCurrentOrder(userId);
    }

    public void delete(int id) {
        service.delete(id);
    }

    public List<Order> getAll() {
        return service.getAll();
    }

    public Order create(Order order) {
        checkNew(order);
        return service.create(order);
    }

    public void update(Order order, int id) {
        assureIdConsistent(order, id);
        service.update(order);
    }

    public void accept(int orderId) {
        int userId = SecurityUtil.authUserId();
        service.accept(orderId, userId);
    }

    public void complete(int orderId) {
        int userId = SecurityUtil.authUserId();
        service.complete(orderId, userId);
    }
}
