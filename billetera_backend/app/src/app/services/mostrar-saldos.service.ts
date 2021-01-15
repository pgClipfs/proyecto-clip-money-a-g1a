import { Injectable } from '@angular/core';
import { HttpClient ,HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { MostarSaldos } from '../models/mostar-saldos.model';
import { map } from 'rxjs/operators';
@Injectable({
  providedIn: 'root'
})
export class MostrarSaldosService {

  url = 'https://localhost:44374/api/mostrarsaldos/9'; //9

  
  constructor( private http: HttpClient) { 
    console.log('MostrarSaldos service is running')
  }

getSaldos(): Observable<MostarSaldos[]>{
  let header = new HttpHeaders().set('Content-Type', 'application/json');
  return this.http.get<MostarSaldos[]>(this.url);
  

}}
