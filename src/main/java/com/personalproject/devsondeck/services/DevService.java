package com.personalproject.devsondeck.services;

import com.personalproject.devsondeck.models.Dev;
import com.personalproject.devsondeck.models.Job;
import com.personalproject.devsondeck.models.Login;
import com.personalproject.devsondeck.models.Skill;
import com.personalproject.devsondeck.repositories.DevRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.List;
import java.util.Optional;

@Service
public class DevService {
    @Autowired
    private DevRepository devRepository;

    public Dev register(Dev newDev, BindingResult result){
        Optional<Dev> potentionalUser=this.devRepository.findByEmail(newDev.getEmail());

        //Email taken
        if (potentionalUser.isPresent()){
            result.rejectValue("email", "EmailTaken", "Email address is already in use!");
        }

        //Password doesn't match confirmation
        if (!newDev.getPassword().equals(newDev.getConfirm())){
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }

        //Return null if result has errors
        if (result.hasErrors()){
            return null;
        }

        //Save dev
        else{
            String hashed= BCrypt.hashpw(newDev.getPassword(), BCrypt.gensalt());
            newDev.setPassword(hashed);
            return devRepository.save(newDev);
        }
    }

    public Dev login(Login newLogin, BindingResult result){
        Optional<Dev> potentionalUser=this.devRepository.findByEmail(newLogin.getEmail());

        //User doesn't exist
        if (!potentionalUser.isPresent()){
            result.rejectValue("email", "EmailNotFound", "No user found with that email address");
        }
        else {
            if (!BCrypt.checkpw(newLogin.getPassword(), potentionalUser.get().getPassword())){
                //BCrypt password match fails
                result.rejectValue("password", "Matches", "Invalid password");
            }
        }
        //Return null if result has errors
        if (result.hasErrors()){
            return null;
        }
        else {
            return potentionalUser.get();
        }
    }
    public Dev findUserById(Long id){
        return this.devRepository.findById(id).orElse(null);
    }

    public Dev add(Dev dev) {
        return devRepository.save(dev);
    }

    public void saveDev(Dev dev) {
        devRepository.save(dev);
    }
    public List<Dev> getAll(){
        return devRepository.findAll();
    }

    public void addSkill(Dev dev, Skill skill){
            List<Skill> skills=dev.getSkills();
            skills.add(skill);
            devRepository.save(dev);
    }
    public void deleteSkill(Dev dev,Skill skill){
        List<Skill> skills=dev.getSkills();
        skills.remove(skill);
        devRepository.save(dev);
    }

    public List<Dev> findDevsWithMatchingSkills(Job job) {
        List<Skill> jobSkills = job.getSkills();
        return devRepository.findDevsBySkillsIn(jobSkills);
    }
}

