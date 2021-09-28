package lt.pigustralas.breakdown.service;

import lt.pigustralas.breakdown.model.Order;
import lt.pigustralas.breakdown.repository.OrderRepository;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.List;

import static lt.pigustralas.breakdown.util.validation.ValidationUtil.checkNotFoundWithId;

@Service
public class OrderService {
    private final OrderRepository repository;

    public OrderService(OrderRepository orderRepository) {
        this.repository = orderRepository;
    }

    public Order get(int id) {
        return checkNotFoundWithId(repository.get(id), id);
    }

    public void delete(int id) {
        checkNotFoundWithId(repository.delete(id), id);
    }

    public List<Order> getAll() {
        return repository.getAll();
    }

    public void update(Order order) {
        Assert.notNull(order, "meal must not be null");
        checkNotFoundWithId(repository.save(order), order.id());
    }

    public Order create(Order order) {
        Assert.notNull(order, "meal must not be null");
        return repository.save(order);
    }
}
