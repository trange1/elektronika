//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*
//*  Version : $Header: /MathcadClient/Trunk/efi/efidiffeq/mpl/efidiffeq.mpl   36   2006-10-19 10:58:00-04:00   cghaddar $
//*
//*
//*  Purpose : Defines the Mathcad Finance Function Library.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//*
//****************************************************************************

module EfiDiffEQ where
{
// Module Imports

   import McdRun;

// Type Synonyms

   type Unary     = V{}->V{};
   type Binary    = V{}->V{}->V{};
   type Func6     = V{}->V{}->V{}->V{}->V{}->V{}->V{};

// Differential Equation Solvers
   
   mc_Adams       :: V{}->V{}->V{}->V{}->(V{}->V{}->V{})->D{}->V{}                          @ "[efidiffeq?]Efi.DiffEq::adams";
   mc_BDF         :: V{}->V{}->V{}->V{}->(V{}->V{}->V{})->N(Object)->V{}                    @ "[efidiffeq?]Efi.DiffEq::dlsode";
   mc_AdamsBDF    :: V{}->V{}->V{}->V{}->(V{}->V{}->V{})->N(Object)->V{}                    @ "[efidiffeq?]Efi.DiffEq::dlsoda";
   mc__AdamsBDF   :: T->V{}->V{}->V{}->V{}->(V{}->V{}->V{})->V{}                            @ "[efidiffeq?]Efi.DiffEq::_dlsoda";
   mc_statespace  :: T->V{}->V{}->V{}->V{}->(V{}->V{})->N(Object)->V{}                      @ "[efidiffeq?]Efi.DiffEq::stateSpace";
   
   //experimental
   mc_dlsodi      :: V{}->V{}->V{}->V{}->V{}->(V{}->V{}->V{})->(V{}->V{}->V{})->D{}->V{}                          @ "[efidiffeq?]Efi.DiffEq::odepackM";
   mc_dlsodij     :: V{}->V{}->V{}->V{}->V{}->(V{}->V{}->V{})->(V{}->V{}->V{})->(V{}->V{}->V{}->V{})->D{}->V{}    @ "[efidiffeq?]Efi.DiffEq::odepackMJ";
   mc_Rkadapt2    :: T->V{}->V{}->V{}->V{}->(V{}->V{}->V{})->V{}                            @ "[efidiffeq?]Efi.DiffEq::tom504";
 
   //new
   mc_Radau       :: V{}->V{}->V{}->V{}->(V{}->V{}->V{})->N(Object)->V{}                    @ "[efidiffeq?]Efi.DiffEq::radau5";
   mc__radau      :: V{}->V{}->V{}->V{}->V{}->(V{}->V{}->V{})->V{}->V{}->V{}                @ "[efidiffeq?]Efi.DiffEq::radau5_SB";
   //old
   mc_Radau2      :: T->V{}->V{}->V{}->V{}->(V{}->V{}->V{})->V{}                            @ "[efidiffeq?]Efi.DiffEq::Radau";  
   //mc__radau      :: V{}->V{}->V{}->V{}->V{}->(V{}->V{}->V{})->V{}->V{}->V{}                @ "[efidiffeq?]Efi.DiffEq::_radau";
   
   mc_Bulstoer    :: T->V{}->V{}->V{}->V{}->(V{}->V{}->V{})->V{}                            @ "[efidiffeq?]Efi.DiffEq::Bulstoer";
   mc_Rkadapt     :: T->V{}->V{}->V{}->V{}->(V{}->V{}->V{})->V{}                            @ "[efidiffeq?]Efi.DiffEq::Rkadapt";
   mc_rkfixed     ::    V{}->V{}->V{}->V{}->(V{}->V{}->V{})->V{}                            @ "[efidiffeq?]Efi.DiffEq::rkfixed";
   mc_Stiffr      :: T->V{}->V{}->V{}->V{}->(V{}->V{}->V{})->(V{}->V{}->V{})->V{}           @ "[efidiffeq?]Efi.DiffEq::Stiffr";
   mc_Stiffb      :: T->V{}->V{}->V{}->V{}->(V{}->V{}->V{})->(V{}->V{}->V{})->V{}           @ "[efidiffeq?]Efi.DiffEq::Stiffb";

