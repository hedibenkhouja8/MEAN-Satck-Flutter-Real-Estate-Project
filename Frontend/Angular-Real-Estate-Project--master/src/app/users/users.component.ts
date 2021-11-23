import { Component, OnInit } from '@angular/core';
import {users} from "./../users-list";
import { Users} from "./../users.model";
@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.css']
})
export class UsersComponent implements OnInit {
  public usersList: Users[] = users;
  constructor() { }

  ngOnInit(): void {
  }

}
