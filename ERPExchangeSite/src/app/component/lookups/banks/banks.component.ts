import { Component, OnInit, ViewChild  } from '@angular/core';
import { BanksDto, BanksDtoPagingResultDto } from 'src/app/services/api.service';
import { BackEndClientService } from 'src/app/services/back-end-client.service';
import { GenericAlertComponent } from '../../General/generic-alert/generic-alert.component';
import { PublicClsService } from 'src/app/services/public-cls.service';
import { Router } from '@angular/router';
import { Location } from '@angular/common';
@Component({
  selector: 'app-banks',
  templateUrl: './banks.component.html',
  styleUrls: ['./banks.component.scss']
})
export class BanksComponent implements OnInit {
  //alert
 // danger-warning-success-info
  showAlert: boolean = false;
  alertMessage: any = false;
  alertType: any = false;
  onCloseAlert() {
    this.showAlert = false;
    this.alertMessage  ="" ;
    this.alertType ="" ;
  }
  alert(message: any,type: any)
  {
   debugger;
  this.alertMessage  =message ;
  this.alertType =type ;
  this.showAlert = true;
  }
 ////////////////////////////////////
  bankOptions = [          // Array of options
    { value: 0, viewValue: 'Low' },
    { value: 1, viewValue: 'Meduim' },
    { value: 2, viewValue: 'Hight' }
  ];
  Allbanks:BanksDtoPagingResultDto | undefined ;
  banks: BanksDto[]  = [];
  bank: BanksDto = new BanksDto()  ;

  isEditing = false;
  displayedColumns = ['nameAr', 'nameEn', 'riskRate', 'actions'];

  backend:BackEndClientService;
  constructor(public PublicClsService:PublicClsService,private back:BackEndClientService,public router: Router,public location: Location) { 
    this.backend = back;

  }


  ngAfterViewInit() {
   
  }
  ScreenName:string = "banks";
  EditRisk:boolean=true;
  async ngOnInit(): Promise<void> {
   this.EditRisk =  await this.PublicClsService.CheckeEditRisk(this.ScreenName) ;
    this.PublicClsService.CheckQuery('banks');
    // this.back.banksGetAll(1,10000,undefined,undefined,undefined,undefined)
    // .then((result: BanksDtoPagingResultDto) => {
    //   this.Allbanks = result;
    //   this.banks=this.Allbanks.result  ?? [];
    // })
// debugger;
//     this.back.privilageCheckAuthByName(this.PublicClsService.Getuserid(),'banks','query')
//     .then((result: boolean) => {
//       if (result == false)
//       {
//        // this.router.navigate(["/Unauthorized/Unauthorized"]);
//         this.router.navigateByUrl('component/Unauthorized/Unauthorized');

  

//       }
//     })
//     .catch((error) => {
//       debugger;
//       console.error('Error fetching data:', error);
//     });
    
    this.fillBanks();
  }

  fillBanks(){

    this.back.banksGetAll(1,10000,'id',undefined,undefined,undefined)
    .then((result: BanksDtoPagingResultDto) => {
      this.Allbanks = result;
      this.banks=this.Allbanks.result  ?? [];
    })
    .catch((error) => {
      debugger;
      console.error('Error fetching data:', error);
    });

  }

  async saveBank(): Promise<void> {

   
    
    debugger;
    //this.bank.riskRate= this.bankSelectedOption?.value;
    if (this.isEditing) {
      
 

      this.back.banksUpdate(this.bank) .then(() => {
        this.fillBanks();
        this.alert( "تم التعديل بنجاح","success");
      })
      .catch((error) => {
        console.error('Error fetching data:', error);
        this.alert( "يوجد مشكله في التعديل","warning");
      });
      

    
    } else {

      if ( await this.PublicClsService.CheckAdd(this.ScreenName)   == false)
   {
    this.alert( "لا يوجد صلاحية اضافة","warning");
    return;
   }
      // this.newBank.riskRate = this.bank.riskRate as number;
      // this.newBank.nameAr = this.bank.nameAr;
      // this.newBank.nameEn = this.bank.nameEn;
      // this.newBank.isActve = 1;
      this.back.banksCreate(this.bank) .then(() => {
        this.fillBanks();
        this.alert( "تم الاضافة بنجاح","success");
      })
      .catch((error) => {
        console.error('Error fetching data:', error);
        this.alert( "يوجد مشكله في الاضافة","warning");
      });

    }
    this.resetForm();
  }

  async editBank(bank: BanksDto): Promise<void> {
   
    if ( await this.PublicClsService.CheckeEdit(this.ScreenName)   == false)
    {
     this.alert( "لا يوجد صلاحية تعديل","warning");
     return;
    }
    //this.bankSelectedOption = this.bankOptions.filter(a=>a.value == bank.riskRate )[0];
    this.bank = bank;

    this.isEditing = true;
  }


  async deleteBank(bank: BanksDto): Promise<void> {
    if ( await this.PublicClsService.CheckDelete(this.ScreenName)   == false)
    {
     this.alert( "لا يوجد صلاحية حذف","warning");
     return;
    }
    
    debugger;
    const index = this.banks.indexOf(bank);
    if (index !== -1) {
      // this.banks.splice(index, 1);
      this.back.banksDelete(bank?.id) .then(() => {
        this.fillBanks();
        this.alert( "تم الحذف بنجاح","success");
      })
      .catch((error) => {
        console.error('Error fetching data:', error);
        this.alert( "يوجد مشكله في الحذف","warning");
      });
      // Logic to delete bank from the backend or service
    }
  }

  resetForm(): void {
    this.bank = new BanksDto();
    this.isEditing = false;
  }
}