   mc_bulstoer    :: V{}->V{}->V{}->V{}->(V{}->V{}->V{})->V{}->V{}->V{}                     @ "[efidiffeq?]Efi.DiffEq::bulstoer";
   mc_rkadapt     :: V{}->V{}->V{}->V{}->(V{}->V{}->V{})->V{}->V{}->V{}                     @ "[efidiffeq?]Efi.DiffEq::rkadapt";
   mc_stiffb      :: V{}->V{}->V{}->V{}->(V{}->V{}->V{})->(V{}->V{}->V{})->V{}->V{}->V{}    @ "[efidiffeq?]Efi.DiffEq::stiffb";
   mc_stiffr      :: V{}->V{}->V{}->V{}->(V{}->V{}->V{})->(V{}->V{}->V{})->V{}->V{}->V{}    @ "[efidiffeq?]Efi.DiffEq::stiffr";
   mc_radau       :: V{}->V{}->V{}->V{}->(V{}->V{}->V{})->V{}->V{}->V{}                     @ "[efidiffeq?]Efi.DiffEq::radau";

   mc_pdeinterp   :: V{}->V{}->V{}->V{}->V{}->V{}->V{}->V{}                                 @ "[efidiffeq?]Efi.DiffEq::pdeinterp";
   pdesolve       :: (I4->Vector Object)->I4->V{}->V{}->V{}->V{}->V{}->V{}->V{}->V{}->V{}->(V{}->V{}->V{}->V{}
                     ->V{}->V{}->V{})->(V{}->V{})->V{}->V{}->V{}->V{}
                     ->(V{}->V{}->V{}->V{}->V{}->V{})->V{}->V{}
                     ->(V{}->V{}->V{})->(V{}->V{}->V{})->(V{}->V{}->V{})
                     ->(V{}->V{}->V{})->Vector(V{})                                         @ "[efidiffeq?]Efi.DiffEq::PdeSolve";
   mc_bvalfit     :: V{}->V{}->V{}->V{}->V{}->(V{}->V{}->V{})->(V{}->V{}->V{})
                     ->(V{}->V{}->V{})->(V{}->V{}->V{})->V{}                                @ "[efidiffeq?]Efi.DiffEq::bvalfit";
   mc_sbval       :: V{}->V{}->V{}->(V{}->V{}->V{})->(V{}->V{}->V{})->(V{}->V{}->V{})->V{}  @ "[efidiffeq?]Efi.DiffEq::sbval";
   mc_relax       :: V{}->V{}->V{}->V{}->V{}->V{}->V{}->V{}->V{}                            @ "[efidiffeq?]Efi.DiffEq::relax";
   mc_multigrid   :: V{}->V{}->V{}                                                          @ "[efidiffeq?]Efi.DiffEq::multigrid";

   mc_numol cb a b c d e f g pde_func h bc_func  =
      augment (numol' cb a b c d e f g pfunc h bc_map bfunc_d_left bfunc_d_right bfunc_n_left bfunc_n_right)
      where
   {
      numol'   :: (I4->Vector Object)->I4->V{}->V{}->V{}->V{}->V{}->V{}->Func6->Unary->V{}->Binary->Binary->Binary->Binary->Vector(V{}) @ "[efidiffeq?]Efi.DiffEq::numol_cpp";
      h1       :: V{}->V{}             @ "[efidiffeq?]Efi.DiffEq::numol_help1";
      h2       :: I4->String->V{}->V{} @ "[efidiffeq?]Efi.DiffEq::numol_help2";
      augment  :: Vector(M a)->M a     @ "[efimatrix?]Efi.Matrix::augment";

      pfunc x t u ux uxx _ = pde_func x t u ux uxx;
      t0                   = get_1' (as_vector d) 0$;
      bc_map               = h1 (bc_func t0);
      bfunc_d_left  t _    = h2 0$ "D" (bc_func t);
      bfunc_d_right t _    = h2 1$ "D" (bc_func t);
      bfunc_n_left  t _    = h2 0$ "N" (bc_func t);
      bfunc_n_right t _    = h2 1$ "N" (bc_func t);
   };
}

//****************************************************************************
