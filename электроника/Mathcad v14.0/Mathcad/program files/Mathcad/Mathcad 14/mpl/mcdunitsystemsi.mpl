//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*
//*  Version : $Header: /MathcadClient/releases/Mathcad_14.0.1/mcd/sources/mpl/mcdunitsystemsi.mpl   68   2007-04-25 15:17:08-04:00   mlippert $
//*
//*
//*  Purpose : Defines the SI unit system used in Mathcad 12.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//*
//****************************************************************************

module McdUnitSystemSI where
{
// Module Imports

   import McdUnits as McdUnitSystemSI(Mass,Length,Time,Current,Temperature,Luminosity,Substance,Money);
   import McdUnits;
   import McdRun;

// Base Dimension Constructors

   op_M           :: Value{} -> Value{Mass        60000} @ 46;
   op_L           :: Value{} -> Value{Length      60000} @ 46;
   op_T           :: Value{} -> Value{Time        60000} @ 46;
   op_Q           :: Value{} -> Value{Current     60000} @ 46;
   op_K           :: Value{} -> Value{Temperature 60000} @ 46;
   op_C           :: Value{} -> Value{Luminosity  60000} @ 46;
   op_S           :: Value{} -> Value{Substance   60000} @ 46;
   op_D           :: Value{} -> Value{Money       60000} @ 46;

// Mathcad Units

