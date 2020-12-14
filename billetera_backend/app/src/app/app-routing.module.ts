import { convertUpdateArguments } from '@angular/compiler/src/compiler_util/expression_converter';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CvuComponent } from './components/cvu/cvu.component';
import { CambiarContrComponent } from './components/cambiar-contr/cambiar-contr.component';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { PersonaComponent } from './components/persona/persona.component';
import { RegistroComponent } from './components/registro/registro.component'


const routes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'persona', component: PersonaComponent },
  { path: 'user/login', component: LoginComponent },
  { path: 'registro', component: RegistroComponent },
  { path: 'micvu', component: CvuComponent},
  { path: 'cambiarcontr', component: CambiarContrComponent},
  { path: '', component: LoginComponent },
  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
