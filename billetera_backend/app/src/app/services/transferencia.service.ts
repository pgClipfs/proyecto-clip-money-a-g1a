import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import { Transferencia } from '../models/transferencia';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TransferenciaService {


  url: string = 'https://localhost:44374/api/transferencia';


  constructor(private http: HttpClient) { }


  enviarTransferencia(transferencia: Transferencia): Observable<Transferencia> {
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    console.log(transferencia);
    return this.http.post<Transferencia>(this.url, transferencia);
  }


}
