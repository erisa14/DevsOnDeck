package com.personalproject.devsondeck.controllers;

import com.personalproject.devsondeck.models.Dev;
import com.personalproject.devsondeck.models.Login;
import com.personalproject.devsondeck.models.Skill;
import com.personalproject.devsondeck.repositories.SkillRepo;
import com.personalproject.devsondeck.services.DevService;
import com.personalproject.devsondeck.services.SkillService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class DevController {
    @Autowired
    private DevService devService;
    @Autowired
    private SkillService skillService;

//    @GetMapping("/")
//    public String local(HttpSession session){
//        Long loggedInUserId=(Long) session.getAttribute("userId");
//        if (loggedInUserId==null){
//            return "redirect:/devs/register";
//        }
//        return "/";
//    }
    @GetMapping("/devs/register")
    public String index1(Model model, @ModelAttribute("newDev") Dev newDev, HttpSession session){
        Long loggedInUserId=(Long) session.getAttribute("userId");

        if (loggedInUserId!=null){
            return "redirect:/devs/skills/language";
        }
        model.addAttribute("newUser", new Dev());
        return "devRegister";
    }
    @GetMapping("/devs/login")
    public String index(Model model,
                        @ModelAttribute("newLogin") Dev newLogin, HttpSession session){
        Long loggedInUserId=(Long) session.getAttribute("userId");

        if (loggedInUserId!=null){
            return "redirect:/devs/skills/language";
            //ndryshoje me vone
        }
        model.addAttribute("newLogin", new Login());
        return "devLog";
    }


    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newDev") Dev newDev, BindingResult result,
                           Model model, HttpSession session){
        devService.register(newDev, result);
        if (result.hasErrors()){
            model.addAttribute("newLogin", new Login());
            return "devRegister";
        }
        session.setAttribute("userId", newDev.getId());
        return "redirect:/devs/skills/language";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") Login newLogin, BindingResult result,
                        Model model, HttpSession session){
        Dev dev = devService.login(newLogin, result);

        if (result.hasErrors()){
            model.addAttribute("newDev", new Dev());
            return "devLog";
        }
        session.setAttribute("userId", dev.getId());
        return "redirect:/devs/skills/language";
        //ndryshoje me vone
    }

    @GetMapping("/devs/skills/language")
    public String dashboard(@ModelAttribute("newSkill")Skill newSkill,
                             HttpSession session,Model model){
        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        Long userId = (Long) session.getAttribute("userId");
        model.addAttribute("userId", devService.findUserById(userId));
        model.addAttribute("skills", skillService.getAll());
        model.addAttribute("assigned", skillService.findBy(userId));
        model.addAttribute("dev", devService.findUserById(userId));
        return "dashboard";
    }
    @PostMapping("/addSkill")
    public String saveSkills(@ModelAttribute("newSkill")Skill newSkill,@RequestParam("addSkill") Long addSkill, HttpSession session) {
        Skill skill=skillService.find(addSkill);
        Long userId = (Long) session.getAttribute("userId");
        Dev dev=devService.findUserById(userId);
        dev.getSkills().add(skill);
        devService.addSkill(dev, skill);
        return "redirect:/devs/skills/language";
    }
    @PostMapping("/addBio")
    public String addBio(@ModelAttribute("dev")Dev dev, HttpSession session){
        devService.saveDev(dev);
        return "redirect:/devs/skills/language";
    }


    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/devs/login";
    }
}