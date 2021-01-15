import { Injectable } from '@angular/core';
import { HttpClient , HttpHeaders } from '@angular/common/http';
import { Provincia } from '../models/provincia.model';
import { Observable } from 'rxjs';
import { Localidad } from '../models/localidad.model';

@Injectable({
  providedIn: 'root'
})
export class ApiProvinciasService {

  provincias = 'https://apis.datos.gob.ar/georef/api/provincias';
  localidades = 'https://apis.datos.gob.ar/georef/api/localidades';  //?provincia=cordoba&campos=nombre&max=250';

  constructor( private http: HttpClient ) { }


  getProvincias(): Observable<Provincia> {
    // tslint:disable-next-line: prefer-const
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get<Provincia>(this.provincias);

  }

  getLocalidades(nombreProvincia: any): Observable<Localidad> {
    // tslint:disable-next-line: prefer-const
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get<Localidad>(this.localidades + '?provincia=' + nombreProvincia + '&campos=nombre&max=250' );

  }

}
