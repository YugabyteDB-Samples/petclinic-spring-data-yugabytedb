/*
 * Copyright 2012-2021 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.samples.petclinic.web;

import org.springframework.samples.petclinic.vet.Specialty;
import org.springframework.samples.petclinic.vet.SpecialtyRepository;
import org.springframework.samples.petclinic.vet.Vet;
import org.springframework.samples.petclinic.vet.VetRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @author Juergen Hoeller
 * @author Mark Fisher
 * @author Ken Krebs
 * @author Arjen Poutsma
 * @author Maciej Walkowiak
 */
@Controller
class VetController {

    private final VetRepository vets;
    private final SpecialtyRepository specialties;

    public VetController(VetRepository clinicService, SpecialtyRepository specialties) {
        this.vets = clinicService;
        this.specialties = specialties;
    }

    @GetMapping("/vets.html")
    public String showVetList(Map<String, Object> model) {
        // Here we are returning an object of type 'Vets' rather than a collection of Vet
        // objects so it is simpler for Object-Xml mapping
        model.put("vets", new Vets(vetToVetDto(this.vets.findAll())));
        return "vets/vetList";
    }

    @GetMapping({"/vets"})
    public @ResponseBody
    Vets showResourcesVetList() {
        // Here we are returning an object of type 'Vets' rather than a collection of Vet
        // objects so it is simpler for JSon/Object mapping
        return new Vets(vetToVetDto(this.vets.findAll()));
    }

    private List<VetDto> vetToVetDto(Collection<Vet> vets) {
        return vets.stream().map(this::vetToVetDto).collect(Collectors.toList());
    }

    private VetDto vetToVetDto(Vet v) {
        var specialtyList = v.getSpecialties().stream()
            .map(s -> specialties.findById(s.specialty()))
            .flatMap(Optional::stream)
            .collect(Collectors.toList());

        return new VetDto(v.getId(), v.getFirstName(), v.getLastName(), specialtyList);
    }

    /**
     *
     */
    static record Vets(List<VetDto> vets) {
    }

    /**
     *
     */
    static record VetDto(Long id, String firstName, String lastName, List<Specialty> specialties) {
        public int getNrOfSpecialties() {
            return specialties.size();
        }
    }
}
