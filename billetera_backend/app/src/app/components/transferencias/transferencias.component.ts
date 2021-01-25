import { Component, OnInit } from '@angular/core';
import { PersonaService } from '../../services/persona.service';
import { LoginService } from '../../services/login.service';
import { Persona } from '../../models/persona.model';
import { DatosCuentaService } from '../../services/DatosCuenta.service';
import { DatosCuenta } from 'src/app/models/DatosCuenta.model';

@Component({
  selector: 'app-transferencias',
  templateUrl: './transferencias.component.html',
  styleUrls: ['./transferencias.component.css']
})
export class TransferenciasComponent implements OnInit {

  persona: Persona = new Persona();
  personaCuenta : DatosCuenta = new DatosCuenta();
  
  cvuDestinatario: any;
  nombreDestinatario: any;

  idCuenta: any;
  constructor(private personaService: PersonaService,
              private loginService: LoginService,
              private datosCuenta: DatosCuentaService) { }

  ngOnInit(): void {

    this.datosCuenta.getCuenta().subscribe(resp => {
    for(let i = 0; i < resp.length; i++){
      if(resp[i]["id"] == this.datosCuenta.idCuenta){
        this.personaCuenta = resp[i];
        console.log(this.personaCuenta["cbu"]);
        this.cvuDestinatario = this.personaCuenta["cbu"];
        console.log(this.cvuDestinatario);
      }
    }
    })
    

  }

  onSubmit(cvu: number){
    
    this.datosCuenta.getCuenta().subscribe(resp=>{
      for(let i = 0; i < resp.length; i++){
        if(resp[i]["cbu"] == cvu){
          this.personaCuenta = resp[i];
          this.idCuenta = resp[i]["id"];
        }
      }
      
     console.log(this.idCuenta);
      

    })

  }
}
