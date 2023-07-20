package com.personalproject.devsondeck.repositories;

import com.personalproject.devsondeck.models.Dev;
import com.personalproject.devsondeck.models.Job;
import com.personalproject.devsondeck.models.Skill;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DevRepository extends CrudRepository<Dev, Long> {
    Optional<Dev> findByEmail(String email);
    List<Dev> findAll();
}