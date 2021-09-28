package lt.pigustralas.breakdown.repository;

import lt.pigustralas.breakdown.model.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DataJpaOrderRepository implements OrderRepository  {

    private final CrudOrderRepository crudOrderRepository;

    public DataJpaOrderRepository(CrudOrderRepository crudOrderRepository) {
        this.crudOrderRepository = crudOrderRepository;
    }

    @Override
    public Order save(Order order) {
        return crudOrderRepository.save(order);
    }

    @Override
    public boolean delete(int id) {
        return crudOrderRepository.delete(id) != 0;
    }

    @Override
    public Order get(int id) {
        return crudOrderRepository.findById(id).orElse(null);
    }

    @Override
    public List<Order> getAll() {
        return crudOrderRepository.findAll();
    }
}
