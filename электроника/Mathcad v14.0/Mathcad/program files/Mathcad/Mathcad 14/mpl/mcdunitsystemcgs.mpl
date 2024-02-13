//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*
//*  Version : $Header: /MathcadClient/releases/Mathcad_14.0.1/mcd/sources/mpl/mcdunitsystemcgs.mpl   41   2007-04-25 15:17:08-04:00   mlippert $
//*
//*
//*  Purpose : Defines the CGS unit system used in Mathcad 12.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//*
//****************************************************************************

module McdUnitSystemCGS where
{
// Module Imports

   import McdUnits as McdUnitSystemCGS(Mass,Length,Time,Temperature,Substance,Luminosity,Money);
   import McdUnits;
   import McdRun;

// Base Dimension Constructors

   op_M v         = v `multiply_by_unit` mc_gm;
   op_L v         = v `multiply_by_unit` mc_cm;
   op_T v         = v `multiply_by_unit` mc_sec;
   op_Q v         = v `multiply_by_unit` mc_coul;
   op_K v         = v `multiply_by_unit` mc_K;
   op_C v         = v `multiply_by_unit` mc_cd;
   op_S v         = v `multiply_by_unit` mc_mole;
   op_D v         = v `multiply_by_unit` mc_¤;

// Mathcad Units

