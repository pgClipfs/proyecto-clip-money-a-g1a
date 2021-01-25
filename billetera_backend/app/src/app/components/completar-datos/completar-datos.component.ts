import { Component, OnInit } from '@angular/core';
import { ApiProvinciasService } from '../../services/api-provincias.service';
import { Provincia } from '../../models/provincia.model';
import { Localidad } from '../../models/localidad.model';
import { PersonaService } from '../../services/persona.service';
import { LoginService } from '../../services/login.service';
import { Persona } from 'src/app/models/persona.model';
import { Foto } from '../../models/foto';
import { FotoService } from '../../services/foto.service';


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

  public persona: Persona = new Persona();
  public fotohtml: Foto = new Foto();

  constructor(private completarDatos: ApiProvinciasService,
              private personasService: PersonaService,
              private login: LoginService,
              private fotoService: FotoService
              ) { }

  ngOnInit(): void {

    this.personasService.getPersonas()
    .subscribe(resp =>{
      for(let i = 0; i < resp.length;i++ ){
        if(resp[i]["Email"] == this.login.user){
          this.persona = resp[i];
        }
      }
      console.log("!!!!!!!!!!!!!!!");
      console.log(this.persona);
      
    })

    this.completarDatos.getProvincias()
    .subscribe( provincias => {
      this.selectedProvincia = provincias;
      this.provinces = provincias.provincias.map(t => t.nombre);
    } );
  }

  public getLocalidades( nombre: any){
    this.completarDatos.getLocalidades(nombre)
    .subscribe( localidades => {
      this.selectedLocalidades = localidades;
      this.localities = localidades.localidades.map(t => t.nombre);
    } );
  }

  public onSelect(item: Provincia) {
    this.selectedProvincia = item;
  }

  public updatePersona(person: Persona){
    this.personasService.onUpdatePersona(person).subscribe(resp =>{
      this.persona = resp;
      console.log(this.persona);
    });
  }

  // public cargaFoto(foto: Foto){
  //   console.log(foto);
  //   this.fotoService.enviarFoto(foto).subscribe(resp =>{
  //     this.fotohtml = resp;
  //   })
  // }


}
