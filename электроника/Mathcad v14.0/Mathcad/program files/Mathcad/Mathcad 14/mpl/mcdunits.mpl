//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*
//*  Version : $Header: /MathcadClient/releases/Mathcad_14.0.1/mcd/sources/mpl/mcdunits.mpl   39   2007-03-12 15:29:20-04:00   mlippert $
//*
//*
//*  Purpose : Defines the units 'built into' Mathcad 12.
//*
//*
//*  See Also: http://physics.nist.gov/cuu/Units/ for a good introduction to
//*            the SI unit system.
//*
//*            http://en.wikipedia.org/wiki/Centimeter-gram-second_system_of_units
//*            for information on the CGS unit system.
//*
//*            http://www.unc.edu/~rowlett/units/sipm.html for information on
//*            unit systems in general.
//*
//*            http://www.unc.edu/~rowlett/units/index.html for a database of
//*            physical constants.
//*
//*  Comments: All units are defined in terms of SI units to maximize inter-
//*            operability across different unit systems.
//*
//*            Base SI units specified using temporary syntax, since dimension
//*            constructors are not yet implemented.They're declared as powers
//*            of a bias to allow for CGS units to include square roots.
//*
//*            SI definitions are copied verbatim from NIST web site above and
//*            take up the first half of this module.
//*
//*            The operators (*.) and (/.) are rebound here for readability.
//*
//*            This file uses a tab size of 3 spaces.
//*
//****************************************************************************

module McdUnits where
{
// Module imports:

   import McdRun hiding((*),(/));                        // For arithmetic ops

// SI base dimensions:

   dimension Length;                                     // Length
   dimension Mass;                                       // Mass
   dimension Time;                                       // Time
   dimension Current;                                    // Electric Current
   dimension Temperature;                                // Thermodynamic Temperature
   dimension Substance;                                  // Amount of Substance
   dimension Luminosity;                                 // Luminous Intensity
   dimension Money;                                      // Money


// SI base units:

   meter          = f 1.0 where{f::Real{}->Real{Length      60000} @ 46;};// m
   kilogram       = f 1.0 where{f::Real{}->Real{Mass        60000} @ 46;};// kg
   second         = f 1.0 where{f::Real{}->Real{Time        60000} @ 46;};// s
   ampere         = f 1.0 where{f::Real{}->Real{Current     60000} @ 46;};// A
   kelvin         = f 1.0 where{f::Real{}->Real{Temperature 60000} @ 46;};// K
   mole           = f 1.0 where{f::Real{}->Real{Substance   60000} @ 46;};// mol
   candela        = f 1.0 where{f::Real{}->Real{Luminosity  60000} @ 46;};// cd
   basecurrency   = f 1.0 where{f::Real{}->Real{Money       60000} @ 46;};// Â¤

// SI derived units with special names and symbols:

   radian         = 1.0;                                 // rad
   steradian      = 1.0;                                 // sr
   hertz          = 1.0 / second;                        // Hz
   newton         = meter * kilogram / square second;    // N
   pascal         = newton / square meter;               // Pa
   joule          = newton * meter;                      // J
   watt           = joule / second;                      // W
   coulomb        = second * ampere;                     // C
   volt           = watt / ampere;                       // V
   farad          = coulomb / volt;                      // F
   ohm            = volt / ampere;                       // Omega
   siemens        = ampere / volt;                       // S
   weber          = volt * second;                       // Wb
   tesla          = weber / square meter;                // T
   henry          = weber / ampere;                      // H
   celsius        = kelvin;                              // °C
   lumen          = candela * steradian;                 // lm
   lux            = lumen / square meter;                // lx
   becquerel      = 1.0 / second;                        // Bq
   gray           = joule / kilogram;                    // Gy
   sievert        = joule / kilogram;                    // Sv
   katal          = mole / second;                       // kat

// SI prefixes

