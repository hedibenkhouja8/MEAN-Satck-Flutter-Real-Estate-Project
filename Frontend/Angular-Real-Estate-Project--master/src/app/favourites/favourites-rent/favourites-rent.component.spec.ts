import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FavouritesRentComponent } from './favourites-rent.component';

describe('FavouritesRentComponent', () => {
  let component: FavouritesRentComponent;
  let fixture: ComponentFixture<FavouritesRentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FavouritesRentComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FavouritesRentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
