//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*
//*  Version : $Header: /MathcadClient/releases/Mathcad_14.0.1/mcd/sources/mpl/mcdunitsystemmks.mpl   28   2007-04-25 15:17:08-04:00   mlippert $
//*
//*
//*  Purpose : Defines the MKS unit system used in Mathcad 12.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//*
//****************************************************************************

module McdUnitSystemMKS where
{
// Module Imports

   import McdUnitSystemSI as McdUnitSystemMKS hiding(system,op_M,op_L,op_T,op_Q,op_K,op_C,op_S,op_D,mc_UnitsOf);
   import McdRun;

// Base Dimension Constructors

   op_M v = v `multiply_by_unit` mc_kg;
   op_L v = v `multiply_by_unit` mc_m;
   op_T v = v `multiply_by_unit` mc_sec;
   op_Q v = v `multiply_by_unit` mc_coul;
   op_K v = v `multiply_by_unit` mc_K;
   op_C v = v `multiply_by_unit` mc_cd;
   op_S v = v `multiply_by_unit` mc_mole;
   op_D v = v `multiply_by_unit` mc_¤;

// Related Functions

   mc_UnitsOf     :: V{a}->V{a};
   mc_UnitsOf   _ =  arg_error "unitsof is obsolete" 0$;

// Unit Simplification

   system = unit_system("MKS",1,"BE7700D7-7754-48B1-A9FA-DF373E1359E4",
   [//     Name         	Symbol      Quantity                Unit        Signature
      unit("kilogram",  	"kg",       "Mass",                 mc_kg,      typeof mc_kg),
      unit("meter",     	"m",        "Length",               mc_m,       typeof mc_m),
      unit("second",    	"sec",      "Time",                 mc_sec,     typeof mc_sec),
      unit("coulomb",   	"coul",     "Charge",               mc_coul,    typeof mc_coul),
      unit("kelvin",    	"K",        "Temperature",          mc_K,       typeof mc_K),
      unit("candela",   	"cd",       "Luminosity",           mc_cd,      typeof mc_cd),
      unit("mole",      	"mole",     "Substance",            mc_mole,    typeof mc_mole),
      unit("base_currency", "¤",    	 "Money",                mc_¤,       typeof mc_¤)

   ],
   [
      unit("ampere",    	"amp",      "Current",              mc_amp,     typeof mc_amp),
      unit("farad",     	"farad",    "Capacitance",          mc_F,       typeof mc_F),
      unit("henry",     	"henry",    "Inductance",           mc_henry,   typeof mc_henry),
      unit("joule",     	"joule",    "Energy",               mc_joule,   typeof mc_joule),
      unit("katal",     	"katal",    "Catalytic Activity",   mc_katal,   typeof mc_katal),
      unit("liter",     	"L",        "Volume",               mc_L,       typeof mc_L),
      unit("lux",       	"lx",       "Illuminance",          mc_lx,      typeof mc_lx),
      unit("newton",    	"newton",   "Force",                mc_newton,  typeof mc_newton),
      unit("oersted",   	"oersted",  "Magnetic Field",       mc_oersted, typeof mc_oersted),
      unit("ohm",       	"Ω",        "Resistance",           mc_Ω,       typeof mc_Ω),
      unit("pascal",    	"Pa",       "Pressure",             mc_Pa,      typeof mc_Pa),
      unit("siemens",   	"siemens",  "Conductance",          mc_siemens, typeof mc_siemens),
      unit("sievert",   	"Sv",       "Dose",                 mc_Sv,      typeof mc_Sv),
      unit("stokes",    	"stokes",   "Viscosity, kinematic", mc_stokes,  typeof mc_stokes),
      unit("tesla",     	"tesla",    "Magnetic Flux Density",mc_tesla,   typeof mc_tesla),
      unit("volt",      	"volt",     "Potential",            mc_volt,    typeof mc_volt),
      unit("watt",      	"watt",     "Power",                mc_watt,    typeof mc_watt),
      unit("weber",     	"weber",    "Magnetic Flux",        mc_weber,   typeof mc_weber)
   ]);
}

//****************************************************************************
