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
public interface CrudOrderRepository extends JpaRepository<User, Integer> {

    @Modifying
    @Transactional
    @Query("DELETE FROM Order m WHERE m.id=:id AND m.user.id=:userId")
    int delete(@Param("id") int id, @Param("userId") int userId);

    @Query("SELECT m FROM Order m WHERE m.user.id=:userId")
    List<Order> getAll(@Param("userId") int userId);
}
