case study 5
-- Create the Artists table
CREATE TABLE Artists (
 ArtistID INT PRIMARY KEY,
 Name VARCHAR(255) NOT NULL,
 Biography TEXT,
 Nationality VARCHAR(100));
-- Create the Categories table
CREATE TABLE Categories (
 CategoryID INT PRIMARY KEY,
 Name VARCHAR(100) NOT NULL);

CREATE TABLE Artworks (
 ArtworkID INT PRIMARY KEY,
 Title VARCHAR(255) NOT NULL,
 ArtistID INT,
 CategoryID INT,
 Year INT,
 Description TEXT,
 ImageURL VARCHAR(255),
 FOREIGN KEY (ArtistID) REFERENCES Artists (ArtistID),
 FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID));
-- Create the Exhibitions table
CREATE TABLE Exhibitions (
 ExhibitionID INT PRIMARY KEY,
 Title VARCHAR(255) NOT NULL,
 StartDate DATE,
 EndDate DATE,
 Description TEXT);

-- Create a table to associate artworks with exhibitions
CREATE TABLE ExhibitionArtworks (
 ExhibitionID INT,
 ArtworkID INT,
 PRIMARY KEY (ExhibitionID, ArtworkID),
 FOREIGN KEY (ExhibitionID) REFERENCES Exhibitions (ExhibitionID),
 FOREIGN KEY (ArtworkID) REFERENCES Artworks (ArtworkID));

-- Insert sample data into the Artists table
INSERT INTO Artists (ArtistID, Name, Biography, Nationality) VALUES
 (1, 'Pablo Picasso', 'Renowned Spanish painter and sculptor.', 'Spanish'),
 (2, 'Vincent van Gogh', 'Dutch post-impressionist painter.', 'Dutch'),
 (3, 'Leonardo da Vinci', 'Italian polymath of the Renaissance.', 'Italian');
-- Insert sample data into the Categories table
INSERT INTO Categories (CategoryID, Name) VALUES
 (1, 'Painting'),
 (2, 'Sculpture'),
 (3, 'Photography');
-- Insert sample data into the Artworks table
INSERT INTO Artworks (ArtworkID, Title, ArtistID, CategoryID, Year, Description, ImageURL) VALUES
 (1, 'Starry Night', 2, 1, 1889, 'A famous painting by Vincent van Gogh.', 'starry_night.jpg'),
 (2, 'Mona Lisa', 3, 1, 1503, 'The iconic portrait by Leonardo da Vinci.', 'mona_lisa.jpg'),
 (3, 'Guernica', 1, 1, 1937, 'Pablo Picasso\'s powerful anti-war mural.', 'guernica.jpg');
-- Insert sample data into the Exhibitions table
INSERT INTO Exhibitions (ExhibitionID, Title, StartDate, EndDate, Description) VALUES
 (1, 'Modern Art Masterpieces', '2023-01-01', '2023-03-01', 'A collection of modern art masterpieces.'),
 (2, 'Renaissance Art', '2023-04-01', '2023-06-01', 'A showcase of Renaissance art treasures.');
-- Insert artworks into exhibitions
INSERT INTO ExhibitionArtworks (ExhibitionID, ArtworkID) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2);

--1.Retrieve the names of all artists along with the number of artworks they have in the gallery, and
list them in descending order of the number of artworks.

select Artistname,count(ArtistID) as TotalArt from Artists left join Artist on Artists.ArtistId =Artwork.ArtistID
group by Artists.Artistname, Artwork.ArtistID
order by TotalArt desc;

--2 List the titles of artworks created by artists from 'Spanish' and 'Dutch' nationalities, and order
them by the year in ascending order

