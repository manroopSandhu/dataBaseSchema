-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/9v9b5V
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Platform" (
    "Console_ID" String   NOT NULL,
    "Console_Name" String   NOT NULL
);

CREATE TABLE "Game" (
    "Game_ID" String   NOT NULL,
    "Game_Name" string   NOT NULL,
    "Game_Genre" string   NOT NULL,
    "Console_ID" integer   NOT NULL,
    "Game_Rating" string   NOT NULL,
    "Game_Release_date" string   NOT NULL
);

CREATE TABLE "Genres" (
    "Genre_ID" String   NOT NULL,
    "Genre_Name" string   NOT NULL,
    "Genre_Console" string   NOT NULL
);

CREATE TABLE "User" (
    "User_ID" String   NOT NULL,
    "User_Name" string   NOT NULL
);

CREATE TABLE "Favorites" (
    "Favorites_ID" String   NOT NULL,
    "User_ID" String   NOT NULL,
    "Game_ID" String   NOT NULL
);

CREATE TABLE "Comments" (
    "Comment_ID" String   NOT NULL,
    "Comment_Text" string   NOT NULL
);

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_Game_ID" FOREIGN KEY("Game_ID")
REFERENCES "Platform" ("Console_ID");

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_Game_Genre" FOREIGN KEY("Game_Genre")
REFERENCES "Platform" ("Console_ID");

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_Console_ID" FOREIGN KEY("Console_ID")
REFERENCES "Genres" ("Genre_ID");

ALTER TABLE "Genres" ADD CONSTRAINT "fk_Genres_Genre_ID" FOREIGN KEY("Genre_ID")
REFERENCES "Platform" ("Console_ID");

ALTER TABLE "Favorites" ADD CONSTRAINT "fk_Favorites_Favorites_ID" FOREIGN KEY("Favorites_ID")
REFERENCES "User" ("User_ID");

ALTER TABLE "Favorites" ADD CONSTRAINT "fk_Favorites_User_ID" FOREIGN KEY("User_ID")
REFERENCES "User" ("User_ID");

ALTER TABLE "Favorites" ADD CONSTRAINT "fk_Favorites_Game_ID" FOREIGN KEY("Game_ID")
REFERENCES "Game" ("Game_ID");

ALTER TABLE "Comments" ADD CONSTRAINT "fk_Comments_Comment_ID" FOREIGN KEY("Comment_ID")
REFERENCES "Game" ("Game_ID");

