import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { UltimosMov } from '../models/ultimos-mov.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UltimosMovService {

  url = 'https://localhost:44374/api/ultimosmov'

  constructor(private http: HttpClient) { }


  


  getUltimosMov(id:any): Observable<UltimosMov[]>{
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get<UltimosMov[]>(this.url + '/' + id);

}
}
