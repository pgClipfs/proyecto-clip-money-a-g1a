import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClient, HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { PersonaComponent } from './components/persona/persona.component';
import { PersonaService } from './services/persona.service';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { LoginComponent } from './components/login/login.component';
import { HomeComponent } from './components/home/home.component';
import { InterceptorService } from './services/interceptor.service';
import { RegistroComponent } from './components/registro/registro.component';
import { NavbarComponent } from './components/shared/navbar/navbar.component';
import { CompletarDatosComponent } from './components/completar-datos/completar-datos.component';
import { CvuComponent } from './components/cvu/cvu.component';
import { TransferenciasComponent } from './components/transferencias/transferencias.component';
import { BuscadorCuentaComponent } from './components/buscador-cuenta/buscador-cuenta.component';
import { GiroComponent } from './components/giro/giro.component';
import { RecuperarContraseniaComponent } from './components/recuperar-contrasenia/recuperar-contrasenia.component';

@NgModule({
  declarations: [
    AppComponent,
    PersonaComponent,
    LoginComponent,
    HomeComponent,
    RegistroComponent,
    NavbarComponent,
    CompletarDatosComponent,
    CvuComponent,
    TransferenciasComponent,
    BuscadorCuentaComponent,
    GiroComponent,
    RecuperarContraseniaComponent,

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: InterceptorService,
      multi: true
    }],
  bootstrap: [AppComponent]
})
export class AppModule { }
