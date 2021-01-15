import { Component, OnInit } from '@angular/core';
import { MostrarSaldosService } from '../../services/mostrar-saldos.service';
import { MostarSaldos } from '../../models/mostar-saldos.model';
import { map } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { UltimosMovService } from '../../services/ultimos-mov.service';
@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  plata: any;
  movimientos:any;

  

  ultmomovimiento1: any;
  ultmomovimiento2: any;
  ultmomovimiento3: any;
  ultmomovimiento4: any;
  ultmomovimiento5: any;
  ultmomovimiento6: any;
  ultmomovimiento7: any;
  ultmomovimiento8: any;
  ultmomovimiento9: any;
  ultmomovimiento10: any;

  constructor(private home: MostrarSaldosService, private home1: UltimosMovService) { }

  ngOnInit(): void {
    
      this.home.getSaldos()
      .subscribe(saldo =>{
       
           saldo = Object.values(saldo);
           this.plata = saldo[1];
           
      })
      this.home1.getUltimosMov()
      .subscribe(movi =>{
       this.movimientos = Object.values(movi);
         this.ultmomovimiento1 = this.movimientos.pop();
         this.ultmomovimiento2 = this.movimientos.pop();
         this.ultmomovimiento3 = this.movimientos.pop();
         this.ultmomovimiento4 = this.movimientos.pop();
         this.ultmomovimiento5 = this.movimientos.pop();
         this.ultmomovimiento6 = this.movimientos.pop();
         this.ultmomovimiento7 = this.movimientos.pop();
         this.ultmomovimiento8 = this.movimientos.pop();
         this.ultmomovimiento9 = this.movimientos.pop();
         this.ultmomovimiento10 = this.movimientos.pop();  
      })

  }

 


}
