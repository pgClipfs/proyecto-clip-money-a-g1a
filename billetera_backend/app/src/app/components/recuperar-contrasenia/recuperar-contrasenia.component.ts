import { Component, OnInit } from '@angular/core';
import { RecuperoCuentaService } from '../../services/recupero-cuenta.service';
import { Mail } from '../../models/email';

@Component({
  selector: 'app-recuperar-contrasenia',
  templateUrl: './recuperar-contrasenia.component.html',
  styleUrls: ['./recuperar-contrasenia.component.css']
})
export class RecuperarContraseniaComponent implements OnInit {

  mailnew: Mail = new Mail();

  constructor( private recuperoPas: RecuperoCuentaService) { }

  ngOnInit(): void {
  }

  onSubmit(mail: Mail){
    this.mailnew.Mail = mail;
    console.log(mail);
    this.recuperoPas.enviarMail(this.mailnew).subscribe(resp=>{
      this.mailnew = resp;
    })
  }
}
