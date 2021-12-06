import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FavouritesBuyComponent } from './favourites-buy.component';

describe('FavouritesBuyComponent', () => {
  let component: FavouritesBuyComponent;
  let fixture: ComponentFixture<FavouritesBuyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FavouritesBuyComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FavouritesBuyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
