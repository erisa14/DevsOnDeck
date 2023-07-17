package com.personalproject.devsondeck.repositories;

import com.personalproject.devsondeck.models.Org;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface OrgRepository extends CrudRepository<Org, Long> {
    Optional<Org> findByEmail(String email);
}
