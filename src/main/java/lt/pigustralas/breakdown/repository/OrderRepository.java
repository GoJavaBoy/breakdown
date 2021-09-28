package lt.pigustralas.breakdown.repository;

import lt.pigustralas.breakdown.model.Order;
import lt.pigustralas.breakdown.model.User;

import java.util.List;

public interface OrderRepository {
    // null if not found, when updated
    Order save(Order order);

    // false if not found
    boolean delete(int id);

    // null if not found
    Order get(int id);

    List<Order> getAll();
}