   mc_¤           = rv(basecurrency);
   mc_μ_2E_0      = rv(mu0);
   mc_ε_2E_0      = rv(epsilon0);
   mc_A           = rv(ampere);
   mc_Angstrom    = rv(angstrom);
   mc_BTU         = rv(btu);
   mc_Btu         = rv(btu);
   mc_BTU15       = rv(btu_15C);
   mc_Bq          = rv(becquerel);
   mc_C           = rv(coulomb);
   mc_CBTU        = rv(btu_canadian);
   mc_Δ°C         = rv(kelvin);
   mc_Δ°F         = rv(rankine);
   mc_Δ℃         = rv(kelvin);
   mc_Δ℉         = rv(rankine);
   mc_F           = rv(farad);
   mc_G           = rv(gauss);
   mc_GHz         = rv(giga hertz);
   mc_GPa         = rv(giga pascal);
   mc_Gy          = rv(gray);
   mc_H           = rv(henry);
   mc_Hz          = rv(hertz);
   mc_Hza         = rv(angular_hertz);
   mc_IBTU        = rv(btu_iso);
   mc_J           = rv(joule);
   mc_K           = rv(kelvin);
   mc_KA          = rv(kilo ampere);
   mc_KHz         = rv(kilo hertz);
   mc_KV          = rv(kilo volt);
   mc_KΩ          = rv(kilo ohm);
   mc_L           = rv(liter);
   mc_MHz         = rv(mega hertz);
   mc_MΩ          = rv(mega ohm);
   mc_MW          = rv(mega watt);
   mc_N           = rv(newton);
   mc_N·m         = rv(newton *. meter);
   mc_N·cm         = rv(newton *. centi meter);
   mc_N·mm         = rv(newton *. milli meter);
   mc_Oe          = rv(oersted);
   mc_Pa          = rv(pascal);
   mc_MPa         = rv(mega pascal);
   mc_R           = rv(rankine);
   mc_°R          = rv(rankine);
   mc_S           = rv(siemens);
   mc_Sv          = rv(sievert);
   mc_T           = rv(tesla);
   mc_V           = rv(volt);
   mc_W           = rv(watt);
   mc_Wb          = rv(weber);
   mc_Ω           = rv(ohm);
   mc_μA          = rv(micro ampere);
   mc_nA          = rv(nano ampere);
   mc_pA          = rv(pico ampere);
   mc_μF          = rv(micro farad);
   mc_μH          = rv(micro henry);
   mc_μm          = rv(micro meter);
   mc_μs          = rv(micro second);
   mc_ns          = rv(nano second);
   mc_ps          = rv(pico second);
   mc_acre        = rv(acre);
   mc_acre·ft     = rv(acre *. foot);
   mc_amp         = rv(ampere);
   mc_arcsec      = rv(arcsecond);
   mc_arcmin      = rv(arcminute);
   mc_atm         = rv(atmosphere);
   mc_bar         = rv(bar);
   mc_barn        = rv(barn);
   mc_bhp         = rv(hp_boiler);
   mc_bohr        = rv(bohr);
   mc_a_2E_0      = rv(bohr);
   mc_c           = rv(c);
   mc_cal         = rv(calorie);
   mc_cal15       = rv(calorie_15C);
   mc_cal20       = rv(calorie_20C);
   mc_cd          = rv(candela);
   mc_cm          = rv(centi meter);
   mc_coul        = rv(coulomb);
   mc_mC          = rv(milli coulomb);
   mc_μC          = rv(micro coulomb);
   mc_nC          = rv(nano coulomb);
   mc_pC          = rv(pico coulomb);
   mc_cubit       = rv(cubit);
   mc_day         = rv(day);
   mc_dcal        = rv(calorie_diet);
   mc_deg         = rv(degree);
   mc_°           = rv(degree);
   mc_dyne        = rv(dyne);
   mc_ehp         = rv(hp_electric);
   mc_erg         = rv(erg);
   mc_farad       = rv(farad);
   mc_fl_5F_oz    = rv(fluid_ounce);
   mc_fortnight   = rv(fortnight);
   mc_ft          = rv(foot);
   mc_ft·lbf      = rv(foot *. pound_force);
   mc_ft·kip      = rv(foot *. kilo pound_force);
   mc_in·lbf      = rv(inch *. pound_force);
   mc_in·kip      = rv(inch *. kilo pound_force);
   mc_in·ozf      = rv(inch *. ounce_force);
   mc_W·s         = rv(watt *. second);
   mc_W·hr        = rv(watt *. hour);
   mc_kW·hr       = rv(kilo watt *. hour);
   mc_furlong     = rv(furlong);
   mc_g           = rv(g);
   mc_gal         = rv(gallon);
   mc_galUK       = rv(gallon_uk);
   mc_gpm         = rv(gallon /. minute);
   mc_cfm         = rv(cubic foot /. minute);
   mc_mgd         = rv(mega gallon /. day);
   mc_gauss       = rv(gauss);
   mc_gm          = rv(gram);
   mc_hectare     = rv(hectare);
   mc_henry       = rv(henry);
   mc_hhp         = rv(hp_water);
   mc_hp          = rv(hp);
   mc_hpUK        = rv(hp_uk);
   mc_hr          = rv(hour);
   mc_in          = rv(inch);
   mc_in_5F_Hg    = rv(inches_mercury);
   mc_joule       = rv(joule);
   mc_kA          = rv(kilo ampere);
   mc_kHz         = rv(kilo hertz);
   mc_kN          = rv(kilo newton);
   mc_MN          = rv(mega newton);
   mc_GN          = rv(giga newton);
   mc_TN          = rv(tera newton);
   mc_tonnef      = rv(tonne_force);
   mc_kN·m        = rv(kilo newton *. meter);
   mc_kN·cm       = rv(kilo newton *. centi meter);
   mc_kN·mm       = rv(kilo newton *. milli meter);
   mc_kV          = rv(kilo volt);
   mc_kW          = rv(kilo watt);
   mc_kΩ          = rv(kilo ohm);
   mc_katal       = rv(katal);
   mc_kcal        = rv(kilo calorie);
   mc_kg          = rv(kilogram);
   mc_kgf         = rv(kilogram_force);
   mc_kip         = rv(kilo pound_force);
   mc_klf         = rv(kilo pound_force /. foot);
   mc_kpi         = rv(kilo pound_force /. inch);
   mc_plf         = rv(pound_force /. foot);
   mc_km          = rv(kilo meter);
   mc_knot        = rv(knot);
   mc_kPa         = rv(kilo pascal);
   mc_kph         = rv(kilo meter /. hour);
   mc_ksf         = rv(kilo pound_force /. square foot);
   mc_ksi         = rv(kilo pound_force /. square inch);
   mc_lb          = rv(pound);
   mc_lbm         = rv(pound);
   mc_lbf         = rv(pound_force);
   mc_liter       = rv(liter);
   mc_l           = rv(liter);
   mc_lm          = rv(lumen);
   mc_lx          = rv(lux);
   mc_m           = rv(meter);
   mc_mA          = rv(milli ampere);
   mc_mBTU        = rv(btu_mean);
   mc_mH          = rv(milli henry);
   mc_mL          = rv(milli liter);
   mc_mV          = rv(milli volt);
   mc_μV          = rv(micro volt);
   mc_nV          = rv(nano volt);
   mc_pV          = rv(pico volt);
   mc_mW          = rv(milli watt);
   mc_μW          = rv(micro watt);
   mc_nW          = rv(nano watt);
   mc_pW          = rv(pico watt);
   mc_mcal        = rv(calorie_mean);
   mc_mg          = rv(milli gram);
   mc_mho         = rv(siemens);
   mc_mhp         = rv(hp_metric);
   mc_micron      = rv(micron);
   mc_mi          = rv(mile);
   mc_mil         = rv(mil);
   mc_mile        = rv(mile);
   mc_min         = rv(minute);
   mc_mm          = rv(milli meter);
   mc_mol         = rv(mole);
   mc_mole        = rv(mole);
   mc_mph         = rv(mile /. hour);
   mc_ms          = rv(milli second);
   mc_newton      = rv(newton);
   mc_nF          = rv(nano farad);
   mc_nm          = rv(nano meter);
   mc_nmi         = rv(nautical_mile);
   mc_oersted     = rv(oersted);
   mc_ohm         = rv(ohm);
   mc_oz          = rv(ounce);
   mc_ozf         = rv(ounce_force);
   mc_pF          = rv(pico farad);
   mc_pcf         = rv(pound_force /. cubic foot);
   mc_pci         = rv(pound_force /. cubic inch);
   mc_poise       = rv(poise);
   mc_psi         = rv(psi);
   mc_psf         = rv(pound_force /. square foot);
   mc_rad         = rv(radian);
   mc_rev         = rv(revolution);
   mc_rpm         = rv(revolution /. minute);
   mc_s           = rv(second);
   mc_sec         = rv(second);
   mc_siemens     = rv(siemens);
   mc_slug        = rv(slug);
   mc_sr          = rv(steradian);
   mc_stokes      = rv(stokes);
   mc_Smoot       = rv(smoot);
   mc_tBTU        = rv(btu_thermo);
   mc_tcal        = rv(calorie_thermo);
   mc_tesla       = rv(tesla);
   mc_ton         = rv(ton);
   mc_tonf        = rv(2000.0 *. pound_force);
   mc_tonne       = rv(tonne);
   mc_torr        = rv(torr);
   mc_volt        = rv(volt);
   mc_watt        = rv(watt);
   mc_weber       = rv(weber);
   mc_yd          = rv(yard);
   mc_yr          = rv(year);
   mc_dpi         = rv(dpi);

// Related Functions

