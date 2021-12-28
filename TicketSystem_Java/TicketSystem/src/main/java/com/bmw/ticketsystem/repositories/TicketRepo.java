package com.bmw.ticketsystem.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.bmw.ticketsystem.models.Ticket;

public interface TicketRepo extends CrudRepository<Ticket, Long>{
	
	// get all tickets
	List<Ticket> findAll();
	
	// get one ticket by ID
	Optional<Ticket> findById(Long id);
	
	// save ticket
	// Ticket save(Ticket a);
	
	// delete ticket by ID
	void deleteById(Long id);

}
