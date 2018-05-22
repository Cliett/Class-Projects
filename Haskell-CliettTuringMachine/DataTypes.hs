module DataTypes where

type Head = Int
type Tape = String
type State = String
type States = [State]
type Alpha = [Char]
type AlphaTape = [Char]
type Start = State
type Accept = State
type Reject = State
data Direction = L | R deriving (Eq)
type Trans = [((State, Char),(State,Char,Direction))]