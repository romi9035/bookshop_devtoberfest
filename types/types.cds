namespace my.bookshop.types;

type User      : String; //> merely for increasing expressiveness

type Genre     : String enum {
    Mystery;
    Fiction;
    Drama;
}

type DayOfWeek : Integer @assert.range: [
    1,
    7
];

type BookID    : UUID;
type BookName  : String;
type BookDescr : String;
