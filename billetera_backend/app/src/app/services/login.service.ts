import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Login } from '../models/login.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  url = 'https://localhost:44374/api/login/authenticate';

  constructor(private http: HttpClient) {
    console.log('Login service is running');
  }

  getToken(login: Login): Observable<string> {

    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post<string>(this.url, login);
  }
}
