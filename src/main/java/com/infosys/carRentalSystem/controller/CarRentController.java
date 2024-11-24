package com.infosys.carRentalSystem.controller;

import com.infosys.carRentalSystem.bean.Car;
import com.infosys.carRentalSystem.bean.CarVariant;
import com.infosys.carRentalSystem.dao.CarDao;
import com.infosys.carRentalSystem.dao.CarVariantDao;
import com.infosys.carRentalSystem.dao.CustomerDao;
import com.infosys.carRentalSystem.exception.CustomerLicenceException;
import com.infosys.carRentalSystem.exception.CustomerStatusException;
import com.infosys.carRentalSystem.service.CarUserService;
import com.infosys.carRentalSystem.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@ControllerAdvice
public class CarRentController {
    @Autowired
    private CarVariantDao carVariantDao;
    @Autowired
    private CarDao carDao;
    @Autowired
    private CarUserService carUserService;
    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private CustomerService customerService;

    @GetMapping("/variantAdd")
    public ModelAndView showVariantEntryPage() {
        String newId = carVariantDao.generateVariantId();
        CarVariant carVariant = new CarVariant(newId);
        ModelAndView mv =  new ModelAndView("variantEntryPage");
        mv.addObject("variantRecord", carVariant);
        return mv;
    }
    @PostMapping("/variantAdd")
    public ModelAndView saveVariant(@ModelAttribute("variantRecord") CarVariant carVariant) {
        carVariantDao.save(carVariant);
        return new ModelAndView("redirect:/index");
    }

    @GetMapping("/variantReport")
    public ModelAndView showVariantReportPage() {
        List<CarVariant> variantList = carVariantDao.findAll();
        variantList.forEach(v-> System.out.println(v));
        ModelAndView mv = new ModelAndView("variantReportPage");
        mv.addObject("variantList", variantList);
        return mv;
    }
    @GetMapping("/variantDeletion/{id}")
    public ModelAndView deleteVariant(@PathVariable String id) {
        carVariantDao.deleteVariantById(id);
        return new ModelAndView("redirect:/variantReport");
    }

    @GetMapping("/carAdd")
    public ModelAndView showCarEntryPage() {
        Car car = new Car();
        List<String> variantIdList = carVariantDao.getAllVariantIds();
        ModelAndView mv = new ModelAndView("carEntryPage");
        mv.addObject("carRecord", car);
        mv.addObject("variantIdList", variantIdList);
        return mv;
    }

    @PostMapping("/carAdd")
    public ModelAndView saveCar(@ModelAttribute("carRecord") Car car) {
        carDao.save(car);
        return new ModelAndView("redirect:/index");
    }

    @GetMapping("/customerCarReport")
    public ModelAndView showCustomerCarReportPage() {
        String username = carUserService.getUsername();
        String role = carUserService.getRole();
        boolean status = customerDao.getCustomerStatusByUsername(username);
        if(!status) throw new CustomerStatusException();

        String licenceExpiryDate = customerDao.getLicenceExpiryDate(username);

        if(!customerService.validateCustomerLicenceDate(licenceExpiryDate))
            throw new CustomerLicenceException();

        List<Car> carList = carDao.getAvailableCars();
        List<CarVariant> variantList = carVariantDao.findAll();

        Map<String, CarVariant> variantMap = new HashMap<>();
        variantList.forEach(variant -> {
            variantMap.put(variant.getVariantId(), variant);
        });

        ModelAndView mv = new ModelAndView("carReportPageCustomer");

        mv.addObject("carList", carList);
        mv.addObject("variantMap", variantMap);

        return mv;
    }

    @GetMapping("/carReport")
    public ModelAndView showCarReportPage() {
        List<Car> carList = carDao.findAll();
        List<CarVariant> variantList = carVariantDao.findAll();

        Map<String, CarVariant> variantMap = new HashMap<>();
        variantList.forEach(variant -> {
            variantMap.put(variant.getVariantId(), variant);
        });

        ModelAndView mv = new ModelAndView("carReportPageAdmin");

        mv.addObject("carList", carList);
        mv.addObject("variantMap", variantMap);

        return mv;
    }

    @GetMapping("/carDelete/{id}")
    public ModelAndView deleteCar(@PathVariable String id) {
        carVariantDao.deleteVariantById(id);
        return new ModelAndView("redirect:/carReport");
    }

    @GetMapping("/carUpdate/{id}")
    public ModelAndView showCarUpdatePage(@PathVariable String id) {
        Car car = carDao.findById(id);
        ModelAndView mv = new ModelAndView("carUpdatePage");
        mv.addObject("carRecord", car);
        return mv;
    }

    @PostMapping("/carUpdate")
    public ModelAndView saveCarUpdatePage(@ModelAttribute("carRecord") Car car) {
        carDao.save(car);
        return new ModelAndView("redirect:/carReport");
    }

    @ExceptionHandler(CustomerStatusException.class)
    public ModelAndView handleCustomerStatusException(CustomerStatusException exception) {
        String message="Sorry Dear Customer, Need to complete last booking & payment procedures";
        ModelAndView mv=new ModelAndView("errorPage");
        mv.addObject("errorMessage",message);
        return mv;
    }
    @ExceptionHandler(CustomerLicenceException.class)
    public ModelAndView handleCustomerLicenceException(CustomerLicenceException exception) {
        String message = "Sorry Dear Customer, Need to renew your Licence";
        ModelAndView mv = new ModelAndView("errorPage");
        mv.addObject("errorMessage",message);
        return mv;
    }


}
