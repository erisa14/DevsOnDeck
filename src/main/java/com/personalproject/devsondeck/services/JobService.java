package com.personalproject.devsondeck.services;
import com.personalproject.devsondeck.models.Dev;
import com.personalproject.devsondeck.models.Job;
import com.personalproject.devsondeck.models.Skill;
import com.personalproject.devsondeck.repositories.JobRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
    public Job findJobById(Long id){
        return this.jobRepo.findById(id).orElse(null);
    }

    public List<Job> findJobsByMatchingSkills(List<Skill> jobSkills) {
        List<Job> jobs = jobRepo.findAll();
        List<Job> matchingJobs = new ArrayList<>();
        for (Job job : jobs) {
            List<Skill> devSkills = job.getSkills();
            int matchingSkillCount = 0;
            for (Skill devSkill : devSkills) {
                if (devSkills.contains(devSkill)) {
                    matchingSkillCount++;
                }
            }
            if (matchingSkillCount >= 1) {
                matchingJobs.add(job);
            }
        }

        return matchingJobs;
    }

    public List<Job> findBy(Long id){
        return jobRepo.findByOrgIdIs(id);
    }



    public List<Job> applied(Dev dev){
        return jobRepo.findAllByDevs(dev);
    }

    public List<Job> toApply(Dev dev){
        return jobRepo.findByDevsNotContains(dev);
    }



}
