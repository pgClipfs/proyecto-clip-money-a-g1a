import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Persona} from '../models/persona.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PersonaService {

  url = 'https://localhost:44374/api/persona';

  constructor( private http: HttpClient) {
    console.log('Persona service is running');
  }

  getPersonas(): Observable<Persona[]>{
    // tslint:disable-next-line: prefer-const
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get<Persona[]>(this.url, {headers: header});

  }
}
