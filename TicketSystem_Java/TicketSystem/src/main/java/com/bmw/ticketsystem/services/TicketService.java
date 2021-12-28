package com.bmw.ticketsystem.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.bmw.ticketsystem.models.Ticket;
import com.bmw.ticketsystem.repositories.TicketRepo;

@Service
public class TicketService {
	
	private final TicketRepo ticketRepo;
	public TicketService(TicketRepo ticketRepo) {
		this.ticketRepo = ticketRepo;
	}
	
	public List<Ticket> getAllTickets() {
		return ticketRepo.findAll();
	}
	
	public Ticket getOneTicket(Long id) {
		Optional<Ticket> optionalTicket = ticketRepo.findById(id);
		return optionalTicket.isPresent() ? optionalTicket.get() : null;
	}
	
	public Ticket saveTicket(Ticket a) {
		return ticketRepo.save(a);
	}
	
	public void deleteTicket(Long id) {
		ticketRepo.deleteById(id);
	}

}
