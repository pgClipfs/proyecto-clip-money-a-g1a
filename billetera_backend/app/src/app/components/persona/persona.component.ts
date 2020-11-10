import { Component, OnInit } from '@angular/core';
import {PersonaService} from '../../services/persona.service';
import {Persona} from '../../models/persona.model';

@Component({
  selector: 'app-persona',
  templateUrl: './persona.component.html',
  styleUrls: ['./persona.component.css']
})
export class PersonaComponent implements OnInit {

  angular = 'https://angular.io/';
  public personas: Persona[];

  constructor(private personaService: PersonaService) { }

  ngOnInit(): void {
    this.personaService.getPersonas().subscribe(resp => {
      console.log(resp);
      this.personas = resp;
    });
  }

  // tslint:disable-next-line: typedef
  nuevaPersona(){
    alert('Nueva Persona - event Binding ok');
  }

}
