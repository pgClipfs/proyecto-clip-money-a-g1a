import { Injectable } from '@angular/core';
import { HttpClient ,HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { DatosCuenta } from '../models/DatosCuenta.model';
import { map } from 'rxjs/operators';
@Injectable({
  providedIn: 'root'
})
export class DatosCuentaService {

  url = 'https://localhost:44374/api/DatosCuenta'; //9

  idCuenta: any;
  
  constructor( private http: HttpClient) { 
    console.log('MostrarSaldos service is running')
  }

  getCuenta(): Observable<DatosCuenta[]>{
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get<DatosCuenta[]>(this.url);
    
  }
  
  getSaldos(id: any): Observable<DatosCuenta[]>{
  let header = new HttpHeaders().set('Content-Type', 'application/json');
  return this.http.get<DatosCuenta[]>(this.url + '/' + id);
}

getCuentaById(id: any): Observable<DatosCuenta[]>{
  this.idCuenta = id;
  console.log(this.idCuenta);
  let header = new HttpHeaders().set('Content-Type', 'application/json');
  return this.http.get<DatosCuenta[]>(this.url + '/' + id);
}

}
