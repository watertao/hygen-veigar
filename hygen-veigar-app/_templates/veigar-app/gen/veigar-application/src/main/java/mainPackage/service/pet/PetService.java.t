---
to: <%= h.mainPomLocation(h, locals) %>/src/main/java/<%= h.mainPackageDir(h, locals) %>/service/pet/PetService.java
---
package <%= h.mainPackage(h, locals) %>.service.pet;


import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class PetService {

  public List<PetResult> findPets() {

    List<PetResult> petResults = new ArrayList<>();

    PetResult pet = new PetResult();
    pet.setName("Jack");
    petResults.add(pet);

    pet = new PetResult();
    pet.setName("Tommy");
    petResults.add(pet);

    return petResults;

  }

}