select Artwork.title,Artist.Nationality, Artwork.year from Artists inner join Artworks on 
Artworks.ArtistID = Artists.ArtistID
where Artists.Nationality in ('Spanishi,'Duct')
order by Artwork.Year Asc

3.Find the names of all artists who have artworks in the 'Painting' category, and the number of
artworks they have in this category.

select Artists.Name ,COUNT(Artworks.ArtworkID) as TotalNum from Artists inner join Artworks 
on Artists.ArtistID = Artworks.ArtistID
and inner join categories on Artwork.CategoriesID= categories.categoriesID
group by ArtistID,ArtistNmae;

4.. List the names of artworks from the 'Modern Art Masterpieces' exhibition, along with their
artists and categories.

select Artwork.title, Artist.Name as ArtistNmae, Categories.Name as CategoriesName from ExibitionArtwork 
inner join Exhibitions on ExhibitionArtworks.ExhibitionID = Exhibitions.ExhibitionID
inner join Artworks on ExhibitionArtworks.ArtworkID = Artworks.ArtworkID
inner join Artists on Artworks.ArtistID = Artists.ArtistID
inner join Categories on Artworks.CategoryID = Categories.CategoryID
where Exhibitions.title = 'Modern Art Masterpieces';

5. Find the artists who have more than two artworks in the gallery.

select Artistname,count(Artwork.ArtistID) as TotalArt from Artists inner join Artist on Artists.ArtistId =Artwork.ArtistID
group by Artists.Artistname, Artwork.ArtistID
having count(Artwork.ArtworkID) > 2;

6.Find the titles of artworks that were exhibited in both 'Modern Art Masterpieces' and
'Renaissance Art' exhibitions 

select A.Title from Artworks A
inner join ExhibitionArtworks EA1 ON A.ArtworkID = EA1.ArtworkID
inner join Exhibitions E1 ON EA1.ExhibitionID = E1.ExhibitionID
inner join ExhibitionArtworks EA2 ON A.ArtworkID = EA2.ArtworkID
inner join Exhibitions E2 ON EA2.ExhibitionID = E2.ExhibitionID
where E1.Title = 'Modern Art Masterpieces'and E2.Title = 'Renaissance Art';

7. Find the total number of artworks in each category

select count(Artwork.ArtworID) as Totalno , categories.name from Artworks left join Categoreies 
on Catagories.catagoriesID = Artwork.CatogoriesID
group by Catogories.name;

8.List artists who have more than 3 artworks in the gallery

select Artists.name, cout(Artwork.ArtworkID) from Artists inner join Artwork 
on Atrist.ArtistID= Artwork.ArtistID
group by Artist.name,Artist.ArtistID
having count(Artwork.ArtistID) > 3;

9.Find the artworks created by artists from a specific nationality (e.g., Spanish)

select Atrist.name , Artist.nationalisty , Artwork.title from Artists inner join Artwork 
on Arttist.ArtistID = Artwork.ArtistID
where Artist.nationality = 'Spanish'

10. List exhibitions that feature artwork by both Vincent van Gogh and Leonardo da Vinci

select E.Title as ExhibitionTitle from Exhibitions E
inner join ExhibitionArtworks EA ON E.ExhibitionID = EA.ExhibitionID
inner join Artworks A ON EA.ArtworkID = A.ArtworkID
inner join Artists AR ON A.ArtistID = AR.ArtistID
where Ar.name in('Vincent van Gogh', 'Leonardo da Vinci')
GROUP BY E.Title;
--to inclue both the author
having count(distint AR.Name) = 2;

11. Find all the artworks that have not been included in any exhibition

select Artwork.ArtworkID from Artwork left join Exibition on Artwork.ArtID = Exibition.ArtID
where ExibitionID = null;

12. List artists who have created artworks in all available categories 

select Atrist.name from Artists inner join Artwork on  Artist.ArtistID = Artwork.ArtistID
inner join Catagories on Artwork.CatagoriesID= Catogories.CatagoriesID
where categories.name in ('painting', 'sculpture','phoyography');
group by ArtistID, Artist.name
having count(distinct.catogories.name) = 3;

13. List the total number of artworks in each category

select categories.name, count(Artwork.ArtworkID) from Artwork inner join categories 
on Artwork.CatagoriesID= catagories.CatagoriesID
group by catgories.name,catagories.catagoriesId;
 
14.Find the artists who have more than 2 artworks in the gallery

select Artist.name, count(Artwork.artwokID) from artists inner join Artwork 
on Artist.ArtistID= Artwork.Artistid
group by Artist.name, Artist.ArtistID
having count(Artwork.artwokID) > 2;

15. List the categories with the average year of artworks they contain, only for categories with more
than 1 artwork

select categories.name , avg(Artwork.year) from categories inner join Artwork 
on Categories.CategoriesID= Artwork.CategoriesID
group Categories.name, categories.categoriesID
having avg(Artwork.ArtworkID) >1;

16.Find the artworks that were exhibited in the 'Modern Art Masterpieces' exhibition
--not artworkid in exibition table so inner joing ExhibitionArtworks first and then join with exibition table

select Artwork.title from Artwork inner join ExhibitionArtworks on ExhibitionArtworks.ArtworkID = Artwork.ArtworkID
inner join Exibition on Exibition.ExibitionID =  ExhibitionArtworks.  ExibitionID
where Artwork.title='Modern Art Masterpieces';

17. Find the categories where the average year of artworks is greater than the average year of all
artworks

select categories.name , Artwork.year from Artwork inner join categories 
on Artwork.CategoriesID = Categories.Categoriesid
group by Categories.CategoryID, Categories.Name
having avg(Artwork.year) > any 
(select avg(Artwork.year) from artwork);

18. List the artworks that were not exhibited in any exhibition.

select Artwork.title from Artwork left join ExhibitionArtworks 
on ExhibitionArtworks.ArtworkID = Artwork.ArtworkID
where ExibitionID is null;

19.Show artists who have artworks in the same category as "Mona Lisa."

select Artist.name from Artists inner join Artwork 
on Artist.ArtistID = Artwork.ArtistId 
where CategoriesID = (select categoriesID from Artwork where CategoriesID='Mona Lisa');

20.List the names of artists and the number of artworks they have in the gallery

--including artist with 0 artwork
select Artist.name, count(Artwork.ArtworkID) as TotalArt from Artist left join Artwork 
on Artist.ArtistID= Artwork.ArtistID
grop by Artist.name, Artist.ArtistID;

