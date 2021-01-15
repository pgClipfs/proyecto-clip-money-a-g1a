import { Component, OnInit } from '@angular/core';
import { ApiProvinciasService } from '../../services/api-provincias.service';
import { Provincia } from '../../models/provincia.model';
import { Localidad } from '../../models/localidad.model';


@Component({
  selector: 'app-completar-datos',
  templateUrl: './completar-datos.component.html',
  styleUrls: ['./completar-datos.component.css']
})
export class CompletarDatosComponent implements OnInit {

  provinces: any[] = [];
  localities: any[] = [];

  
  public provincias: Provincia[];
  selectedProvincia: Provincia = new Provincia();
  public localidades: Localidad[];
  selectedLocalidades: Localidad = new Localidad();

  constructor(private completarDatos: ApiProvinciasService) { }

  ngOnInit(): void {

    this.completarDatos.getProvincias()
    .subscribe( provincias => {
      this.selectedProvincia = provincias;
      this.provinces = provincias.provincias.map(t => t.nombre);
      console.log(this.provinces);
    } );
  }

  public getLocalidades( nombre: any){
    this.completarDatos.getLocalidades(nombre)
    .subscribe( localidades => {
      this.selectedLocalidades = localidades;
      this.localities = localidades.localidades.map(t => t.nombre);
      console.log(this.localities);
    } );
  }



  public onSelect(item: Provincia) {
    this.selectedProvincia = item;
  }
}
