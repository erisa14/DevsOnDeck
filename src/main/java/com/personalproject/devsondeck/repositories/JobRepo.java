package com.personalproject.devsondeck.repositories;

import com.personalproject.devsondeck.models.Dev;
import com.personalproject.devsondeck.models.Job;
import com.personalproject.devsondeck.models.Skill;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobRepo extends CrudRepository<Job, Long> {
    List<Job> findAll();

    List<Job> findJobsBySkillsIn(List<Skill> skills);

    List<Job> findByOrgIdIs(Long id);

    List<Job> findAllByDevs(Dev dev);
    List<Job> findByDevsNotContains(Dev dev);
}
