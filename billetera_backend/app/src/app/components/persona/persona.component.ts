import { Component, OnInit } from '@angular/core';
import { PersonaService } from '../../services/persona.service';
import { Persona } from '../../models/persona.model';

@Component({
  selector: 'app-persona',
  templateUrl: './persona.component.html',
  styleUrls: ['./persona.component.css']
})
export class PersonaComponent implements OnInit {

  angular = 'https://angular.io/';
  public personas: Persona[];
  selectedPersona: Persona = new Persona();

  constructor(private personaService: PersonaService) { }

  ngOnInit(): void {
    this.personaService.getPersonas().subscribe(resp => {
      console.log(resp);
      this.personas = resp;
    });
  }


  public onDelete(id: number) {
    this.personaService.onDeletePersona(id).subscribe(resp => {
      this.personas = this.personas.filter(t => t.Id !== id);
    });
  }


  public onSubmit(persona: Persona) {

    if (persona.Id == 0) {
      this.personaService.onCreatePersona(persona).subscribe(resp => {
        this.personas.push(resp);
      });
    }
    else {
      this.personaService.onUpdatePersona(persona).subscribe(resp => {

      });
    }

    this.selectedPersona = new Persona();
  }


  public onSelect(item: Persona) {
    this.selectedPersona = item;
  }

}
