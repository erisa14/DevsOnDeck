package com.personalproject.devsondeck.repositories;

import com.personalproject.devsondeck.models.Job;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobRepo extends CrudRepository<Job, Long> {
    List<Job> findAll();
}
