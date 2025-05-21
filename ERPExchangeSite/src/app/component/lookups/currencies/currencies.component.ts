import { Component, OnInit, ViewChild  } from '@angular/core';
import { CountriesDto, CountriesDtoPagingResultDto, CurrenciesDto, CurrenciesDtoPagingResultDto } from 'src/app/services/api.service';
import { BackEndClientService } from 'src/app/services/back-end-client.service';
import { GenericAlertComponent } from '../../General/generic-alert/generic-alert.component';
import { PublicClsService } from 'src/app/services/public-cls.service';

@Component({
  selector: 'app-currencies',
  templateUrl: './currencies.component.html',
  styleUrls: ['./currencies.component.scss']
})
export class CurrenciesComponent implements OnInit {
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
  currencyOptions = [          // Array of options
    { value: 0, viewValue: 'Low' },
    { value: 1, viewValue: 'Meduim' },
    { value: 2, viewValue: 'Hight' }
  ];

  countriesOptions!: CountriesDto[];
  currenciesOptions!: CurrenciesDto[];
  Allcurrencies:CurrenciesDtoPagingResultDto | undefined ;
  currencies: CurrenciesDto[]  = [];
  currency: CurrenciesDto = new CurrenciesDto()  ;
  defaultCurrency: CurrenciesDto = new CurrenciesDto()  ;

  isEditing = false;
  displayedColumns = ['nameAr', 'nameEn','currCode', 'riskRate','countryId', 'actions'];

  backend:BackEndClientService;
  constructor(public PublicClsService:PublicClsService,private back:BackEndClientService) { 
    this.backend = back;

  }

  ScreenName:string = "Currencies";
  EditRisk:boolean=true;
  async ngOnInit(): Promise<void> {
   this.EditRisk = await this.PublicClsService.CheckeEditRisk(this.ScreenName) ;
    this.PublicClsService.CheckQuery('Currencies');
    this.fillCurrencies();
   
this.defaultCurrency = (await this.back.currenciesGetDefaultCurrency());
    //fill countriesOptions
    this.back.countriesGetAll(1,10000,'id',undefined,undefined,undefined)
    .then((result: CountriesDtoPagingResultDto) => {
      this.countriesOptions = result.result?? [];

    })
    .catch((error) => {
      console.error('Error fetching data:', error);
    });

    
      //fill currency
      this.back.currenciesGetAll(1,10000,'id',undefined,undefined,undefined)
      .then((result: CurrenciesDtoPagingResultDto) => {
        this.currenciesOptions = result.result?? [];
  
      })
      .catch((error) => {
        console.error('Error fetching data:', error);
      });
  }

  fillCurrencies(){

    this.back.currenciesGetAll(1,10000,undefined,undefined,undefined,undefined)
    .then((result: CurrenciesDtoPagingResultDto) => {
      this.Allcurrencies = result;
      this.currencies=this.Allcurrencies.result  ?? [];
    })
    .catch((error) => {
      console.error('Error fetching data:', error);
    });

  }
  oncrrSelectChange(event: any) {
    debugger;
    this.back.currenciesSetDefaultCurrency(event.value);
  }
  async saveCurrency(): Promise<void> {
    debugger;
    //this.currency.riskRate= this.currencySelectedOption?.value;
    if (this.isEditing) {
            
      if ( await this.PublicClsService.CheckeEdit(this.ScreenName)   == false)
      {
       this.alert( "لا يوجد صلاحية تعديل","warning");
       return;
      }
      this.back.currenciesUpdate(this.currency) .then(() => {
        this.fillCurrencies();
        this.alert( "تم التعديل بنجاح","success");
      })
      .catch((error) => {
        console.error('Error fetching data:', error);
        this.alert( "يوجد مشكله في التعديل","warning");
      });
      

    
    } else {

      if ( await this.PublicClsService.CheckAdd('Currencies')   == false)
   {
    this.alert( "لا يوجد صلاحية اضافة","warning");
    return;
   }
      // this.newCurrency.riskRate = this.currency.riskRate as number;
      // this.newCurrency.nameAr = this.currency.nameAr;
      // this.newCurrency.nameEn = this.currency.nameEn;
      // this.newCurrency.isActve = 1;
      this.back.currenciesCreate(this.currency) .then(() => {
        this.fillCurrencies();
        this.alert( "تم الاضافة بنجاح","success");
      })
      .catch((error) => {
        console.error('Error fetching data:', error);
        this.alert( "يوجد مشكله في الاضافة","warning");
      });

    }
    this.resetForm();
  }

  editCurrency(currency: CurrenciesDto): void {
   
    //this.currencySelectedOption = this.currencyOptions.filter(a=>a.value == currency.riskRate )[0];
    this.currency = currency;

    this.isEditing = true;
  }


  async deleteCurrency(currency: CurrenciesDto): Promise<void> {
    if ( await this.PublicClsService.CheckDelete(this.ScreenName)   == false)
    {
     this.alert( "لا يوجد صلاحية حذف","warning");
     return;
    }
    debugger;
    const index = this.currencies.indexOf(currency);
    if (index !== -1) {
      // this.currencies.splice(index, 1);
      this.back.currenciesDelete(currency?.id) .then(() => {
        this.fillCurrencies();
        this.alert( "تم الحذف بنجاح","success");
      })
      .catch((error) => {
        console.error('Error fetching data:', error);
        this.alert( "يوجد مشكله في الحذف","warning");
      });
      // Logic to delete currency from the backend or service
    }
  }

  resetForm(): void {
    this.currency = new CurrenciesDto();
    this.isEditing = false;
  }
}

