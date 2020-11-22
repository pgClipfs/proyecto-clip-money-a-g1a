import { Component, OnInit } from '@angular/core';
import { LoginService } from '../../services/login.service';
import { Login } from '../../models/login.model';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  public login: Login[];
  selectedLogin: Login = new Login();

  constructor(private loginService: LoginService) { }

  ngOnInit(): void {
  }

  public onSubmit(login: Login) {

    this.loginService.getToken(login).subscribe(resp => {
      console.log(resp)
    });

  }

}