   yotta x        = x * 1e+24;                           // Y
   zetta x        = x * 1e+21;                           // Z
   exa   x        = x * 1e+18;                           // E
   peta  x        = x * 1e+15;                           // P
   tera  x        = x * 1e+12;                           // T
   giga  x        = x * 1e+9;                            // G
   mega  x        = x * 1e+6;                            // M
   kilo  x        = x * 1e+3;                            // k
   hecto x        = x * 1e+2;                            // h
   deka  x        = x * 1e+1;                            // da
   deci  x        = x * 1e-1;                            // d
   centi x        = x * 1e-2;                            // c
   milli x        = x * 1e-3;                            // m
   micro x        = x * 1e-6;                            // µ
   nano  x        = x * 1e-9;                            // n
   pico  x        = x * 1e-12;                           // p
   femto x        = x * 1e-15;                           // f
   atto  x        = x * 1e-18;                           // a
   zepto x        = x * 1e-21;                           // z
   yocto x        = x * 1e-24;                           // y

// Units outside the SI that are accepted for use with the SI:

   minute         = 60.0 * second;                       // min
   hour           = 60.0 * minute;                       // hr
   day            = 24.0 * hour;                         // day
   degree         = pi  / 180.0 * radian;                // °
   arcminute      = 1.0 /  60.0 * degree;                // '
   arcsecond      = 1.0 /3600.0 * degree;                // "
   liter          = 1e-3 * cubic meter;                  // L
   tonne          = 1e+3 * kilogram;                     // t
   neper          = 1.0;                                 // Np
   electronvolt   = 1.60217653e-19 * joule;              // eV (approx)
   atomic_mass    = 1.66053886e-27 * kilogram;           // u  (approx)
   astronomical   = 1.49598e+11    * meter;              // ua (approx)

// Other units outside the SI that are accepted for use with the SI, subject
// to further review:

   nautical_mile  = 1852.0 * meter;                      //
   knot           = nautical_mile / hour;                //
   are            = square(deka  meter);                 // a
   hectare        = square(hecto meter);                 // ha
   bar            = 100.0 * kilo pascal;                 // bar
   angstrom       = 0.1   * nano meter;                  // Å
   barn           = 100.0 * square(femto meter);         // b
   curie          = 3.7e+10 * becquerel;                 // Ci
   roentgen       = 2.58e-4 * curie / kilogram;          // R
   rad            = centi gray;                          // rad
   rem            = centi sievert;                       // rem

// Physical constants:

   c              = 299792458.0 * meter / second;        // c
   g              = 9.80665 * meter / square second;     // g
   bohr           = 0.5291772108e-10 * meter;            // a.0
   atmosphere     = 101.325 * kilo pascal;               // atm
   mu0            = 4e-7 * pi * henry / meter;           // µ0
   epsilon0       = 1.0/(square c * mu0);                // e0

// Additional units of length:

   micron         = micro meter;                         // µ
   inch           = 0.0254 * meter;                      // in
   foot           = 0.3048 * meter;                      // ft
   mil            = 0.001  * inch;                       // mil
   cubit          = 18.0   * inch;                       // cb
   yard           = 3.0    * foot;                       // yd
   furlong        = 220.0  * yard;                       // furlong
   mile           = 1760.0 * yard;                       // mi
   smoot		  = 67.0   * inch;				    	 // Smoot

// Additional units of area:

   acre           = 4840.0 * square yard;                // a

// Additional units of volume:

   fluid_ounce    = 29.573531 * milli liter;             // floz
   gallon         = 128.0 * fluid_ounce;                 // gal
   gallon_uk      = 4.54609 * liter ;                    // galUK

// Additional units of mass:

   gram           = 0.001 * kilogram;                    // gm
   ounce          = 0.028349523125 * kilogram;           // oz
   pound          = 16.0 * ounce;                        // lb
   slug           = 14.5939029372064 * kilogram;         // slug
   ton            = 2000.0 * pound;                      // T

// Additional units of temperature:

   rankine        = 5.0 / 9.0 * kelvin;                  // R

// Additional units of time and frequency:

   angular_hertz  = 2.0 * pi * hertz;                    // Hz
   revolution     = 2.0 * pi;                            // rev
   fortnight      = 14.0 * day;                          // fortnight
   year           = 31556925.9747 * second;              // yr

// Additional units of force:

   dyne           = 1e-5 * newton;                       // dyne
   kilogram_force = g * kilogram;                        // kgf
   pound_force    = g * pound;                           // lbf
   ounce_force    = g * ounce;                           // ozf
   tonne_force    = g * tonne;                           // tonnef

// Additional units of energy:

