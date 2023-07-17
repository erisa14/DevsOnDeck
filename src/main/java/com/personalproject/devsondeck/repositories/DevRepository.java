package com.personalproject.devsondeck.repositories;

import com.personalproject.devsondeck.models.Dev;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DevRepository extends CrudRepository<Dev, Long> {
    Optional<Dev> findByEmail(String email);
}