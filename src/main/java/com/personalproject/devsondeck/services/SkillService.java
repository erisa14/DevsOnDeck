package com.personalproject.devsondeck.services;

import com.personalproject.devsondeck.models.Dev;
import com.personalproject.devsondeck.models.Skill;
import com.personalproject.devsondeck.repositories.SkillRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class SkillService {
    @Autowired
    private SkillRepo skillRepo;

    public List<Skill> getAll(){
        return skillRepo.findAll();
    }

    public Skill create(Skill skill){
        return skillRepo.save(skill);
    }

    public Skill find(Long id){
        return skillRepo.findById(id).orElse(null);
    }

    public List<Skill> findBy(Long id){
        return skillRepo.findByDevsIdIs(id);
    }

}