   erg            = dyne * centi meter;                  // erg

// Additional units of power:

   hp             = 550.0*foot*pound_force / second;     // hp
   hp_electric    = 746.0     * watt;                    // ehp
   hp_uk          = 745.7     * watt;                    // UK_hp
   hp_boiler      = 9809.5    * watt;                    // bhp
   hp_metric      = 735.49875 * watt;                    // mhp
   hp_water       = 746.043   * watt;                    // hhp

   btu            = 1.05505585262 * kilo joule;          // BTU
   btu_15C        = 1.05480  * kilo joule;               // BTU15
   btu_canadian   = 1.054615 * kilo joule;               // CBTU
   btu_iso        = 1.0545   * kilo joule;               // IBTU
   btu_mean       = 1.05587  * kilo joule;               // mBTU
   btu_thermo     = 1.054350 * kilo joule;               // tBTU

   calorie        = 4.1868 * joule;                      // cal
   calorie_15C    = 4.1858 * joule;                      // cal15
   calorie_20C    = 4.1819 * joule;                      // cal20
   calorie_diet   = 4.1855 * kilo joule;                 // dcal
   calorie_mean   = 4.19002 * joule;                     // mcal
   calorie_thermo = 4.1840 * joule;                      // tcal

// Additional units of viscosity:

   poise          = deci pascal * second;                // P
   stokes         = square cm / second;                  // St

// Additional units of pressure:

   psi            = g * pound / square inch;             // psi
   torr           = 1.0/760.0 * atmosphere;              // Torr
   inches_mercury = 3.38638 * kilo pascal;               // inHg

// Additional units of electromagnetism:

   gauss          = 1e-4 * tesla;                        // G
   oersted        = 1.0/(4.0*pi) * kilo ampere / meter;  // Oe

// Additional units of resolution:

   dpi            = 1.0 / inch;                          // dpi

// The CGS electrical and other units (esu system):

   barye          = deci pascal;                         // barye
   statcoulomb    = sqrt(gram * cubic cm) / second;      // statcoul, esu
   statampere     = statcoulomb / second;                // statamp
   statvolt       = statcoulomb / cm;                    // statvolt
   statohm        = statvolt / statampere;               // statohm
   statsiemen     = 1.0 / statohm;                       // statsiemen
   statfarad      = statcoulomb / statvolt;              // statfarad
   stathenry      = statohm * statweber / statampere;    // stathenry
   statweber      = statvolt * centi meter;              // statweber
   stattesla      = cgs_gauss;                           // stattesla
   maxwell        = cgs_gauss * square cm;               // Mx

// Notice that the definitions for magnetic field, flux and flux density
// i.e. gauss, stattesla and oersted, have been updated in Mathcad 12: answers
// may differ from previous versions:

   cgs_coulomb    = 1e+1 * statcoulomb * magnitude c;    // C, coul
   cgs_ampere     = 1e+1 * statampere  * magnitude c;    // A, amp, ampere
   cgs_volt       = 1e+6 * statvolt    / magnitude c;    // V, volt
   cgs_ohm        = cgs_volt / cgs_ampere;               // Omega, ohm
   cgs_siemen     = 1.0 / cgs_ohm;                       // siemen
   cgs_farad      = cgs_coulomb / cgs_volt;              // F
   cgs_henry      = 1e+5 * stathenry/square(magnitude c);// H
   cgs_oersted    = statvolt/centi meter;                // Oe
   cgs_gauss      = cgs_oersted;	                     // gauss - ESU def.
   cgs_mu0        = 4e-7 * pi * cgs_henry / meter;       // µ0
   cgs_epsilon0   = 1.0/(square c * cgs_mu0);            // e0

// Additional supporting definitions:

   cm             = centi meter;                         // cm
   square x       = x * x;                               // ^2
   cubic  x       = x * x * x;                           // ^3
   x * y          = x McdRun.*. y;                       // *
   x / y          = x McdRun./. y;                       // /
   magnitude      ::Real{d} -> Real{} @ 46;              // strips dimensions
}

//****************************************************************************
