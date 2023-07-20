package com.personalproject.devsondeck.controllers;

import com.personalproject.devsondeck.models.*;
import com.personalproject.devsondeck.services.DevService;
import com.personalproject.devsondeck.services.JobService;
import com.personalproject.devsondeck.services.OrgService;
import com.personalproject.devsondeck.services.SkillService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class OrgController {

    @Autowired
    private OrgService orgService;
    @Autowired
    private SkillService skillService;

    @Autowired
    private JobService jobService;
    @Autowired
    private DevService devService;

    @GetMapping("/orgs/register")
    public String index1(Model model, @ModelAttribute("newOrg") Org newOrg, HttpSession session){
        Long loggedInUserId=(Long) session.getAttribute("userId");

        if (loggedInUserId!=null){
            return "redirect:/orgs/dashboard";
        }
        model.addAttribute("newOrg", new Org());
        return "orgRegister";
    }
    @GetMapping("/orgs/login")
    public String index(Model model,
                        @ModelAttribute("newLogin") Org newLogin, HttpSession session){
        Long loggedInUserId=(Long) session.getAttribute("userId");

        if (loggedInUserId!=null){
            return "redirect:/orgs/dashboard";
        }
        model.addAttribute("newLogin", new Login());
        return "orgLog";
    }


    @PostMapping("/orgs/register")
    public String register(@Valid @ModelAttribute("newOrg") Org newOrg, BindingResult result,
                           Model model, HttpSession session){
        orgService.register(newOrg, result);
        if (result.hasErrors()){
            model.addAttribute("newLogin", new Login());
            return "orgRegister";
        }
        session.setAttribute("userId", newOrg.getId());
        return "redirect:/orgs/dashboard";
    }

    @PostMapping("/orgs/login")
    public String login(@Valid @ModelAttribute("newLogin") Login newLogin, BindingResult result,
                        Model model, HttpSession session){
        Org org = orgService.login(newLogin, result);

        if (result.hasErrors()){
            model.addAttribute("newOrg", new Org());
            return "orgLog";
        }
        session.setAttribute("userId", org.getId());
        return "redirect:/orgs/dashboard";
    }
    @GetMapping("/orgs/dashboard")
    public String dashboard(HttpSession session, Model model){
        Long loggedInUserId=(Long) session.getAttribute("userId");
        if (loggedInUserId==null){
            return "redirect:/";
        }
        Long userId = (Long) session.getAttribute("userId");
        Org org = orgService.findUserById(userId);

        model.addAttribute("org", org);
        model.addAttribute("jobs", jobService.findBy(userId));
        model.addAttribute("devs",devService.getAll());
        return "dash";
    }
    @GetMapping("/skills")
    private String s(@ModelAttribute("skills") Skill skills, Model model, HttpSession session){
        Long loggedInUserId=(Long) session.getAttribute("userId");
        if (loggedInUserId==null){
            return "redirect:/";
        }
        Long userId = (Long) session.getAttribute("userId");
        Org org = orgService.findUserById(userId);
        model.addAttribute("sk", skillService.getAll());
        model.addAttribute("skills", skills);
        return "skill";
    }
    @PostMapping ("/skills")
    private String skill(@Valid@ModelAttribute("skills") Skill skills, Model model, BindingResult result){
        if(result.hasErrors()){
            return "skill";
        }
        Skill skill= skillService.create(skills);
        model.addAttribute("skills", skill);
        return "redirect:/skills";
    }

    @GetMapping("/orgs/jobs/new")
    private String newJob(@ModelAttribute("jobs") Job jobs,HttpSession session, Model model){
        if(session.getAttribute("userId") == null) {
            return "redirect:/logoutOrg";
        }
        Org org = orgService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("org", org);
        model.addAttribute("skills",skillService.getAll());
        model.addAttribute("jobs", new Job());
        return "newPosition";
    }

    @PostMapping("/orgs/jobs/new")
    private String newJob(@Valid@ModelAttribute("jobs") Job jobs,BindingResult result, @RequestParam("jobSkill") List<Skill> jobSkill){
       if (result.hasErrors()){
           return "newPosition";
       }
       List<Skill> skills=jobs.getSkills();
           jobs.setSkills(jobSkill);
           jobService.create(jobs);
       return "redirect:/orgs/dashboard";
    }

    @GetMapping("/orgs/jobs/{id}")
    public String getJob(@PathVariable("id")Long id, Model model,HttpSession session){
        if(session.getAttribute("userId") == null) {
            return "redirect:/logoutOrg";
        }
        Job job=jobService.findJobById(id);

        List<Dev> developers = devService.findDevsByMatchingSkills(job.getSkills());

        model.addAttribute("job", job);
        model.addAttribute("developers", developers);
        return "devJobs";
    }
    @GetMapping("/logoutOrg")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

}
