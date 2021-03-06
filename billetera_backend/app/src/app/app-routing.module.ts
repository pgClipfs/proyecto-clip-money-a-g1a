import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { PersonaComponent } from './components/persona/persona.component';
import { RegistroComponent } from './components/registro/registro.component'
import { CompletarDatosComponent } from './components/completar-datos/completar-datos.component';
import { CvuComponent } from './components/cvu/cvu.component';
import { TransferenciasComponent } from './components/transferencias/transferencias.component';
import { BuscadorCuentaComponent } from './components/buscador-cuenta/buscador-cuenta.component';
import { GiroComponent } from './components/giro/giro.component';
import { RecuperarContraseniaComponent } from './components/recuperar-contrasenia/recuperar-contrasenia.component';

const routes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'persona', component: PersonaComponent },
  { path: 'user/login', component: LoginComponent },
  { path: 'registro', component: RegistroComponent },
  { path: 'completar-datos', component: CompletarDatosComponent },
  { path: 'cvu', component: CvuComponent },
  { path: 'transferencias', component: TransferenciasComponent },
  { path: 'buscador-cuenta', component: BuscadorCuentaComponent },
  { path: 'giro', component: GiroComponent },
  { path: 'recuperar-contrasenia', component: RecuperarContraseniaComponent },
  { path: '', component: LoginComponent },
  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
