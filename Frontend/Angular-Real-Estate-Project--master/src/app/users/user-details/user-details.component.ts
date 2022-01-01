import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
import { UserService } from 'src/app/services/user.service';
import { Users } from 'src/app/responsable.model';
import { users } from "src/app/respnsables-list";
@Component({
  selector: 'app-user-details',
  templateUrl: './user-details.component.html',
  styleUrls: ['./user-details.component.css']
})
export class UserDetailsComponent implements OnInit {

  public user?: Users;

  constructor(private route: ActivatedRoute,  private userService: UserService) { }
  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      const userId = params.get("id");
      this.user = users.filter(users => users.id === userId)[0];
    });
  }

  getTitle(): string {
    return this.user ? this.user.mail : "";

}
}
