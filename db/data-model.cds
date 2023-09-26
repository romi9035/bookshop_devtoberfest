namespace my.bookshop;

using {
  Currency,
  managed,
  sap,
  cuid
} from '@sap/cds/common';
using {my.bookshop.types as types} from '../types/types';

entity Books : managed { //reuse aspect
  key ID       : Integer; //custom defined types
      title    : localized String(111);
      descr    : localized String(1111);
      stock    : Integer;
      price    : Decimal(9, 2);
      currency : Currency; //Reuse types
      author   : Association to Authors; //> to one   , maanged association
      /* unmanaged association
      // author : Association to Authors on author.ID = author_ID;
      // author_ID : type of Authors:ID;
      */
      Items    : Composition of many OrderItems
                   on Items.book = $self;


}

entity Authors : managed {
  key ID    : Integer;
      name  : String(111);
      books : Association to many Books
                on books.author = $self; //to many association is by default unmanaged
}


entity Orders : cuid, managed {
  OrderNo : String @title: 'Order Number'; //> readable key
  Items   : Composition of many OrderItems
              on Items.parent = $self;
}

entity OrderItems { // link table
  key parent : Association to Orders;
  key book   : Association to Books;
      amount : Integer;
}

//Custom defined types
//type User : String; //> merely for increasing expressiveness
// type Genre : String enum {
//   Mystery; Fiction; Drama;
// }
// type DayOfWeek :  Integer @assert.range:[1,7];
