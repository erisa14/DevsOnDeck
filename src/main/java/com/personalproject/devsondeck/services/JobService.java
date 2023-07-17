package com.personalproject.devsondeck.services;
import com.personalproject.devsondeck.models.Job;
import com.personalproject.devsondeck.models.Skill;
import com.personalproject.devsondeck.repositories.JobRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobService {
    @Autowired
    private JobRepo jobRepo;
    public List<Job> getAll(){
        return jobRepo.findAll();
    }

    public Job create(Job job){
        return jobRepo.save(job);
    }

    public void addSkill(Job job, Skill skill){
        List<Skill> skills=job.getSkills();
        skills.add(skill);
        jobRepo.save(job);
    }

}
