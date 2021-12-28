package com.bmw.ticketsystem.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.bmw.ticketsystem.models.LoginUser;
import com.bmw.ticketsystem.models.Ticket;
import com.bmw.ticketsystem.models.User;
import com.bmw.ticketsystem.services.TicketService;
import com.bmw.ticketsystem.services.UserService;

@Controller
public class MainController {

	// services
	private final TicketService ticketServ;
	
	public MainController(TicketService ticketServ) {
		this.ticketServ = ticketServ;
	}
	
	// Login & Register
	
	@Autowired
    private UserService userServ;
    
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        userServ.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = userServ.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("user_id", user.getId());
        return "redirect:/home";
    }
    
    // logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    
    // routes (other stuff here)
    
    @GetMapping("/home")
    public String dashboard(Model model, HttpSession session) {
    	Long userId = (Long) session.getAttribute("user_id");
    	if (userId == null) {
    		return "redirect:/";
    	}
    	
    	// get user info
    	User user = userServ.getOneUser(userId);
    	model.addAttribute("userName", user.getUserName());
    	
    	// info for table
    	model.addAttribute("allTickets", ticketServ.getAllTickets());
    	
    	return "dashboard.jsp";
    }
    
    // Page to fill out the new ticket form
    @GetMapping("/createTicket")
    public String createIssue(Model model, HttpSession session) {
    	Long userId = (Long) session.getAttribute("user_id");
    	if (userId == null) {
    		return "redirect:/";
    	}
    	
    	// push forward an empty ticket for Form data
    	Ticket ticket = new Ticket();
    	model.addAttribute("ticket", ticket);
    	return "newTicket.jsp";
    }
    
    // submit new ticket form to the database
    @PostMapping("/newTicket")
    public String newTicket(@Valid @ModelAttribute("ticket") Ticket ticket, BindingResult result, Model model) {
    	if(result.hasErrors()) {
    		return "newTicket.jsp";
    	}
    	ticketServ.saveTicket(ticket);
    	return "redirect:/home";
    }
    
    @GetMapping("/tickets/{id}")
    public String showOneTicket(@PathVariable("id") Long id, Model model, HttpSession session) {
    	Long userId = (Long) session.getAttribute("user_id");
    	if (userId == null) {
    		return "redirect:/";
    	}
    	
    	//get ticket by ID
    	Ticket ticket = ticketServ.getOneTicket(id);
    	model.addAttribute("ticket", ticket);
    	return "showOneTicket.jsp";
    }
    
    // Render a "confirmation" page before deleting tickets
    @GetMapping("/deleteConfirmation/{id}")
    public String deleteTicketConfirmation(@PathVariable("id") Long id, Model model) {
    	// render ShowOne information with confirmation box to delete
    	// TO-DO: Actually make that render / jsp file...
    	return "deleteOneTicket.jsp";
    }
    
    // Actual delete method (use after confirming that user actually wants to delete)
    @GetMapping("/deleteConfirmation/{id}/confirmed")
    public String deleteTicketConfirmed(@PathVariable("id") Long id) {
    	ticketServ.deleteTicket(id);
    	return "redirect:/home";
    }
    
}