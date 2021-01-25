import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Login } from '../models/login.model';
import { Observable } from 'rxjs';
import jwtDecode, * as JWT from 'jwt-decode';
import { Usuario } from '../models/Usuario.model';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  url = 'https://localhost:44374/api/login/authenticate';
  
  //url2 = 'https://localhost:44374/api/user';
  user: any;
  constructor(private http: HttpClient) {
    console.log('Login service is running');
    
  }

  // getUser(): Observable<Usuario[]>{
  //   let header = new HttpHeaders().set('Content-Type', 'application/json');
  //   return this.http.get<Usuario[]>(this.url2);
  // }

  getToken(login: Login): Observable<string> {
    this.user = login.Username;
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    console.log("Y esto" + JSON.stringify( login));
    return this.http.post<string>(this.url, login);
  }
}
