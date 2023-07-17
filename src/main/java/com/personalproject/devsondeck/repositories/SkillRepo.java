package com.personalproject.devsondeck.repositories;

import com.personalproject.devsondeck.models.Dev;
import com.personalproject.devsondeck.models.Skill;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SkillRepo extends CrudRepository<Skill, Long> {
    List<Skill> findAll();

    List<Skill> findByDevsIdIs(Long id);
}
