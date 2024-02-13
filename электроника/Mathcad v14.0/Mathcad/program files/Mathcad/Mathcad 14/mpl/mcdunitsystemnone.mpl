//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*
//*  Version : $Header: /MathcadClient/releases/Mathcad_14.0.1/mcd/sources/mpl/mcdunitsystemnone.mpl   22   2007-03-01 17:30:14-05:00   mlippert $
//*
//*
//*  Purpose : Defines the trivial unit system used in Mathcad 12.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//*
//****************************************************************************

module McdUnitSystemNone where
{
// Module Imports

   import McdRun;

// Base Dimensions

   dimension D1;
   dimension D2;
   dimension D3;
   dimension D4;
   dimension D5;
   dimension D6;
   dimension D7;
   dimension D8;

// Base Dimension Constructors

   op_M :: Value{} -> Value{D1 60000} @ 46;
   op_L :: Value{} -> Value{D2 60000} @ 46;
   op_T :: Value{} -> Value{D3 60000} @ 46;
   op_Q :: Value{} -> Value{D4 60000} @ 46;
   op_K :: Value{} -> Value{D5 60000} @ 46;
   op_C :: Value{} -> Value{D6 60000} @ 46;
   op_S :: Value{} -> Value{D7 60000} @ 46;
   op_D :: Value{} -> Value{D8 60000} @ 46;

// Mathcad Units

   mc_M           =  op_M (iv' 1$);
   mc_L           =  op_L (iv' 1$);
   mc_T           =  op_T (iv' 1$);
   mc_Q           =  op_Q (iv' 1$);
   mc_K           =  op_K (iv' 1$);
   mc_C           =  op_C (iv' 1$);
   mc_S           =  op_S (iv' 1$);
   mc_D           =  op_D (iv' 1$);

// Related Functions

   mc_UnitsOf     :: V{a}->V{a};
   mc_UnitsOf   _ =  f(iv' 1$) where {f::a->V{b} @ 46};

// Unit Simplification

   system = unit_system("none",4,"B2D057CB-916D-4BBF-BA8E-9D67051C7F35",
   [//     Name   Symbol   Quantity Magnitude   Signature
      unit("M",   "M",     "M",     mc_M,       typeof mc_M),
      unit("L",   "L",     "L",     mc_L,       typeof mc_L),
      unit("T",   "T",     "T",     mc_T,       typeof mc_T),
      unit("Q",   "Q",     "Q",     mc_Q,       typeof mc_Q),
      unit("K",   "K",     "K",     mc_K,       typeof mc_K),
      unit("C",   "C",     "C",     mc_C,       typeof mc_C),
      unit("S",   "S",     "S",     mc_S,       typeof mc_S),
      unit("D",   "D",     "D",     mc_D,       typeof mc_D)
   ],[]);
}

//****************************************************************************
