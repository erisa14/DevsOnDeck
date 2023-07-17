package com.personalproject.devsondeck.services;

import com.personalproject.devsondeck.models.Login;
import com.personalproject.devsondeck.models.Org;
import com.personalproject.devsondeck.repositories.OrgRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.Optional;

@Service
public class OrgService {
    @Autowired
    private OrgRepository orgRepository;

    public Org register(Org newOrg, BindingResult result){
        Optional<Org> potentionalUser=this.orgRepository.findByEmail(newOrg.getEmail());

        //Email taken
        if (potentionalUser.isPresent()){
            result.rejectValue("email", "EmailTaken", "Email address is already in use!");
        }

        //Password doesn't match confirmation
        if (!newOrg.getPassword().equals(newOrg.getConfirm())){
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }

        //Return null if result has errors
        if (result.hasErrors()){
            return null;
        }

        //Save dev
        else{
            String hashed= BCrypt.hashpw(newOrg.getPassword(), BCrypt.gensalt());
            newOrg.setPassword(hashed);
            return orgRepository.save(newOrg);
        }
    }

    public Org login(Login newLogin, BindingResult result){
        Optional<Org> potentionalUser=this.orgRepository.findByEmail(newLogin.getEmail());

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
    public Org findUserById(Long id){
        return this.orgRepository.findById(id).orElse(null);
    }

    public Org add(Org org) {
        return orgRepository.save(org);
    }
}
