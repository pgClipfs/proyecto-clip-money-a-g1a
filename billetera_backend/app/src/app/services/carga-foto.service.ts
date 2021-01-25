import { Injectable } from '@angular/core';
import { Foto } from '../models/foto';
import {  HttpClient , HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CargaFotoService {

  url: string = 'https://localhost:44374/api/foto';
 
  constructor( private http: HttpClient  ) { }


  onSubirFoto(foto: Foto): Observable<Foto> {
    // tslint:disable-next-line: prefer-const
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    console.log(foto);
    return this.http.post<Foto>(this.url, foto);
  }

}
