import { Injectable } from '@angular/core';
import { HttpClient ,HttpHeaders } from '@angular/common/http';
import { Foto } from '../models/foto';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class FotoService {

  url: string = 'https://localhost:44374/api/foto';

  constructor(private http: HttpClient) { }

  enviarFoto(foto: Foto): Observable<Foto> {
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    console.log(foto);
    return this.http.post<Foto>(this.url, foto);
  }
}
