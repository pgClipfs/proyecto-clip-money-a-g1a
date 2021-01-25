import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { DatosCuenta } from 'src/app/models/DatosCuenta.model';
import { DatosCuentaService } from '../../services/DatosCuenta.service';
import { PersonaService } from '../../services/persona.service';
import { LoginService } from '../../services/login.service';
import { Persona } from 'src/app/models/persona.model';

@Component({
  selector: 'app-buscador-cuenta',
  templateUrl: './buscador-cuenta.component.html',
  styleUrls: ['./buscador-cuenta.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class BuscadorCuentaComponent implements OnInit {

  public datosCuenta: DatosCuenta[];
  public personaCuenta: Persona = new Persona();

  idPersona: any;

  constructor(private datoscuentaService: DatosCuentaService,
              private personaService: PersonaService,
              private loginService: LoginService) { }

  ngOnInit(): void {

    this.datoscuentaService.getCuenta().subscribe(resp =>{
      this.datosCuenta = resp;
      console.log("Datos cuenta:");
      console.log(this.datosCuenta);
    })

    // this.personaService.getPersonas()
    // .subscribe(resp =>{
    //   for(let i = 0; i < resp.length;i++ ){
    //     if(resp[i]["Email"] == this.loginService.user){
    //       this.personaCuenta = resp[i];
    //     }
    //   } 
    // })


  }


  onSeleccion(id: number){

    console.log(id);

  }

}
