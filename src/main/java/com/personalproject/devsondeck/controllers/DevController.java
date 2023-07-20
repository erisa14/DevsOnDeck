package com.personalproject.devsondeck.controllers;

import com.personalproject.devsondeck.models.Dev;
import com.personalproject.devsondeck.models.Job;
import com.personalproject.devsondeck.models.Login;
import com.personalproject.devsondeck.models.Skill;
import com.personalproject.devsondeck.repositories.SkillRepo;
import com.personalproject.devsondeck.services.DevService;
import com.personalproject.devsondeck.services.JobService;
import com.personalproject.devsondeck.services.SkillService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class DevController {
    @Autowired
    private DevService devService;
    @Autowired
    private SkillService skillService;
    @Autowired
    private JobService jobService;

    @GetMapping("/")
    public String local(){
        return "index";
    }
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
            return "redirect:/devs/jobs";
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
        return "redirect:/devs/jobs";
    }

    @GetMapping("/devs/skills/language")
    public String dashboard(@ModelAttribute("newSkill")Skill newSkill,
                             HttpSession session,Model model){
        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        Long userId = (Long) session.getAttribute("userId");
        Dev editDev=devService.findUserById(userId);
        model.addAttribute("userId", devService.findUserById(userId));
        model.addAttribute("skills", skillService.getAll());
        model.addAttribute("assigned", skillService.findBy(userId));
        model.addAttribute("editDev", editDev);
        return "dashboard";
    }
    @PostMapping("/addSkill")
    public String saveSkills(@ModelAttribute("newSkill")Skill newSkill,@RequestParam("addSkill") Long addSkill, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        Dev dev=devService.findUserById(userId);
        Skill skill=skillService.find(addSkill);
        List<Skill> skills=dev.getSkills();
        if (dev.getSkills().contains(skill)){
            devService.deleteSkill(dev,skill);
        }
        else {
            if (skills.size()<5) {
                dev.setSkills(dev.getSkills());
                devService.addSkill(dev, skill);
            }
        }
        return "redirect:/devs/skills/language";
    }
    @PostMapping("/addBio")
    public String addBio(@Valid@ModelAttribute("editDev") Dev editDev, BindingResult result, HttpSession session){
        if (result.hasErrors()){
            return "dashboard";
        }
        Long userId = (Long) session.getAttribute("userId");
        Dev loggedDev= devService.findUserById(userId);
        loggedDev.setConfirm(editDev.getConfirm());
        loggedDev.setBio(editDev.getBio());
        devService.saveDev(loggedDev);
        return "redirect:/devs/jobs";
    }

    @GetMapping("/devs/jobs")
    public String getJob(Model model,HttpSession session){
        if(session.getAttribute("userId") == null) {
            return "redirect:/logoutOrg";
        }
        Long userId=(Long) session.getAttribute("userId");
        Dev dev=devService.findUserById(userId);
        List<Job> jobs = jobService.findJobsByMatchingSkills(dev.getSkills());
        model.addAttribute("dev", dev);
        model.addAttribute("jobs", jobs);
        model.addAttribute("allJobs", jobService.getAll());


        model.addAttribute("toApply", jobService.toApply(dev));
        model.addAttribute("applied", jobService.applied(dev));

        return "jobsDev";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }



    @RequestMapping("/dev/apply/{id}")
    public String applyJob(@PathVariable("id") Long id, HttpSession session, Model model) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        Long userId = (Long) session.getAttribute("userId");

        Job job = jobService.findJobById(id);
        Dev dev = devService.findUserById(userId);

        dev.getJobs().add(job);
        devService.saveDev(dev);

        model.addAttribute("dev", dev);
        model.addAttribute("toApply", jobService.toApply(dev));
        model.addAttribute("applied", jobService.applied(dev));

        return "redirect:/devs/jobs";
    }
}