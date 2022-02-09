package com.javaspringclub.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.javaspringclub.entity.Contact;
import com.javaspringclub.service.ContactService;

@Controller
public class ContactController {
	// Constructor based Dependency Injection
	@Autowired
	private ContactService contactService;
	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public ModelAndView hello(HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}

	// Get All Contacts
	@RequestMapping(value = "/allContacts", method = RequestMethod.POST)
	public ModelAndView displayAllUser() {
		System.out.println("User Page Requested : All Contacts");
		ModelAndView mv = new ModelAndView();
		List<Contact> contactList = contactService.getAllContacts();
		mv.addObject("contactList", contactList);
		mv.setViewName("allContacts");
		return mv;
	}

	@RequestMapping(value = "/addContact", method = RequestMethod.GET)
	public ModelAndView displayNewUserForm() {
		ModelAndView mv = new ModelAndView("addContact");
		mv.addObject("headerMessage", "Add Contact Details");
		mv.addObject("contact", new Contact());
		return mv;
	}

	@RequestMapping(value = "/addContact", method = RequestMethod.POST)
	public ModelAndView saveNewContact(@ModelAttribute Contact contact, BindingResult result) {
		ModelAndView mv = new ModelAndView("redirect:/home");

		if (result.hasErrors()) {
			return new ModelAndView("error");
		}
		boolean isAdded = contactService.saveContact(contact);
		if (isAdded) {
			mv.addObject("message", "New Contact successfully added");
		} else {
			return new ModelAndView("error");
		}

		return mv;
	}

	@RequestMapping(value = "/editContact/{id}", method = RequestMethod.GET)
	public ModelAndView displayEditUserForm(@PathVariable Integer id) {
		ModelAndView mv = new ModelAndView("/editContact");
		Contact contact = contactService.getContactById(id);
		mv.addObject("headerMessage", "Edit Contact Details");
		mv.addObject("contact", contact);
		return mv;
	}

	@RequestMapping(value = "/editContact/{id}", method = RequestMethod.POST)
	public ModelAndView saveEditedContact(@ModelAttribute Contact contact, BindingResult result) {
		ModelAndView mv = new ModelAndView("redirect:/home");

		if (result.hasErrors()) {
			System.out.println(result.toString());
			return new ModelAndView("error");
		}
		boolean isSaved = contactService.saveContact(contact);
		if (!isSaved) {

			return new ModelAndView("error");
		}

		return mv;
	}

	@RequestMapping(value = "/deleteContact/{id}", method = RequestMethod.GET)
	public ModelAndView deleteContactById(@PathVariable Integer id) {
		boolean isDeleted = contactService.deleteContactById(id);
		System.out.println("Contact deletion respone: " + isDeleted);
		ModelAndView mv = new ModelAndView("redirect:/home");
		return mv;

	}

}
