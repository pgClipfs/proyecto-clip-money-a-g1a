import { Injectable } from '@angular/core';
import { HttpClient ,HttpHeaders } from '@angular/common/http';
import { Giro } from '../models/giro';
import { Observable } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class GiroService {

  url: string = 'https://localhost:44374/api/giro';

  constructor(private http: HttpClient) { }


  
  enviarGiro(giro: Giro): Observable<Giro> {
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    console.log(giro);
    return this.http.post<Giro>(this.url, giro);
  }
}
