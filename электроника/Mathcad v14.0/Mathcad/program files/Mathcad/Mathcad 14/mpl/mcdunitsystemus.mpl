//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*
//*  Version : $Header: /MathcadClient/releases/Mathcad_14.0.1/mcd/sources/mpl/mcdunitsystemus.mpl   32   2007-04-25 15:17:08-04:00   mlippert $
//*
//*
//*  Purpose : Defines the US unit system used in Mathcad 12.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//*
//****************************************************************************

module McdUnitSystemUS where
{
// Module Imports

   import McdUnitSystemSI as McdUnitSystemUS hiding(system,op_M,op_L,op_T,op_Q,op_K,op_C,op_S,op_D,mc_UnitsOf);
   import McdRun;

// Base Dimension Constructors

   op_M v = v `multiply_by_unit` mc_lb;
   op_L v = v `multiply_by_unit` mc_ft;
   op_T v = v `multiply_by_unit` mc_sec;
   op_Q v = v `multiply_by_unit` mc_amp;
   op_K v = v `multiply_by_unit` mc_K;
   op_C v = v `multiply_by_unit` mc_cd;
   op_S v = v `multiply_by_unit` mc_mole;
   op_D v = v `multiply_by_unit` mc_¤;

// Related Functions

   mc_UnitsOf     :: V{a}->V{a};
   mc_UnitsOf   _ =  arg_error "unitsof is obsolete" 0$;

// Unit Simplification

   system = unit_system("US",3,"319B8044-254A-4D46-82A0-2167681EFE1B",
   [//     Name                  Symbol   Quantity                   Unit        Signature
      unit("pound",              "lb",    "Mass",                    mc_lb,      typeof mc_lb),
      unit("foot",               "ft",    "Length",                  mc_ft,      typeof mc_ft),
      unit("second",             "sec",   "Time",                    mc_sec,     typeof mc_sec),
      unit("ampere",             "amp",   "Current",                 mc_amp,     typeof mc_amp),
      unit("kelvin",             "K",     "Temperature",             mc_K,       typeof mc_K),
      unit("candela",            "cd",    "Luminous Intensity",      mc_cd,      typeof mc_cd),
      unit("base_currency",      "¤",     "Money",                   mc_¤,       typeof mc_¤),
      unit("mole",               "mole",  "Substance",               mc_mole,    typeof mc_mole)

   ],
   [
      unit("coulomb",            "coul",  "Charge",                  mc_coul,    typeof mc_coul),
      unit("farad",              "F",     "Capacitance",             mc_F,       typeof mc_F),
      unit("gallon",             "gal",   "Volume",                  mc_gal,     typeof mc_gal),
      unit("gallons_per_minute", "gpm",   "Flow Rate",               mc_gpm,     typeof mc_gpm),
      unit("henry",              "H",     "Inductance",              mc_H,       typeof mc_H),
      unit("katal",              "katal", "Catalytic Activity",      mc_katal,   typeof mc_katal),
      unit("lux",                "lx",    "Illuminance",             mc_lx,      typeof mc_lx),
      unit("pound_force",        "lbf",   "Force",                   mc_lbf,     typeof mc_lbf),
      unit("oersted",            "Oe",    "Magnetic Field Strength", mc_Oe,      typeof mc_Oe),
      unit("ohm",                "Ω",     "Resistance",              mc_Ω,       typeof mc_Ω),
      unit("pounds_per_sq_inch", "psi",   "Pressure",                mc_psi,     typeof mc_psi),
      unit("siemens",            "S",     "Conductance",             mc_S,       typeof mc_S),
      unit("sievert",            "Sv",    "Dose",                    mc_Sv,      typeof mc_Sv),
      unit("stokes",             "stokes","Viscosity, kinematic",    mc_stokes,  typeof mc_stokes),
      unit("tesla",              "T",     "Magnetic Flux Density",   mc_T,       typeof mc_T),
      unit("volt",               "V",     "Potential",               mc_V,       typeof mc_V),
      unit("watt",               "W",     "Power",                   mc_W,       typeof mc_W),
      unit("weber",              "Wb",    "Magnetic Flux",           mc_Wb,      typeof mc_Wb)
   ]);
}

//****************************************************************************