   mc_¤           = rv(basecurrency);
   mc_μm          = rv(micro meter);
   mc_μs          = rv(micro second);
   mc_Angstrom    = rv(angstrom);
   mc_BTU         = rv(btu);
   mc_Btu         = rv(btu);
   mc_BTU15       = rv(btu_15C);
   mc_Bq          = rv(becquerel);
   mc_CBTU        = rv(btu_canadian);
   mc_Δ°C         = rv(kelvin);
   mc_Δ°F         = rv(rankine);
   mc_Δ℃         = rv(kelvin);
   mc_Δ℉         = rv(rankine);
   mc_GHz         = rv(giga hertz);
   mc_GPa         = rv(giga pascal);
   mc_Gy          = rv(gray);
   mc_Hz          = rv(hertz);
   mc_Hza         = rv(angular_hertz);
   mc_IBTU        = rv(btu_iso);
   mc_J           = rv(joule);
   mc_K           = rv(kelvin);
   mc_KHz         = rv(kilo hertz);
   mc_L           = rv(liter);
   mc_MHz         = rv(mega hertz);
   mc_MPa         = rv(mega pascal);
   mc_N           = rv(newton);
   mc_Pa          = rv(pascal);
   mc_R           = rv(rankine);
   mc_°R          = rv(rankine);
   mc_Sv          = rv(sievert);
   mc_W           = rv(watt);
   mc_a_2E_0      = rv(bohr);
   mc_acre        = rv(acre);
   mc_atm         = rv(atmosphere);
   mc_barn        = rv(barn);
   mc_barye       = rv(barye);
   mc_bhp         = rv(hp_boiler);
   mc_bohr        = rv(bohr);
   mc_c           = rv(c);
   mc_c_5F_       = rv(magnitude c);
   mc_cal         = rv(calorie);
   mc_cal15       = rv(calorie_15C);
   mc_cal20       = rv(calorie_20C);
   mc_cd          = rv(candela);
   mc_cm          = rv(centi meter);
   mc_cubit       = rv(cubit);
   mc_day         = rv(day);
   mc_dcal        = rv(calorie_diet);
   mc_deg         = rv(degree);
   mc_°           = rv(degree);
   mc_dyne        = rv(dyne);
   mc_ehp         = rv(hp_electric);
   mc_erg         = rv(erg);
   mc_fl_5F_oz    = rv(fluid_ounce);
   mc_fortnight   = rv(fortnight);
   mc_furlong     = rv(furlong);
   mc_ft          = rv(foot);
   mc_g           = rv(g);
   mc_gal         = rv(gallon);
   mc_galUK       = rv(gallon_uk);
   mc_gm          = rv(gram);
   mc_gpm         = rv(gallon /. minute);
   mc_hectare     = rv(hectare);
   mc_hhp         = rv(hp_water);
   mc_hp          = rv(hp);
   mc_hpUK        = rv(hp_uk);
   mc_hr          = rv(hour);
   mc_in          = rv(inch);
   mc_in_5F_Hg    = rv(inches_mercury);
   mc_joule       = rv(joule);
   mc_kHz         = rv(kilo hertz);
   mc_kN          = rv(kilo newton);
   mc_kW          = rv(kilo watt);
   mc_katal       = rv(katal);
   mc_kcal        = rv(kilo calorie);
   mc_kg          = rv(kilogram);
   mc_kgf         = rv(kilogram_force);
   mc_kip         = rv(kilo pound_force);
   mc_km          = rv(kilo meter);
   mc_kph         = rv(kilo meter /. hour);
   mc_ksi         = rv(kilo pound_force /. square inch);
   mc_lb          = rv(pound);
   mc_lbm         = rv(pound);
   mc_lbf         = rv(pound_force);
   mc_liter       = rv(liter);
   mc_lm          = rv(lumen);
   mc_lx          = rv(lux);
   mc_m           = rv(meter);
   mc_mBTU        = rv(btu_mean);
   mc_mL          = rv(milli liter);
   mc_mcal        = rv(calorie_mean);
   mc_mg          = rv(milli gram);
   mc_mW          = rv(milli watt);
   mc_mhp         = rv(hp_metric);
   mc_mi          = rv(mile);
   mc_micron      = rv(micron);
   mc_mil         = rv(mil);
   mc_mile        = rv(mile);
   mc_min         = rv(minute);
   mc_mm          = rv(milli meter);
   mc_mol         = rv(mole);
   mc_mole        = rv(mole);
   mc_mph         = rv(mile /. hour);
   mc_ms          = rv(milli second);
   mc_newton      = rv(newton);
   mc_nm          = rv(nano meter);
   mc_nmi         = rv(nautical_mile);
   mc_oz          = rv(ounce);
   mc_poise       = rv(poise);
   mc_psi         = rv(psi);
   mc_psf         = rv(pound_force /. square foot);
   mc_rad         = rv(radian);
   mc_sec         = rv(second);
   mc_s           = rv(second);
   mc_slug        = rv(slug);
   mc_sr          = rv(steradian);
   mc_stokes      = rv(stokes);
   mc_tBTU        = rv(btu_thermo);
   mc_tcal        = rv(calorie_thermo);
   mc_ton         = rv(ton);
   mc_tonne       = rv(tonne);
   mc_torr        = rv(torr);
   mc_watt        = rv(watt);
   mc_yd          = rv(yard);
   mc_yr          = rv(year);
   mc_dpi         = rv(dpi);
   mc_rev         = rv(revolution);
   mc_ft·lbf      = rv(foot *. pound_force);
   mc_in·lbf      = rv(inch *. pound_force);
   mc_in·ozf      = rv(inch *. ounce_force);
   mc_N·m         = rv(newton *. meter);
   mc_N·cm         = rv(newton *. centi meter);
   mc_N·mm         = rv(newton *. milli meter);


// Electrical units are defined differently in CGS

