import { Injectable } from '@angular/core';
import { HttpClient ,HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Mail } from '../models/email';


@Injectable({
  providedIn: 'root'
})
export class RecuperoCuentaService {

  url: string = 'https://localhost:44374/api/email'
  constructor(private http: HttpClient) { }


  enviarMail(mail: Mail): Observable<Mail> {
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    console.log(mail);
    return this.http.post<Mail>(this.url, mail);
  }
}
