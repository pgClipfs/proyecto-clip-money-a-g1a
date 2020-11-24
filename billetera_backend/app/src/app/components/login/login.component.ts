import { Component, OnInit } from '@angular/core';
import { LoginService } from '../../services/login.service';
import { Login } from '../../models/login.model';
import { Router } from '@angular/router'
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

  public onSubmit(login: Login) {

    this.loginService.getToken(login).subscribe(resp => {
      localStorage.setItem('token', resp);
      this.router.navigateByUrl('/home');
      console.log(resp)
    },
      err => {
        if (err.status == 401) alert("Contraseña o Usuario invalido")
      }
    );

  }



}