   mc_μ_2E_0      = rv(cgs_mu0);
   mc_ε_2E_0      = rv(cgs_epsilon0);
   mc_μA          = rv(micro cgs_ampere);
   mc_μF          = rv(micro cgs_farad);
   mc_μH          = rv(micro cgs_henry);
   mc_Ω           = rv(cgs_ohm);
   mc_A           = rv(cgs_ampere);
   mc_C           = rv(cgs_coulomb);
   mc_F           = rv(cgs_farad);
   mc_H           = rv(cgs_henry);
   mc_S           = rv(cgs_siemen);
   mc_V           = rv(cgs_volt);
   mc_KΩ          = rv(kilo cgs_ohm);
   mc_KA          = rv(kilo cgs_ampere);
   mc_KV          = rv(kilo cgs_volt);
   mc_MΩ          = rv(mega cgs_ohm);
   mc_MW          = rv(mega watt);
   mc_Mx          = rv(maxwell);
   mc_amp         = rv(cgs_ampere);
   mc_coul        = rv(cgs_coulomb);
   mc_esu         = rv(statcoulomb);
   mc_farad       = rv(cgs_farad);
   mc_gauss       = rv(cgs_gauss);
   mc_henry       = rv(cgs_henry);
   mc_kΩ          = rv(kilo cgs_ohm);
   mc_kA          = rv(kilo cgs_ampere);
   mc_kV          = rv(kilo cgs_volt);
   mc_mA          = rv(milli cgs_ampere);
   mc_mH          = rv(milli cgs_henry);
   mc_mV          = rv(milli cgs_volt);
   mc_maxwell     = rv(maxwell);
   mc_mho         = rv(cgs_siemen);
   mc_nF          = rv(nano cgs_farad);
   mc_oersted     = rv(cgs_oersted);
   mc_ohm         = rv(cgs_ohm);
   mc_pF          = rv(pico cgs_farad);
   mc_siemens     = rv(cgs_siemen);
   mc_statamp     = rv(statampere);
   mc_statcoul    = rv(statcoulomb);
   mc_statfarad   = rv(statfarad);
   mc_stathenry   = rv(stathenry);
   mc_statohm     = rv(statohm);
   mc_statsiemens = rv(statsiemen);
   mc_stattesla   = rv(stattesla);
   mc_statvolt    = rv(statvolt);
   mc_statweber   = rv(statweber);
   mc_volt        = rv(cgs_volt);

// Related Functions

   mc_SIUnitsOf   :: V{a}->V{a};
   mc_SIUnitsOf _ =  f(iv' 1$) where {f::a->V{b} @ 46};

   mc_UnitsOf     :: V{a}->V{a};
   mc_UnitsOf   _ =  arg_error "unitsof is obsolete" 0$;

// Unit Simplification

   system = unit_system("CGS",2,"DDD31661-FF82-4A97-B5C7-0C754A775401",
   [//     Name            Symbol         Quantity                Unit           Signature
      unit("gram",         "gm",          "Mass",                 mc_gm,         typeof mc_gm),
      unit("centimeter",   "cm",          "Length",               mc_cm,         typeof mc_cm),
      unit("second",       "sec",         "Time",                 mc_sec,        typeof mc_sec),
      unit("kelvin",       "K",           "Temperature",          mc_K,          typeof mc_K),
      unit("candela",      "cd",          "Luminosity",           mc_cd,         typeof mc_cd),
      unit("mole",         "mole",        "Substance",            mc_mole,       typeof mc_mole),
      unit("base_currency","¤",           "Money",                mc_¤,          typeof mc_¤)
   ],
   [
      unit("barye",        "barye",       "Pressure",             mc_barye,      typeof mc_barye),
      unit("dyne",         "dyne",        "Force",                mc_dyne,       typeof mc_dyne),
      unit("erg",          "erg",         "Energy",               mc_erg,        typeof mc_erg),
      unit("gauss",        "gauss",       "Magnetic Flux Density",mc_gauss,      typeof mc_gauss),
      unit("katal",        "katal",       "Catalytic Activity",   mc_katal,      typeof mc_katal),
      unit("lux",          "lx",          "Illuminance",          mc_lx,         typeof mc_lx),
      unit("milliliter",   "mL",          "Volume",               mc_mL,         typeof mc_mL),
      unit("oersted",      "oersted",     "Magnetic Field",       mc_oersted,    typeof mc_oersted),
      unit("poise",        "poise",       "Viscosity, dynamic",   mc_poise,      typeof mc_poise),
      unit("sievert",      "Sv",          "Dose",                 mc_Sv,         typeof mc_Sv),
      unit("statampere",   "statamp",     "Current",              mc_statamp,    typeof mc_statamp),
      unit("statcoulomb",  "statcoul",    "Charge",               mc_statcoul,   typeof mc_statcoul),
      unit("statohm",      "statohm",     "Resistance",           mc_statohm,    typeof mc_statohm),
      unit("statvolt",     "statvolt",    "Potential",            mc_statvolt,   typeof mc_statvolt),
      unit("stathenry",    "stathenry",   "Inductance",           mc_stathenry,  typeof mc_stathenry),
      unit("stokes",       "stokes",      "Viscosity, kinematic", mc_stokes,     typeof mc_stokes),
      unit("watt",         "W",           "Power",                mc_W,          typeof mc_W)
   ]);
}

//****************************************************************************
