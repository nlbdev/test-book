#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

BOOKS="$DIR/books"
TARGET="$DIR/target"

for book in $BOOKS/* ; do
    cd $book
    book_id="`basename $book`"
    zip -X0 "$TARGET/$book_id.epub" mimetype
    zip -X9Dr "$TARGET/$book_id.epub" * --exclude mimetype
done
