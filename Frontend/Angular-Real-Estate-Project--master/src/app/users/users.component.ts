import { Component, OnInit } from '@angular/core';
import {users} from "./../users-list";
import { Users} from "./../users.model";
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { UserService } from '../services/user.service';
@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.css']
})
export class UsersComponent implements OnInit {
 // public usersList: Users[] = users;
 public userList: any = [];
  
 constructor  ( private userService: UserService ) { }

  ngOnInit(): void {

    this.userService.all().subscribe(
      res => this.userList = res
    );
  }

}
