--Yearly Reading Trends
WITH ReadingYears AS (
    SELECT
        STRFTIME('%Y', SUBSTR("Date Added", 7, 4) || '-' || SUBSTR("Date Added", 4, 2) || '-' || SUBSTR("Date Added", 1, 2)) AS ReadYear,
        COUNT(*) AS BooksRead
    FROM MyReadingHistory
    WHERE "Exclusive Shelf" = 'read' AND "Date Added" IS NOT NULL
    GROUP BY ReadYear
)
SELECT
    ReadYear,
    BooksRead
FROM ReadingYears
ORDER BY ReadYear;

-- Books Read By Genre
SELECT
    Bookshelves AS Genre,
    COUNT(*) AS BooksRead
FROM MyReadingHistory
WHERE "Exclusive Shelf" = 'read'
    AND Bookshelves IN ('history-bio', 'novel', 'development', 'nonfiction', 'business', 'body', 'science', 'life-hack', 'prob-stats', 'philosohpy', 'fantasy', 'sales', 'marketing', 'mind', 'strategy', 'development', 'scifi-novel', 'war')
GROUP BY Genre
ORDER BY BooksRead DESC;

--Longest Books
SELECT
    "Title",
    "Author",
    "Number of Pages"
FROM MyReadingHistory
WHERE "Exclusive Shelf" = 'read'
    AND "Number of Pages" > 600;

--Favourite Authors
SELECT
    "Author",
    COUNT(*) AS BooksRead
FROM MyReadingHistory
WHERE "Exclusive Shelf" = 'read'
GROUP BY "Author"
ORDER BY BooksRead DESC;
