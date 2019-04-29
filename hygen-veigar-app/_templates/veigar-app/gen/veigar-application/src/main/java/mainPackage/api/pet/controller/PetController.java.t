---
to: <%= h.mainPomLocation(h, locals) %>/src/main/java/<%= h.mainPackageDir(h, locals) %>/api/pet/controller/PetController.java
---
package <%= h.mainPackage(h, locals) %>.api.pet.controller;

import <%= h.mainPackage(h, locals) %>.api.pet.payload.PetRes;
import <%= h.mainPackage(h, locals) %>.service.pet.PetResult;
import <%= h.mainPackage(h, locals) %>.service.pet.PetService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/pets")
public class PetController {

  @Autowired
  private PetService petService;


  @GetMapping()
  List<PetRes> findPets(HttpServletResponse response) {

    List<PetResult>  petResults = petService.findPets();
    List<PetRes> petReses = new ArrayList<>();
    petResults.forEach(item -> {
      PetRes petRes = new PetRes();
      petRes.setName(item.getName());
      petReses.add(petRes);
    });

    response.setHeader("X-Total-Count", String.valueOf(petResults.size()));

    return petReses;

  }


}
