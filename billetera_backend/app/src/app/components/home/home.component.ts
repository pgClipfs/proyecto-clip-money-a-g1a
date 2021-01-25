import { Component, OnInit } from '@angular/core';
import {DatosCuentaService } from '../../services/DatosCuenta.service';
import { DatosCuenta } from '../../models/DatosCuenta.model';
import { map } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { UltimosMovService } from '../../services/ultimos-mov.service';
import { PersonaService } from '../../services/persona.service';
import { Persona } from 'src/app/models/persona.model';
import { Login } from '../../models/login.model';
import { LoginService } from '../../services/login.service';
import { UsuarioService } from '../../services/usuario.service';
import { UltimosMov } from '../../models/ultimos-mov.model';



@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  public cuentas: DatosCuenta[];
  public personas : Persona[];
  movim : UltimosMov[];

  idposta: any;
  plata: any;
  
  constructor( private home: DatosCuentaService, 
              private home1: UltimosMovService, 
              private persona: PersonaService,
              private login: LoginService) { }

  ngOnInit(): void {

    this.persona.getPersonas().subscribe(resp =>{
      this.personas = Object.values(resp);
      console.log(this.personas);
      for(let i = 0; i < this.personas.length; i++)
      {
        if(this.login.user == this.personas[i]['Email'])
        {
          this.idposta = i + 1;
        }
      }
      console.log("Entro: " + this.idposta);
      this.home.getSaldos(this.idposta).subscribe(resp =>{
        console.log(resp);
        this.plata = resp;
        this.plata = this.plata['Saldo'];
        console.log(this.plata);
      })

      console.log(this.idposta);

      this.home1.getUltimosMov(this.idposta).subscribe(resp => {
        this.movim = resp;
      })

    })


  }

}
