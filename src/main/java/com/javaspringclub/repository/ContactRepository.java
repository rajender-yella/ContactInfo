package com.javaspringclub.repository;

import org.springframework.data.repository.CrudRepository;

import com.javaspringclub.entity.Contact;


public interface ContactRepository extends CrudRepository<Contact, Integer> {

}
