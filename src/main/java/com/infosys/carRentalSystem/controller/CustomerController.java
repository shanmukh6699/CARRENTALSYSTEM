package com.infosys.carRentalSystem.controller;

import com.infosys.carRentalSystem.bean.Customer;
import com.infosys.carRentalSystem.dao.CustomerDao;
import com.infosys.carRentalSystem.service.CarUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
public class CustomerController {
    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private CarUserService carUserService;

    @GetMapping("/myaccount")
    public ModelAndView showCustomerDetailsPage() {
        String username = carUserService.getUsername();
        ModelAndView mv = new ModelAndView("customerProfilePage");
        Customer customer = customerDao.findById(username);
        mv.addObject("customer", customer);
        return mv;
    }

    @GetMapping("/customerReport")
    public ModelAndView showCustomerReport() {

        String username = carUserService.getUsername();
        String role = carUserService.getRole();

        ModelAndView mv = new ModelAndView("customerReportPage");

        List<Customer> customers = customerDao.findAll();
        mv.addObject("customers", customers);
        return mv;
    }

    @GetMapping("/myaccount/update")
    public ModelAndView customerUpdatePage() {
        String username = carUserService.getUsername();
        String email = carUserService.getEmail();
        Customer customer = customerDao.findById(username);
        if(customer == null) {
            customer = new Customer();
            customer.setUsername(username);
            customer.setEmail(email);
        }

        ModelAndView mv = new ModelAndView("customerUpdatePage");
        mv.addObject("customer", customer);
        return mv;
    }

    @PostMapping("/myaccount/update")
    public ModelAndView updateCustomerDetail(@ModelAttribute("customer") Customer customer) {
        String username = customer.getUsername();
        customerDao.save(customer);
        return new ModelAndView("redirect:/myaccount");
    }

}
