import { Component, OnInit } from '@angular/core';
import { PersonaService } from '../../services/persona.service';
import { Persona } from '../../models/persona.model';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router'

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent implements OnInit {

  public personas: Persona[];
  selectedPersona: Persona = new Persona();

  constructor(private personaService: PersonaService, private router: Router) { }

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

  onZubmit(form: NgForm) {

    if (form.invalid) {
      return;
    }


  }

  public onSubmit(form: NgForm, persona: Persona) {

    if (form.invalid) {
      return;
    }

    if (persona.Id == 0) {
      this.personaService.onCreatePersona(persona).subscribe(resp => {

      });
      alert('Registro exitoso')
      this.router.navigateByUrl('user/login');
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