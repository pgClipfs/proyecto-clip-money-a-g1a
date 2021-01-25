import { Component, OnInit } from '@angular/core';
import { PersonaService } from '../../services/persona.service';
import { LoginService } from '../../services/login.service';
import { Persona } from '../../models/persona.model';
import { DatosCuentaService } from '../../services/DatosCuenta.service';
import { DatosCuenta } from 'src/app/models/DatosCuenta.model';
import { Transferencia } from '../../models/transferencia';
import { TransferenciaService } from '../../services/transferencia.service';

@Component({
  selector: 'app-transferencias',
  templateUrl: './transferencias.component.html',
  styleUrls: ['./transferencias.component.css']
})
export class TransferenciasComponent implements OnInit {

  persona: Persona = new Persona();
  personaCuenta : DatosCuenta = new DatosCuenta();
  personaLogeadaCuenta : DatosCuenta [];
  personaLogeada: Persona = new Persona();

  transferencia: Transferencia = new Transferencia();

  idCuenta: any;
  //idPersona: any;

  constructor(private personaService: PersonaService,
              private loginService: LoginService,
              private datosCuenta: DatosCuentaService,
              private transfer: TransferenciaService) { }

  ngOnInit(): void {

    this.personaService.getPersonas().subscribe(resp => {
    for(let i = 0; i < resp.length; i++){
      if(resp[i]["Email"] == this.loginService.user){
        this.personaLogeada = resp[i];
        console.log(this.personaLogeada);
      }
    }
    this.datosCuenta.getSaldos(this.personaLogeada["Id"]).subscribe(resp =>{
      this.personaLogeadaCuenta = resp;
      console.log(this.personaLogeada);
    })
    })
  }

  onSubmit(cvu: number){
    this.datosCuenta.getCuenta().subscribe(resp=>{
      console.log(resp);
      for(let i = 0; i < resp.length; i++){
        if(resp[i]["Cbu"] == cvu){
          this.personaCuenta = resp[i];
        }
      }
      this.idCuenta = this.personaCuenta["Id"];
    })
    this.personaService.getPersonas().subscribe(resp =>{
      for(let i = 0; i < resp.length; i++){
        if(resp[i]["Id"] == this.idCuenta){
          this.persona = resp[i];
        }
      }
    })
  }

  enviarTransferencia(monto: number){

    if(monto > this.personaLogeadaCuenta["Saldo"] || monto == 0){
      alert("No tienes suficiente saldo para hacer la operacion.")
    }else{
    this.transferencia.monto = monto;
    this.transferencia.id_cuenta_destino = this.idCuenta;
    this.transferencia.id_cuenta_origen = this.personaLogeadaCuenta["Id"];
    this.transfer.enviarTransferencia(this.transferencia).subscribe(resp=>{
      this.transferencia = resp;
    })

    console.log(this.transferencia);
  }
  }
}
