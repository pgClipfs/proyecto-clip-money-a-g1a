
import { Component, OnInit } from '@angular/core';
import { LoginService } from '../../services/login.service';
import { Login } from '../../models/login.model';
import { Router } from '@angular/router'
import { NgForm } from '@angular/forms';
import { Usuario } from '../../models/Usuario.model';
import { Persona } from '../../models/persona.model';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  public login: Login[];
  selectedLogin: Login = new Login();



  constructor(private loginService: LoginService, private router: Router) { }

  ngOnInit(): void {
    localStorage.removeItem('token')
  }

  public onSubmit(form: NgForm, login: Login) {

    if (form.invalid) {
      return;
    }

    else {

      let person = new Persona()
      
      let id = person.Id;
      console.log("El id:" + id);
      this.loginService.getToken(login).subscribe(resp => {
        localStorage.setItem('token', resp);
        this.router.navigateByUrl('/home');
        console.log("Esto es el token:" + JSON.stringify(login))
      },
        err => {
          if (err.status == 401) alert("Contraseña o Usuario invalido")
        }
      );

    }

  }

  public logout(){
    localStorage.removeItem('token');
  }

}
