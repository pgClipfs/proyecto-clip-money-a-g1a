import { Component, OnInit } from '@angular/core';
import { Giro } from 'src/app/models/giro';
import { GiroService } from '../../services/giro.service';
import { DatosCuentaService } from '../../services/DatosCuenta.service';
import { LoginService } from '../../services/login.service';
import { PersonaService } from '../../services/persona.service';
import { DatosCuenta } from '../../models/DatosCuenta.model';
import { Persona } from 'src/app/models/persona.model';

@Component({
  selector: 'app-giro',
  templateUrl: './giro.component.html',
  styleUrls: ['./giro.component.css']
})
export class GiroComponent implements OnInit {

  giro: Giro = new Giro();
  personaLogeadaCuenta : DatosCuenta [];
  personaLogeada: Persona = new Persona();

  constructor(private giroService: GiroService,
              private cuentaService: DatosCuentaService,
              private loginService: LoginService,
              private personaService: PersonaService) { }

  ngOnInit(): void {
    this.personaService.getPersonas().subscribe(resp => {
      for(let i = 0; i < resp.length; i++){
        if(resp[i]["Email"] == this.loginService.user){
          this.personaLogeada = resp[i];
          console.log(this.personaLogeada);
        }
      }
      this.cuentaService.getSaldos(this.personaLogeada["Id"]).subscribe(resp =>{
        this.personaLogeadaCuenta = resp;
        console.log(this.personaLogeada);
      })
      })
  }

  enviarGiro(monto: number){
    this.giro.Id_Cuenta = this.personaLogeada["Id"];
    this.giro.MontoMax = this.personaLogeadaCuenta["Saldo"] * .10;
    this.giro.Monto = monto;
    if(this.giro.Monto <= this.giro.MontoMax){
      this.giroService.enviarGiro(this.giro).subscribe(resp =>{
        resp = this.giro;
      })
    }else{
      alert("No puedes retirar este monto")
    }
  } 

}
