# Chess

Build a command line chess game with object oriented programming.

This readme taken from [here](https://github.com/britneywright/chess-challenge/blob/master/README.md).


## Summary

Today, let's build a command line chess game. Here's an example of the start
of a game:

*(Note: the ASCII art may be a little misaligned in the browser).*

    $ ruby chess.rb
    8  ♜  ♞  ♝  ♛  ♚  ♝  ♞  ♜
    7  ♟  ♟  ♟  ♟  ♟  ♟  ♟  ♟
    6
    5
    4
    3
    2  ♙  ♙  ♙  ♙  ♙  ♙  ♙  ♙
    1  ♖  ♘  ♗  ♕  ♔  ♗  ♘  ♖
       a  b  c  d  e  f  g  h
    white's turn.
    white, your move? d2
    moves for white pawn d2: d3, d4
    white, move d2 where? d4

    Ok, white's pawn d2 to d4.

If a capture is available, the program says so when it lists the move:

    8  ♜  ♞  ♝  ♛  ♚  ♝  ♞  ♜
    7  ♟  ♟  ♟     ♟  ♟  ♟  ♟
    6
    5           ♟
    4           ♙  ♙
    3
    2  ♙  ♙  ♙        ♙  ♙  ♙
    1  ♖  ♘  ♗  ♕  ♔  ♗  ♘  ♖
       a  b  c  d  e  f  g  h
    black's turn.
    black, your move? d5
    moves for black's pawn d5: e4
    black, move d5 where? e4

    Ok, black's pawn d5 captures white's pawn e4.

And on and on until:

    8
    7
    6
    5
    4
    3     ♚
    2              ♜
    1     ♔        ♘
       a  b  c  d  e  f  g  h
    black's turn.
    black, your piece? e2
    moves for black's rook e2: a2, b2, c2, d2, f2, g2, h2, e1, e3, e4, e5, e6, e7, e8
    black, move e2 where? e1

    Ok, black's pawn e2 to capture white's knight e1. Checkmate.