   mc_SIUnitsOf   :: V{a}->V{a};
   mc_SIUnitsOf _ =  f(iv' 1$) where {f::a->V{b} @ 46};

   mc_UnitsOf     :: V{a}->V{a};
   mc_UnitsOf   _ =  f(iv' 1$) where {f::a->V{b} @ 46};

// Unit Simplification

   system = unit_system("SI",0,"7FE6716D-2E40-43A6-9E41-0DF66E111D32",
   [//     Name             Symbol   Quantity                Unit        Signature
      unit("kilogram",      "kg",    "Mass",                 mc_kg,      typeof mc_kg),
      unit("meter",         "m",     "Length",               mc_m,       typeof mc_m),
      unit("second",        "s",     "Time",                 mc_s,       typeof mc_s),
      unit("ampere",        "A",     "Current",              mc_A,       typeof mc_A),
      unit("kelvin",        "K",     "Temperature",          mc_K,       typeof mc_K),
      unit("candela",       "cd",    "Luminosity",           mc_cd,      typeof mc_cd),
      unit("mole",          "mol",   "Substance",            mc_mole,    typeof mc_mole),
      unit("base_currency", "¤",     "Money",                mc_¤,       typeof mc_¤)

   ],
   [
      unit("coulomb",       "C",     "Charge",               mc_C,       typeof mc_C),
      unit("farad",         "F",     "Capacitance",          mc_F,       typeof mc_F),
      unit("henry",         "H",     "Inductance",           mc_H,       typeof mc_H),
      unit("joule",         "J",     "Energy",               mc_J,       typeof mc_J),
//      unit("katal",         "katal", "Catalytic Activity",   mc_katal,   typeof mc_katal),
//LB the units mol/s are more commonly used, and have different connotation, than katal
      unit("liter",         "L",     "Volume",               mc_L,       typeof mc_L),
      unit("lux",           "lx",    "Illuminance",          mc_lx,      typeof mc_lx),
      unit("newton",        "N",     "Force",                mc_N,       typeof mc_N),
      unit("ohm",           "Ω",     "Resistance",           mc_Ω,       typeof mc_Ω),
      unit("pascal",        "Pa",    "Pressure",             mc_Pa,      typeof mc_Pa),
      unit("siemens",       "S",     "Conductance",          mc_S,       typeof mc_S),
//      unit("sievert",       "Sv",    "Dose",                 mc_Sv,      typeof mc_Sv),
//LB The units J/kg are more commonly used than Sievert
      unit("tesla",         "T",     "Magnetic Flux Density",mc_T,       typeof mc_T),
      unit("watt",          "W",     "Power",                mc_W,       typeof mc_W),
      unit("weber",         "Wb",    "Magnetic Flux",        mc_Wb,      typeof mc_Wb),
      unit("volt",          "V",     "Potential",            mc_V,       typeof mc_V)
   ]);
}

//****************************************************************************
