import { HttpClient,HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Usuario } from '../models/Usuario.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  url = 'https://localhost:44374/api/user';

  constructor(private http: HttpClient) {
    console.log('Persona service is running');
   }

   getUsuario(): Observable<Usuario[]> {
    // tslint:disable-next-line: prefer-const
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get<Usuario[]>(this.url);

  }
}
