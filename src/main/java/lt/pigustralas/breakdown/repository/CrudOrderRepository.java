package lt.pigustralas.breakdown.repository;

import lt.pigustralas.breakdown.model.Order;
import lt.pigustralas.breakdown.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Transactional(readOnly = true)
public interface CrudOrderRepository extends JpaRepository<Order, Integer> {

    @Transactional
    @Modifying
    @Query("DELETE FROM Order o WHERE o.id=:id")
    int delete(@Param("id") int id);

    @Query("SELECT o FROM Order o WHERE o.user.id=:orderId")
    List<Order> getAll(@Param("orderId") int orderId);
}
