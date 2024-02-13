module McdEfi where
{
   import EfiWavelets   as McdEfi;
   import Mpl;
   import EfiSignal     as McdEfi;
   import EfiImage      as McdEfi;
   import EfiData       as McdEfi;
   import McdUnits;                                      // For shared units
   import McdRun;                                        // For the prelude
// Module Imports


// Temperature Conversions

   (mc_°C,mc_℃,mc_°F,mc_℉,mc__2F_°C,mc__2F_℃,mc__2F_°F,mc__2F_℉) = 
   (ck,   ck,  fk,   fk,  kc,       kc,       kf,       kf)
   where
   {
      ck t = (t * °K) + °c;                              // °C to °K
      kc t = (t - °c) / °K;                              // °K to °C
      fk t = (t * °F) + °f;                              // °F to °K
      kf t = (t - °f) / °F;                              // °K to °F

      °K = rv kelvin;                                    // 1 °K
      °F = rv(5.0 /. 9.0) * °K;                          // 1 °F
      °c = rv 273.15 * °K;                               // 0 °C
      °f = °c - rv 32.0 * °F;                            // 0 °F

      (+) :: V{a}->V{a}->V{a}     @ 65;infixl 6 +;       // Mathcad +
      (-) :: V{a}->V{a}->V{a}     @ 66;infixl 6 -;       // Mathcad -
      (*) :: V{a}->V{b}->V{a b}   @ 67;infixl 7 *;       // Mathcad *
      (/) :: V{a}->V{b}->V{a b-1} @ 68;infixl 7 /;       // Mathcad /
   };

// Other Conversions

   mc_DMS         :: V{}->D{}->D{}->V{}                  @"[efiutl?]Efi.Convert::DMS";
   mc__2F_DMS     :: V{}->V{}                            @"[efiutl?]Efi.Convert::DMS_inverse";

   mc_FIF         :: V{}->D{}->D{}->V{Length 60000}      @"[efiutl?]Efi.Convert::FIF";
   mc__2F_FIF     :: V{Length 60000}->V{}                @"[efiutl?]Efi.Convert::FIF_inverse";

   mc_hhmmss      :: V{}->D{}->D{}->V{Time 60000}        @"[efiutl?]Efi.Convert::HMS";
   mc__2F_hhmmss  :: V{Time 60000}->V{}                  @"[efiutl?]Efi.Convert::HMS_inverse";
// Module Imports


// J - Bessel Functions

   mc_J0          :: V{}->V{}                @"[efibessel?]Efi.Bessel::ZJ0";
   mc_J1          :: V{}->V{}                @"[efibessel?]Efi.Bessel::ZJ1";
   mc_Jn          :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::ZJn";
   mc_J0_2E_sc    :: V{}->V{}                @"[efibessel?]Efi.Bessel::EZJ0";
   mc_J1_2E_sc    :: V{}->V{}                @"[efibessel?]Efi.Bessel::EZJ1";
   mc_Jn_2E_sc    :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::EZJn";

// Y - Bessel Functions

   mc_Y0          :: V{}->V{}                @"[efibessel?]Efi.Bessel::ZY0";
   mc_Y1          :: V{}->V{}                @"[efibessel?]Efi.Bessel::ZY1";
   mc_Yn          :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::ZYn";
   mc_Y0_2E_sc    :: V{}->V{}                @"[efibessel?]Efi.Bessel::EZY0";
   mc_Y1_2E_sc    :: V{}->V{}                @"[efibessel?]Efi.Bessel::EZY1";
   mc_Yn_2E_sc    :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::EZYn";

// I - Modified Bessel Functions

   mc_I0          :: V{}->V{}                @"[efibessel?]Efi.Bessel::ZI0";
   mc_I1          :: V{}->V{}                @"[efibessel?]Efi.Bessel::ZI1";
   mc_In          :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::ZIn";
   mc_I0_2E_sc    :: V{}->V{}                @"[efibessel?]Efi.Bessel::EZI0";
   mc_I1_2E_sc    :: V{}->V{}                @"[efibessel?]Efi.Bessel::EZI1";
   mc_In_2E_sc    :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::EZIn";

// K - Modified Bessel Functions

   mc_K0          :: V{}->V{}                @"[efibessel?]Efi.Bessel::ZK0";
   mc_K1          :: V{}->V{}                @"[efibessel?]Efi.Bessel::ZK1";
   mc_Kn          :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::ZKn";
   mc_K0_2E_sc    :: V{}->V{}                @"[efibessel?]Efi.Bessel::EZK0";
   mc_K1_2E_sc    :: V{}->V{}                @"[efibessel?]Efi.Bessel::EZK1";
   mc_Kn_2E_sc    :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::EZKn";

// H - Hankel Functions

   mc_H1          :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::ZH1";
   mc_H2          :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::ZH2";
   mc_H1_2E_sc    :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::EZH1";
   mc_H2_2E_sc    :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::EZH2";

// Ai - Airy Functions and Derivatives

   mc_Ai          :: V{}->V{}                @"[efibessel?]Efi.Bessel::ZAi";
   mc_DAi         :: V{}->V{}                @"[efibessel?]Efi.Bessel::ZdAi"; 
   mc_Ai_2E_sc    :: V{}->V{}                @"[efibessel?]Efi.Bessel::EZAi";
   mc_DAi_2E_sc   :: V{}->V{}                @"[efibessel?]Efi.Bessel::EZdAi";

// Bi - Airy Functions and Derivatives

   mc_Bi          :: V{}->V{}                @"[efibessel?]Efi.Bessel::ZBi";
   mc_DBi         :: V{}->V{}                @"[efibessel?]Efi.Bessel::ZdBi"; 
   mc_Bi_2E_sc    :: V{}->V{}                @"[efibessel?]Efi.Bessel::EZBi";
   mc_DBi_2E_sc   :: V{}->V{}                @"[efibessel?]Efi.Bessel::EZdBi";

// Spherical Bessel Functions

   mc_js          :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::Zjs";
   mc_ys          :: V{}->V{}->V{}           @"[efibessel?]Efi.Bessel::Zys";
// Module Imports


// Calculus Operators

   mc_ε                   :: O->V{}->V{}->V{}->V{}                           @"[eficalculus?]Efi.Calculus::epsilon";
   mc_integral_         :: T->I(i->o)->(V{a}->V{b})->V{a}->V{a}->I4->V{a b}@"[eficalculus?]Efi.Calculus::IntegMain";
   op_indef_integral    ::             (V{a}->V{b})->V(c)->                V{a b};
   op_limit             :: (V{}->V{})->V{}->V{};
   op_limitright        :: (V{}->V{})->V{}->V{};
   op_limitleft         :: (V{}->V{})->V{}->V{};

// Range Operators

   op_rangeproduct f r = g f (as_range_a 2$ r) where
   {
      g f (Range a b c _ _) = op f a b c;
      op ::(V{a}->V{})->F8{a}->F8{a}->I4->V{} @"[eficalculus?]Efi.Calculus::prod_op";
   };

   op_rangesum f r = g f (as_range_a 2$ r) where
   {
      g f (Range a b c _ _) = op f a b c;
      op ::(V{a}->V{b})->F8{a}->F8{a}->I4->V{b} @"[eficalculus?]Efi.Calculus::sum_op";
   };

// Derivative Operators

   op_deriv_1 f x       =  op f (iv' 1$) x where
   {
      op :: (V{a}->V{b})->V{}->V{a}->V{b a-1} @"[eficalculus?]Efi.Calculus::NthDerivative";
   };

   op_deriv_2 f x       =  op f (iv' 2$) x where
   {
      op :: (V{a}->V{b})->V{}->V{a}->V{b a-2} @"[eficalculus?]Efi.Calculus::NthDerivative";
   };

   op_deriv_3 f x       =  op f (iv' 3$) x where
   {
      op :: (V{a}->V{b})->V{}->V{a}->V{b a-3} @"[eficalculus?]Efi.Calculus::NthDerivative";
   };

   op_deriv_4 f x       =  op f (iv' 4$) x where
   {
      op :: (V{a}->V{b})->V{}->V{a}->V{b a-4} @"[eficalculus?]Efi.Calculus::NthDerivative";
   };

   op_deriv_5 f x       =  op f (iv' 5$) x where
   {
      op :: (V{a}->V{b})->V{}->V{a}->V{b a-5} @"[eficalculus?]Efi.Calculus::NthDerivative";
   };

   op_deriv_n :: (V{}->V{a})->V{}->V{a}->V{a} @"[eficalculus?]Efi.Calculus::NthDerivative";

// Other Implementations

   op_limit        _ _  = error "symbolic operator only";
   op_limitleft    _ _  = error "symbolic operator only";
   op_limitright   _ _  = error "symbolic operator only";
   op_indef_integral _  = error "symbolic operator only";
// Module Imports


// Relational Operators

// Changed for bug # 060627-084155; see explanation farther down in file.
   op_not      :: V{a}->V{};
// op_not      :: Bool->Bool;
   op_or       :: V{a}->V{b}->V{};
   op_and      :: V{a}->V{b}->V{};
   op_lt       :: V{a}->V{a}->V{};
   op_gt       :: V{a}->V{a}->V{};
   op_leq      :: V{a}->V{a}->V{};
   op_geq      :: V{a}->V{a}->V{};
   op_xor      :: V{a}->V{b}->V{};

// Arithmetic Operators

   op_nthroot  :: V{}->V{}->V{}           @ 64;
   op_add      :: V{a}->V{a}->V{a}        @ 65;
   op_sub      :: V{a}->V{a}->V{a}        @ 66;
   op_negate   :: V{a}->V{a}              @ 69;
   op_conjugate:: V{a}->V{a}              @"[eficore?]Efi.Core::conjugate";
   op_factorial:: V{}->V{}                @"[eficore?]Efi.Core::fact";
   op_sqrt     :: V{a 2}->V{a}            @"[eficore?]Efi.Core::sqrt";

// Core Functions

   mc_acos     :: V{}->V{}                @"[eficore?]Efi.Core::acos";
   mc_acosh    :: V{}->V{}                @"[eficore?]Efi.Core::acosh";
   mc_acot     :: V{}->V{}                @"[eficore?]Efi.Core::acot";
   mc_acoth    :: V{}->V{}                @"[eficore?]Efi.Core::acoth";
   mc_acsc     :: V{}->V{}                @"[eficore?]Efi.Core::acsc";
   mc_acsch    :: V{}->V{}                @"[eficore?]Efi.Core::acsch";
   mc_angle    :: V{a}->V{a}->V{}         @"[eficore?]Efi.Core::angle";
   mc_arg      :: V{a}->V{}               @"[eficore?]Efi.Core::arg";
   mc_asec     :: V{}->V{}                @"[eficore?]Efi.Core::asec";
   mc_asech    :: V{}->V{}                @"[eficore?]Efi.Core::asech";
   mc_asin     :: V{}->V{}                @"[eficore?]Efi.Core::asin";
   mc_asinh    :: V{}->V{}                @"[eficore?]Efi.Core::asinh";
   mc_atan     :: V{}->V{}                @"[eficore?]Efi.Core::atan";
   mc_atan2    :: V{a}->V{a}->V{}         @"[eficore?]Efi.Core::atan2";
   mc_atanh    :: V{}->V{}                @"[eficore?]Efi.Core::atanh";
   mc_ceil     :: V{}->V{}                @"[eficore?]Efi.Core::ceil";
   mc_Ceil     :: V{a}->V{a}->V{a}        @"[eficore?]Efi.Core::Ceil";
   mc_ceilMc11 :: V{}->V{}                @"[eficore?]Efi.Core::ceilFuzzy";
   mc_CeilMc11 :: V{a}->V{a}->V{a}        @"[eficore?]Efi.Core::CeilFuzzy";
   mc_cnorm    :: V{}->V{}                @"[eficore?]Efi.Core::cnorm";
   mc_cos      :: V{}->V{}                @"[eficore?]Efi.Core::cos";
   mc_cosh     :: V{}->V{}                @"[eficore?]Efi.Core::cosh";
   mc_cot      :: V{}->V{}                @"[eficore?]Efi.Core::cot";
   mc_coth     :: V{}->V{}                @"[eficore?]Efi.Core::coth";
   mc_csc      :: V{}->V{}                @"[eficore?]Efi.Core::csc";
   mc_csch     :: V{}->V{}                @"[eficore?]Efi.Core::csch";
   mc_csgn     :: V{a}->V{}               @"[eficore?]Efi.Core::csign";
   mc_erf      :: V{}->V{}                @"[eficore?]Efi.Core::erf";
   mc_erfc     :: V{}->V{}                @"[eficore?]Efi.Core::erfc";
   mc_exp      :: V{}->V{}                @"[eficore?]Efi.Core::exp";
   mc_floor    :: V{}->V{}                @"[eficore?]Efi.Core::floor";
   mc_Floor    :: V{a}->V{a}->V{a}        @"[eficore?]Efi.Core::Floor";
   mc_floorMc11:: V{}->V{}                @"[eficore?]Efi.Core::floorFuzzy";
   mc_FloorMc11:: V{a}->V{a}->V{a}        @"[eficore?]Efi.Core::FloorFuzzy";
   mc_Im       :: V{a}->V{a}              @"[eficore?]Efi.Core::im";
   mc_ln0      :: V{}->V{}                @"[eficore?]Efi.Core::log0";
   mc_ln       :: V{}->V{}                @"[eficore?]Efi.Core::log";
   mc_mod      :: V{a}->V{a}->V{a}        @"[eficore?]Efi.Core::mod";
   mc_Re       :: V{a}->V{a}              @"[eficore?]Efi.Core::re";
   mc_Round    :: V{a}->V{a}->V{a}        @"[eficore?]Efi.Core::Round";
   mc_sec      :: V{}->V{}                @"[eficore?]Efi.Core::sec";
   mc_sech     :: V{}->V{}                @"[eficore?]Efi.Core::sech";
   mc_sign     :: V{a}->V{}               @"[eficore?]Efi.Core::sign";
   mc_signum   :: V{a}->D{}->V{};       //@"[eficore?]Efi.Core::signum"; // wrapped below. -kmp 11-Apr-2006
   mc_sin      :: V{}->V{}                @"[eficore?]Efi.Core::sin";
   mc_sinc     :: V{}->V{}                @"[eficore?]Efi.Core::sinc";
   mc_sinh     :: V{}->V{}                @"[eficore?]Efi.Core::sinh";
   mc_tan      :: V{}->V{}                @"[eficore?]Efi.Core::tan";
   mc_tanh     :: V{}->V{}                @"[eficore?]Efi.Core::tanh";
   mc_trunc    :: V{}->V{}                @"[eficore?]Efi.Core::trunc";
   mc_Trunc    :: V{a}->V{a}->V{a}        @"[eficore?]Efi.Core::Trunc";
   mc_truncMc11:: V{}->V{}                @"[eficore?]Efi.Core::truncFuzzy";
   mc_TruncMc11:: V{a}->V{a}->V{a}        @"[eficore?]Efi.Core::TruncFuzzy";
   mc_sleep    :: V{}->V{}                @"[eficore?]Efi.Core::sleep";
   mc_δ        :: V{}->V{}->V{}           @"[eficore?]Efi.Core::delta";
   mc_Φ        :: V{a}->V{}               @"[eficore?]Efi.Core::heaviside";
   mc_vec2str  :: V{}->V{}                @ "[eficore?]Efi.Core::vec2str";
   mc_str2vec  :: V{}->V{}                @ "[eficore?]Efi.Core::str2vec";
   mc_str2num  :: V{}->V{}                @ "[eficore?]Efi.Core::str2num";
   parse_number:: String->F8{}            @ "[eficore?]Efi.Core::parse_number";

// Other Core Functions

   op_element_of_C :: V{}->V{};
   op_element_of_Q :: V{}->V{};
   op_element_of_R :: V{}->V{};
   op_element_of_Z :: V{}->V{};

   mc_IsNaN    :: V{a}->V{};
   mc_IsArray  :: a->V{};
   mc_IsScalar :: a->V{};
   mc_IsString :: a->V{};
   mc_error    :: V{a}->b;
   mc_log      :: V{}->D{}->V{};
   mc_round    :: V{}->D{}->V{};
   mc_strlen   :: V{a}->V{};
   mc_concat   :: N(V{a})->V{b};
   mc_search   :: O->V{a}->V{b}->V{}->V{};
   mc_substr   :: O->V{a}->V{}->V{}->V{b};
   mc_num2str  :: V{}->V{a};

// Implementation
   
   op_element_of_C x = mc_IsScalar x;
   op_element_of_Q x = error "symbolic operator only";
   op_element_of_R x = bv(is_real x);
   op_element_of_Z x = bv(is_int x);

   mc_IsArray o         = bv(not_null(f o)) where {f::o->NullOr MatVal @ 48;};
   mc_IsScalar o        = bv(not_null(f o)) where {f::o->NullOr NumVal @ 49;};
   mc_IsString o        = bv(not_null(f o)) where {f::o->NullOr String @ 50;};
   mc_error v           = error (as_string_a 1$ v);

   op_lt  x y           = vectorize_2' lt  x y;
   op_leq x y           = vectorize_2' leq x y;
   op_gt  x y           = vectorize_2' gt  x y;
   op_geq x y           = vectorize_2' geq x y;
//
// We're translating this differently now, with the bv(...) and as_bool(...)
// always explicitly inserted, so it's not needed here.  
// This fixes bug # 060627-084155. -kmp 28-Jun-2006
//
   op_not a             = bv(not(as_bool a));
// op_not a             = not a;
   op_xor a b           = bv(as_bool a `xor` as_bool b);
   op_or  a b           = ibv(if as_bool a then 1$ else if as_bool b then 1$ else 0$);
   op_and a b           = ibv(if as_bool a then if as_bool b then 1$ else 0$ else 0$);

// Constants

   inline 1 mc_e, mc_π, mc_∞, mc__25_, mc_γ;

   mc_e                 = rv' e';                        // e
   mc_π                 = rv' pi';                       // pi
   mc_∞                 = rv' 1.0e307$;                  // infinity
   mc__25_              = rv' 0.01$;                     // percent
   mc_γ                 = rv' gamma';                    // Euler-Mascheroni 
                                                         // constant

// Mathcad represents the special value 'NaN' as 'positive infinity'. The code
// generator has trouble generating a reference to this field for some reason,
// so the class 'NumVal' exports a copy of it instead.

   mc_NaN               = rv' n where
   {
      n :: F8{a}        @ "[mplrun]Mcd.NumVal::NaN";     // NaN
   };

   mc_undefined         = mc_NaN;

// Temporary binding for testing.

   mc_IEEE754Infinity   = rv' n where
   {
      n :: F8{}         @ "[mplrun]Mcd.NumVal::Inf";     // Positive infinity
   };

// Return true if either real or imaginary part of a scalar is a NaN
// otherwise false.
   mc_IsNaN (Num x)     = ibv ((isnan_f8 (real' x)) `add_i4` (isnan_f8 (imag' x)))
      where {
         isnan_f8 :: F8{a}->I4 @ "[eficore?]Efi.Core::isnan";
      };

   mc_IsNaN _           = iv' 0$;      // false for non NumVals

// Return the logarithm of 'a' with respect to the base 'b',where 'b' defaults
// to base 10.

   mc_log a b           =  f a (b|=iv' 10$) where
   {
      f::V{}->V{}->V{}  @  "[eficore?]Efi.Core::logb";
   };

   mc_round a b         =  f a (b|=iv' 0$) where
   {
      f::V{}->V{}->V{}  @  "[eficore?]Efi.Core::round";
   };

// Return the length of the string 'ss'.

   mc_strlen ss         =  iv'(f s) where
   {
      f::String->I4     @  "instance[mscorlib]System.String::get_Length()";
      s                 =  as_string_a 1$ ss;
   };

// Return the concatenation of the strings given in the vector 'v'. The local
// function 'g' returns the index of the first non-string element in the list
// in the event that the the system string concatenation function fails.

   mc_concat v          =  try sv(f v) catch
   {
      e -> arg_error "must be string" (g 1$ (vfrom v));
   }
   where
   {
      f::a->String      @  "[mscorlib]System.String::Concat(System.String[])";

      g i []            = i;                             // First non string
      g i (h:t)
         | is_string  h = g (i`add_i4`1$) t              // Keep on looking
         | else         = i;                             // Found non-string
   };

// Return the index of the first occurrence of the string 'tt' within string
// 'ss', starting at position 'mm', or -1 if no such substring can be found.

   mc_search oo ss tt mm = try iv' (adjust (f s t m)) catch
   {
      e -> arg_error "index out of bounds" 3$;
   }
   where
   {
      f :: String->String->I4->I4 @ "instance[mscorlib]System.String::IndexOf(System.String,System.Int32)";
      s                 = as_string_a        1$ ss;
      t                 = as_string_a        2$ tt;
      m                 = as_string_index_a  3$ oo mm;
      adjust i
       | ib x           = add_i4 i oo
       | else           = i
      where
      {
         x :: I4 @"[mplrun]Mcd.RuntimeOptions::strings_indexed_from_origin";
      };
   };

// Returns arg2 (default 1) if z = 0 and z/|z| otherwise.

   mc_signum a b         =  signum2 a (b|=iv' 1$) where
   {
      signum2::V{a}->V{}->V{} @ "[eficore?]Efi.Core::signum";
   };

// Return the substring of up to 'nn' characters of 'ss' that begins at index
// 'mm'.

   mc_substr oo ss mm nn
      | ib(n`clt_i4`0$) =  arg_error "must be non-negative" 3$
      | else            =  try sv(sub s m (min(len s `sub_i4` m) n)) catch
   {
      e -> arg_error "index out of bounds" 2$;           // Report an error
   }
   where
   {
      sub::String->I4->I4->String  @ "instance[mscorlib]System.String::Substring(System.Int32,System.Int32)";
      len::String->I4              @ "instance[mscorlib]System.String::get_Length()";
      min::I4->I4->I4              @ "[mscorlib]System.Math::Min(System.Int32,System.Int32)";
      s = as_string_a        1$ ss;                      // Parent string
      m = as_string_index_a  2$ oo mm;                   // Substring index
      n = as_i4_a            3$ nn;                      // Substring length
   };

// Format the scalar 'vv' as a string. We check that 'vv' is in fact a scalar,
// then pass it to the function ToString() that every .NET object implements.

   mc_num2str vv        = sv(f(as_number_a 1$ vv)) where
   {
      f::a->String @ "virtual[mscorlib]System.Object::ToString()";
   };
// Module Imports


// Debug Functions

   mc_format   :: (Object,String)->N (Object,String)->V{}         @"[efidebug?]Efi.Debug::format";
   mc_trace	   :: (i->o)->(Object,String)->N (Object,String)->V{}	@"[efidebug?]Efi.Debug::trace";
   mc_pause	   :: (i->o)->(Object,String)->N (Object,String)->V{}	@"[efidebug?]Efi.Debug::pause";
// Module Imports


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
// Module Imports


// Finance Functions

   mc_cnper :: V{}->V{a}->V{a}->V{}                  @"[efifinance?]Efi.Finance::cnper";
   mc_crate :: V{}->V{a}->V{a}->V{}                  @"[efifinance?]Efi.Finance::crate";
   mc_cumint:: V{}->V{}->V{a}->V{}->V{}->D{}->V{a}   @"[efifinance?]Efi.Finance::cumint";
   mc_cumprn:: V{}->V{}->V{a}->V{}->V{}->D{}->V{a}   @"[efifinance?]Efi.Finance::cumprn";
   mc_eff   :: V{}->V{}->V{}                         @"[efifinance?]Efi.Finance::eff";
   mc_fv    :: V{}->V{}->V{a}->D{a}->D{}->V{a}       @"[efifinance?]Efi.Finance::fv";
   mc_fvadj :: V{a}->V{}->V{a}                       @"[efifinance?]Efi.Finance::fvadj";
   mc_fvc   :: V{}->V{a}->V{a}                       @"[efifinance?]Efi.Finance::fvc";
   mc_ipmt  :: V{}->V{}->V{}->V{a}->D{a}->D{}->V{a}  @"[efifinance?]Efi.Finance::ipmt";
   mc_irr   :: V{a}->D{}->V{}                        @"[efifinance?]Efi.Finance::irr";
   mc_mirr  :: V{a}->V{}->V{}->V{}                   @"[efifinance?]Efi.Finance::mirr";
   mc_nom   :: V{}->V{}->V{}                         @"[efifinance?]Efi.Finance::nom";
   mc_nper  :: V{}->V{a}->V{a}->D{a}->D{}->V{}       @"[efifinance?]Efi.Finance::nper";
   mc_npv   :: V{}->V{a}->V{a}                       @"[efifinance?]Efi.Finance::npv";
   mc_pmt   :: V{}->V{}->V{a}->D{a}->D{}->V{a}       @"[efifinance?]Efi.Finance::pmt";
   mc_ppmt  :: V{}->V{}->V{}->V{a}->D{a}->D{}->V{a}  @"[efifinance?]Efi.Finance::ppmt";
   mc_pv    :: V{}->V{}->V{a}->D{a}->D{}->V{a}       @"[efifinance?]Efi.Finance::pv";
   mc_rate  :: V{}->V{a}->V{a}->D{a}->D{}->D{}->V{}  @"[efifinance?]Efi.Finance::rate";

// Other Functions

   mc_time  :: V{}->V{}                            @"[efifinance?]Efi.Finance::time";
// Module Imports


// Fitting Functions

 //Mathcad 'Classic' versions

   mc_expfit      :: T->V{}->V{}->D{}->V{}                  @"[efiFitting?]Efi.Fitting::expfit";
   mc_lgsfit      :: T->V{}->V{}->V{}->V{}                  @"[efiFitting?]Efi.Fitting::lgsfit";
   mc_logfit      :: T->V{}->V{}->V{}->V{}                  @"[efiFitting?]Efi.Fitting::logfit";
   mc_pwrfit      :: T->V{}->V{}->V{}->V{}                  @"[efiFitting?]Efi.Fitting::pwrfit";
   mc_sinfit      :: T->V{}->V{}->V{}->V{}                  @"[efiFitting?]Efi.Fitting::sinfit";
   mc_genfit      :: T->I I4->V{}->V{}->V{}->(V{}->a)->V{};

// Interpolation Functions

   mc_bspline     :: V{}->V{}->V{}->V{}->V{}                @"[efiFitting?]Efi.Fitting::bspline";
   mc_cspline     :: V{a}->V{b}->V{b a-2}                   @"[efiFitting?]Efi.Fitting::cspline";
   mc_intercept   :: V{a}->V{b}->V{b}                       @"[efiFitting?]Efi.Fitting::intercept";
   mc_interp      :: V{a}->V{b}->V{c}->V{b}->V{c}           @"[efiFitting?]Efi.Fitting::interp";
   mc_ksmooth     :: V{a}->V{b}->V{a}->V{b}                 @"[efiFitting?]Efi.Fitting::ksmooth";
   mc_line        :: V{}->V{a}->V{a}                        @"[efiFitting?]Efi.Fitting::line";
   mc_linfit      :: V{}->V{}->(V{}->V{})->V{}              @"[efiFitting?]Efi.Fitting::linfit";
   mc_linterp     :: V{a}->V{b}->V{a}->V{b}                 @"[efiFitting?]Efi.Fitting::linterp";
   mc_lnfit       :: V{}->V{}->V{}                          @"[efiFitting?]Efi.Fitting::lnfit";
   mc_loess       :: V{}->V{}->V{}->V{}                     @"[efiFitting?]Efi.Fitting::loess";
   mc_lspline     :: V{a}->V{b}->V{b a-2}                   @"[efiFitting?]Efi.Fitting::lspline";
   mc_medfit      :: V{a}->V{b}->V{b a-1}                   @"[efiFitting?]Efi.Fitting::medfit";
   mc_medsmooth   :: V{a}->V{}->V{a}                        @"[efiFitting?]Efi.Fitting::medsmooth";
   mc_pspline     :: V{a}->V{b}->V{b a-2}                   @"[efiFitting?]Efi.Fitting::pspline";
   mc_regress     :: V{}->V{}->V{}->V{}                     @"[efiFitting?]Efi.Fitting::regress";
   mc_slope       :: V{a}->V{b}->V{b a-1}                   @"[efiFitting?]Efi.Fitting::slope";
   mc_supsmooth   :: V{a}->V{b}->V{b}                       @"[efiFitting?]Efi.Fitting::supsmooth";

// Root Finding Functions

   mc_root         :: T->(V{a}->V{b})->V{a}->V{a}           @"[efiFitting?]Efi.Fitting::root";
   mc_root_bracket_:: T->(V{a}->V{b})->V{a}->V{a}->V{a}     @"[efiFitting?]Efi.Fitting::root_bracket";
   mc_polyroots    :: I I4->V{a}->V{}                       @"[efiFitting?]Efi.Fitting::polyroots";

// Implementations

   mc_genfit t 0$ x y p f = g t x y p f where
   {
      g :: T->V{}->V{}->V{}->(V{}->a)->V{} @"[efiFitting?]Efi.Fitting::genfit2";
   };

   mc_genfit t _ x y p f = g t x y p f where
   {
      g :: T->V{}->V{}->V{}->(V{}->a)->V{} @"[efiFitting?]Efi.Fitting::genfit";
   };
// Module Imports


// Fourier Functions

   mc_fft      :: V{a}->V{a}        @"[efifourier?]Efi.Fourier::fft";
   mc_FFT      :: V{a}->V{a}        @"[efifourier?]Efi.Fourier::FFT";
   mc_cfft     :: V{a}->V{a}        @"[efifourier?]Efi.Fourier::cfft";
   mc_CFFT     :: V{a}->V{a}        @"[efifourier?]Efi.Fourier::CFFT";
   mc_ifft     :: V{a}->V{a}        @"[efifourier?]Efi.Fourier::ifft";
   mc_IFFT     :: V{a}->V{a}        @"[efifourier?]Efi.Fourier::IFFT";
   mc_icfft    :: V{a}->V{a}        @"[efifourier?]Efi.Fourier::icfft";
   mc_ICFFT    :: V{a}->V{a}        @"[efifourier?]Efi.Fourier::ICFFT";
   mc_wave     :: V{}->V{}          @"[efifourier?]Efi.Fourier::wave";
   mc_iwave    :: V{}->V{}          @"[efifourier?]Efi.Fourier::iwave";
// Module Imports


// Graphics Functions

   mc_pol2xy      :: V{}->D{}->V{};
   mc_xy2pol      :: V{}->D{}->V{};
   mc_cyl2xyz     :: V{}->D{}->D{}->V{};
   mc_sph2xyz     :: V{}->D{}->D{}->V{};
   mc_xyz2cyl     :: V{}->D{}->D{}->V{};
   mc_xyz2sph     :: V{}->D{}->D{}->V{};
   mc_CreateMesh  :: I I4->(V{}->V{}->V{})->NullOr(V{}->a)->N(V{})->V{}   @"[efigraphics?]Efi.Graphics::CreateMesh";
   mc_CreateSpace :: I I4->(V{}->V{})->NullOr(V{}->a)->N(V{})->V{}        @"[efigraphics?]Efi.Graphics::CreateSpace";
   mc_CreateMesh3 ::(V{}->V{}->V{})->(V{}->V{}->V{})->(V{}->V{}->V{})->NullOr(V{}->a)->N(V{})->V{};
   mc_CreateSpace3::(V{}->V{})->(V{}->V{})->(V{}->V{})->NullOr(V{}->a)->N(V{})->V{};
   mc_PolyLookup  :: V{}->V{}                                           @"[efigraphics?]Efi.Graphics::LookupPolyhedron";
   mc_Polyhedron  :: V{a}->V{a};

// Converts the polar coordinates of a point in 2D space to rectangular co-
// ordinates.

   mc_pol2xy rr tt      = rvec [x,y] where
   {
      (r,t)             = vxy rr tt;
      x                 = r *. cos t;
      y                 = r *. sin t;
   };

// Converts the rectangular coordinates of a point in 2D space to polar co-
// ordinates.

   mc_xy2pol xx yy      = rvec [r,t] where
   {
      (x,y)             = vxy xx yy;
      r                 = norm x y 0.0;
      t'                = atan2 y x;
      t                 = if t' <. 0.0 then t' +. pi +. pi else t';
   };

// Converts the cylindrical coordinates of a point in 3D space to rectangular
// coordinates.

   mc_cyl2xyz rr tt zz  = rvec [x,y,z] where
   {
      (r,t,z)           = vxyz rr tt zz;
      x                 = r *. cos t;
      y                 = r *. sin t;
   };

// Converts the rectangular coordinates of a point in 3D space to cylindrical
// coordinates.

   mc_xyz2cyl xx yy zz  = rvec [r,t,z] where
   {
      (x,y,z)           = vxyz xx yy zz;
      r                 = norm x y 0.0;
      t                 = atan2 y x;
   };

// Converts the polar coordinates of a point in 3D space to rectangular co-
// ordinates.

   mc_sph2xyz rr tt pp  = rvec [rsp*.cos(t),rsp*.sin(t),r*.cos(p)] where
   {
      (r,t,p)           = vxyz rr tt pp;
      rsp               = r *. sin(p);
   };

// Converts the rectangular coordinates of a point in 3D space to spherical
// coordinates.

   mc_xyz2sph xx yy zz  = rvec [r,t,p] where
   {
      (x,y,z)           = vxyz xx yy zz;
      r                 = norm x y z;
      t                 = atan2 y x;
      p                 = acos(z /. r);
   };

// Mesh functions

   mc_CreateMesh3 f1 f2 f3 fmap opts = mc_CreateMesh 3$ f fmap opts where
   {
      f u v = init_vector 3$ [f1 u v,f2 u v,f3 u v];
   };

   mc_CreateSpace3 f1 f2 f3 fmap opts = mc_CreateSpace 3$ f fmap opts where
   {
      f u   = init_vector 3$ [f1 u,f2 u,f3 u];
   };

// Generates the uniform polyhedron whose name, number code, or Wythoff symbol
// is 's'. Just a no-op since the code has now moved into the 3D plot control.

   mc_Polyhedron s      = sv(as_string_a 1$ s);

//****************************************************************************

// Return the 'i'th element of the given real vector.

   (!)                 :: MatVal(Value{a})->I4->Real{a};
   (!) v i              = R (f v i) where
   {
      f :: MatVal(Value{a})->I4->F8{a} @ "instance[mplrun]Mcd.MatVal::get_real(System.Int32)";
   };

// Parse the arguments for either a 2-vector or 2 real scalars.

   vxy                 :: V{}->D{}->(Real{},Real{});
   vxy vv Null
      | rows v == 2     = (v!0$,v!1$)                    // Return in a pair
      | else            = arg_error "must be a 2 element vector" 1$ where
   {
      v                 = as_real_vector_a 1$ vv;        // ...the real vector
   };

   vxy xx (Really yy)   = (x,y) where                    // Return in a pair
   {
      x                 = as_real_a 1$ xx;               // ...the x coordinate
      y                 = as_real_a 2$ yy;               // ...the y coordinate
   };

// Parse the arguments for either a 3-vector or 3 real scalars.

   vxyz                :: V{}->D{}->D{}->(Real{},Real{},Real{});
   vxyz vv Null Null
      | rows v == 3     = (v!0$,v!1$,v!2$)               // Return in a triple 
      | else            = arg_error "must be a 3 element vector" 1$ where
   {
      v = as_real_vector_a 1$ vv;                        // ...fetch the vector
   };

   vxyz xx (Really yy) (Really zz) = (x,y,z) where       // Return in a triple
   {
      x = as_real_a 1$ xx;                               // ...the x coordinate
      y = as_real_a 2$ yy;                               // ...the y coordinate
      z = as_real_a 3$ zz;                               // ...the z coordinate
   };

   vxyz _ _ _           = arg_error "too_few_arguments\t3\t2" 0$;

// Return the Euclidean norm of the vector with Cartesian coordinates 'x', 'y'
// and 'z'.

   norm                :: Real{} -> Real{} -> Real{} -> Real{};
   norm x y z           = sqrt(x*.x +. y*.y +. z*.z);

// Aliases needed by the plot code.

   sph2xyz              = mc_sph2xyz;
   cyl2xyz              = mc_cyl2xyz;
   createMesh3          = mc_CreateMesh3;
   createSpace3         = mc_CreateSpace3;
// Module Imports


// Input/Output Functions

   mc_READPRN              :: C->V{}->V{}                @"[efiio?]Efi.IO::READPRN";
   mc_WRITEPRN             :: C->P->W->V{}->V{}->V{}     @"[efiio?]Efi.IO::WRITEPRN";
   mc_APPENDPRN            :: C->P->W->V{}->V{}->V{}     @"[efiio?]Efi.IO::APPENDPRN";
   mc_READBMP              :: C->V{}->V{}                @"[efiio?]Efi.IO::READBMP";
   mc_WRITEBMP             :: C->V{}->V{}->V{}           @"[efiio?]Efi.IO::WRITEBMP";
   mc_READRGB              :: C->V{}->V{}                @"[efiio?]Efi.IO::READRGB";
   mc_READ_5F_RED          :: C->V{}->V{}                @"[efiio?]Efi.IO::READ_RED";
   mc_READ_5F_GREEN        :: C->V{}->V{}                @"[efiio?]Efi.IO::READ_GREEN";
   mc_READ_5F_BLUE         :: C->V{}->V{}                @"[efiio?]Efi.IO::READ_BLUE";
   mc_WRITERGB             :: C->V{}->V{}->V{}           @"[efiio?]Efi.IO::WRITERGB";
   mc_READ_5F_HLS          :: C->V{}->V{}                @"[efiio?]Efi.IO::READ_HLS";
   mc_READ_5F_HLS_5F_HUE   :: C->V{}->V{}                @"[efiio?]Efi.IO::READ_HLS_HUE";
   mc_READ_5F_HLS_5F_LIGHT :: C->V{}->V{}                @"[efiio?]Efi.IO::READ_HLS_LIGHT";
   mc_READ_5F_HLS_5F_SAT   :: C->V{}->V{}                @"[efiio?]Efi.IO::READ_HLS_SAT";
   mc_READ_5F_HSV          :: C->V{}->V{}                @"[efiio?]Efi.IO::READ_HSV";
   mc_READ_5F_HSV_5F_HUE   :: C->V{}->V{}                @"[efiio?]Efi.IO::READ_HSV_HUE";
   mc_READ_5F_HSV_5F_SAT   :: C->V{}->V{}                @"[efiio?]Efi.IO::READ_HSV_SAT";
   mc_READ_5F_HSV_5F_VALUE :: C->V{}->V{}                @"[efiio?]Efi.IO::READ_HSV_VALUE";
   mc_READ_5F_IMAGE        :: C->V{}->V{}                @"[efiio?]Efi.IO::READ_IMAGE";
   mc_WRITE_5F_HLS         :: C->V{}->V{}->V{}           @"[efiio?]Efi.IO::WRITE_HLS";
   mc_WRITE_5F_HSV         :: C->V{}->V{}->V{}           @"[efiio?]Efi.IO::WRITE_HSV";
   mc_READBIN              :: C->N(V{})->V{}             @"[efiio?]Efi.IO::READBIN";
   mc_WRITEBIN             :: C->V{}->V{}->V{}->V{}->V{} @"[efiio?]Efi.IO::WRITEBIN";
   mc_GETWAVINFO           :: C->V{}->V{}                @"[efiio?]Efi.IO::GETWAVINFO";
   mc_READWAV              :: C->V{}->V{}                @"[efiio?]Efi.IO::READWAV";
   mc_WRITEWAV             :: C->V{}->V{}->V{}->V{}->V{} @"[efiio?]Efi.IO::WRITEWAV";
   mc_LoadColormap         :: V{}->V{}                   @"[efiio?]Efi.IO::LoadColormap";
   mc_SaveColormap         :: V{}->V{}->V{}              @"[efiio?]Efi.IO::SaveColormap";

// Datawizard Functions

   mc_READFILE             :: C->N(V{})->V{}             @"[efiio?]Efi.IO::READFILE";
// Module Imports


// Intel Math Kernel Library versions

   mc_eigenvals    :: V{a}->V{a}                      @"[efimatrix?]Efi.IntelMKL::eigenvals";
   mc_eigenvecs    :: V{a}->D{}->V{}                  @"[efimatrix?]Efi.IntelMKL::eigenvecs";
   mc_genvals      :: V{a}->V{b}->V{a b-1}            @"[efimatrix?]Efi.IntelMKL::genvals";
   mc_genvecs      :: V{a}->V{b}->D{}->V{}            @"[efimatrix?]Efi.IntelMKL::genvecs";
   mc_lsolve       :: V{a}->V{b}->V{a-1 b}            @"[efimatrix?]Efi.IntelMKL::lsolve";
   mc_svds         :: V{a}->V{a}                      @"[efimatrix?]Efi.IntelMKL::svds";
   mc_svd2         :: V{a}->V{a}                      @"[efimatrix?]Efi.IntelMKL::svd";
   mc_eigenvec     :: V{a}->V{a}->V{}                 @"[efimatrix?]Efi.Matrix::eigenvec";
   mc_svd          :: V{}->V{}                        @"[efimatrix?]Efi.Matrix::svd";

// Matrix Operators

   op_power       :: V{}->V{}->V{}                    @ 63;
   op_mult        :: V{a}->V{b}->V{a b}               @ 67;
   op_div         :: V{a}->V{b}->V{a b-1}             @ 68;
   op_sqr         :: V{a}->V{a 2}                     @"[efimatrix?]Efi.Matrix::sqr";
   op_abs         :: V{a}->V{a}                       @"[efimatrix?]Efi.Matrix::abs";
   op_det         :: M (V{})->V{}                     @"[efimatrix?]Efi.Matrix::det";
   op_cross       :: V{a}->V{b}->V{a b}               @"[efimatrix?]Efi.Matrix::crossprod";
   op_sigmasum    :: V{a}->V{a}                       @"[efimatrix?]Efi.Matrix::sigmasum";
   op_transpose   :: M a->M a                         @"[efimatrix?]Efi.Matrix::transpose";

// Matrix Functions

   mc_augment     :: N(M a)->M a                      @"[efimatrix?]Efi.Matrix::augment";
   mc_cholesky    :: V{a 2}->V{a}                     @"[efimatrix?]Efi.Matrix::cholesky";
   mc_cols        :: M a->V{}                         @"[efimatrix?]Efi.Matrix::cols";
   mc_cond1       :: V{a}->V{}                        @"[efimatrix?]Efi.Matrix::cond1";
   mc_cond2       :: V{a}->V{}                        @"[efimatrix?]Efi.Matrix::cond2";
   mc_conde       :: V{a}->V{}                        @"[efimatrix?]Efi.Matrix::conde";
   mc_condi       :: V{a}->V{}                        @"[efimatrix?]Efi.Matrix::condi";
   mc_csort       :: O->V{a}->V{}->V{a}               @"[efimatrix?]Efi.Matrix::csort";
   mc_diag        :: V{a}->V{a}                       @"[efimatrix?]Efi.Matrix::diag";
   mc_gcd         :: N(V{})->V{}                      @"[efimatrix?]Efi.Matrix::gcd";
   mc_geninv      :: T->V{a}->V{a-1}                  @"[efimatrix?]Efi.Matrix::geninv";
   mc_identity    :: V{}->V{}                         @"[efimatrix?]Efi.Matrix::identity";
   mc_last        :: O->M a->V{}                      @"[efimatrix?]Efi.Matrix::last";
   mc_lcm         :: N(V{})->V{}                      @"[efimatrix?]Efi.Matrix::lcm";
   mc_length      :: M a->V{}                         @"[efimatrix?]Efi.Matrix::length";
   mc_lu          :: V{}->V{}                         @"[efimatrix?]Efi.Matrix::lu";
   mc_matrix      :: V{}->V{}->(V{}->V{}->a)->M a     @"[efimatrix?]Efi.Matrix::matrix";
   mc_max         :: N(V{a})->V{a}                    @"[efimatrix?]Efi.Matrix::max";
   mc_min         :: N(V{a})->V{a}                    @"[efimatrix?]Efi.Matrix::min";
   mc_norm1       :: V{a}->V{a}                       @"[efimatrix?]Efi.Matrix::norm1";
   mc_norm2       :: V{a}->V{a}                       @"[efimatrix?]Efi.Matrix::norm2";
   mc_norme       :: V{a}->V{a}                       @"[efimatrix?]Efi.Matrix::norme";
   mc_normi       :: V{a}->V{a}                       @"[efimatrix?]Efi.Matrix::normi";
   mc_qr          :: V{a 2}->V{a}                     @"[efimatrix?]Efi.Matrix::qr";
   mc_rank        :: V{a}->V{}                        @"[efimatrix?]Efi.Matrix::rank";
   mc_rref        :: V{}->V{}                         @"[efimatrix?]Efi.Matrix::rref";
   mc_rsort       :: O->V{a}->V{}->V{a}               @"[efimatrix?]Efi.Matrix::rsort";
   mc_tr          :: V{a}->V{a}                       @"[efimatrix?]Efi.Matrix::tr";
   mc_rows        :: M a->V{}                         @"[efimatrix?]Efi.Matrix::rows";
   mc_reverse     :: M a->M a                         @"[efimatrix?]Efi.Matrix::reverse";
   mc_submatrix   :: O->M a->V{}->V{}->V{}->V{}->M a  @"[efimatrix?]Efi.Matrix::submatrix";
   mc_skew        :: N(V{a})->V{}                     @"[efimatrix?]Efi.Matrix::skew";
   mc_sort        :: V{a}->V{a}                       @"[efimatrix?]Efi.Matrix::sort";
   mc_stack       :: N(M a)->M a                      @"[efimatrix?]Efi.Matrix::stack";

// Lookup Functions

   mc_match       :: O->T->V{a}->V{a}->V{}            @"[efimatrix?]Efi.Matrix::Match";
   mc_lookup      :: O->T->V{a}->V{a}->V{b}->V{b}     @"[efimatrix?]Efi.Matrix::Lookup";
   mc_hlookup     :: O->T->V{a}->V{a}->V{}->V{a}      @"[efimatrix?]Efi.Matrix::Hlookup";
   mc_vlookup     :: O->T->V{a}->V{a}->V{}->V{a}      @"[efimatrix?]Efi.Matrix::Vlookup";
// Module Imports


// Type Synonyms

   data Trace;                                           // Represents a trace

// 2D Plot Functions

   maketrace   :: I4->a->(b->c)->(d->e)->I4->I4->Trace      @ "[efiplot?]Efi.Plot::maketrace";
   mc_logspace :: V{a}->V{a}->V{}->V{}                      @ "[efiplot?]Efi.Plot::logspace";
   mc_logpts   :: V{}->V{}->V{}->V{}                        @ "[efiplot?]Efi.Plot::logpts";

   cplot callback options xoptions yoptions y2options
         yparams y2params
         ytraces y2traces
         xlimits ylimits y2limits  = cplot' callback options xoptions yoptions y2options
                                      (vector_i4 yparams) (vector_i4 y2params)
                                      (vector ytraces) (vector y2traces)
                                      (vector xlimits) (vector ylimits) (vector y2limits)
	where
   {
      cplot':: (i->o)->
               I4->I4->I4->I4->
               Vector I4->
               Vector I4->
               Vector Trace->
               Vector Trace->
               Vector(Real{a})->Vector(Real{b})->Vector(Real{c})->V{}    @ "[efiplot?]Efi.Plot::cplot";
   };

	vector_trace = maketrace 0$;
	range_trace = maketrace 1$;
	quick_trace = maketrace 2$;
// Module Imports


// Solver Functions

//   op_solve :: I4->                                   // Option bit field
//               F8{}->                                 // Convergence tolerance
//               F8{}->                                 // Constraint tolerance
//               I4->                                   // Minimum-error flag
//               NullOr(a->b)->                         // Objective function
//               I4->                                   // Number of guess vals
//               d->                                    // Initial guesses
//               I4->                                   // Number of constraints
//               e->                                    // Left hand side (tuple)
//               Vector(Value{})->                      // Vector of senses
//               NullOr String->                        // mip_string
//               (Value{}->c)->                         // crazy format
//               (i->o)->                               // Algorithm notification
//               I4->                                   // Is maximization?
//               f->                                    // ignored
//               (f,Value{})                            // Result tuple
//               @ "[efisolver?]Efi.Solver::Solve";

   op_solve_inner ::
               I4->                                   // Option bit field
               F8{}->                                 // Convergence tolerance
               F8{}->                                 // Constraint tolerance
               I4->                                   // Minimum-error flag
               NullOr(a->b)->                         // Objective function
               I4->                                   // Number of guess vals
               a->                                    // Initial guesses
               I4->                                   // Number of constraints
               Vector(a->c) ->                        // Left hand side (vector)
               Vector(Value{})->                      // Vector of senses
               NullOr String->                        // mip_string
               (a->d) ->                              // crazy format
               (i->o)->                               // Algorithm notification
               I4->                                   // Is maximization?
               f->                                    // ignored
               (d,Value{})                            // Result tuple
               @ "[efisolver?]Efi.Solver::Solve";

   // Put constraint argument before guess values
   // Exchange 7th and 9th argument
   op_solve x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 =
      op_solve_inner x1 x2 x3 x4 x5 x6 x9 x8 x7 x10 x11 x12 x13 x14 x15;

// Module Imports


// Special Functions

   mc_bei         :: V{}->V{}->V{}           @"[efispecial?]Efi.Special::Bei";
   mc_ber         :: V{}->V{}->V{}           @"[efispecial?]Efi.Special::Ber";
   mc_mhyper      :: V{}->V{}->V{}->V{}      @"[efispecial?]Efi.Special::Mhyper";
   mc_ibeta       :: V{}->V{}->V{}->V{}      @"[efispecial?]Efi.Special::Ibeta";
   mc_Jac         :: V{}->V{}->V{}->V{}->V{} @"[efispecial?]Efi.Special::Jac";
   mc_Her         :: V{}->V{}->V{}           @"[efispecial?]Efi.Special::Her";
   mc_Lag         :: V{}->V{}->V{}           @"[efispecial?]Efi.Special::Lag";
   mc_Leg         :: V{}->V{}->V{}           @"[efispecial?]Efi.Special::Leg";
   mc_Tcheb       :: V{}->V{}->V{}           @"[efispecial?]Efi.Special::Tcheb";
   mc_Ucheb       :: V{}->V{}->V{}           @"[efispecial?]Efi.Special::Ucheb";
   mc_Γ           :: V{}->D{}->V{}           @"[efispecial?]Efi.Special::Gamma";
   mc_lnΓ         :: V{}->V{}                @"[efispecial?]Efi.Special::LnGamma";
   mc_fhyper      :: V{}->V{}->V{}->V{}->V{} @"[efispecial?]Efi.Special::Fhyper";
// Module Imports


// Probability Density Functions

   mc_dbeta       :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Dbeta";
   mc_dbinom      :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Dbinom";
   mc_dcauchy     :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Dcauchy";
   mc_dchisq      :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Dchisq";
   mc_dexp        :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Dexp";
   mc_dF          :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::DF";
   mc_dgamma      :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Dgamma";
   mc_dgeom       :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Dgeom";
   mc_dhypergeom  :: V{}->V{}->V{}->V{}->V{} @"[efistatistics?]Efi.Statistics::Dhypergeom";
   mc_dlnorm      :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Dlnorm";
   mc_dlogis      :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Dlogis";
   mc_dnbinom     :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Dnbinom";
   mc_dnorm       :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Dnorm";
   mc_dpois       :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Dpois";
   mc_dt          :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Dt";
   mc_dunif       :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Dunif";
   mc_dweibull    :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Dweibull";

// Cumulative Probability Density Functions

   mc_pbeta       :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Pbeta";
   mc_pbinom      :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Pbinom";
   mc_pcauchy     :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Pcauchy";
   mc_pchisq      :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Pchisq";
   mc_pexp        :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Pexp";
   mc_pF          :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::PF";
   mc_pgamma      :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Pgamma";
   mc_pgeom       :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Pgeom";
   mc_phypergeom  :: V{}->V{}->V{}->V{}->V{} @"[efistatistics?]Efi.Statistics::Phypergeom";
   mc_plnorm      :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Plnorm";
   mc_plogis      :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Plogis";
   mc_pnbinom     :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Pnbinom";
   mc_pnorm       :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Pnorm";
   mc_ppois       :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Ppois";
   mc_pt          :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Pt";
   mc_punif       :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Punif";
   mc_pweibull    :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Pweibull";

// Inverse Probability Density Functions

   mc_qbeta       :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Qbeta";
   mc_qbinom      :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Qbinom";
   mc_qcauchy     :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Qcauchy";
   mc_qchisq      :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Qchisq";
   mc_qexp        :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Qexp";
   mc_qF          :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::QF";
   mc_qgamma      :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Qgamma";
   mc_qgeom       :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Qgeom";
   mc_qhypergeom  :: V{}->V{}->V{}->V{}->V{} @"[efistatistics?]Efi.Statistics::Qhypergeom";
   mc_qlnorm      :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Qlnorm";
   mc_qlogis      :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Qlogis";
   mc_qnbinom     :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Qnbinom";
   mc_qnorm       :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Qnorm";
   mc_qpois       :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Qpois";
   mc_qt          :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Qt";
   mc_qunif       :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::Qunif";
   mc_qweibull    :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::Qweibull";

// Random Number Generation Functions

   mc_rbeta       :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::rbeta";
   mc_rbinom      :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::rbinom";
   mc_rcauchy     :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::rcauchy";
   mc_rchisq      :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::rchisq";
   mc_rexp        :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::rexp";
   mc_rF          :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::rF";
   mc_rgamma      :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::rgamma";
   mc_rgeom       :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::rgeom";
   mc_rhypergeom  :: V{}->V{}->V{}->V{}->V{} @"[efistatistics?]Efi.Statistics::rhypergeom";
   mc_rlnorm      :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::rlnorm";
   mc_rlogis      :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::rlogis";
   mc_rnbinom     :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::rnbinom";
   mc_rnorm       :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::rnorm";
   mc_rpois       :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::rpois";
   mc_rt          :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::rt";
   mc_runif       :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::runif";
   mc_rweibull    :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::rweibull";

// Statistical Functions

   mc_combin      :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::combin";
   mc_corr        :: V{a}->V{b}->V{}         @"[efistatistics?]Efi.Statistics::corr";
   mc_correl      :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::correl";
   mc_correl2d    :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::correl2d";
   mc_cvar        :: V{a}->V{b}->V{a b}      @"[efistatistics?]Efi.Statistics::cvar";
   mc_gmean       :: N(V{a})->V{a}           @"[efistatistics?]Efi.Statistics::gmean";
   mc_hist        :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::hist";
   mc_histogram   :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::histogram";
   mc_kurt        :: N(V{a})->V{}            @"[efistatistics?]Efi.Statistics::kurt";
   mc_hmean       :: N(V{a})->V{a}           @"[efistatistics?]Efi.Statistics::hmean";
   mc_rnd         :: V{}->V{}                @"[efistatistics?]Efi.Statistics::rand";
   mc_Seed        :: D{}->V{}                @"[efistatistics?]Efi.Statistics::Seed";
   mc_mean        :: N(V{a})->V{a}           @"[efistatistics?]Efi.Statistics::mean";
   mc_median      :: N(V{a})->V{a}           @"[efistatistics?]Efi.Statistics::median";
   mc_mode        :: N(V{a})->V{a}           @"[efistatistics?]Efi.Statistics::mode";
   mc_permut      :: V{}->V{}->V{}           @"[efistatistics?]Efi.Statistics::permut";
   mc_predict     :: V{}->V{}->V{}->V{}      @"[efistatistics?]Efi.Statistics::predict";
   mc_stderr      :: V{a}->V{b}->V{b}        @"[efistatistics?]Efi.Statistics::std_err";
   mc_stdev       :: N(V{a})->V{a}           @"[efistatistics?]Efi.Statistics::stdev";
   mc_Stdev       :: N(V{a})->V{a}           @"[efistatistics?]Efi.Statistics::Stdev";
   mc_var         :: N(V{a})->V{a 2}         @"[efistatistics?]Efi.Statistics::var";
   mc_Var         :: N(V{a})->V{a 2}         @"[efistatistics?]Efi.Statistics::Var";
// Module Imports

// Module Imports

// Module Imports


//*****************************************************************
// BijectiveMap data type and ancillary functions.
// TODO: This could probably go into a library somewhere;
//       it's not specific to symbolics.
//*****************************************************************

   data Hashtable a b;

   make_hash :: I4 -> Hashtable a b @ "[mscorlib]System.Collections.Hashtable::.ctor(System.Int32)";

   safe_add :: (Hashtable a b) -> a -> b -> (Hashtable a b);
   safe_add h x y = case (add h x y) of { IoVoid _ -> h; }
   where {
    add :: (Hashtable a b) -> a -> b -> IoVoid @ "instance[mscorlib]System.Collections.Hashtable::set_Item(System.Object,System.Object)";
   };

   hlookup :: (Hashtable a b) -> a -> Maybe b;
   hlookup h k
           | is_null lk = Nothing
           | else       = Just (really lk)
   where {
    get :: (Hashtable a b) -> a -> (NullOr b) @ "instance[mscorlib]System.Collections.Hashtable::get_Item(System.Object)";
    lk = get h k;
   };

   data Dups = DError | DAllow;

   // Add the given entry to the table.  The fourth
   // argument indicates how duplicate keys should be handled.
   add_with_check :: (Hashtable a b) -> a -> b -> Dups -> (Hashtable a b);
   add_with_check h x y dups =
       case (hlookup h x) of {
         Nothing -> safe_add h x y;
         _       -> case dups of {
                     DError  -> error "duplicate hash key";
                     DAllow  -> h;
                    };
       };

   make_hash_map :: [(a,b)] -> Hashtable a b;
   make_hash_map l = _add_all l (make_hash lt)
   where {
    (I lt) = length l;
    _add_all ((x,y):r) h = case (add h x y) of {
                            IoVoid _ -> _add_all r h;
                          };
    _add_all _         h = h;
    add :: (Hashtable a b) -> a -> b -> IoVoid @ "instance[mscorlib]System.Collections.Hashtable::set_Item(System.Object,System.Object)";
   };


   data Map a b = Map (Hashtable a b) (Hashtable b a);

   make_map :: [(a,b)] -> Bool -> Map a b;
   make_map l allow_dups = add_entries l dp (Map (make_hash lt)
                                                 (make_hash lt))
   where { (I lt) = length l;
           dp     = if allow_dups then DAllow  else DError;
         };

   add_entries :: [(a,b)] -> Dups -> Map a b -> Map a b;
   add_entries ((x,y):r) dp m@(Map for rev) =
        seq (add_with_check for x y dp)
       (seq (add_with_check rev y x dp)
            (add_entries r dp m));
   add_entries _ _ m = m;



   data BijectiveMap a b = BMap (Map a b);

   make_bijective_map :: [(a,b)] -> BijectiveMap a b;
   make_bijective_map l = BMap (make_map l False);

   blookup :: (BijectiveMap a b) -> a -> Maybe b;
   blookup (BMap (Map for rev)) x = hlookup for x;

   blookupInv :: (BijectiveMap a b) -> b -> Maybe a;
   blookupInv (BMap (Map for rev)) y = hlookup rev y;



   // A ManyToOneMap may contain duplicate entries.
   // When multiple keys map to the same value,
   // mlookupInv will map that value back to the
   // first key which was inserted into the map.
   data ManyToOneMap a b = MMap (Map a b);

   make_many_to_one_map :: [(a,b)] -> ManyToOneMap a b;
   make_many_to_one_map l = MMap (make_map l True);

   mlookup :: (ManyToOneMap a b) -> a -> Maybe b;
   mlookup (MMap (Map for rev)) x = hlookup for x;

   mlookupInv :: (ManyToOneMap a b) -> b -> Maybe a;
   mlookupInv (MMap (Map for rev)) y = hlookup rev y;

//*****************************************************************
// MuPad-specific identifier map.  It maps Mathcad identifiers
// to the corresponding MuPad identifiers, and vice versa.
//
// This map is not one-to-one.  This is because a Mathcad
// identifier can have multiple MuPAD equivalents.
// For example, 'mc_sin' is mapped to our library function
// 'mcad_sin'.  But MuPAD has its own 'sin' function, which
// may occur in results and must also be mapped back
// to 'mc_sin'.  (Note that 'mc_sin' is mapped to 'mcad_sin'
// and not 'sin' because the "mc_sin" <-> "mcad_sin" entry
// precedes the "mc_sin" <-> "sin" entry.)
//
//*****************************************************************

   mupad_funcmap = make_many_to_one_map
   [

    ("_hex_6D635FCEB4",   "mcad_kroneckerDelta"), // lowercase delta
    ("_hex_6D635FCEB4",   "kroneckerDelta"),   // lowercase delta

    ("_hex_6D635FCEA6",   "heaviside"),        // capital phi
    ("_hex_6D635FCE93",   "mcad_gamma"),       // capital gamma
    ("_hex_6D635FCE93",   "gamma"),            // capital gamma
    ("_hex_6D635FCE93",   "igamma"),           // capital gamma
    ("_hex_6D635FCE94",   "mcad_dirac"),       // capital delta
    ("op_element_of",     "op_element_of"),
    ("op_element_of",     "in"),

    ("_hex_6D635FCEB5",   "mcad_tensor_epsilon"), // lowercase epsilon
    ("_hex_6D635FE28888", "xin"),              // kludge, used to implement infix in - see efisymbolicsemitter.mpl

    ("mc_sin",            "mcad_sin"),
    ("mc_sin",            "sin"),
    ("mc_cos",            "mcad_cos"),
    ("mc_cos",            "cos"),
    ("mc_tan",            "mcad_tan"),
    ("mc_tan",            "tan"),
    ("mc_sec",            "mcad_sec"),
    ("mc_sec",            "sec"),
    ("mc_csc",            "mcad_csc"),
    ("mc_csc",            "csc"),
    ("mc_cot",            "mcad_cot"),
    ("mc_cot",            "cot"),
    ("mc_asin",           "mcad_arcsin"),
    ("mc_asin",           "arcsin"),
    ("mc_acos",           "mcad_arccos"),
    ("mc_acos",           "arccos"),
    ("mc_atan",           "mcad_arctan"),
    ("mc_atan",           "arctan"),
    ("mc_acsc",           "mcad_arccsc"),
    ("mc_acsc",           "arccsc"),
    ("mc_asec",           "mcad_arcsec"),
    ("mc_asec",           "arcsec"),
    ("mc_acot",           "mcad_arccot"),
    ("mc_acot",           "arccot"),
    ("mc_sinh",           "mcad_sinh"),
    ("mc_sinh",           "sinh"),
    ("mc_cosh",           "mcad_cosh"),
    ("mc_cosh",           "cosh"),
    ("mc_tanh",           "mcad_tanh"),
    ("mc_tanh",           "tanh"),
    ("mc_sech",           "mcad_sech"),
    ("mc_sech",           "sech"),
    ("mc_csch",           "mcad_csch"),
    ("mc_csch",           "csch"),
    ("mc_coth",           "mcad_coth"),
    ("mc_coth",           "coth"),
    ("mc_asinh",          "mcad_arcsinh"),
    ("mc_asinh",          "arcsinh"),
    ("mc_acosh",          "mcad_arccosh"),
    ("mc_acosh",          "arccosh"),
    ("mc_atanh",          "mcad_arctanh"),
    ("mc_atanh",          "arctanh"),
    ("mc_acsch",          "mcad_arccsch"),
    ("mc_acsch",          "arccsch"),
    ("mc_asech",          "mcad_arcsech"),
    ("mc_asech",          "arcsech"),
    ("mc_acoth",          "mcad_arccoth"),
    ("mc_acoth",          "arccoth"),

    ("mc_atan2",             "mcad_atan2"),
    ("mc_sinc",              "mcad_sinc"),

    ("mc_fact2",          "fact2"),   
    ("mc_fact2",          "mcad_fact2"),   

    // Bessel Functions

    ("mc_I0",                "mcad_I0"),
    ("mc_J0",                "mcad_J0"),
    ("mc_K0",                "mcad_K0"),
    ("mc_Y0",                "mcad_Y0"),

    ("mc_I1",                "mcad_I1"),
    ("mc_J1",                "mcad_J1"),
    ("mc_K1",                "mcad_K1"),
    ("mc_Y1",                "mcad_Y1"),

    ("mc_In",                "mcad_In"),
    ("mc_In",                "besselI"),
    ("mc_Jn",                "mcad_Jn"),
    ("mc_Jn",                "besselJ"),
    ("mc_Kn",                "mcad_Kn"),
    ("mc_Kn",                "besselK"),
    ("mc_Yn",                "mcad_Yn"),
    ("mc_Yn",                "besselY"),

    ("mc_I0_2E_sc",          "mcad_I0_scaled"),
    ("mc_J0_2E_sc",          "mcad_J0_scaled"),
    ("mc_K0_2E_sc",          "mcad_K0_scaled"),
    ("mc_Y0_2E_sc",          "mcad_Y0_scaled"),

    ("mc_I1_2E_sc",          "mcad_I1_scaled"),
    ("mc_J1_2E_sc",          "mcad_J1_scaled"),
    ("mc_K1_2E_sc",          "mcad_K1_scaled"),
    ("mc_Y1_2E_sc",          "mcad_Y1_scaled"),

    ("mc_In_2E_sc",          "mcad_In_scaled"),
    ("mc_Jn_2E_sc",          "mcad_Jn_scaled"),
    ("mc_Kn_2E_sc",          "mcad_Kn_scaled"),
    ("mc_Yn_2E_sc",          "mcad_Yn_scaled"),

    // Hankel Functions

    ("mc_H1",                "mcad_H1"),
    ("mc_H2",                "mcad_H2"),

    ("mc_H1_2E_sc",          "mcad_H1_scaled"), // H1.sc (scaled H1)
    ("mc_H2_2E_sc",          "mcad_H2_scaled"), // H2.sc (scaled H2)

    // Airy Functions

    ("mc_Ai",                "mcad_Ai"),
    ("mc_Ai",                "airyAi"),
    ("mc_Bi",                "mcad_Bi"),
    ("mc_Bi",                "airyBi"),

    ("mc_Ai_2E_sc",          "mcad_Ai_scaled"), // Ai.sc (scaled Ai)
    ("mc_Bi_2E_sc",          "mcad_Bi_scaled"), // Bi.sc (scaled Bi)

    ("mc_DAi",               "mcad_DAi"),
    ("mc_DBi",               "mcad_DBi"),

    ("mc_DAi_2E_sc",         "mcad_DAi_scaled"), // DAi.sc (scaled DAi = scaled D(Ai))
    ("mc_DBi_2E_sc",         "mcad_DBi_scaled"), // DBi.sc (scaled DBi = scaled D(Bi))

    // Spherical Bessel Functions

    ("mc_js",                "mcad_js"),
    ("mc_ys",                "mcad_ys"),

    ("mc_erf",               "mcad_erf"),
    ("mc_erf",               "erf"),
    ("mc_erfc",              "mcad_erfc"),
    ("mc_erfc",              "erfc"),
    ("mc_beta",              "mcad_beta"),
    ("mc_beta",              "beta"),
    ("mc_Psi",               "mcad_Psi"),
  //psi gets rewritten in terms of mc_Psi
  //("mc_Psi",               "psi"),
    ("mc_Zeta",              "mcad_Zeta"),
    ("mc_Zeta",              "zeta"),
    ("mc_dilog",             "mcad_dilog"),
    ("mc_dilog",             "dilog"),
    ("mc_polylog",           "mcad_polylog"),
    ("mc_polylog",           "polylog"),

    ("mc_EllipticK",         "mcad_EllipticK"),
    ("mc_EllipticK",         "ellipticK"),
    ("mc_EllipticCK",        "mcad_EllipticCK"),
    ("mc_EllipticCK",        "ellipticCK"),
    ("mc_EllipticF",         "mcad_EllipticF"),
    ("mc_EllipticF",         "ellipticF"),
    ("mc_EllipticE",         "mcad_EllipticE"),
    ("mc_EllipticE",         "ellipticE"),
    ("mc_EllipticCE",        "mcad_EllipticCE"),
    ("mc_EllipticCE",        "ellipticCE"),
    ("mc_EllipticPi",        "mcad_EllipticPi"),
    ("mc_EllipticPi",        "ellipticPi"),
    ("mc_EllipticCPi",       "mcad_EllipticCPi"),
    ("mc_EllipticCPi",       "ellipticCPi"),

    ("mc_FresnelC",          "mcad_FresnelC"),
    ("mc_FresnelC",          "fresnelC"),
    ("mc_FresnelS",          "mcad_FresnelS"),
    ("mc_FresnelS",          "fresnelS"),
    ("mc_Ei",                "mcad_Ei"),
  //Ei is specially handled in the emitter now.  it is NOT a synonym for mcad_Ei
  //("mc_Ei",                "Ei"),
    ("mc_LambertW",          "mcad_LambertW"),
    ("mc_LambertW",          "lambertW"),
    ("mc_Ci",                "mcad_Ci"),
    ("mc_Ci",                "Ci"),
    ("mc_Si",                "mcad_Si"),
    ("mc_Si",                "Si"),
    ("mc_Chi",               "mcad_Chi"),
    ("mc_Chi",               "Chi"),
    ("mc_Shi",               "mcad_Shi"),
    ("mc_Shi",               "Shi"),
    ("mc_hypergeom",         "mcad_hypergeom"),
  //don't put "hypergeom" here. It's handled directly in parser.

    ("mc_IsInteger",         "mcad_IsInteger"),
    ("mc_IsRational",        "mcad_IsRational"),
    ("mc_IsReal",            "mcad_IsReal"),
    ("mc_IsComplex",         "mcad_IsComplex"),

    ("mc_IsPrime",           "mcad_IsPrime"),

    ("mc_Re",                "mcad_Re"),
    ("mc_Re",                "Re"),
    ("mc_Im",                "mcad_Im"),
    ("mc_Im",                "Im"),

    ("mc_numer",             "mcad_numer"),
    ("mc_numer",             "numer"),
    ("mc_denom",             "mcad_denom"),
    ("mc_denom",             "denom"),

    ("mc_arg",               "mcad_arg"),
    ("mc_arg",               "arg"),
    ("mc_csgn",              "mcad_csgn"),
    ("mc_sign",              "mcad_sign"),
    ("mc_signum",            "mcad_signum"),

    ("mc_mod",               "mcad_mod"),
    ("mc_mod",               "_mod"),
    ("mc_gcd",               "mcad_gcd"),
    ("mc_gcd",               "gcd"),
    ("mc_lcm",               "mcad_lcm"),
    ("mc_lcm",               "lcm"),

    ("mc_max",               "mcad_max"),
    ("mc_max",               "max"),
    ("mc_min",               "mcad_min"),
    ("mc_min",               "min"),

    ("mc_combin",            "mcad_combin"),
    ("mc_combin",            "binomial"),

    ("mc_error",             "mcad_error"),

    ("mc_log",               "mcad_log"), // NOTE: requires reversal of arguments for MuPAD
    ("mc_exp",               "mcad_exp"),
    ("mc_exp",               "exp"),
    ("mc_ln",                "mcad_ln"),
    ("mc_ln",                "ln"),
    ("mc_ln0",               "mcad_ln0"),

    ("mc_eigenvals",         "mcad_eigenvals"),
    ("mc_eigenvec",          "mcad_eigenvec"),
    ("mc_eigenvecs",         "mcad_eigenvecs"),
    ("mc_tr",                "mcad_tr"),

    ("mc_svd",               "mcad_svd"),
    ("mc_svd2",              "mcad_svd2"),
    ("mc_svds",              "mcad_svds"),

    ("mc_lsolve",            "mcad_lsolve"),

    ("mc_geninv",            "mcad_geninv"),
    ("mc_rank",              "mcad_rank"),
    ("mc_rank",              "rank"),
    ("mc_rref",              "mcad_rref"),

    ("mc_ceil",              "mcad_ceil"),
    ("mc_ceil",              "ceil"),
    ("mc_Ceil",              "mcad_Ceil"),
    ("mc_floor",             "mcad_floor"),
    ("mc_floor",             "floor"),
    ("mc_Floor",             "mcad_Floor"),
    ("mc_round",             "mcad_round"),
    ("mc_round",             "round"),
    ("mc_Round",             "mcad_Round"),
    ("mc_trunc",             "mcad_trunc"),
    ("mc_trunc",             "trunc"),
    ("mc_Trunc",             "mcad_Trunc"),

    ("mc_last",              "mcad_last"),
    ("mc_length",            "mcad_length"),
    ("mc_length",            "vecdim"),

    ("mc_sort",              "mcad_sort"),
    ("mc_reverse",           "mcad_reverse"),
    ("mc_csort",             "mcad_csort"),
    ("mc_rsort",             "mcad_rsort"),

    ("mc_matrix",            "mcad_matrix"),
    ("mc_identity",          "mcad_identity"),
    ("mc_identity",          "identity"),
    ("mc_diag",              "mcad_diag"),

    ("mc_cholesky",          "mcad_cholesky"),
    ("mc_submatrix",         "mcad_submatrix"),
    ("mc_rows",              "mcad_rows"),
    ("mc_rows",              "nrows"),
    ("mc_cols",              "mcad_cols"),
    ("mc_cols",              "ncols"),
    ("mc_augment",           "mcad_augment"),
    ("mc_augment",           "concatMatrix"),
    ("mc_stack",             "mcad_stack"),
    ("mc_stack",             "stackMatrix"),

    ("mc_match",             "mcad_match"),
    ("mc_lookup",            "mcad_lookup"),
    ("mc_hlookup",           "mcad_hlookup"),
    ("mc_vlookup",           "mcad_vlookup"),

    ("mc_undefined",         "undefined"),
    ("mc_undefined",         "FAIL"),

  //("_hex_6D635FE28AA5",    "undefined"),  // U+22A5 Up Tack (Bottom)
  //("_hex_6D635FE28AA5",    "FAIL"),

    ("op_conjugate",         "conjugate"),

    ("op_add",               "op_add"),
    ("op_add",               "add_i4"),
    ("op_sub",               "op_sub"),
    ("op_sub",               "sub_i4"),
    ("op_abs",               "op_abs"),
    ("op_abs",               "mcad_abs"),
    ("op_abs",               "mc_abs"),
    ("op_abs",               "abs"),

    ("op_sqrt",              "op_sqrt"),
    ("op_sqrt",              "sqrt")
   ];

   mupad_nonfuncmap = make_many_to_one_map
   [
    ("_hex_6D635FCEB1",   "mcvar_alpha"),      // lowercase alpha
    ("_hex_6D635FCEB2",   "mcvar_beta"),       // lowercase beta
    ("_hex_6D635FCF87",   "mcvar_chi"),        // lowercase chi

    ("_hex_6D635FCEB4",   "mcvar_delta"),      // lowercase delta (not kroneckerDelta)

    ("_hex_6D635FCEB5",   "mcvar_epsilon"),    // lowercase epsilon
    ("_hex_6D635FCF86",   "mcvar_phi"),        // lowercase phi (one of two
                                               //   renderings,   see below)

    ("_hex_6D635FCEB3",   "EULER"),            // lowercase gamma, representing
//  ("_hex_6D635FCEB3",   "mcvar_gamma"),      // lowercase gamma (in case there's
//                                             //  need to refer to it by name)

    ("_hex_6D635FCEB7",   "mcvar_eta"),        // lowercase eta
    ("_hex_6D635FCEB9",   "mcvar_iota"),       // lowercase iota
    ("_hex_6D635FCF95",   "mcvar_script_phi"), // lowercase phi (stroked,
                                               //   alternate rendering)
    ("_hex_6D635FCEBA",   "mcvar_kappa"),      // lowercase kappa
    ("_hex_6D635FCEBB",   "mcvar_lambda"),     // lowercase lambda
    ("_hex_6D635FCEBC",   "mcvar_mu"),         // lowercase mu
    ("_hex_6D635FCEBF",   "mcvar_omicron"),    // lowercase omicron

    ("_hex_6D635FCF80",   "PI"),               // lowercase pi
//  ("_hex_6D635FCF80",   "mcvar_pi"),         // lowercase pi (in case there's
//                                             //   need to refer to it by name)

    ("_hex_6D635FCEB8",   "mcvar_theta"),      // lowercase theta
    ("_hex_6D635FCF81",   "mcvar_rho"),        // lowercase rho
    ("_hex_6D635FCF83",   "mcvar_sigma"),      // lowercase sigma
    ("_hex_6D635FCF84",   "mcvar_tau"),        // lowercase tau
    ("_hex_6D635FCF85",   "mcvar_upsilon"),    // lowercase upsilon
    ("_hex_6D635FCF96",   "mcvar_omega_pi"),   // pi symbol (so says Unicode
                                               //   standard, which admits
                                               //   it looks almost like
                                               //   an omega)
    ("_hex_6D635FCF89",   "mcvar_omega"),      // lowercase omega
    ("_hex_6D635FCEBE",   "mcvar_xi"),         // lowercase xi
    ("_hex_6D635FCF88",   "mcvar_psi"),        // lowercase psi
    ("_hex_6D635FCEB6",   "mcvar_zeta"),       // lowercase zeta

    ("_hex_6D635FCE91",   "mcvar_Alpha"),      // capital alpha
    ("_hex_6D635FCE92",   "mcvar_Beta"),       // capital beta
    ("_hex_6D635FCEA7",   "mcvar_Chi"),        // capital chi
    ("_hex_6D635FCE94",   "mcvar_Delta"),      // capital delta (not mcad_dirac)
    ("_hex_6D635FCE93",   "mcvar_Gamma"),      // capital gamma (not mcad_gamma)
    ("_hex_6D635FCE95",   "mcvar_Epsilon"),    // capital epsilon
    ("_hex_6D635FCEA6",   "mcvar_Phi"),        // capital phi (not heaviside)
    ("_hex_6D635FCE97",   "mcvar_Nu"),         // capital nu
    ("_hex_6D635FCE99",   "mcvar_Iota"),       // capital iota
    ("_hex_6D635FCF91",   "mcvar_THETA"),      // greek Theta symbol (alternate
                                               //   rendering, script)
    ("_hex_6D635FCE9A",   "mcvar_Kappa"),      // capital kappa
    ("_hex_6D635FCE9B",   "mcvar_Lambda"),     // capital lambda
    ("_hex_6D635FCE9C",   "mcvar_Mu"),         // capital mu
    ("_hex_6D635FCE9D",   "mcvar_Eta"),        // capital eta
    ("_hex_6D635FCE9F",   "mcvar_Omicron"),    // capital omicron
    ("_hex_6D635FCEA0",   "mcvar_Pi"),         // capital pi
    ("_hex_6D635FCE98",   "mcvar_Theta"),      // capital theta (one of two
                                               //   renderings, see above)
    ("_hex_6D635FCEA1",   "mcvar_Rho"),        // capital rho
    ("_hex_6D635FCEA3",   "mcvar_Sigma"),      // capital sigma
    ("_hex_6D635FCEA4",   "mcvar_Tau"),        // capital tau
    ("_hex_6D635FCEA5",   "mcvar_Upsilon"),    // capital upsilon
    ("_hex_6D635FCF82",   "mcvar_V"),          // greek stigma ("final sigma")
    ("_hex_6D635FCEA9",   "mcvar_Omega"),      // capital omega
    ("_hex_6D635FCE9E",   "mcvar_Xi"),         // capital xi
    ("_hex_6D635FCEA8",   "mcvar_Psi"),        // capital psi
    ("_hex_6D635FCE96",   "mcvar_Zeta"),       // capital zeta

    ("_hex_6D635FE28482",  "C_"),              // Script C (set of Complexes)
    ("_hex_6D635FE2849A",  "Q_"),              // Script Q (set of Rationals)
    ("_hex_6D635FE2849D",  "R_"),              // Script R (set of Reals)
    ("_hex_6D635FE284A4",  "Z_"),              // Script Z (set of Integers)

    ("_hex_6D635FE2889E", "infinity"),         // infinity symbol
    ("_hex_6D635FE2889E", "RD_INF"),           // floating point infinity

    ("mc_e",              "E"),                // base of natural logarithms

    ("mc_Catalan",        "CATALAN")

   ];

   // Try to look something up in each of a list of maps.
   find_first :: a -> (m->a->(Maybe a)) -> [m] -> a;
   find_first s f (m:rest) = case (f m s) of {
                              Nothing -> find_first s f rest;
                              Just t  -> t;
                             };
   find_first s _ _        = s;


   to_mupad :: String -> String;
   to_mupad s = find_first s mlookup [mupad_nonfuncmap];

   to_mupad_func :: String -> String;
   to_mupad_func s = find_first s mlookup [mupad_funcmap];

   from_mupad :: String -> String;
   from_mupad s = find_first s mlookupInv [mupad_funcmap,mupad_nonfuncmap];

// Error Messages

errmsgLexError   = "bad_syntax"; // "symbolics: lex error";

//*****************************************************************
// Monadic machinery for lexing
//
//    MPL doesn't yet support type classes.  When it does, the
//    type constructor 'Lexer' below will be a Monad, with 'lBind'
//    as the bind operation and 'lempty' as the return operation.
//*****************************************************************

   data Format = MuPad | XML | RL | Mathcad;

   data Token = STok String        // string
              | Id String          // identifier
              | ITok Int           // "small" integer -- fits into an Int
              | BigITok String     // arbitrary-size integer
              | Float String       // floating-point number
              | TProc | TXProc1    // 'proc' keyword and xproc1([var],body)
              | TMatrix            // 'matrix' keyword
              | TImagUnit          // imaginary unit
              | T_INFINITY
           // deliberately blurred with T_INFINITY. -kmp 27-Jun-2006
           // | T_RD_INF
              | T_RD_NINF
              | TPiecewise         // 'piecewise' keyword
              | T_OTHERWISE        //   and its Otherwise marker
              | TMcFloat           // 'mcfloat' keyword
              | T_ABS              // absolute value
              | T_EVAL             // 'eval' keyword
              | T_RANGE            // op_range2_i (the kind of range used in prods and sums)
              | T_RANGE2           // op_range2
              | T_RANGE3           // op_range3
              | T_INTEGRAL         // integral
              | T_MC_INTEGRAL      // Mathcad integral (w/TOL and callback)
              | T_MC_INDEF_INTEGRAL // Mathcad indefinite integral
              | T_INTEGRAL_CB      // integral callback
              | T_MIXEDNUM         // op_mixednum
                // Summation
              | T_SUM     | T_RANGESUM | T_SIGMASUM
                // Product
              | T_PRODUCT | T_RANGEPRODUCT
                // Trig
              | T_SIN   | T_COS   | T_TAN   | T_SEC   | T_CSC   | T_COT
              | T_ASIN  | T_ACOS  | T_ATAN  | T_ASEC  | T_ACSC  | T_ACOT
              | T_SINH  | T_COSH  | T_TANH  | T_SECH  | T_CSCH  | T_COTH
              | T_ASINH | T_ACOSH | T_ATANH | T_ASECH | T_ACSCH | T_ACOTH
               //
              | T_ERF   | T_ERFC  | T_PSI   | T_ZETA | T_DILOG
              // | T_COMBIN // now handled in the mupadmap
              | T_ARG
              | T_MOD  | T_GCD | T_LCM | T_MIN | T_MAX
              | T_CEIL | T_FLOOR | T_ROUND | T_TRUNC
              | T_RANK | T_ROWS | T_COLS | T_LENGTH | T_IDENTITY | T_SUBMATRIX | T_STACK | T_AUGMENT | T_MUSUBMATRIX | T_TRANSPOSE
              | T_MATCH | T_LOOKUP | T_VLOOKUP | T_HLOOKUP | T_CSORT | T_RSORT
               //
              | T_BESSEL_I | T_BESSEL_J | T_BESSEL_K | T_BESSEL_Y
              | T_AIRY_AI | T_AIRY_BI
              | T_LAMBERTW
              | T_EXP  | T_EI | T_XEI  // exponential function, mcad_Ei and mupad's Ei
              | T_CONJUGATE        // complex conjugate
                // arithmetic, comparison, and boolean operators
              | T_PLUS | T_MINUS | T_MULT | T_DIVIDE | T_POW | T_UMINUS | T_SURD
	      | T_OP_ADD | T_OP_SUB | T_OP_MULT | T_OP_DIV | T_OP_POWER | T_OP_NEGATE
              | T_CROSSPROD
              | T_LT | T_GT | T_EQ | T_LTEQ | T_GTEQ | T_NEQ
              | T_MC_LT | T_MC_GT | T_MC_EQ | T_MC_LTEQ | T_MC_GTEQ | T_MC_NEQ
              | T_AND | T_OR | T_XOR | T_NOT
                // set operators
              | T_IN  | T_UNION  | T_INTERSECT  | T_SETMINUS  | T_SUBSET | T_INTERVAL
              | T_XIN | T_TENSOR_EPSILON
              | T__IN | T__UNION | T__INTERSECT | T__SETMINUS | T__SUBSET
              | T_THE_INTEGERS | T_THE_RATIONALS | T_THE_REALS | T_THE_COMPLEXES
                // mc_root, mc_root_bracket_
              | T_ROOT | T_ROOT_BRACKET
                // square, square root, nth root
              | T_SQR | T_SQRT | T_NTHROOT
                // Differentiation operators. T_D is MuPad's 'D';
                // T_D1 etc. are Mathcad's 'op_deriv_1', 'op_deriv_2'...
              | T_D | T_D1 | T_D2 | T_D3 | T_D4 | T_D5 | T_DN | T_XDN | T_XD
                // Limits (from any side, from right side, from left side)
              | T_LIMIT | T_LIMITR | T_LIMITL | T_MuLIMIT
                // Subscripts and Matcol
              | T_SUB1 | T_SUB2 | T_MATCOL
                // boolean constants
              | T_TRUE | T_FALSE | T_UNKNOWN | T_UNDEFINED
                // parentheses and brackets and separators and set builder
              | T_LPAREN | T_RPAREN | T_LBRACKET | T_RBRACKET | T_SET
              | T_COMMA | T_SEMI
                // set enclosure and the evalAt operator
              | T_LBRACE | T_RBRACE | T_EVAL_AT
                // factorial
              | T_FACTORIAL | T_FACTORIAL2 | T_OP_FACTORIAL
                // Misc. translator-generated identifiers
              | T_AS_I4 | T_CLR_VEC | T_BV | T_AS_BOOL | T_AND_ | T_OR_ | T_XOR_
              | T_OP_AND | T_OP_OR | T_OP_NOT | T_OP_XOR
                // Misc MuPAD "synonyms" (ours have more error checking but are the same)
                // An "X" means it takes different (e.g., reversed or extended) args from Mathcad
              | T_SIGNUM0 | T_SIGN_IM
              | T_DIRAC | T_XDIRAC
              | T_RE | T_IM | T_LOG | T_XLOG | T_LN | T_XPSI
                // operators that MuPAD knows about that we don't really need but might see
                // in return values ... and that require special parsing.
                // A "Z" indicates that the operator is dormant (and should probably
                // be removed if it becomes actively used).
                // The T_Z_ versions are the "_" equivalents (_assuming for assuming).
                // They get rewritten as the other form for display.
              | T_MOD_DIV | T_MOD_REM
              | T_ZSEQ      | T_Z_SEQIN | T_Z_SEQGEN
              | T_ZHULL     | T_Z_HULL
              | T_ZASSUMING | T_Z_ASSUMING
              | T_ZIMPLIES  | T_Z_IMPLIES
              | T_ZEQUIV    | T_Z_EQUIV
              | T_FNEST     | T_Z_FNEST
              | T_FCONCAT   | T_Z_FCONCAT

              | T_HOLD

                // used in the handling of optional arguments
              | T_NULL | T_REALLY

              | T_ERROR
                // catch-all for other operators
              | Op Int;

   data LexState    = LexState { pos, len :: Int, input :: String };
   data LexResult t = LexResult LexState t | LexError;
   data Lexer t     = Lexer (LexState -> LexResult t);

   lexres_to_str_expecting :: Bool -> LexResult t -> String;
   lexres_to_str_expecting flag LexError =
      if flag then "LexError"
              else "LexError (expected)";
   lexres_to_str_expecting flag (LexResult (LexState pos len input) v) =
     (strcat (if flag then "SUCCESS: "
                      else "(unexpected) SUCCESS: ")
             (to_string v));

   lexWith :: Lexer t -> LexState -> LexResult t;
   lexWith (Lexer lex) s = lex s;

   lBind :: Lexer t -> (t -> Lexer u) -> Lexer u;
   lBind (Lexer lex) k =
       Lexer (\lstate -> case (lex lstate) of {
                          LexResult s x -> let { (Lexer q) = k x } in q s;
                          LexError      -> LexError;
                         }
             );

   lAlt :: Lexer t -> Lexer t -> Lexer t;
   lAlt (Lexer lex1) (Lexer lex2) =
       Lexer (\lstate -> case (lex1 lstate) of {
                          LexError -> (lex2 lstate);
                          lexres   -> lexres;
                         }
             );

   lempty :: t -> Lexer t;
   lempty x = Lexer (\lstate -> LexResult lstate x);

   lFail :: Lexer t;
   lFail = Lexer (\_ -> LexError);

   lbuild :: Lexer t -> (t -> u) -> Lexer u;
   lbuild lex f = lBind lex (lempty.f);

   lMaybe :: Lexer t -> Lexer (Maybe t);
   lMaybe lexer = lAlt (lBind lexer (\x -> lempty (Just x))) (lempty Nothing);

   lexFirst :: [Lexer t] -> Lexer t;
   lexFirst (lexer:rest) = lAlt lexer (lexFirst rest);
   lexFirst []           = lFail;

   // While this is a natural definition of lexList, it's not
   // tail recursive and can result in stack overflows.
   // (The file attached to bug 061114-121958 can produce
   // one, for example.)
   //lexList lexer = lAlt (lBind lexer
   //                    (\x -> (lBind (lexList lexer) (\r -> lempty (x:r)))))
   //                   (lempty []);

   // Tail-recursive definition of lexList.
   lexList :: Lexer t -> Lexer [t];
   lexList lexer = Lexer h where
   {
    Lexer g = lexer;
    //f :: [t] -> LexState -> ([t],LexState);
    f accum lexstate = case (g lexstate) of {
                        LexResult lexstate' x -> f (x:accum) lexstate';
                        _                     -> (accum,lexstate);
                       };
    //h :: LexState -> LexResult [t];
    h s = let { (lst,s') = f [] s; }
          in LexResult s' (reverse lst);
   };
   
   lIgnoreFirst :: Lexer t -> Lexer u -> Lexer u;
   lIgnoreFirst lex1 lex2 = lBind lex1 (\_ -> lex2);

   // General-purpose function for extracting information from
   // the lexer state.  Given a function of position, input length,
   // and the input itself, returns a lexer for an object obtained
   // by applying that function to the current state.
   lDoState :: (Int->Int->String->t) -> Lexer t;
   lDoState f = Lexer (\s@(LexState pos len input) ->
                            (LexResult s (f pos len input)));

   // Lexer which returns the current position in the lexer state.
   getPos :: Lexer Int;
   getPos = lDoState (\pos len input -> pos);

   // Lexer which returns the character at the given offset from
   // the current position in the lexer state.
   getChar :: Int -> Lexer Int;
   getChar (I offset) = lDoState (\(I pos) len input ->
                                   (I (get_char input (add_i4 pos offset))));

   // Constructs a new lexer which, if the given lexer succeeds,
   // returns the beginning and end of the match.
   getMatch :: Lexer t -> Lexer (Int,Int);
   getMatch lexer = lBind         getPos
                     (\s -> lBind lexer
                     (\_ -> lBind getPos
                     (\e -> lempty (s,e))));

   // Apply the given lexer once, returning the
   // resulting offset in the lexer state.
   lexOne :: Lexer t -> Lexer Int;
   lexOne lexer = lBind lexer (\_ -> getPos);

   // Try the given lexer; if it fails, do nothing.
   lexMaybe :: Lexer t -> Lexer ();
   lexMaybe lexer = lAlt (lBind lexer (\_ -> lempty ()))
                         (lempty ());

   // Apply the given lexer zero or more times, returning
   // the resulting position in the lexer state.
   lexZeroOrMore :: Lexer t -> Lexer Int;
   lexZeroOrMore lexer = lAlt (lBind lexer (\_ -> (lexZeroOrMore lexer)))
                              getPos;

   lexOneOrMore :: Lexer t -> Lexer Int;
   lexOneOrMore lexer = lBind lexer (\_ -> (lexZeroOrMore lexer));

   // Match a single character that satisfies a predicate.
   // On success, the integer value within the result is an
   // offset into the input string which is one character past
   // the matched character.
   lexIf :: (Int->Bool) -> Lexer Int;
   lexIf pred = lBind lexAnyChar
                 (\c -> if pred c then getPos else lFail);

   // Returns a pair of integers representing the beginning
   // and end of the range which satisfies the predicate.
   lexZeroOrMoreWhile :: (Int->Bool) -> Lexer (Int,Int);
   lexZeroOrMoreWhile = getMatch.lexZeroOrMore.lexIf;

   // Returns a pair of integers representing the beginning
   // and end of the range which satisfies the predicate.
   lexOneOrMoreWhile :: (Int->Bool) -> Lexer (Int,Int);
   lexOneOrMoreWhile = getMatch.lexOneOrMore.lexIf;

   lexPairToString :: (Int,Int) -> Lexer String;
   lexPairToString (i,j) =
       Lexer (\(LexState pos len input) ->
                  (LexResult (LexState pos len input) (substr input i j)));

   lexWhileToString :: (Int->Bool) -> Lexer String;
   lexWhileToString pred = lBind (lexOneOrMoreWhile pred) lexPairToString;

   lexChar :: Int -> Lexer Int;
   lexChar c = lexIf (is_char c);

   lexCharList :: [Int] -> Lexer Int;
   lexCharList [] = getPos;
   lexCharList (c:r) = lBind (lexChar c) (\_ -> lexCharList r);

   stringToCharList :: String -> [Int];
   stringToCharList str = _helper str 0
   where {
    len         = (I (get_length str));
    _helper s i@(I _i)
        | i == len = []
        | else     = ((I (get_char s _i)):(_helper s (i+1)));
   };

   containsString :: String -> [String] -> Bool;
   containsString s [] = False;
   containsString s (s1:more) = if (stringEqual s s1) then True else (containsString s more);

   stringEqual :: String -> String -> Bool;
   stringEqual x y = charsEqual (stringToCharList x) (stringToCharList y);

   charsEqual :: [Int] -> [Int] -> Bool;
   charsEqual [] []       = True;
   charsEqual (c:more) [] = False;
   charsEqual [] (c:more) = False;
   charsEqual (c1:more1) (c2:more2) =
      if (c1 == c2) then (charsEqual more1 more2) else False;

   // Match a specific string
   lexMatchString :: String -> Lexer Int;
   lexMatchString = lexCharList.stringToCharList;

   lexAnyChar :: Lexer Int;
   lexAnyChar = Lexer f
       where {
              f (LexState pos len input)
                  | pos >= len = LexError
                  | else =
                      let { (I i) = pos;
                            c     = I (get_char input i); } in
                        (LexResult (LexState (pos+1) len input) c);
             };

   is_char :: Int -> (Int->Bool);
   is_char c c2 = (c2 == c);

   negate :: (Int->Bool) -> (Int->Bool);
   negate pred c = (not (pred c));

   quote = 34;

   // A few string-related utilities which should probably go
   // elsewhere.
   substr :: String->Int->Int->String;
   substr s begin end = sub s b l
       where { (I b) = begin;
               (I l) = end - begin;
               sub::String->I4->I4->String  @ "instance[mscorlib]System.String::Substring(System.Int32,System.Int32)";
             };

   get_char::String->I4->I4 @ "instance[mscorlib]System.String::get_Chars(System.Int32)";
   get_length::String->I4 @ "instance[mscorlib]System.String::get_Length()";
   to_string::a->String @ "virtual System.Object::ToString()";
   strcat::String->String->String @ "[mscorlib]System.String::Concat(System.Object,System.Object)";
   strcat_l strings = foldl strcat "" strings;
   int_to_str :: Int -> String;
   int_to_str = _fmt "{0:d}" where {
    _fmt :: String -> a -> String @"[mscorlib]System.String::Format(System.String,System.Object)"; };


   lexString :: Format -> Lexer Token;
   lexString fmt =
     let { lexQuote = (lexChar quote); } in
     lBind           lexQuote
      (\_   -> lBind (lexZeroOrMoreWhile (negate (is_char quote)))
      (\p   -> lBind (lexPairToString p)
      (\str -> lBind lexQuote
      (\_   -> lempty (STok str)))));


    // Some tokens would be recognized as identifiers but for
    // their presence in this map.
    tok_id_map :: BijectiveMap String Token;
    tok_id_map = make_bijective_map
                 [("proc",             TProc),
                  ("matrix",           TMatrix),
                  ("I",                TImagUnit),
                  ("piecewise",        TPiecewise),
                  ("Otherwise",        T_OTHERWISE),
                  ("mcfloat",          TMcFloat),

                  ("hold",             T_HOLD),

                  ("surd",             T_SURD),

                  ("int",              T_INTEGRAL),
                  ("mc_integral_",     T_MC_INTEGRAL),
                  ("op_indef_integral",T_MC_INDEF_INTEGRAL),
                  ("integralcb",       T_INTEGRAL_CB),

                  ("op_cross",         T_CROSSPROD),

                  ("_hex_6D635FE2889E",T_INFINITY),
                // deliberately blurred with infinity. -kmp 27-Jun-2006
                //("RD_INF",           T_RD_INF),
                  ("RD_NINF",          T_RD_NINF),

                  ("op_range2_i",      T_RANGE),
                  ("op_range2",        T_RANGE2),
                  ("op_range3",        T_RANGE3),

                  ("eval",             T_EVAL),

                  ("op_sqr",           T_SQR),
                  ("op_nthroot",       T_NTHROOT),

                  ("sum",              T_SUM),
                  ("op_rangesum",      T_RANGESUM),
                  ("op_sigmasum",      T_SIGMASUM),

                  ("mc_In",            T_BESSEL_I),
                  ("mc_Jn",            T_BESSEL_J),
                  ("mc_Kn",            T_BESSEL_K),
                  ("mc_Yn",            T_BESSEL_Y),

                  ("mc_Ai",            T_AIRY_AI),
                  ("mc_Bi",            T_AIRY_BI),

                  ("mc_LambertW",      T_LAMBERTW),

                  ("mc_sin",           T_SIN),
                  ("mc_cos",           T_COS),
                  ("mc_tan",           T_TAN),
                  ("mc_sec",           T_SEC),
                  ("mc_csc",           T_CSC),
                  ("mc_cot",           T_COT),

                  ("mc_asin",          T_ASIN),
                  ("mc_acos",          T_ACOS),
                  ("mc_atan",          T_ATAN),
                  ("mc_asec",          T_ASEC),
                  ("mc_acsc",          T_ACSC),
                  ("mc_acot",          T_ACOT),

                  ("mc_sinh",          T_SINH),
                  ("mc_cosh",          T_COSH),
                  ("mc_tanh",          T_TANH),
                  ("mc_sech",          T_SECH),
                  ("mc_csch",          T_CSCH),
                  ("mc_coth",          T_COTH),

                  ("mc_asinh",         T_ASINH),
                  ("mc_acosh",         T_ACOSH),
                  ("mc_atanh",         T_ATANH),
                  ("mc_asech",         T_ASECH),
                  ("mc_acsch",         T_ACSCH),
                  ("mc_acoth",         T_ACOTH),

                  ("mc_erf",           T_ERF),
                  ("mc_erfc",          T_ERFC),

                  ("mc_Psi",           T_PSI),
                  ("psi",              T_XPSI),
                  ("mc_Zeta",          T_ZETA),
                  ("mc_dilog",         T_DILOG),
                //now handled in the mupad map
                //("mc_combin",        T_COMBIN),
                  ("mc_arg",           T_ARG),

                  ("mc_Re",            T_RE),
                  ("mc_Im",            T_IM),

                  ("mc_ln",            T_LN),

                  ("mc_mod",           T_MOD),

                  ("evalAt",           T_EVAL_AT),
                  ("mod",              T_MOD_REM),
                  ("div",              T_MOD_DIV),
                  ("hull",             T_Z_HULL),
                  ("assuming",         T_ZASSUMING),
                  // These next ones have no special parser, just special display
                  ("_assuming",        T_Z_ASSUMING),
                  ("_implies",         T_Z_IMPLIES),
                  ("_equiv",           T_Z_EQUIV),
                  ("_seqin",           T_Z_SEQIN),
                  ("_seqgen",          T_Z_SEQGEN),
                  ("_fnest",           T_Z_FNEST),

                  ("mc_gcd",           T_GCD),
                  ("mc_lcm",           T_LCM),

		  ("op_sub",           T_OP_SUB),
		  ("op_add",           T_OP_ADD),
		  ("op_mult",          T_OP_MULT),
		  ("op_div",           T_OP_DIV),
		  ("op_power",         T_OP_POWER),
		  ("op_negate",        T_OP_NEGATE),

                  ("mc_min",           T_MIN),
                  ("mc_max",           T_MAX),

                  ("mc_ceil",          T_CEIL),
                  ("mc_floor",         T_FLOOR),
                  ("mc_round",         T_ROUND),
                  ("mc_trunc",         T_TRUNC),

                  ("mc_match",         T_MATCH),
                  ("mc_lookup",        T_LOOKUP),
                  ("mc_hlookup",       T_HLOOKUP),
                  ("mc_vlookup",       T_VLOOKUP),

                  ("mc_csort",         T_CSORT),
                  ("mc_rsort",         T_RSORT),

                  ("mc_rank",          T_RANK),
                  ("mc_rows",          T_ROWS),
                  ("mc_cols",          T_COLS),
                  ("mc_length",        T_LENGTH),
                  ("mc_identity",      T_IDENTITY),
                  ("mc_submatrix",     T_SUBMATRIX),
                  ("mc_stack",         T_STACK),
                  ("mc_augment",       T_AUGMENT),
                  ("product",          T_PRODUCT),
                  ("op_rangeproduct",  T_RANGEPRODUCT),

                  ("D",                T_D),
                  ("op_deriv_1",       T_D1),
                  ("op_deriv_2",       T_D2),
                  ("op_deriv_3",       T_D3),
                  ("op_deriv_4",       T_D4),
                  ("op_deriv_5",       T_D5),
                  ("op_deriv_n",       T_DN),

                  ("mc_exp",           T_EXP),

                  ("op_limit",         T_LIMIT),
                  ("op_limitright",    T_LIMITR),
                  ("op_limitleft",     T_LIMITL),
                  ("limit",            T_MuLIMIT),

                  ("TRUE",             T_TRUE),
                  ("FALSE",            T_FALSE),
                  ("UNKNOWN",          T_UNKNOWN),

               // ("_hex_6D635FE28AA5", T_UNDEFINED), // U+22A5 Up Tack (Bottom)
                  ("mc_undefined",     T_UNDEFINED), // spelled out, don't use bottom

                  ("op_element_of",    T_IN),

                  ("_hex_6D635FE28888",T_XIN),
                  ("_hex_6D635FCEB5",  T_TENSOR_EPSILON),

                  ("intersect",        T_INTERSECT),
                  ("union",            T_UNION),
                  ("minus",            T_SETMINUS),
                  ("subset",           T_SUBSET),
                  ("DOM_SET",          T_SET),
                  ("Interval",         T_INTERVAL),

                  ("_in",              T__IN),
                  ("_intersect",       T__INTERSECT),
                  ("_union",           T__UNION),
                  ("_minus",           T__SETMINUS),
                  ("_subset",          T__SUBSET),

                  ("_hex_6D635FE284A4", T_THE_INTEGERS),
                  ("_hex_6D635FE2849A", T_THE_RATIONALS),
                  ("_hex_6D635FE2849D", T_THE_REALS),
                  ("_hex_6D635FE28482", T_THE_COMPLEXES),

                  ("Error",            T_ERROR),

                  ("submatrix",        T_MUSUBMATRIX),
                  ("symsubscript1",    T_SUB1),
                  ("symsubscript2",    T_SUB2),
                  ("op_matcol",        T_MATCOL),

                  ("op_eq",            T_MC_EQ),
                  ("op_neq",           T_MC_NEQ),
                  ("op_lt",            T_MC_LT),
                  ("op_gt",            T_MC_GT),
                  ("op_leq",           T_MC_LTEQ),
                  ("op_geq",           T_MC_GTEQ),

                  ("op_factorial",     T_OP_FACTORIAL),

                  ("as_i4",            T_AS_I4),
                  ("as_bool",          T_AS_BOOL),
                  ("clr_vec",          T_CLR_VEC),
                  ("bv",               T_BV),
                  ("and_",             T_AND_),
                  ("or_",              T_OR_),
                  ("xor_",             T_XOR_),

                  ("op_and",           T_OP_AND),
                  ("op_or",            T_OP_OR),
                  ("op_not",           T_OP_NOT),
                  ("op_xor",           T_OP_XOR),

                  ("op_mixednum",      T_MIXEDNUM),

                  ("mc_root",          T_ROOT),
                  ("mc_root_bracket_", T_ROOT_BRACKET),

                  // These items are generated by MuPAD and don't quite have Mathcad semantics,
                  // so need to be mapped to special pseudo-operators that we can write special rules for.
                  ("sign",             T_SIGNUM0),
                  ("signIm",           T_SIGN_IM),
                  ("mc_log",           T_LOG),
                  ("log",              T_XLOG), // MuPAD log has reversed args, so we call it T_XLOG, not T_LOG
                  ("diff",             T_XDN), // diff takes args differently than op_deriv_n
                  ("mc_Ei",            T_EI),
                  ("Ei",               T_XEI),

                  ("_hex_6D635FCE94",  T_DIRAC), // our dirac delta (takes one arg)
                  ("dirac",            T_XDIRAC), // MuPAD's dirac delta (takes one or two args, second is deriv #)

                  ("op_abs",           T_ABS),       // abs

                  ("op_conjugate",     T_CONJUGATE), // conjugate
                  ("op_transpose",     T_TRANSPOSE), // conjugate
                  ("op_sqrt",          T_SQRT),      // sqrt

                  ("and",              T_AND),      // boolean and
                  ("or",               T_OR),       // boolean or
                  ("not",              T_NOT),      // boolean not
                  ("xor",              T_XOR),      // boolean xor

                  ("Really",           T_REALLY),   // supplied opt. arg.
                  ("Null",             T_NULL),     // missing opt. arg.

                  ("xproc1",           TXProc1)      // fake proc for derivs
                 ];

   lexSimpleId :: Format -> Lexer (Int,Int);
   lexSimpleId fmt = lBind (lexIf (is_id_start fmt))
                  (\s  -> lBind (lexZeroOrMore (lexIf (is_id_char fmt)))
                  (\e  -> lempty (s-1,e)));

   // For now, we simply discard any namespace qualifier
   // on an identifier. --presumably Leopold
   // (Actually, not any more. We only discard the basic Mathcad ones. We keep the MuPAD ones as part of the name.) --Kent
   // Leopold 2006-05-25: I think we may still need to discard them
   // (or come up with a general mechanism for handling them).
   // Right now, if we don't discard the namespace, then 'int'
   // and 'numeric::int' are recognized as different tokens, which means
   // that expressions involving 'numeric::int' can show up in
   // the Mathcad UI (the integral in bug 021014-165000 produces such
   // an expression, for example).
   lexId :: Format -> Lexer Token;
   lexId fmt = lBind (lexSimpleId fmt)
            (\p1 -> lAlt (lBind (lexMatchString "::")
                             (\_  -> lBind (lexSimpleId fmt)
                             (\p2 -> lBind (lexPairToString p2)
                             (\str -> lempty (make_token str)))))
                         (lBind (lexPairToString p1)
                             (\str -> lempty (make_token str))))
   where {
          make_token :: String -> Token;
          make_token s = let { s' = from_mupad s; } in
                         case (blookup tok_id_map s') of {
                          Nothing  -> (Id (_unmangle_hex s'));
                          Just tok -> tok;
                         };

          //mclibs :: [String];
          //mclibs = ["mathcad", "mcmsg", "mcfloat", "mcutils", "basefuncs", "keywords", "mcmenu", "mcdebug"];
          //
          //make_token2 :: String -> String -> Token;
          //make_token2 p s =
          //    Id
          //    (strcat_l (if (containsString p mclibs)
          //                  then [(from_target s)]
          //                  else [p, "::" , (from_target s)]));
   };

   // helper for lexSmallInt
   lexDigit :: Format -> Lexer Int;
   lexDigit fmt = lbuild (lBind (lexIf (is_digit fmt)) (\_ -> (getChar (0-1))))
                      (\c -> c - 48); // 48 = ASCII '0'

   // Lex an integer <= 2^31 (=2147483648)
   lexSmallInt :: Format -> Lexer Token;
   lexSmallInt fmt = lBind (lexDigit fmt) (\d -> (lBind (_lexSmallInt fmt d) next))
   where {
     next Nothing    = lFail;
     next (Just tok) = lempty tok;
   };

   // helper for lexSmallInt
   _lexSmallInt :: Format -> Int -> Lexer (Maybe Token);
   _lexSmallInt fmt val =
      lAlt (lBind (lexDigit fmt)
                  (\digit -> if (val <= 214748364 && digit <= 8)
                             then _lexSmallInt fmt (10 McdRun.* val+digit)
                             else lempty Nothing))
           (lempty (Just (ITok val)));

   lexInt :: Format -> Lexer Token;
   lexInt fmt = lBind (lexWhileToString (is_digit fmt)) (\str -> lempty (BigITok str));

   lexFloat :: Format -> Lexer Token;
   lexFloat fmt = lBind (getMatch (lexFloatAlternatives fmt))
                    (\m   -> lBind (lexPairToString m)
                                (\str -> lempty (Float str)));

   // <FloatAlternatives> := { <Digit>+ <FloatTailAfterDigits> | <FloatTailAfterNoDigits> }

   lexFloatAlternatives :: Format -> Lexer Int;
   lexFloatAlternatives fmt = (lAlt (lBind (lexOneOrMoreWhile (is_digit fmt))       // digits   { floatTailWithDigits }
                                      (\_ -> (lexFloatTailAfterDigits fmt)))
                                    (lexFloatTailAfterNoDigits fmt));               // nodigits { floatTailSansDigits }
   
   // <FloatTailAfterDigits> := <DotEFloat> | <DotDigits> <EFloat>

   lexFloatTailAfterDigits :: Format -> Lexer Int;
   lexFloatTailAfterDigits fmt = (lAlt
                                  (lexDotEFloat fmt)                                // [DIGITS] . [digits] e +/- digits
                                  (lAlt (lexDotDigits fmt)
                                        (lexEFloat fmt)));                          // [DIGITS]            e +/- digits

   // <DotDigits> := <Dot> <Digit>*     [for Mathcad (no digits required after trailing dot)]
   // <DotDigits> := <Dot> <Digit>+     [for others  (which mostly means MuPad for now)]
   // 
   // Bug # 070517-160327 noticed that Mathcad and MuPAD disagree
   // about the question of whether 1. is a valid float.  Mathcad
   // thinks it is, but MuPAD doesn't think it is.  So we lexically
   // permit it here only for Mathcad syntax.  MuPAD has good reason
   // not to like trailing dots.  They make parsing 1..2 problematic.
   // If Mathcad ever has a conventional text syntax, this will be
   // a problem.  But for now, Mathcad always finds ".." via the
   // semicolon command in the UI, so this doesn't come up.
   // Ths lexing phase allows the trailing dot, 
   // but doesn't supply the implied "0".  That part is handled in
   // floatFromString on the MuPAD side.

   lexDotDigits :: Format -> Lexer Int;
   lexDotDigits Mathcad = lBind (lexIf (is_dot fmt))
                            (\_ -> (lexZeroOrMore (lexIf (is_digit fmt))))
   where { fmt = Mathcad; };
   lexDotDigits fmt = lBind (lexIf (is_dot fmt))
                        (\_ -> (lexOneOrMore (lexIf (is_digit fmt))));

   // <DotEFloat> := <Dot> <Digit>* <EFloat> 

   lexDotEFloat :: Format -> Lexer Int;
   lexDotEFloat fmt = lBind (lexIf (is_dot fmt))
                    (\_ -> (lBind (lAlt (lBind (lexOneOrMoreWhile (is_digit fmt))
                                    (\_ -> (lexEFloat fmt)))                         // . [digits] e +/- digits
                                 (lexEFloat fmt))
                            (\_ -> getPos)));

   // <EFloat> := <FloatMarker> [ <Sign> ] <Digit>+ 

   lexEFloat :: Format -> Lexer Int;
   lexEFloat fmt = (lBind (lexIf (is_float_marker fmt))                                // e or E (required)
                      (\_ -> (lAlt (lBind (lexIf (is_sign fmt))                        // + or - (optional)
                                      (\_ -> (lexOneOrMore (lexIf (is_digit fmt)))))   // e/E +/- digits
                               (lexOneOrMore (lexIf (is_digit fmt))))));               // e/E     digits


//   lexFloatTailAfterNoDigits :: Format -> Lexer Int;
//   lexFloatTailAfterNoDigits fmt = lFail;

   // <FloatTailAfterNoDigits> := <Dot> <Digit>+ [ <EFloat> ]

   // Lex a floating-point number that begins with a decimal point
   lexFloatTailAfterNoDigits :: Format -> Lexer Int;
   lexFloatTailAfterNoDigits fmt =
      lBind (lexIf (is_dot fmt))
        (\_ -> (lBind (lexOneOrMore (lexIf (is_digit fmt)))                      // [NODIGITS] . digits [ e +/- digits ]
                  (\pos -> (lBind (lAlt (lexEFloat fmt) (lempty pos))
                             (\pos2 -> lempty pos2)))));

   // We have special cases for the only two-character and three-character ops we handle.
   lexOp :: Format -> Lexer Token;
   lexOp fmt =
            lAlt (lBind (lexChars [60,61,62]) (\_ -> lempty T_ZEQUIV))     // <=>
           (lAlt (lBind (lexChars [61,61,62]) (\_ -> lempty T_ZIMPLIES))   // ==>
           (lAlt (lBind (lexChars [60,61])    (\_ -> lempty T_LTEQ))       // <=
           (lAlt (lBind (lexChars [62,61])    (\_ -> lempty T_GTEQ))       // >=
           (lAlt (lBind (lexChars [60,62])    (\_ -> lempty T_NEQ))        // <>
           (lAlt (lBind (lexChars [64,64])    (\_ -> lempty T_FNEST))      // @@
           (lAlt (lBind (lexChars [46,46,46]) (\_ -> lempty T_ZHULL))      // ...
           (lAlt (lBind (lexChars [46,46])    (\_ -> lempty T_RANGE))      // ..
           (lAlt (lBind (lexChars [33,33])    (\_ -> lempty T_FACTORIAL2)) // !!
                 (lBind lexAnyChar (\c -> lempty (lookup_op c)))))))))))
   where {
     lexChars [c1]    = lexChar c1;
     lexChars (c1:cs) = lBind (lexChar c1) (\_ -> (lexChars cs));
     op_map = make_bijective_map
              [
               (36,T_ZSEQ),        // $
               (39,T_XD),          // '  [syntax only, postfix D becomes T_D]
               (43,T_PLUS),        // +
               (45,T_MINUS),       // -  [sometimes rewritten as T_UMINUS]
               (42,T_MULT),        // *
               (47,T_DIVIDE),      // /
               (94,T_POW),         // ^
               (60,T_LT),          // <  [sometimes merged into T_LTEQ or T_NEQ]
               (62,T_GT),          // >  [sometimes merged into T_GTEQ]
               (61,T_EQ),          // =
             // unused for now, so no point in parsing it
             //(64,T_FCONCAT),     // @
               (44,T_COMMA),       // ,
               (59,T_SEMI),        // ;
               (40,T_LPAREN),      // (  [syntax only, i.e., not an operator]
               (41,T_RPAREN),      // )  [syntax only]
               (91,T_LBRACKET),    // [  [syntax only]
               (93,T_RBRACKET),    // ]  [syntax only]
               (33,T_FACTORIAL),   // !
               (123,T_LBRACE),     // {  [syntax only]
               (125,T_RBRACE),     // }  [syntax only]
               (124,T_EVAL_AT)     // |
              ];

     lookup_op c = case (blookup op_map c) of {
                    Nothing  -> Op c;
                    Just tok -> tok;
                   };
   };

   lexTok :: Format -> Lexer Token;
   lexTok fmt = lexFirst [(lexId fmt),(lexString fmt),(lexFloat fmt),(lexSmallInt fmt),(lexInt fmt),(lexOp fmt)];

   is_sign :: Format -> Int -> Bool;
   is_sign fmt c
     | (c == 43) || (c == 45) = True    // + or -
     | else                   = False;

   is_float_marker :: Format -> Int -> Bool;
   is_float_marker fmt c
     | (c == 69) || (c == 101) = True   // E or e
     | else                    = False;

   is_dot :: Format -> Int -> Bool;
   is_dot fmt c
     | (c == 46) = True                 // dot (.)
     | else      = False;

   is_id_start :: Format -> Int -> Bool;
   is_id_start fmt c
     | (c >= 65 && c <= 90)  = True // uppercase
     | (c >= 97 && c <= 122) = True // lowercase
     | (c == 95)             = True // underscore
     | (c > 127)             = True // something weird
     | else                  = False;

   is_digit :: Format -> Int -> Bool;
   is_digit fmt c = (c >= 48 && c <= 57);

   is_id_char :: Format -> Int -> Bool;
   is_id_char fmt c = (is_id_start fmt c) || (is_digit fmt c);

   is_white :: Format -> Int -> Bool;
   is_white fmt c
     | c == 9  = True // tab
     | c == 10 = True // newline
     | c == 13 = True // carriage return
     | c == 32 = True // space
     | else    = False;


// TODO: Move this elsewhere?
   bool_from_registry :: String->Bool->Bool@"[efisymbolics?]Efi.Symbolics::bool_from_registry";

   from_target :: String -> String;
   from_target = _unmangle_hex.from_mupad;

   _unmangle_hex :: String->String@"[efisymbolics?]Efi.Symbolics::_unmangle_hex";

   skipWhite :: Format -> Lexer t -> Lexer t;
   skipWhite fmt lexer = lIgnoreFirst (lexZeroOrMore (lexIf (is_white fmt))) lexer;

   standardLexer :: Format -> Lexer [Token];
   standardLexer fmt = lexList (skipWhite fmt (lexTok fmt));

   lexFromString lexer s = lexWith lexer (LexState 0 (I (get_length s)) s);
/*
   test_expecting flag lexer str = lexres_to_str_expecting flag (lexFromString lexer str);
   testSuccess = (test_expecting True);
   testFailure = (test_expecting False);

   test i = case i of {
    1 -> testSuccess (lexString MuPad) "\"dskjflksdA\"";
    2 -> testSuccess (lexChar 65) "A";
    3 -> testSuccess (lexZeroOrMore (lexChar 65)) "AAAA";
    4 -> testSuccess (lexWhileToString (negate (is_char quote))) "dksdA";
    5 -> testSuccess (lexId MuPad) "adf_d";
    6 -> testSuccess (lexTok MuPad) "a";
    7 -> testSuccess (lexTok MuPad) "+";
    8 -> testSuccess (lexList lexAnyChar) "+++-+";
    9 -> testSuccess (lexInt MuPad) "1234";
    10 -> testSuccess (standardLexer MuPad) "+++-+";
    11 -> testSuccess (standardLexer MuPad) "(a+c)-c";
    12 -> testSuccess (standardLexer MuPad) "(a +c) - c";
    13 -> testSuccess (lexFloat MuPad) "1.2";
    14 -> testSuccess (lexFloat MuPad) "1.2e3";
    15 -> testSuccess (lexFloat MuPad) "1e3";
    16 -> testSuccess (lexFloat MuPad) "1e+3";
    17 -> testSuccess (lexFloat MuPad) "1.e3";
    18 -> testSuccess (lexFloat MuPad) "1.e+3";
    19 -> testSuccess (lexFloat MuPad) "1e-3";
    20 -> testSuccess (lexFloat MuPad) ".2";
    21 -> testSuccess (lexFloat MuPad) ".2e3";

    22 -> testFailure (lexFloat MuPad) ".e3";
    23 -> testFailure (lexFloat MuPad) "2.";
   };

   testall = map test [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,
                       22,23];
*/
   // Note: Can't do this.  No heterogeneous lists in MPL.
   //tests = [(lexString,"\"dskjflksdA\""),
   //         ((lexChar 65),"A"),
   //         ((lexZeroOrMore (lexChar 65)), "AAAA"),
   //         ((lexWhile (negate (is_char quote))), "dksdA"),
   //         ((lexId MuPad),"adf_d")];
// Module Imports


// Error Messages

errmsgParseError = "bad_syntax"; // "symbolics: parse error";
errmsgBadMatrix  = "efisymbolicsparser: bad matrix";
errmsgBadXproc1  = "efisymbolicsparser: ill-formed xproc1";
errmsgBadMcFloat = "efisymbolicsparser: ill-formed mcfloat";
errmsgBadHold    = "efisymbolicsparser: ill-formed hold";

// Formats for parsing and emission

   data Expr = Literal Token
             | Seq [Expr]
             | Parens Expr
             | SMat (Matrix Expr)
             | App Expr [Expr]
             | SLam [Expr] Expr             // symbolic lambda
             | SList [Expr]                 // symbolic list
             | SPiecewise [(Expr,Expr)]     // MuPad's 'piecewise' construct
             | Progn [Expr]                 // semicolon-separated sequence
                                            // of expressions
             // These next few can't be produced by parsing,
             // but can be created by code the translator
             // generates.
             | NLam ([Expr] -> Expr) [Expr] // numeric lambda and
                                            // parameter names
             | SNPair Expr (V{})
             | SVec Expr [Expr]             // vectorized application
             | SRaw String;                 // raw symbolic string (MuPad format implied!)


   data ParserState   = ParserState { rest :: [Token] };
   data ParseResult t = ParseResult ParserState t | ParseError;
   data Parser t      = Parser (ParserState -> ParseResult t);

   freeOf :: Expr -> Expr -> Bool;
   freeOf var exp = 
      if (expr_eq var exp) then False
      else
        case exp of {
          (Literal tok)      -> True; // The False case would have been caught by expr_eq
          (Seq xs)           -> allTrue (freeOf var) xs;
          (Parens x)         -> (freeOf var) x;
          (SMat m)           -> allMatrixElemsTrue (freeOf var) m;
          (App f xs)         -> (freeOf var f) && (allTrue (freeOf var) xs);
          (SLam vs b)        -> (expr_in var vs) || (freeOf var b);
          (SList xs)         -> allTrue (freeOf var) xs;
          (SPiecewise cases) -> allTrue (\ (x,y) -> (freeOf var x) && (freeOf var y)) cases;
          (Progn xs)         -> allTrue (freeOf var) xs;
          (NLam fn xs)       -> allTrue (freeOf var) xs;
          (SNPair x hunoz)   -> (freeOf var) x;
          (SVec x xs)        -> (freeOf var x) && (allTrue (freeOf var) xs);
          (SRaw s)           -> (freeOf var (parseString s));
          _                  -> True; // better to be wrong than to crash
       };

   betaReduce :: Expr -> Expr -> Expr -> Expr;
   betaReduce oldvar newvar exp = 
      if (expr_eq exp oldvar) then
        newvar
      else
        case exp of {
          (Literal tok) -> case tok of { (Id name)  -> if (expr_eq exp oldvar) then newvar else exp;
                                         non_id_tok -> exp;
                                       };
          (Seq xs)           -> (Seq (map transform xs));
          (Parens x)         -> (Parens (transform x));
          (SMat xs)          -> (SMat (smap_1 transform xs));
          (App f xs)         -> (App (transform f) (map transform xs));
          (SLam vs b)        -> if (expr_in oldvar vs) then (SLam vs b) else (SLam vs (transform b));
          (SList xs)         -> (SList (map transform xs));
          (SPiecewise cases) -> (SPiecewise (map (\ (x,y) -> ((transform x),(transform y))) cases));
          (Progn xs)         -> (Progn (map transform xs));
          (NLam fn xs)       -> (NLam fn (map transform xs));
          (SNPair x hunoz)   -> (SNPair (transform x) hunoz);
          (SVec f xs)        -> (SVec (transform f) (map transform xs));
          (SRaw s)           -> (SRaw s); // maybe should parse, but not sure it ever matters
   }
   where
   {
     transform :: Expr -> Expr;
     transform x = (betaReduce oldvar newvar x);
   };

   // Helper function for mapping over a symbolic expression
   mapExpr :: (Expr->Expr)->Expr->Expr;
   mapExpr f (Seq s) = Seq (map f s);
   mapExpr f (Parens x) = Parens (f x);
   mapExpr f (SMat m) = SMat (smap_1 f m);
   mapExpr f (App fn args) = App (f fn) (map f args);
   mapExpr f (SList s) = SList (map f s);
   mapExpr f (SPiecewise pairs) =
       SPiecewise (map (\(x,y)->(f x,f y)) pairs);
   mapExpr f (Progn s) = Progn (map f s);
   mapExpr f (SVec fn args) = SVec (f fn) (map f args);

   maps :: Expr -> Bool;
   maps (Seq _)        = True;
   maps (Parens _)     = True;
   maps (SMat _)       = True;
   maps (App _ _)      = True;
   maps (SList _)      = True;
   maps (SPiecewise _) = True;
   maps (Progn _)      = True;
   maps (SVec _ _)     = True;
   maps _              = False;

   // only tokens compare eq. all other items don't.
   // this is like lisp's eq and is intended as a fast test for a symbol.
   // it is not a general comparison predicate.
   expr_eq :: Expr -> Expr -> Bool;
   expr_eq (Literal tok1) (Literal tok2) = (tok_eq tok1 tok2);
   expr_eq (Seq s1) (Seq s2) =
     case s1 of {
      []     -> case s2 of { [] -> True;
                             _  -> False;
                           };
      (a:as) -> case s2 of { (b:bs) -> if (expr_eq a b)
                                       then (expr_eq (Seq as) (Seq bs))
                                       else False;
                             _ -> False;
                           };
     };
   expr_eq (SList e1) (SList e2) = (expr_eq (Seq e2) (Seq e2));
   expr_eq (Progn b1) (Progn b2) = (expr_eq (Seq b1) (Seq b2));
   expr_eq (Parens e1) (Parens e2) = (expr_eq e1 e2);
   expr_eq (App s1 a1) (App s2 a2) = if (expr_eq s1 s2)
                                     then (expr_eq (Seq a1) (Seq a2))
                                     else False;
   expr_eq (SLam v1 b1) (SLam v2 b2) = if (expr_eq (Seq v1) (Seq v2))
                                       then (expr_eq b1 b2)
                                       else False;
   expr_eq (SPiecewise clauses1) (SPiecewise clauses2) =
      case clauses1 of { [] -> case clauses2 of { [] -> True;
                                                  _  -> False;
                                                };
                         (c1:more1)  -> case clauses2 of { (c2:more2) -> let { (c1_guard, c1_guarded) = c1;
                                                                               (c2_guard, c2_guarded) = c2; } in
                                                                          if (expr_eq c1_guard   c2_guard) &&
                                                                             (expr_eq c1_guarded c2_guarded)
                                                                          then (expr_eq (SPiecewise more1) (SPiecewise more2))
                                                                          else False;
                                                           _ -> False;
                                                         };
                       };
   expr_eq any1 any2 = False;

   // only tokens can be found this way, not arbitrary expressions.
   // this is like old lisp memq (CL's member with an eq predicate) and is intended as a fast way to find symbols.
   // it is not a general comparison predicate.
   expr_in :: Expr -> [Expr] -> Bool;
   expr_in sought (elem:more) = if (expr_eq sought elem)
                                   then True
                                   else expr_in sought more;
   expr_in sought []          = False;

   remove_n_exprs :: Int -> Expr -> [Expr] -> [Expr];

   remove_n_exprs 0 s e = e;

   remove_n_exprs times sought [] = [];

   remove_n_exprs times sought (elem:more) =
     if (expr_eq sought elem)
     then (remove_n_exprs (times-1) sought more)
     else (elem:(remove_n_exprs times sought more));

   // maps a predicate down a list, returning true if predicate is true for all
   allTrue :: (a->Bool) -> [a] -> Bool;
   allTrue pred (elem:more) = if (pred elem)
                                  then allTrue pred more
                                  else False;
   allTrue pred []          = True;

   // maps a predicate down a list, returning true if predicate is true for all
   anyTrue :: (a->Bool) -> [a] -> Bool;
   anyTrue pred (elem:more) = if (pred elem)
                              then True
                              else anyTrue pred more;
   anyTrue pred []          = False;

   allMatrixElemsTrue :: (Expr->Bool) -> (Matrix Expr) -> Bool;
   allMatrixElemsTrue pred m = (doelem 0$ 0$)
   where {
          m' = as_matrix m;
          (I r) = rows m';
          (I c) = cols m';
          doelem :: I4 -> I4 -> Bool;
          doelem i j
              | (ib (ceq_i4 i r)) = True
              | (ib (ceq_i4 j c)) = doelem (add_i4 i 1$) 0$
              | else = if (pred (get_2' m' i j))
                       then doelem i (add_i4 j 1$)
                       else False;
   };

   anyMatrixElemTrue :: (Expr->Bool) -> (Matrix Expr) -> Bool;
   anyMatrixElemTrue pred m = (doelem 0$ 0$)
   where {
          m' = as_matrix m;
          (I r) = rows m';
          (I c) = cols m';
          doelem :: I4 -> I4 -> Bool;
          doelem i j
              | (ib (ceq_i4 i r)) = False
              | (ib (ceq_i4 j c)) = doelem (add_i4 i 1$) 0$
              | else = if (pred (get_2' m' i j))
                       then True
                       else doelem i (add_i4 j 1$);
   };

   // This definition of smap_1 was moved from efisymbolics.mpl to here because it's used both places.
   // There should probably be an efisymbolicsutils.mpl that contains this kind of general purpose stuff.
   // -kmp 13-Apr-2006
   smap_1 :: (a->b)->(Matrix a)->(Matrix b);
   smap_1 f a = v f (stelem (newvec 1$) 0$ a)
   where {
     v :: (a->b) -> Vector (Matrix a) -> (Matrix b) @"[mplrun]Mcd.MatVal::vectorize";
   };

   parseWith :: Parser t -> ParserState -> t;
   parseWith (Parser p) s = case (p s) of {
    (ParseResult (ParserState [])     x) -> x;
//  (ParseResult (ParserState tokens) x) -> error errmsgParseError;
     _                                   -> error errmsgParseError;
   };

   // This should have been called parseMuPadString
   parseString :: String -> Expr;
   parseString s = parseMuPadString s;

   parseMuPadString :: String -> Expr;
   parseMuPadString s = parseAnyString MuPad s;

   parseMathcadString :: String -> Expr;
   parseMathcadString s = parseAnyString Mathcad s;

   parseMathcadNumber :: String -> Expr;
   parseMathcadNumber s = parseMathcadString s; // stub definition for now

   parseAnyString :: Format -> String -> Expr;
   parseAnyString fmt s =
    case (lexFromString (standardLexer fmt) s) of {
     (LexResult _ tokens) -> parseWith (parse fmt (0-1)) (ParserState tokens);
     _                    -> error errmsgLexError;
    };

   pBind :: Parser t -> (t -> Parser u) -> Parser u;
   pBind (Parser p) k =
       Parser (\pstate -> case (p pstate) of {
                          ParseResult s x -> let { (Parser q) = k x } in q s;
                          ParseError      -> ParseError;
                         }
              );


   pAlt :: Parser t -> Parser t -> Parser t;
   pAlt (Parser p1) (Parser p2) =
       Parser (\pstate -> case (p1 pstate) of {
                          ParseError -> (p2 pstate);
                          pres       -> pres;
                         }
              );

   pempty :: t -> Parser t;
   pempty x = Parser (\pstate -> ParseResult pstate x);

   pFail :: Parser t;
   pFail = Parser (\_ -> ParseError);

   pbuild :: Parser t -> (t -> u) -> Parser u;
   pbuild p f = pBind p (pempty.f);

   getToken :: Parser Token;
   getToken = Parser f where {
     f (ParserState (x:r)) = (ParseResult (ParserState r) x);
     f _                   = ParseError;
   };

   putBack :: Token -> Parser ();
   putBack x = Parser (\(ParserState r) ->
                          (ParseResult (ParserState (x:r)) ()));

   pMatchIf :: (Token->Bool) -> Parser Token;
   pMatchIf pred = pBind getToken (\token -> if (pred token)
                                             then pempty token
                                             else pFail);

   pMatchIfNot :: (Token->Bool) -> Parser Token;
   pMatchIfNot pred = pBind getToken (\token -> if (not (pred token))
                                                then pempty token
                                                else pFail);

   tok_eq :: Token -> Token -> Bool;
   tok_eq (Op x) (Op y) = (x == y);
   tok_eq (Id a) (Id b) = (ib (eq_i4 a b));
   tok_eq (ITok a) (ITok b) = (a == b);
   tok_eq (Float a) (Float b) = stringEqual a b;
   tok_eq (BigITok a) (BigITok b) = stringEqual a b;
   tok_eq (STok a) (STok b) = stringEqual a b;
   tok_eq t1      t2    = (ib (eq_i4 t1 t2));

   tok_in :: Token -> [Token] -> Bool;
   tok_in sought (elem:more) = if (tok_eq sought elem)
                                   then True
                                   else tok_in sought more;
   tok_in sought []          = False;

   str_eq :: String -> String -> Bool;
   str_eq x y = (ib (eq_i4 x y));

   pMatchTok :: Token -> Parser Token;
   pMatchTok tok = pMatchIf (tok_eq tok);

   pMatchNotTok :: Token -> Parser Token;
   pMatchNotTok tok = pMatchIfNot (tok_eq tok);

   pMaybe :: Parser t -> Parser (Maybe t);
   pMaybe p = pAlt (pBind p (\x -> pempty (Just x))) (pempty Nothing);

   pDelimited :: Parser t -> [t] -> Parser u -> Parser [t];
   pDelimited p accum delimiter =
    pBind p (\x -> pAlt (pBind delimiter
                          (\_ -> pDelimited p (x:accum) delimiter))
                        (pempty (reverse (x:accum))));

   pKeep1 :: Parser t -> Parser u -> Parser t;
   pKeep1 p q = pBind p (\x -> (pBind q (\_ -> (pempty x))));

   pBracketed :: Parser t -> Parser u -> Parser v -> Parser u;
   pBracketed p q r = pBind p (\_ -> (pKeep1 q r));

   pUntil :: Parser t -> Parser t;
   pUntil p = pAlt p (pBind getToken (\_ -> (pUntil p)));

   pUntilTok :: Token -> Parser Token;
   pUntilTok tok = pUntil (pMatchTok tok);

   pZeroOrMore :: Parser t -> Parser [t];
   pZeroOrMore p = pAlt (pBind p (\x -> pBind (pZeroOrMore p)
                                 (\r -> pempty (x:r))))
                        (pempty []);

   pOneOrMore :: Parser t -> Parser [t];
   pOneOrMore p = pBind p (\x -> pBind (pZeroOrMore p) (\r -> pempty (x:r)));

// General parsing functions and utilities

   parse :: Format -> Int -> Parser Expr;
   parse fmt rbp = pBind getToken
                (\token -> pAlt (pBind (parse_nud fmt token)
                                  (\left -> (phelp fmt rbp left)))
                                (phelp fmt rbp (Literal token)));

   phelp :: Format -> Int -> Expr -> Parser Expr;
   phelp fmt rbp left = pAlt (pBind getToken
                           (\op -> if (lbp fmt op) < rbp
                                   then pBind (putBack op)
                                         (\_ -> (pempty left))
                                   else pBind (parse_led fmt left op)
                                         (\left -> phelp fmt rbp left)))
                         (pempty left);

   parse_bracketed :: Format -> Token -> Parser t -> Parser t;
   parse_bracketed fmt begin p =
     pBracketed (pMatchTok begin) p (pMatchTok (match fmt begin));

   parse_delimited :: Format -> [Expr] -> Token -> Parser [Expr];
   parse_delimited fmt left sep =
    pDelimited (parse fmt ((lbp fmt sep)+1)) left (pMatchTok sep);

// Parsers used in parse_nud and parse_led

   parse_nary :: Format -> [Expr] -> Token -> Parser Expr;
   parse_nary fmt left op =
    pbuild (pDelimited (parse fmt (rbp fmt op)) left (pMatchTok op))
           (App (Literal op));

   parse_binary :: Format -> [Expr] -> Token -> Parser Expr;
   parse_binary fmt [x] op =
    pBind (parse fmt (rbp fmt op)) (\y -> pempty (App (Literal op) [x,y]));

   parse_call :: Format -> Expr -> Token -> Parser Expr;
   parse_call fmt f begin =
    let { sep = (separator fmt begin); mtch = (match fmt begin); } in
     pbuild (pKeep1 (pDelimited (parse fmt ((lbp fmt sep)+1)) [] (pMatchTok sep))
                    (pMatchTok mtch))
            (App f);

   parse_subscript :: Format -> Expr -> Token -> Parser Expr;
   parse_subscript fmt m begin =
    let { sep = (separator fmt begin); mtch = (match fmt begin); } in
     pbuild (pKeep1 (pDelimited (parse fmt ((lbp fmt sep)+1)) [] (pMatchTok sep))
                    (pMatchTok mtch))
            (build_subscript m);

   build_subscript :: Expr -> [Expr] -> Expr;
   build_subscript m [i]   =
     case i of {
      (App (Literal T_RANGE) [lo,hi]) -> (App (Literal T_MUSUBMATRIX)
                                              [m, lo, hi,
                                                  (Literal (ITok 1)),
                                                  (Literal (ITok 1))]);
                                     _ -> (App (Literal T_SUB1)
                                              [m,
                                               (predecessor
                                                 (App (Literal T_PLUS) [origin, i])),
                                               origin]);
     } where {
       origin = (Literal (Id "mc_ORIGIN"));
     };

   build_subscript m [i,j] =
     case i of {
      (App (Literal T_RANGE) [ilo,ihi]) ->
           case j of {
               (App (Literal T_RANGE) [jlo,jhi]) ->
                    (App (Literal T_MUSUBMATRIX)
                         [m, ilo, ihi, jlo, jhi]);
               _ ->
                    (App (Literal T_MUSUBMATRIX)
                         [m, ilo, ihi, j, j]);
           };
      _ -> case j of {
               (App (Literal T_RANGE) [jlo,jhi]) ->
                    (App (Literal T_MUSUBMATRIX)
                         [m, i, j, jlo, jhi]);
               _ -> (App (Literal T_SUB2)
                         [m,
                          (predecessor (App (Literal T_PLUS) [origin, i])),
                          (predecessor (App (Literal T_PLUS) [origin, j])),
                          origin]);
           };
     } where {
       origin = (Literal (Id "mc_ORIGIN"));
     };

   successor :: Expr -> Expr;
   successor x = add x (Literal (ITok 1));

   predecessor :: Expr -> Expr;
   predecessor x = add x (Literal (ITok (0-1)));


   numsimp :: Expr -> Expr;
   numsimp x =
     case x of {
       (App (Literal T_UMINUS) [(Literal (ITok k))]) -> (Literal (ITok (0-k)));
       _ -> x;
     };

   add :: Expr -> Expr -> Expr;
   add x0 y0 =
       if ok
       then val
       else (App (Literal T_PLUS) [x,y])
     where {
       x = numsimp x0;
       y = numsimp y0;
       (ok, val) = addp x y;
     };

   addp :: Expr -> Expr -> (Bool,Expr);
   addp x1 y =
     case x1 of {
      (Literal (ITok 0)) -> (True, y);
      (Literal (ITok n1)) ->
         case y of {
           (Literal (ITok n2)) -> (True, (Literal (ITok (n1+n2))));
           _                   -> addp y x1;
         };
      (App (Literal T_UMINUS) [xneg]) -> if (expr_eq xneg y)
                                   then (True, (Literal (ITok 0)))
                                   else (False, x1);
      (App (Literal T_PLUS) [x2, x3]) ->
         let { (ok2, sum2) = addp x2 y; } in
           if ok2
           then (True, if (expr_eq sum2 (Literal (ITok 0)))
                       then x3
                       else (App (Literal T_PLUS) [sum2, x3]))
           else let { (ok3, sum3) = addp x3 y; } in
                  if ok3
                  then (True, if (expr_eq sum3 (Literal (ITok 0)))
                              then x2
                              else (App (Literal T_PLUS) [x2, sum3]))
                  else (False, x1);
      (App (Literal T_MINUS) [x2, x3]) ->
         let { (ok2, sum2) = addp x2 y; } in
           if ok2
           then (True, if (expr_eq sum2 (Literal (ITok 0)))
                       then x3
                       else (App (Literal T_MINUS) [sum2, x3]))
           else let { (ok3, sum3) = addp x3 (negative y); } in
                  if ok3
                  then (True, if (expr_eq sum3 (Literal (ITok 0)))
                              then x2
                              else (App (Literal T_MINUS) [x2, sum3]))
                  else (False, x1);
      _ -> if (expr_eq x1 (negative y))
           then (True, (Literal (ITok 0)))
           else (False, x1);
     };

   negative :: Expr -> Expr;
   negative (Literal t@(ITok n))    = (Literal (negToken t));
   negative (Literal t@(BigITok s)) = (Literal (negToken t));
   negative (Literal t@(Float s))   = (Literal (negToken t));
   negative (App (Literal T_UMINUS) [e]) = e;
   negative (App (Literal T_MULT) []) = (Literal (ITok (0-1)));
   negative (App (Literal T_MULT) [k]) = negative k;
   negative (App (Literal T_MULT) (n:m)) =
     multiply (negative n) (App (Literal T_MULT) m);
   negative e = (App (Literal T_UMINUS) [e]);

   negToken :: Token -> Token;
   negToken (ITok n) = (ITok (0-n));
   negToken (Float s) = if (stringEqual (substr s 0 1) "-") then
                           (Float (substr s 1 (I (get_length s))))
                        else
                           (Float (strcat "-" s));
   negToken (BigITok s) = if (stringEqual (substr s 0 1) "-") then
                           (BigITok (substr s 1 (I (get_length s))))
                        else
                           (BigITok (strcat "-" s));

   multiply :: Expr -> Expr -> Expr;
   multiply (App (Literal T_MULT) args1) (App (Literal T_MULT) args2) =
     multiplyx (concat [args1,args2]);
   multiply x@(App (Literal T_MULT) args1) y = multiplyx (concat [args1,[y]]);
   multiply x y@(App (Literal T_MULT) args2) = multiplyx (concat [[x],args2]);
   multiply x y = multiply2 x y;

   multiplyx :: [Expr] -> Expr;
   multiplyx []    = (Literal (ITok 1));
   multiplyx [x]   = x;
   multiplyx [x,y] = multiply2 x y;
   multiplyx (x1:(x2:xs)) = multiplyx ((multiply2 x1 x2):xs);

   multiply2 :: Expr -> Expr -> Expr;
   multiply2 (App (Literal T_UMINUS) [x]) y = (multiply2 (Literal (ITok (0-1))) (multiply x y));
   multiply2 (Literal TImagUnit) (Literal TImagUnit) = (Literal (ITok (0-1)));
   multiply2 (Literal (ITok 1)) y = y;
   multiply2 (Literal (ITok n1)) (Literal (ITok n2)) =
     if nn < 0
     then (App (Literal T_UMINUS) [(Literal (ITok (abs nn)))])
     else (Literal (ITok nn))
   where { nn = n1 McdRun.* n2; };
   multiply2 (App (Literal T_DIVIDE) [n1,d1]) (App (Literal T_DIVIDE) [n2,d2]) =
     (App (Literal T_DIVIDE) [(multiply n1 n2),(multiply d1 d2)]);
   multiply2 (App (Literal T_DIVIDE) [n1,d1]) y =
     (App (Literal T_DIVIDE) [(multiply n1 y),d1]);
   multiply2 x (App (Literal T_UMINUS) [y]) = (multiply2 (Literal (ITok (0-1))) (multiply x y));
   multiply2 x (App (Literal T_DIVIDE) [n2,d2]) =
     (App (Literal T_DIVIDE) [(multiply x n2),d2]);
   multiply2 x@(Literal (ITok n1)) y = (App (Literal T_MULT) [x,y]);
   multiply2 x y@(Literal (ITok n)) = multiply2 y x;
   multiply2 x y = (App (Literal T_MULT) [x,y]);

   timesI :: Expr -> Expr;
   timesI (App (Literal T_MULT) args) =
     if (expr_in i args)
     then (negative (multiplyx (remove_n_exprs 1 i args)))
     else (multiplyx (i:args))
   where {
     i = (Literal TImagUnit);
   };
   timesI x = (timesI (App (Literal T_MULT) [x]));

//   (App (Literal T_MULT) (remove_n_exprs 1 (Literal TImagUnit) args)))

//   timesI (Literal TImagUnit) = (Literal (ITok (0-1)));
//   timesI (App (Literal T_MULT) []) = (Literal TImagUnit);
//   timesI (App (Literal T_MULT) [k]) = timesI k;
//   timesI (App (Literal T_MULT) args) =
//     if (expr_in (Literal TImagUnit) args)
//     then (negative (App (Literal T_MULT) (remove_n_exprs 1 (Literal TImagUnit) args)))
//     else (App (Literal T_MULT) ((Literal TImagUnit):args));
//   timesI (App (Literal T_DIVIDE) [x,y]) = (App (Literal T_DIVIDE) [(timesI x),y]);
//   timesI k = (App (Literal T_MULT) [k, (Literal TImagUnit)]);

   parse_seq :: Format -> [Expr] -> Token -> Parser Expr;
   parse_seq fmt left sep = pbuild (parse_delimited fmt left sep) Seq;

   parse_progn :: Format -> [Expr] -> Token -> Parser Expr;
   parse_progn fmt left sep =
      let { psep = pMatchTok sep;
            pexp = pBind (pZeroOrMore psep) (\_ -> (parse fmt ((lbp fmt sep)+1)));
          } in
      pbuild (pDelimited pexp left psep) Progn;

   parse_parens :: Format -> Token -> Parser Expr;
   parse_parens fmt begin = pbuild (pKeep1 (parse fmt ((lbp fmt (match fmt begin))+1))
                                       (pMatchTok (match fmt begin)))
                               Parens;

   parse_unary :: Format -> Token -> Parser Expr;
   parse_unary fmt op = pBind (parse fmt (rbp fmt op))
                     (\x -> pempty (App (Literal op) [x]));

   parse_unary_led :: Format -> Expr -> Token -> Parser Expr;
   parse_unary_led fmt expr op = pempty (App (Literal op) [expr]);

   parse_not :: Format -> () -> Parser Expr;
   parse_not fmt _ = pBind (parse fmt (rbp fmt T_NOT))
                      (\x -> pempty (adjust_not x))
   where {

     adjust_not :: Expr -> Expr;
     adjust_not x =
        case x of {
          (Parens px)                   -> adjust_not px;
          (App (Literal T_AS_BOOL) [e]) -> adjust_not e;
          _                             -> adjust x;
        };

     adjust :: Expr -> Expr;
     adjust x =
            case x of {
             (App (Literal T_EQ)   [a,b]) -> (App (Literal T_NEQ)  [a,b]);
             (App (Literal T_NEQ)  [a,b]) -> (App (Literal T_EQ)   [a,b]);
             (App (Literal T_LT)   [a,b]) -> (App (Literal T_GTEQ) [a,b]);
             (App (Literal T_GT)   [a,b]) -> (App (Literal T_LTEQ) [a,b]);
             (App (Literal T_LTEQ) [a,b]) -> (App (Literal T_GT)   [a,b]);
             (App (Literal T_GTEQ) [a,b]) -> (App (Literal T_LT)   [a,b]);
             (App (Literal T_MC_EQ)   [a,b]) -> (App (Literal T_MC_NEQ)  [a,b]);
             (App (Literal T_MC_NEQ)  [a,b]) -> (App (Literal T_MC_EQ)   [a,b]);
             (App (Literal T_MC_LT)   [a,b]) -> (App (Literal T_MC_GTEQ) [a,b]);
             (App (Literal T_MC_GT)   [a,b]) -> (App (Literal T_MC_LTEQ) [a,b]);
             (App (Literal T_MC_LTEQ) [a,b]) -> (App (Literal T_MC_GT)   [a,b]);
             (App (Literal T_MC_GTEQ) [a,b]) -> (App (Literal T_MC_LT)   [a,b]);
             (App (Literal T_NOT)  [a])   -> (App (Literal T_NOT)  [(adjust_not a)]);
             (Literal tok)                -> (App (Literal T_NOT)  [x]);
             _                            -> (App (Literal T_NOT)  [(Parens x)]);
           };
   };

   // parse_proc takes a dummy argument in order to avoid
   // a "dependency cycle" error from the compiler.
   parse_proc :: Format -> () -> Parser Expr;
   parse_proc fmt _ = pBind (pMatchTok T_LPAREN)
                   (\_            -> pBind (parse_seq fmt [] T_COMMA)
                   (\ (Seq params) -> pBind (pMatchTok T_RPAREN)
                   (\_            -> (pUntil (pAlt (pBind (pMatchTok (Id "begin"))
                                                      // parses and returns body
                                                      (\_ -> (parse_proc_body fmt params)))
                                                   (pBind (pMatchTok (Id "name"))
                                                      (\_ -> (pBind (getToken)
                                                               (\pname -> if (anonymous_procname_tok fmt pname)
                                                                          then pFail
                                                                          else (pBind (parse_past_proc_body fmt pname)
                                                                                 // skips body, returns name
                                                                                 (\_ -> pempty (Literal pname))))))))))));

   // anonymous_procname tests whether a procedure's name makes it anonymous or not,
   // which affects whether it parses as a symbol (its name) or as something exposing
   // its internal function.
   //
   // For example Bug # 060531-233610 needs to detect procedures with names like "ex",
   // "res", "ret", "result", "anonymous", and others as anonymous.  Since ALL mc_ and mcad_
   // and op_ names have "_" in them, for the sake of name mangling, and since local
   // variable names (from which these funny procedure names for anonymous procedures tend
   // to come) don't have "_" in them, we use that as a fast test.

   anonymous_procname_tok :: Format -> Token -> Bool;
   anonymous_procname_tok fmt (Id s) = anonymous_procname s;
   anonymous_procname_tok fmt _ = False;

   anonymous_procname :: String -> Bool;
   anonymous_procname s =
      testchars clist
   where {

     testchars :: [Int] -> Bool;
     testchars [] = True;
     testchars (c:more) = if c == 95
                          then False
                          else testchars more;

     clist = stringToCharList s;
   };

   parse_proc_body :: Format -> [Expr] -> Parser Expr;
   parse_proc_body fmt params =
                  pBind (parse fmt (0-1))
                   (\body -> pBind (pMatchTok (Id "end_proc"))
                   (\_    -> pempty (SLam params body)));

   parse_past_proc_body :: Format -> Token -> Parser Token;
   parse_past_proc_body fmt p = (pBind (pUntilTok (Id "begin"))
                                   (\_ -> (parse_to_proc_end fmt p)));

   parse_to_proc_end :: Format -> Token -> Parser Token;
   parse_to_proc_end fmt p1 = pUntil (pAlt (pBind (pMatchTok (Id "proc"))
                                             (\p2 -> (pBind (parse_to_proc_end fmt p2)
                                                       (\_ -> (parse_to_proc_end fmt p1)))))
                                           (pMatchTok (Id "end_proc")));

   parse_xproc1 :: Format -> () -> Parser Expr;
   parse_xproc1 fmt _ =
    pbuild
     (parse_bracketed fmt T_LPAREN (parse_delimited fmt [] T_COMMA))
     build_xproc1;

   parse_mcfloat :: Format -> () -> Parser Expr;
   parse_mcfloat fmt _ =
    pbuild
     (parse_bracketed fmt T_LPAREN (parse_delimited fmt [] T_COMMA))
     build_mcfloat;

   parse_hold :: Format -> () -> Parser Expr;
   parse_hold fmt _ =
    pbuild
     (parse_bracketed fmt T_LPAREN (parse_delimited fmt [] T_COMMA))
     build_hold;

   parse_matrix :: Format -> () -> Parser Expr;
   parse_matrix fmt _ =
    pbuild
     (parse_bracketed fmt T_LPAREN
       (parse_bracketed fmt T_LBRACKET
         (pDelimited (parse_bracketed fmt T_LBRACKET (parse_delimited fmt [] T_COMMA))
                     [] (pMatchTok T_COMMA))))
     build_matrix;

   parse_piecewise :: Format -> () -> Parser Expr;
   parse_piecewise fmt _ =
    pbuild
     (parse_bracketed fmt T_LPAREN
       (pDelimited (parse_bracketed fmt T_LBRACKET (parse_branch ()))
                   [] (pMatchTok T_COMMA)))
     SPiecewise
   where {
     parse_branch :: () -> Parser (Expr,Expr);
     parse_branch _ = pBind                 (parse fmt ((lbp fmt T_COMMA)+1))
                      (\condition -> pBind  (pMatchTok T_COMMA)
                      (\_         -> pBind  (parse fmt ((lbp fmt (match fmt T_LBRACKET))+1))
                      (\expr      -> pempty (condition,expr))));
   };

   parse_braces :: Format -> Token -> ([Expr]->Expr) -> Parser Expr;
   parse_braces fmt begin builder =
    let { sep = (separator fmt begin); mtch = (match fmt begin); } in
     pbuild (pKeep1 (parse_delimited fmt [] sep) (pMatchTok mtch)) builder;

// Operators

   default_lbp :: Format -> Int;
   default_lbp fmt = 1000;

   default_rbp :: Format -> Int;
   default_rbp fmt = 0;

   lbp :: Format -> Token -> Int;
   rbp :: Format -> Token -> Int;

   // Presently we deal with :: as an actual part of a name.
   // :: (method access, slot)                MuPAD priority = 2000

   // '  (differential operator, D)           MuPAD priority = 1900
   // .  (concatenation, _concat)             MuPAD priority = 1700
   lbp fmt T_FNEST      = 180; // @@ (_fnest)     MuPAD priority = 1600  (iterated composition)
   rbp fmt T_FNEST      = 180;

   // @  (composition of functions, _fconcat) MuPAD priority = 1500

   lbp fmt T_FACTORIAL  = 160; // !  (factorial)  MuPAD priority = 1300

   lbp fmt T_FACTORIAL2 = 160; // !! (fact2)      MuPAD priority = 1300

   lbp fmt T_POW       = 140; // ^                MuPAD priority = 1200
   rbp fmt T_POW       = 141; // ^

   lbp XML T_OP_POWER  = 140; // superscript (Mathcad) = op_power
   rbp XML T_OP_POWER  = 141; // superscript (Mathcad) = op_power

   // NOTE: In M a p l e, the precedence of "/" is believed to have been higher than "*".
   //       For MuPAD, they document that they are not, so we've set this back.

   lbp fmt T_DIVIDE    = 110; // /                MuPAD priority = 1100
   rbp fmt T_DIVIDE    = 111; // /

   lbp XML T_OP_DIV    = 110; // / (Mathcad) = op_div
   rbp XML T_OP_DIV    = 111; // / (Mathcad) = op_div

   lbp fmt T_MULT      = 110; // *                MuPAD priority = 1100
   rbp fmt T_MULT      = 111; // *

   lbp XML T_OP_MULT   = 110; // * (Mathcad) = op_mult
   rbp XML T_OP_MULT   = 111; // * (Mathcad) = op_mult

   rbp fmt T_UMINUS    = 105; // unary -          MuPAD priority = 1050 (prefix)

   rbp XML T_OP_NEGATE = 105; // unary - (Mathcad) = op_negate

   lbp fmt T_PLUS      = 100; // +                MuPAD priority = 1000
   rbp fmt T_PLUS      = 101; // +

   lbp XML T_OP_ADD    = 100; // + (Mathcad) = op_add
   rbp XML T_OP_ADD    = 101; // + (Mathcad) = op_add

   lbp fmt T_MINUS     = 100; // -                MuPAD priority = 1000 (infix)
   rbp fmt T_MINUS     = 101; // -

   lbp XML T_OP_SUB    = 100; // - (Mathcad) = op_sub
   rbp XML T_OP_SUB    = 101; // - (Mathcad) = op_sub

   lbp fmt T_MOD_DIV   = 98;  // div              MuPAD priority = 0900
   rbp fmt T_MOD_DIV   = 99;  // div

   lbp fmt T_MOD_REM   = 98;  // mod              MuPAD priority = 0900
   rbp fmt T_MOD_REM   = 99;  // mod

   // "..." operator is called "hull" and used for floating point intervals by MuPAD
   lbp fmt T_ZHULL     = 96;  // ... [hull]       MuPAD priority = 0850
   rbp fmt T_ZHULL     = 97;  // ... [hull]

   lbp fmt T_INTERSECT = 94; // intersect         MuPAD priority = 0800
   rbp fmt T_INTERSECT = 95; // intersect

   lbp fmt T_SETMINUS  = 92; // minus             MuPAD priority = 0700
   rbp fmt T_SETMINUS  = 93; // minus

   lbp fmt T_UNION     = 90; // union             MuPAD priority = 0600
   rbp fmt T_UNION     = 91; // union

   lbp fmt T_RANGE     = 85; // ..                MuPAD priority = 0500
   rbp fmt T_RANGE     = 86; // ..

   lbp fmt T_LT        = 80; // <                 MuPAD priority = 0400
   rbp fmt T_LT        = 81; // <

   lbp fmt T_MC_LT     = 80;
   rbp fmt T_MC_LT     = 81;

   lbp fmt T_GT        = 80; // >                 MuPAD priority = 0400
   rbp fmt T_GT        = 81; // >

   lbp fmt T_MC_GT     = 80;
   rbp fmt T_MC_GT     = 81;

   lbp fmt T_LTEQ      = 80; // <=                MuPAD priority = 0400
   rbp fmt T_LTEQ      = 81; // <=

   lbp fmt T_MC_LTEQ   = 80;
   rbp fmt T_MC_LTEQ   = 81;

   lbp fmt T_GTEQ      = 80; // >=                MuPAD priority = 0400
   rbp fmt T_GTEQ      = 81; // >=

   lbp fmt T_MC_GTEQ   = 80;
   rbp fmt T_MC_GTEQ   = 81;

   lbp fmt T_NEQ       = 80; // <>                MuPAD priority = 0400
   rbp fmt T_NEQ       = 81; // <>

   lbp fmt T_MC_NEQ    = 80;
   rbp fmt T_MC_NEQ    = 81;

   lbp fmt T_EQ        = 80; // =                 MuPAD priority = 0400
   rbp fmt T_EQ        = 81; // =

   lbp fmt T_MC_EQ     = 80;
   rbp fmt T_MC_EQ     = 81;

   lbp fmt T_IN        = 80; // in                MuPAD priority = 0400
   rbp fmt T_IN        = 81; // in

   lbp fmt T_SUBSET    = 80; // subset            MuPAD priority = 0400
   rbp fmt T_SUBSET    = 80; // subset

   // $ in MuPAD means _seqgen or _seqin according to context
   // We take care to always refer to it as $ to avoid having to know.
   lbp fmt T_ZSEQ      = 68; // $                 MuPAD priority = 0300
   rbp fmt T_ZSEQ      = 69; // $                 MuPAD priority = 0300


   // Note: T_NOT and T__NOT are unary; a left binding power
   // must not be specified, since they take no left operand.

   rbp XML T_NOT       = 101; // !!! EXPERIMENTAL
   rbp fmt T_NOT       = 69; // not               MuPAD priority = 0300

   lbp fmt T_AND       = 64; // and               MuPAD priority = 0200
   rbp fmt T_AND       = 65; // and

   lbp fmt T_XOR       = 62; // xor               MuPAD priority = 0150
   rbp fmt T_XOR       = 63; // xor

   lbp fmt T_OR        = 60; // or                MuPAD priority = 0100
   rbp fmt T_OR        = 61; // or

   lbp fmt T_ZASSUMING = 60; // assuming          MuPAD priority = 0100
   rbp fmt T_ZASSUMING = 61; // assuming

   lbp fmt T_ZIMPLIES  = 50; // ==> (implies)     MuPAD priority = 0075
   rbp fmt T_ZIMPLIES  = 51; // ==> (implies)

   lbp fmt T_ZEQUIV    = 40; // <=> (equiv)       MuPAD priority = 0050
   rbp fmt T_ZEQUIV    = 41; // <=> (equiv)

   lbp fmt T_EVAL_AT   = 30; // |                 MuPAD priority = 0035
   rbp fmt T_EVAL_AT   = 31; // |

   lbp fmt T_COMMA     = 0;  // ,                 MuPAD priority = 0020
   lbp fmt T_RPAREN    = 0;  // )
   lbp fmt T_RBRACKET  = 0;  // ]                 MuPAD priority = 1800

   lbp fmt T_SEMI      = 0;  // ;                 MuPAD priority = 0010
   // : (command separator, _stmtseq)         MuPAD priority = 0010

   lbp fmt _ = default_lbp fmt;
   rbp fmt _ = default_rbp fmt;

   takes_left_operand :: Format -> Token -> Bool;
   takes_left_operand fmt tok = not ((lbp fmt tok) == (default_lbp fmt));

   takes_right_operand :: Format -> Token -> Bool;
   takes_right_operand fmt tok = not ((rbp fmt tok) == (default_rbp fmt));

   is_op :: Format -> Token -> Bool;

   // XML thinks these are operators and we have binding powers for them,
   // but MuPad wants them as regular functions.

   is_op MuPad T_MC_EQ   = False;
   is_op MuPad T_MC_LT   = False;
   is_op MuPad T_MC_GT   = False;
   is_op MuPad T_MC_NEQ  = False;
   is_op MuPad T_MC_LTEQ = False;
   is_op MuPad T_MC_GTEQ = False;

   is_op fmt tok = (takes_left_operand fmt tok) || (takes_right_operand fmt tok);

   separator :: Format -> Token -> Token;
   separator fmt T_LPAREN    = T_COMMA;
   separator fmt T_LBRACKET  = T_COMMA;
   separator fmt T_LBRACE    = T_COMMA;

   match :: Format -> Token -> Token;
   match     fmt T_LPAREN    = T_RPAREN;
   match     fmt T_LBRACKET  = T_RBRACKET;
   match     fmt T_LBRACE    = T_RBRACE;

   parse_nud :: Format -> Token -> Parser Expr;
   parse_nud fmt T_LPAREN    = parse_parens fmt T_LPAREN;
   parse_nud fmt T_MINUS     = parse_unary fmt T_UMINUS; // unary negation
 //Use this version to parse not normally (without optimization)
 //parse_nud fmt T_NOT       = parse_unary fmt T_NOT;    // logical negation
   parse_nud fmt T_NOT       = parse_not fmt ();
   parse_nud fmt TProc       = parse_proc fmt ();
   parse_nud fmt TXProc1     = parse_xproc1 fmt ();
   parse_nud fmt TMatrix     = parse_matrix fmt ();
   parse_nud fmt TPiecewise  = parse_piecewise fmt ();
   parse_nud fmt TMcFloat    = parse_mcfloat fmt ();
   parse_nud fmt T_HOLD      = parse_hold fmt ();
   parse_nud fmt T_LBRACKET  = parse_braces fmt T_LBRACKET SList;
   parse_nud fmt T_LBRACE    = parse_braces fmt T_LBRACE set_constructor;
   parse_nud fmt _ = pFail;

   // parse {a,b,c} as DOM_SET(a,b,c) since that's equivalent in MuPAD.
   set_constructor :: [Expr] -> Expr;
   set_constructor elements = App (Literal T_SET) elements;

   parse_led :: Format -> Expr -> Token -> Parser Expr;
   parse_led fmt left T_LPAREN     = parse_call fmt      left  T_LPAREN;
   parse_led fmt left T_COMMA      = parse_seq fmt      [left] T_COMMA;
   parse_led fmt left T_SEMI       = parse_progn fmt    [left] T_SEMI;
   parse_led fmt left T_FACTORIAL  = parse_unary_led fmt left  T_FACTORIAL;
   parse_led fmt left T_FACTORIAL2 = parse_unary_led fmt left  T_FACTORIAL2;
   parse_led fmt left T_XD         = parse_unary_led fmt left  T_D;
   parse_led fmt left T_LBRACKET   = parse_subscript fmt left  T_LBRACKET;
   parse_led fmt left tok          = if (rbp fmt tok) > 0
                                     then parse_binary fmt [left] tok
                                     else pFail;

// Utilites

   // build a matrix from a nested list of elements
   build_matrix nested@(r1:_) =
    let { (I rows) = length nested;
          (I cols) = length r1;
          elem     = concat nested;
          op_transpose::M a->M a@"[efimatrix?]Efi.Matrix::transpose"; // from Efi Matrix
        } in
     SMat (op_transpose (init_array cols rows elem));
   build_matrix _             = error errmsgBadMatrix;

   // build a proc
   build_xproc1 [v,e] = SLam [v] e;
   build_xproc1 _     = error errmsgBadXproc1;

   // build a mcfloat (by picking out the expression, dropping precision for now)
   build_mcfloat [r,p,i] = make_complex r i;
   build_mcfloat [r,p]   = r;
   build_mcfloat [r]     = r;
   build_mcfloat _     = error errmsgBadMcFloat;

   // build a hold (by picking out the expression, dropping extraneous args)
   build_hold [x] = x;
   build_hold _     = error errmsgBadHold;

   make_complex :: Expr -> Expr -> Expr;
   make_complex r (Literal (ITok 0)) = r;
   make_complex r i@(Literal (Float s)) =
     if (str_eq s "0.0")
     then r
     else make_full_complex r i;

   make_complex r i = make_full_complex r i;

   make_full_complex :: Expr -> Expr -> Expr;
   make_full_complex r i =
    (App (Literal T_PLUS) [r,(App (Literal T_MULT) [i,(Literal TImagUnit)])]);

// Tests
   test = map parseString ["a",
                           "a+b",
                           "a+b+c",
                           "1,2", // sequence
                           "1+2,3", // sequence (1+2),3
                           "1+2*f(2)", // 1+(2*f(2))
                           "(1)+((2)*f(2))", // 1+(2*f(2))
                           "g(x,y)",
                           "mcad_add(1, 1)",
                           "proc(mc_x, mc_y) begin
                             eval(op_add(mc_x, mc_y))
                            end_proc"
                          ];

   checkParser :: String -> Expr -> ();
   checkParser unparsed expected
       | (ib (eq_i4 expected_string parsed_string)) = ()
       | else                         = (report_error expected_string
                                                      parsed_string)
   where {
     parsed :: Expr;
     parsed = try (parseString unparsed)
              catch { er -> error (strcat_l ["error parsing ",
                                             unparsed,"; expected ",
                                             expected_string]); };
     parsed_string :: String;
     parsed_string = to_string parsed;
     expected_string :: String;
     expected_string = to_string expected;
     report_error ex pa = error (strcat_l ["parse error parsing ",unparsed,
                                           "; expected: ",ex,
                                           "; got: ",pa]);
   };
// Module Imports


   data Writer; // System.IO.TextWriter

   data EmitterState  = EmitterState { writer       :: Writer,
                                       indent_level :: Int,
// HACK
// What we'd really like to do is parametrize EmitterResult on
// the state type and the result type, declare (EmitterResult s)
// to be an instance of the state monad, and then use a different
// state type for counting as opposed to emitting.  But without
// type classes, it's not feasible to get things like the
// indentation functions working correctly for different
// state types.  So rather than use a different state type
// for counting, we add a count field to EmitterState.
                                       token_count  :: Int };

   data EmitterResult t = EmitterResult EmitterState t | EmitterError;
   data Emitter t       = Emitter (EmitterState -> EmitterResult t);

   emit :: Emitter t -> EmitterState -> EmitterResult t;
   emit (Emitter e) s = e s;

   emitAndGetState :: Int -> Emitter t -> EmitterState;
   emitAndGetState bwrite e = let { w = make_string_writer bwrite;
                                    s = (EmitterState w 0 0); } in
     case (emit e s) of {
      EmitterResult estate _ -> estate;
      _                      -> error "symbolics: emitter error";
     };

   emitToString :: Emitter t -> String;
   emitToString e = (get_string w) where {
    (EmitterState w _ _) = emitAndGetState 1 e;
   };

   count :: Emitter t -> Int;
   count e = c where {
    (EmitterState _ _ c) = emitAndGetState 0 e;
   };

   // Trying to call this causes System.InvalidProgram exceptions
   // to be thrown.
   //make_string_writer :: Void -> Writer @ "[mscorlib]System.IO.StringWriter::.ctor()";

   make_string_writer :: Int -> Writer @"[efisymbolics?]Efi.Symbolics::_make_string_writer";
   //write :: Writer -> String -> () @ "virtual System.IO.TextWriter::Write(System.String)";
   write :: Writer -> String -> Writer @"[efisymbolics?]Efi.Symbolics::_write";

   get_string :: Writer -> String @"[efisymbolics?]Efi.Symbolics::_get_string";


// Once again, we build up monadic machinery similar to that
// used in the parser and lexer.  When MPL has type classes,
// Emitter will be another instance of a state monad.

   eBind :: Emitter t -> (t -> Emitter u) -> Emitter u;
   eBind (Emitter e) k =
       Emitter (\estate -> case (e estate) of {
                           EmitterResult s x -> let { (Emitter q) = k x }
                                                in q s;
                           EmitterError      -> EmitterError;
                           }
               );

   eempty :: t -> Emitter t;
   eempty x = Emitter (\estate -> EmitterResult estate x);

// Some utilities for manipulating the state of the emitter

   eDoIndent :: (Int->Int) -> Emitter Int;
   eDoIndent f = Emitter
                 (\(EmitterState w l c) -> let { m = (f l); } in
                     EmitterResult (EmitterState w m c) m);

   eDoCount :: (Int->Int) -> Emitter Int;
   eDoCount f = Emitter
                 (\(EmitterState w l c) -> let { m = (f c); } in
                     EmitterResult (EmitterState w l m) m);

   eDoWriter :: (Writer->t) -> Emitter t;
   eDoWriter f = Emitter
                 (\(EmitterState w l c) -> let { v = (f w); } in
                     EmitterResult (EmitterState w l c) v);

   eIndentUp :: Emitter Int;
   eIndentUp = eDoIndent (\x -> x+1);

   eIndentDown :: Emitter Int;
   eIndentDown = eDoIndent (\x -> x-1);

   eGetIndent :: Emitter Int;
   eGetIndent = eDoIndent (\x -> x);

// General-purpose emitters

   emitString :: String -> Emitter ();
   emitString s = eBind (eDoWriter (\w -> write w s)) (\_ -> eempty ());

   emitInt :: Int -> Emitter ();
   emitInt = emitString.int_to_str;

   emitNewline :: Emitter ();
   emitNewline =
       eBind         (eDoWriter newline)
        (\_ -> eBind eGetIndent
        (\l -> emitString (make_indentation l)))
       where {
        newline :: Writer -> () @ "instance[mscorlib]System.IO.TextWriter::WriteLine()";
        make_string :: I4 -> I4 -> String @ "[mscorlib]System.String::.ctor(System.Char,System.Int32)";
        make_indentation (I i) = make_string 32$ i; // ASCII 32 = space
       };

   eTwo :: Emitter t -> Emitter u -> Emitter u;
   eTwo a b = eBind a (\_ -> b);

   eThree :: Emitter t -> Emitter u -> Emitter v -> Emitter v;
   eThree a b c = eTwo (eTwo a b) c;

   eSpace :: Emitter ();
   eSpace = emitString " ";

   // Conditional emission; only emit when the two format arguments
   // are the same.
   eWhen :: Format -> Format -> Emitter t -> Emitter ();
   eWhen f1 f2 e
         | (ib (eq_i4 f1 f2)) = eTwo e (eempty ())
         | else               = eempty ();

   eBracketed :: Emitter t -> Emitter u -> Emitter v -> Emitter u;
   eBracketed begin emitter end =
       eBind         begin
        (\_ -> eBind emitter
        (\x -> eBind end
        (\_ -> eempty x)));

   eIndented :: Emitter t -> Emitter t;
   eIndented emitter = eBracketed (eTwo eIndentUp emitNewline)
                                  emitter
                                  (eTwo eIndentDown emitNewline);

// Note: "prefix" is a keyword in MPL
   ePrefixed :: [Emitter t] -> Emitter u -> Emitter ();
   ePrefixed (x:r) pfix = eTwo (eTwo pfix x) (ePrefixed r pfix);
   ePrefixed _     _    = eempty ();


   eDelimited :: [Emitter t] -> Emitter u -> Emitter ();
   eDelimited (x:r) sep = eTwo x (ePrefixed r sep);
   eDelimited _     _   = eempty ();


   eList :: [Emitter t] -> Emitter ();
   eList (x:r) = eTwo x (eList r);
   eList _     = eempty ();
   // Alternatively, eList could be defined like so:
   //    eList l = eDelimited l (eempty ()).
   // But the above is perhaps more efficient.


// XML emission

   emitTaggedInl :: String -> [(String,String)] -> Emitter t -> Emitter t;
   emitTaggedInl tag attrs emitter =
       eBracketed (emitOpenTag tag attrs)
                  emitter
                  (emitCloseTag tag);

   // The most common case is to indent an element's content.
   emitTagged :: String -> [(String,String)] -> Emitter t -> Emitter t;
   emitTagged tag attrs emitter = emitTaggedInl tag attrs (eIndented emitter);

   emitOpenTag :: String -> [(String,String)] -> Emitter ();
   emitOpenTag tag attrs =
       eBind         (emitString "<")
        (\_ -> eBind (emitString tag)
        (\_ -> eBind (eList (map emitAttr attrs))
        (\_ -> eBind (emitString ">")
        (\_ -> eempty ()))));

   emitAttr :: (String,String) -> Emitter ();
   emitAttr (attr,val) = eBind         (emitString " ")
                          (\_ -> eBind (emitString attr)
                          (\_ -> eBind (emitString "=")
                          (\_ -> eBind (emitQuoted (emitString val))
                          (\_ -> eempty ()))));

   emitEmptyTag :: String -> [(String,String)] -> Emitter ();
   emitEmptyTag tag attrs = eBind   (emitString "<")
                       (\_ -> eBind (emitString tag)
                       (\_ -> eBind (eList (map emitAttr attrs))
                       (\_ -> eBind (emitString "/>")
                       (\_ -> eempty ()))));

   emitCloseTag :: String -> Emitter ();
   emitCloseTag tag = eBind         (emitString "</")
                       (\_ -> eBind (emitString tag)
                       (\_ -> eBind (emitString ">")
                       (\_ -> eempty ())));

   emitQuoted :: Emitter t -> Emitter t;
   emitQuoted emitter = eBind         (emitString "\"")
                         (\_ -> eBind emitter
                         (\x -> eBind (emitString "\"")
                         (\_ -> eempty x)));


   // These next two are not used now, but these idioms come up below and could
   // be simplified later... -kmp 14-Feb-2006
//
// emitXMLExplicitApplyWrapper :: [Emitter()] -> Emitter();
// emitXMLExplicitApplyWrapper body =
//    (emitTagged "ml:apply" []
//      (eIndented
//        (eDelimited body emitNewline)));
//
// emitXMLExplicitApply :: String -> [(String,String)] -> Expr -> Emitter();
// emitXMLExplicitApply opname attrs expr =
//    emitXMLExplicitApplyWrapper [(emitEmptyTag opname attrs), (emitExpr XML expr)];


// RL emission

   emitParenthesized :: Emitter t -> Emitter t;
   emitParenthesized emitter = eBracketed (emitString "(")
                                          emitter
                                          (emitString ")");

   emitWrapped :: String -> Emitter t -> Emitter t;
   emitWrapped s emitter = emitParenthesized
                            (eThree (emitString s) (emitString " ") emitter);

// General functions for emission

   emitExpr :: Format -> Expr -> Emitter ();

   emitExpr fmt (Literal token) = eTwo (eDoCount (\x->x+1))
                                       (emitToken fmt token);
   emitExpr fmt (App f args)    = emitApply fmt f args;
   emitExpr fmt (SNPair e _)    = emitExpr  fmt e;

   emitExpr XML (Parens e)      = emitTagged "ml:parens" [] (emitExpr XML e);
   emitExpr RL  (Parens e)      = emitExpr RL e;
   emitExpr fmt (Parens e)      = emitParenthesized (emitExpr fmt e);

   emitExpr fmt (SList args)    = emitList fmt (map (emitExpr fmt) args);

   emitApply :: Format -> Expr -> [Expr] -> Emitter ();

   // MuPAD won't complain about using a matrix as a function,
   // but bug 060510-101939 says that Mathcad should.
   emitApply MuPad (SMat _) _  = error "must be function";

   emitApply fmt (Literal T_XIN) [x,y] = emitAnyApply fmt (Literal (Id "op_element_of")) [x,y];
   emitApply fmt (Literal T__IN) [x,y] = emitAnyApply fmt (Literal (Id "op_element_of")) [x,y];

   emitApply fmt f@(Literal tok) args
       | is_op fmt tok && len == 1 = emitUnaryApply  fmt f (uparens fmt f (head args))
       | is_op fmt tok             = emitInfixApply  fmt f (iparens fmt f args)
       | else                      = emitAnyApply fmt f args
   where {
     rbp_ = rbp fmt tok;
     len  = length args;

     is_associative :: Format -> Token -> Bool;
     is_associative fmt T_MULT = True;
     is_associative fmt T_PLUS = True;
     is_associative fmt T_AND  = True;
     is_associative fmt T_OR   = True;
     is_associative fmt _      = False;

     // For Bug # 061128-153726
     // This stuff is so that things like
     //        b                 b
     //   a + ---     or    a * ---
     //        c                 c
     // can avoid parens even when they are called for because
     // the --- in the visual layout says the parens are not needed.

     visually_self_delimiting_within :: Format -> Token -> Expr -> Bool;

     visually_self_delimiting_within XML T_PLUS    (App (Literal T_DIVIDE) _) = True;
     visually_self_delimiting_within XML T_MINUS   (App (Literal T_DIVIDE) _) = True;
     visually_self_delimiting_within XML T_MULT    (App (Literal T_DIVIDE) _) = True;

     visually_self_delimiting_within fmt _ _ = False; 

     visually_self_delimiting_within_l :: Format -> Token -> Expr -> Bool;
     visually_self_delimiting_within_r :: Format -> Token -> Expr -> Bool;

     visually_self_delimiting_within_l fmt x y = visually_self_delimiting_within fmt x y;
     visually_self_delimiting_within_r fmt x y = visually_self_delimiting_within fmt x y;

     // Note on iparens_* functions below:
     // when displaying in Mathcad, we sometimes don't
     // want parentheses, even if operator precedence
     // would seem to require it.  See bug
     // 061128-153726.
     
     iparens_l :: Format -> Expr -> Expr -> Expr;
     // Insert parentheses around an operator's left
     // operand, if necessary.
     iparens_l XML (Literal T_DIVIDE) x = x;
     iparens_l fmt op e =
       case op of {
         (Literal tok) -> case e of {
                                (Parens _)             -> iparens_l_parens fmt tok      e;
                                (App (Literal tok2) _) -> iparens_l_app    fmt tok tok2 e;
                                _                      -> iparens_l_any    fmt op       e;
                               };
         _             -> iparens_l_any fmt op e;
       };
     iparens_l_parens :: Format -> Token -> Expr -> Expr;
     iparens_l_parens fmt tok px@(Parens x)
         | (visually_self_delimiting_within_l fmt tok x)   = x
         | else = px;
     iparens_l_app :: Format -> Token -> Token -> Expr -> Expr;
     iparens_l_app fmt tok tok2 x 
         | (not (takes_right_operand fmt tok2))          = x
         | (visually_self_delimiting_within_l fmt tok x)   = x
         | (is_associative fmt tok) &&
           (tok_eq tok tok2) = x
         | (lbp fmt tok) < (rbp fmt tok2)                = x
         | else                                          = (Parens x);
     iparens_l_any :: Format -> Expr -> Expr -> Expr;
     iparens_l_any fmt op x = x;

     iparens_r :: Format -> Expr -> Expr -> Expr;
     // Insert parentheses around an operator's right
     // operand, if necessary.
     iparens_r XML (Literal T_DIVIDE)   x = x;
     iparens_r XML (Literal T_POW)      x = x;
     iparens_r fmt op e =
       case op of {
         (Literal tok) -> case e of {
                                (Parens _)             -> iparens_r_parens fmt tok      e;
                                (App (Literal tok2) _) -> iparens_r_app    fmt tok tok2 e;
                                _                      -> iparens_r_any    fmt op       e;
                               };
         _             -> iparens_r_any fmt op e;
       };
     iparens_r_parens :: Format -> Token -> Expr -> Expr;
     iparens_r_parens fmt tok px@(Parens x)
         | (visually_self_delimiting_within_r fmt tok x)   = x
         | else = px;
     iparens_r_app :: Format -> Token -> Token -> Expr -> Expr;
     iparens_r_app fmt tok tok2 x
         | (not (takes_left_operand fmt tok2))           = x
         | (visually_self_delimiting_within_r fmt tok x)   = x
         | (is_associative fmt tok) &&
           (tok_eq tok tok2) = x
         | (lbp fmt tok2) < (rbp fmt tok)                = (Parens x)
         | else                                          = x;
     iparens_r_any :: Format -> Expr -> Expr -> Expr;
     iparens_r_any fmt op x = x;

     iparens :: Format -> Expr -> [Expr] -> [Expr];
     // Insert parentheses around the arguments of an infix application,
     // if necessary.
     iparens fmt op@(Literal tok) (x:r) = (px:pr)
     where {
            px =      iparens_l fmt op  x;
            pr = map (iparens_r fmt op) r;
     };
     iparens fmt _             args     = args;

     uparens :: Format -> Expr -> Expr -> Expr;
     // Insert parentheses around the argument of a unary application,
     // if necessary.
     uparens fmt op@(Literal tok) x
         | (takes_left_operand  fmt tok) = iparens_l fmt op x
         | (takes_right_operand fmt tok) = iparens_r fmt op x
         | else                      = x;
   };

   emitApply fmt f args = emitAnyApply fmt f args;

   emitUnaryApply :: Format -> Expr -> Expr -> Emitter ();
   emitUnaryApply XML f arg = emitAnyApply XML f [arg];
   emitUnaryApply RL  f arg = emitAnyApply RL  f [arg];
   emitUnaryApply fmt f@(Literal tok) arg
       | takes_right_operand fmt tok = (eTwo (emitExpr fmt f)   (emitExpr fmt arg))
       | takes_left_operand  fmt tok = (eTwo (emitExpr fmt arg) (emitExpr fmt f));

   emitInfixApply :: Format -> Expr -> [Expr] -> Emitter ();
   emitInfixApply XML f args = emitAnyApply XML f args;
   emitInfixApply RL  f args = emitAnyApply RL  f args;
   emitInfixApply fmt f args = eDelimited (map (emitExpr fmt) args)
                                          (emitExpr fmt f);

   emitGenericFunctionCall :: Format -> Expr -> [Expr] -> Emitter ();
   emitGenericFunctionCall fmt f args = eTwo (emitExpr fmt f) // f(arg1,arg2,...)
                                     (emitParenthesized
                                       (emitExprsDelimited fmt args ","));

   is_log_op :: Format -> Token -> Bool;
   is_log_op XML T_EQ = True;
   is_log_op XML T_NEQ = True;
   is_log_op XML T_GT = True;
   is_log_op XML T_LT = True;
   is_log_op XML T_GTEQ = True;
   is_log_op XML T_LTEQ = True;
   is_log_op XML T_MC_EQ = True;
   is_log_op XML T_MC_NEQ = True;
   is_log_op XML T_MC_GT = True;
   is_log_op XML T_MC_LT = True;
   is_log_op XML T_MC_GTEQ = True;
   is_log_op XML T_MC_LTEQ = True;
   is_log_op fmt x = False;

   emitAnyApply :: Format -> Expr -> [Expr] -> Emitter ();

   emitAnyApply XML (Literal T_AND) a0@[(App (Literal o1) [v1,x1]), (App (Literal o2) [x2,v2])] =
    // op_lt(lo,EXP) and op_lt(EXP,hi) BECOMES op_lt(op_lt(lo,EXP),hi)
    if ((is_log_op XML o1) && (is_log_op XML o2)) &&
       ( ((tok_in o1 [T_GT, T_GTEQ]) && (tok_in o2 [T_GT, T_GTEQ])) ||
         ((tok_in o1 [T_LT, T_LTEQ]) && (tok_in o2 [T_LT, T_LTEQ])) )
    then
      if (expr_eq x1 x2)
      then (emitExpr XML (App (Literal o2) [(App (Literal o1) [v1,x1]),v2]))
      else
        // op_lt(EXP,hi) and op_lt(lo,EXP) BECOMES op_lt(op_lt(lo,EXP),hi)
        if (expr_eq v2 v1)
        then (emitExpr XML (App (Literal o1) [(App (Literal o2) [x2,v1]),x1]))
        else (emitAnyDefaultApply XML (Literal T_AND) a0)
    else
      (emitAnyDefaultApply XML (Literal T_AND) a0);

   stripParens :: Expr -> Expr;
   stripParens (Parens e) = e;
   stripParens e = e;

   emitAnyApply XML (Literal T_POW) [b,e] =
     case se of {
      (Literal (ITok 1)) -> (emitExpr XML b);
       _                 -> (emitAnyDefaultApply XML (Literal T_POW) [b,se]);
     } where {
       se = stripParens e;
     };

   emitAnyApply XML (Literal T_SQRT) [e] =
     emitAnyDefaultApply XML (Literal T_SQRT) [(stripParens e)];

   emitAnyApply XML (Literal T_SURD) [e, k] =
     case k of {
       (Literal (ITok 2)) -> (emitExpr XML (App (Literal T_SQRT) [e]));
       _ -> (emitAnyDefaultApply XML (Literal T_NTHROOT) [(stripParens e),k]);
     };

   emitAnyApply XML (Literal T_DIVIDE) [n,d] =
     emitAnyDefaultApply XML (Literal T_DIVIDE) [(stripParens n), (stripParens d)];

   emitAnyApply fmt (Literal T_SIGN_IM) [x] =
     emitExpr fmt (negative (App (Literal (Id "mc_csgn")) [(timesI x)]));

   emitAnyApply fmt (Literal T_SIGNUM0) [x] =
     (emitAnyApply fmt (Literal (Id "mc_signum")) [x, (Literal (ITok 0))]);

   // T_XLOG = log with args in reverse order
   emitAnyApply fmt (Literal T_XLOG) [(Literal (ITok 10)),x] = emitAnyApply fmt (Literal T_LOG) [x];

   emitAnyApply fmt (Literal T_XLOG) [b,x] = emitAnyApply fmt (Literal T_LOG) [x,b];

   // T_XEI = MuPAD's Ei, which is not quite ours
   emitAnyApply fmt (Literal T_XEI) [z] = emitAnyApply fmt (Literal T_EI) [(Literal (ITok 1)),z];

   // T_XPSI = digamma + deriv (i.e., polygamma)

   emitAnyApply fmt (Literal T_XPSI) [x] = emitAnyApply fmt (Literal T_PSI) [x];

   emitAnyApply fmt (Literal T_XPSI) [x,k] = emitAnyApply fmt (Literal T_PSI) [k,x];

   // T_XDIRAC = dirac + deriv

   emitAnyApply fmt (Literal T_XDIRAC) [x] = emitAnyApply fmt (Literal T_DIRAC) [x];

   emitAnyApply fmt (Literal T_XDIRAC) [x,k] = emitAnyApply fmt (Literal T_DIRAC) [k,x];

   // T_XDN = diff
   emitAnyApply fmt (Literal T_XDN) (exp:(v:vars)) =
     case exp of {
       // Rewrite diff(diff(f(x,y),x),y) as diff(f(x,y),x,y)
       // so that later optimizations on that output form will
       // be coalesced correctly.  This fixes bug # 060816-110553
       (App (Literal T_XDN) (exp2:(v2:vars2)))
              -> emitAnyApply fmt (Literal T_XDN) (exp2:(concat [(v:vars),(v2:vars2)]));
       _      -> emitXDN fmt exp (v:vars);
     };
       
   // This is the workhorse for T_XDN expressions (i.e., diff expressions).
   // diff occurs as diff(expr,var1,var2,...), where var1, var2, etc.,
   // are not necessarily distinct.  Hence, we have to collect
   // the distinct variables and the number of times each occurs
   // to determine the correct expression to emit.
   // (See bug 050204-143603 for a relevant example.)
   emitXDN :: Format -> Expr -> [Expr] -> Emitter ();
   emitXDN fmt exp (v:vars) =
    let { orders = collectOrders v 1 [] vars;
          derivs = makeDerivs exp orders;
        } in
      emitExpr fmt derivs
    where {
      collectOrders :: Expr -> Int -> [(Expr,Int)] -> [Expr] -> [(Expr,Int)];
      collectOrders var i accum (v:rest)
       | (expr_eq var v) = collectOrders var (i+1) accum rest
       | else            = collectOrders v 1 ((var,i):accum) rest;
      collectOrders var i accum _ = (reverse ((var,i):accum));

      makeDeriv :: Expr -> (Expr,Int) -> Expr;
      makeDeriv expr (var,order) =
        case var of {
           (Literal (Id _)) ->
                 (App (Literal T_DN) [(SLam [var] expr), (iExpr order), var]);
           _ -> let { gvar = (gensymFor expr "mc_q"); } in
                 (App (Literal T_DN) [(SLam [gvar] (betaReduce var gvar expr)),
                                      (iExpr order),
                                      var]);
        };

      makeDerivs :: Expr -> [(Expr,Int)] -> Expr;
      makeDerivs expr (pair:rest) = makeDerivs (makeDeriv expr pair) rest;
      makeDerivs expr _           = expr;
    };

   emitAnyApply MuPad (Literal T_MUSUBMATRIX) [m,r1,r2,c1,c2] =
     emitAnyApply MuPad (Literal (Id "submatrix"))
          // DO NOT PASS ORIGIN HERE.  THE ONLY WAY WE GET A
          // MUSUBMATRIX IS FROM MUPAD TO BE RESUBMITTED.  IN THAT CASE,
          // ORIGIN WAS ALREADY SUBTRACTED ONCE AND SHOULD NOT BE AGAIN.
          [(Literal (ITok 0)),m,r1,r2,c1,c2];

   emitAnyApply XML (Literal T_MUSUBMATRIX) [m,r1,r2,c1,c2] =
     (emitAnyApply XML (Literal (Id "mc_submatrix"))
        [m,
         (App (Literal T_PLUS) [origin,(predecessor r1)]),
         (App (Literal T_PLUS) [origin,(predecessor r2)]),
         (App (Literal T_PLUS) [origin,(predecessor c1)]),
         (App (Literal T_PLUS) [origin,(predecessor c2)])])

    where {

     origin = (Literal (Id "mc_ORIGIN"));

     };

   emitAnyApply fmt (Literal T_INTEGRAL) args =
     emitAnyDefaultApply fmt (Literal T_INTEGRAL) [(head args),(head (tail args))];

   emitAnyApply fmt   f args = emitAnyDefaultApply fmt f args;

   emitAnyDefaultApply :: Format -> Expr -> [Expr] -> Emitter ();

   emitAnyDefaultApply XML   f args = emitXMLApply   f args;
   emitAnyDefaultApply RL    f args = emitRLApply    f args;
   emitAnyDefaultApply MuPad f args = emitMuPadApply f args;

   emitMuPadApply :: Expr -> [Expr] -> Emitter ();

   // ... customized MuPad-only output could go here ...
   // The reason you mostly don't see any is that there's a lot of table-driven stuff
   // handled higher up by the operator parser, which can't be overridden to keep
   // it invertible.

   emitMuPadApply (Literal T_RANGE)  args = emitMuPadRange2 args;
   emitMuPadApply (Literal T_RANGE2) args = emitMuPadRange2 args;

   emitMuPadRange2 :: [Expr] -> Emitter ();
   emitMuPadRange2 args =
       case args of
       {
        [b,e] -> emitParenthesized (eThree (emitExpr MuPad b)
                                           (emitString "..")
                                           (emitExpr MuPad e));

        _     -> error "illegal range";
       };

   // Don't want to emit "op_eq" as part of the second
   // argument; MuPAD won't know what to do with it.
   // (See bug 061127-105835 for an example.)
   emitMuPadApply f@(Literal T_MuLIMIT) [expr,spec,side] =
    emitGenericFunctionCall MuPad f [expr,g spec,side]
   where {
          g (App (Literal T_MC_EQ) args) = (App (Literal T_EQ) args);
          g x                            = x;
   };

   emitMuPadApply (Literal tok) args =
       eTwo (emitAsId MuPad (to_mupad_func (_mangle_hex (to_str tok))))
            (emitParenthesized
             (emitExprsDelimited MuPad args ","))
   where {
          to_str :: Token -> String;
          to_str (Id s) = s;
          to_str tok = case (blookupInv tok_id_map tok) of {
                        Nothing -> error "emission failure";
                        Just s  -> s;
                       };

         };

   emitMuPadApply f args = emitGenericFunctionCall MuPad f args;


   emitXMLApply :: Expr -> [Expr] -> Emitter();

   emitXMLApply (Literal T_RANGE)  args = emitXMLRange args;
   emitXMLApply (Literal T_RANGE2) args = emitXMLRange args;
   emitXMLApply (Literal T_RANGE3) args = emitXMLRange args;

   emitXMLRange :: [Expr] -> Emitter ();
   emitXMLRange args =
       case args of
       {
        [_,_]   -> emitTagged "ml:range" [] (emitExprSeq XML args);

        [b,n,e] -> emitTagged "ml:range" []
                    (emitSequence XML [emitTagged "ml:sequence" []
                                       (emitExprSeq XML [b,n]),
                                       emitExpr XML e]);

        _       -> error "illegal range";
       };


   emitXMLApply (Literal T_EVAL_AT) [e,b] =
     case b of {
      (SList [])                        -> (emitExpr XML e);
      (SList bindings)                  -> (emitEvalAtSet XML e bindings []);
      (App (Literal T_SET) [])          -> (emitExpr XML e);
      (App (Literal T_SET) bindings)    -> (emitEvalAtSet XML e bindings []);
      (App (Literal T_MC_EQ) [var,val]) -> (emitEvalAt XML e [(var,val)]);
      (App (Literal T_EQ) [var,val])    -> (emitEvalAt XML e [(var,val)]);
      _ -> (emitXMLDefaultApply (Literal T_EVAL_AT) [e,b]);
     };

   emitEvalAtSet :: Format -> Expr -> [Expr] -> [(Expr,Expr)] -> Emitter();
   emitEvalAtSet fmt e [] varvals = emitEvalAt fmt e (reverse varvals);
   emitEvalAtSet fmt e (b:bmore) varvals =
    case b of { 
     (App (Literal T_MC_EQ) [var,val]) -> maybeEmitEvalAtSet fmt e bmore (var,val) varvals;
     (App (Literal T_EQ)    [var,val]) -> maybeEmitEvalAtSet fmt e bmore (var,val) varvals;
     _ -> error "bad_syntax";
    } where {
     maybeEmitEvalAtSet :: Format -> Expr -> [Expr] -> (Expr,Expr) -> [(Expr,Expr)] -> Emitter();
     maybeEmitEvalAtSet fmt e bindings (var,val) varvals =
       if (expr_eq var val) then
          (emitEvalAtSet fmt e bindings varvals)
       else
          (emitEvalAtSet fmt e bindings ((var,val):varvals));
    };

   emitEvalAt :: Format -> Expr -> [(Expr,Expr)] -> Emitter();
   emitEvalAt XML e varvals =
    case e of {
     (App (Literal T_EVAL_AT) [e0,(App (Literal T_MC_EQ) [var,val])]) -> 
          (emitEvalAt XML e0 ((var,val):varvals));
     (App (Literal T_EVAL_AT) [e0,(App (Literal T_EQ) [var,val])]) -> 
          (emitEvalAt XML e0 ((var,val):varvals));
     (Parens pe) -> (emitEvalAt XML pe varvals);
     _ -> (emitTagged "ml:program" []
           (eTwo
            (emitSequence XML
             (map (\ (var,val)-> (eTwo
                                   (emitTagged "ml:localDefine" [] (emitExprSeq XML [var,val]))
                                   (emitNewline)))
                  varvals))
            (emitExpr XML e)));
    };

   // integral
   emitXMLApply (Literal T_INTEGRAL) args =
     (emitTagged "ml:apply" []
        (emitSequence XML ((emitEmptyTag "ml:integral" []):iargs)))
   where {
     [expr, v] = args; // expr : v : ignored_options = args; // destructuring done earlier now.
     iargs    =
       case v of {
        // definite integral
        App (Literal T_EQ) [var,App (Literal T_RANGE) [l,u]] ->
            [(emitLam XML [var] expr),
             (emitTagged "ml:bounds" [] (emitExprSeq XML [l,u]))];

        // indefinite integral
        _ -> [(emitLam XML [v] expr)];
       };
   };

   emitXMLApply (Literal T_MC_INDEF_INTEGRAL) [lam] =
     (emitTagged "ml:apply" []
        (emitSequence XML [(emitEmptyTag "ml:integral" []),
                           (emitXMLLam lam)]));

   useUnicodeIdentifiers = (not (bool_from_registry "AvoidUnicodeIdentifiers" False)); // MPL has no way to use the C++ constant STR_AVOID_UNICODE_IDENTIFIERS

   // T_IN = infix set membership in [generated by MuPAD]
   emitXMLApply (Literal T_IN) [x,set] =
     if (isBasicSet set)
     then
       basic_constraint
     else
       case set of {
            (App (Literal T_SETMINUS) [set1,set2]) -> (inSetMinus set1 set2);
            (App (Literal T__SETMINUS) [set1,set2]) -> (inSetMinus set1 set2);
            (App (Literal T_INTERSECT) [set1,set2]) -> (inSetPlus set1 set2);
            (App (Literal T__INTERSECT) [set1,set2]) -> (inSetPlus set1 set2);
            (App (Literal T_INTERVAL) [lo,hi]) -> (inRange lo hi);
            _                                   -> basic_constraint;
          }
   where { tok =
            if useUnicodeIdentifiers
            then T_XIN
            else T__IN;

           basic_constraint :: Emitter();
           basic_constraint =
            (emitTagged "ml:apply" [("fixity","infix")]
              (emitExprSeq XML ((Literal tok):[x,set])));


           inRange :: Expr -> Expr -> Emitter();
           inRange lo hi =
              if (expr_eq lo (App (Literal T_UMINUS) [(Literal T_INFINITY)]))
              then (emitExpr XML (build_rangePart x hi))
              else
                if (expr_eq hi (Literal T_INFINITY))
                then (emitExpr XML (build_rangePart lo x))
                else (emitExpr XML (build_rangePart (build_rangePart lo x) hi));

           inSetPlus :: Expr -> Expr -> Emitter();
           inSetPlus set1 set2 =
              (emitExpr XML (App (Literal T_AND)
                                 [(App (Literal T_IN) [x,set1]),
                                  (App (Literal T_IN) [x,set2])]));

           inSetMinus :: Expr -> Expr -> Emitter();
           inSetMinus set1 set2 =
              if (isBasicSet set1) then
                  (emitExpr XML (build_setMinus x (App (Literal T_IN) [x,set1]) set2))
               else
                 basic_constraint;

   };

  build_rangePart :: Expr -> Expr -> Expr;
  build_rangePart x y =
    case x of {
      (SList [x0]) -> (App (Literal T_MC_LT) [x0,y]);
      _ -> case y of {
             (SList [y0]) -> (App (Literal T_MC_LT) [x,y0]);
             _            -> (App (Literal T_MC_LTEQ) [x,y]);
           };
    };

  build_setMinus :: Expr -> Expr -> Expr -> Expr;
  build_setMinus var set1 set2 =
    case set2 of {
      (App (Literal T_SET) []) -> set1;
      (App (Literal T_SET) (elem1:more)) ->
        (App (Literal T_AND) [set1,(build_setMinus var (App (Literal T_MC_NEQ) [var,elem1]) (App (Literal T_SET) more))]);
      _ -> (App (Literal T_AND) [set1,(App (Literal T_NOT) [(App (Literal T_IN) [var,set2])])]);
    };

   emitXMLApply (Literal T_MC_INTEGRAL) [callback,lam,lower,upper,algo] =
     (emitTagged "ml:apply" []
        (emitSequence XML ((emitEmptyTag "ml:integral" []):iargs)))
   where {
     iargs = [(emitXMLLam lam),
              (emitTagged "ml:bounds" [] (emitExprSeq XML [lower,upper]))];
   };

   // utilities used in later programs

   fixLambda :: Expr -> Expr -> Expr;
// fixLambda lam var = lam;  // THE OLD BEHAVIOR
   fixLambda (SLam [oldvar] bod) newvar =
             (SLam [newvar] (betaReduce oldvar newvar bod));

   fixLambda (NLam f [oldvar]) newvar = (NLam f [newvar]);

   gensymFor :: Expr -> String -> Expr;
   gensymFor exp str =
       tryN 0
     where {
       tryN :: Int -> Expr;
       tryN k  = let { var = (Literal (Id (strcat_l [str,(int_to_str k)]))); } in
                   if (freeOf var exp)
                   then var
                   else tryN (k+1);
     };

   // See Bug # 060923-003215 (nth derivative failing to parse) for motivation of the T_FNEST uses here

   emitXMLApply (App (Parens (App (Literal T_FNEST) [(Literal T_D), n])) [(SLam [v] e)]) [a] =
      emitXMLApply (App (App (Literal T_FNEST) [(Literal T_D), n]) [(SLam [v] e)]) [a];

   emitXMLApply (App (App (Literal T_FNEST) [(Literal T_D), n]) [(SLam [v] e)]) [a] =
     (emitXMLApply (Literal T_DN) [(SLam [v] e), n, a]);

   // Note that other cases of T_FNEST will be displayed poorly and users will complain.
   // But that's better than having the display crash.  It shouldn't happen.
   // And if they do complain, we can fix it easier than if they don't know what to complain about.
   // -kmp 23-Sep-2006

   // fallthrough cases
   emitXMLApply (Literal T_FNEST) [x,y] = emitXMLDefaultApply (Literal (Id "_fnest")) [x,y];
   emitXMLApply (Literal T_Z_FNEST) [x,y] = emitXMLDefaultApply (Literal (Id "_fnest")) [x,y];
   emitXMLApply (Literal T_FCONCAT) [x,y] = emitXMLDefaultApply (Literal (Id "_fconcat")) [x,y];
   emitXMLApply (Literal T_Z_FCONCAT) [x,y] = emitXMLDefaultApply (Literal (Id "_fconcat")) [x,y];

   // Helper
   // This doesn't work...
   //iExpr = Literal.ITok;
   iExpr :: Int -> Expr;
   iExpr n = (Literal (ITok n));

   // derivatives

// Something like this (not quite debugged) might be needed in the future, 
// for example to fix things like Bug # 060816-110553,
// but for now our fix to T_XDN should be enough. -kmp 17-Mar-2007
//
//   emitXMLApply (Literal T_D1) [lam,  x] = 
//      case lam of {
//         (SLam [v] (App (Literal T_D1) [(SLam [v2] b2), x2])) -> 
//                           if (expr_eq v v2) && (expr_eq x2 v)
//                           then            emitXMLDerivAt      (iExpr 2) (SLam [v] b2) x
//                           else            emitXMLDerivAt      (iExpr 1) lam x;
//          _ ->                             emitXMLDerivAt      (iExpr 1) lam x;
//      };
//
// instead of:
//
   emitXMLApply (Literal T_D1) [lam,  x] = emitXMLDerivAt      (iExpr 1) lam x;
   emitXMLApply (Literal T_D2) [lam,  x] = emitXMLDerivAt      (iExpr 2) lam x;
   emitXMLApply (Literal T_D3) [lam,  x] = emitXMLDerivAt      (iExpr 3) lam x;
   emitXMLApply (Literal T_D4) [lam,  x] = emitXMLDerivAt      (iExpr 4) lam x;
   emitXMLApply (Literal T_D5) [lam,  x] = emitXMLDerivAt      (iExpr 5) lam x;
   emitXMLApply (Literal T_DN) [lam,o,x] = emitXMLDerivAtMaybe o         lam x;

   emitXMLDerivAtMaybe :: Expr -> Expr -> Expr -> Emitter();
   emitXMLDerivAtMaybe o lam x =
      case o of {
         (Literal (ITok 0)) ->
            case lam of {
               (SLam [v] b) -> emitExpr XML (betaReduce v x b);
               _            -> (emitXMLDerivAt o lam x);
             };
          _            -> (emitXMLDerivAt o lam x);
    };

   emitXMLDerivAt :: Expr -> Expr -> Expr -> Emitter ();
   emitXMLDerivAt order lam var@(Literal (Id s)) =
       if (freeOf var lam) then
         emitXMLDerivSimple order (fixLambda lam var)
       else
         emitXMLDerivAtExplicit order lam var;

   emitXMLDerivAt order lam point =
      emitXMLDerivAtExplicit order lam point;

   emitXMLDerivAtExplicit :: Expr -> Expr -> Expr -> Emitter ();
   emitXMLDerivAtExplicit order lam point =
     let { var = (gensymFor lam "mc_x"); } in
       (emitTagged "ml:program" []
         (emitSequence XML
           [(emitTagged "ml:localDefine" [] (emitExprSeq XML [var,point])),
            (emitXMLDerivAtMaybe order lam var)])); // emitXMLDerivSimple order (fixLambda lam var)

   emitXMLDerivSimple :: Expr -> Expr -> Emitter ();
   emitXMLDerivSimple order lam =
     (emitTagged "ml:apply" []
       (emitSequence XML ((emitEmptyTag "ml:derivative" []):dargs)))
   where {
     xl    = (emitXMLLam lam);
     ol    = (emitTagged "ml:degree" []
               (emitExprSeq XML [order]));
     dargs = [xl] ++ (if (bEmitOrder order) then [ol] else []);

     bEmitOrder :: Expr -> Bool;
     bEmitOrder (Literal (ITok n)) = (n>1);
     bEmitOrder _                  = True;
   };

   // MuPAD sometimes returns things like D(D(f))(x)
   emitXMLApply (App (Literal T_D) [f]) [x] = emitXMLNestedDeriv 1 f x;

   emitXMLNestedDeriv :: Int -> Expr -> Expr -> Emitter ();
   emitXMLNestedDeriv n (App (Literal T_D) [f]) x =
       emitXMLNestedDeriv (n+1) f x;

   emitXMLNestedDeriv n f@(SLam [v] b) x =
     emitXMLDerivAtMaybe (iExpr n) f x;

   emitXMLNestedDeriv n f x =
     let { var = (gensymFor f "mc_x"); } in
       emitXMLDerivAtMaybe (iExpr n) (SLam [var] (App f [var])) x;

  // Next few are "better than nothing" if something slips through that shouldn't.
   emitXMLApply (Literal T_ZSEQ) [x,n] = emitXMLDefaultApply (Literal (Id "seq")) [x,n];
   emitXMLApply (Literal T_Z_SEQIN) [x,n] = emitXMLDefaultApply (Literal (Id "_seqin")) [x,n];
   emitXMLApply (Literal T_Z_SEQGEN) [x,n] = emitXMLDefaultApply (Literal (Id "_seqgen")) [x,n];
   emitXMLApply (Literal T_FACTORIAL2) [x] = emitXMLDefaultApply (Literal (Id "fact2")) [x];
   emitXMLApply (Literal T_XD) [x] = emitXMLApply (Literal T_D) [x];
   emitXMLApply (Literal T_ZASSUMING) [x,y] = emitXMLDefaultApply (Literal (Id "_assuming")) [x,y];
   emitXMLApply (Literal T_Z_ASSUMING) [x,y] = emitXMLDefaultApply (Literal (Id "_assuming")) [x,y];
   emitXMLApply (Literal T_ZIMPLIES) [x,y] = emitXMLDefaultApply (Literal (Id "_implies")) [x,y];
   emitXMLApply (Literal T_Z_IMPLIES) [x,y] = emitXMLDefaultApply (Literal (Id "_implies")) [x,y];
   emitXMLApply (Literal T_ZEQUIV) [x,y] = emitXMLDefaultApply (Literal (Id "_equiv")) [x,y];
   emitXMLApply (Literal T_Z_EQUIV) [x,y] = emitXMLDefaultApply (Literal (Id "_equiv")) [x,y];
   emitXMLApply (Literal T_ZHULL) [x,y] = emitXMLDefaultApply (Literal (Id "hull")) [x,y];
   emitXMLApply (Literal T_Z_HULL) [x,y] = emitXMLDefaultApply (Literal (Id "hull")) [x,y];
   emitXMLApply (Literal T_MOD_DIV) [x,y] = emitXMLDefaultApply (Literal (Id "div")) [x,y];
   emitXMLApply (Literal T_MOD_REM) [x,y] = emitXMLDefaultApply (Literal (Id "mod")) [x,y];
// emitXMLApply (Literal T__IN) [x,y] = emitXMLDefaultApply (Literal (Id "_in")) [x,y];
   emitXMLApply (Literal T__SUBSET) [x,y] = emitXMLDefaultApply (Literal (Id "_subset")) [x,y];
   emitXMLApply (Literal T__INTERSECT) [x,y] = emitXMLDefaultApply (Literal (Id "_intersect")) [x,y];
   emitXMLApply (Literal T__UNION) [x,y] = emitXMLDefaultApply (Literal (Id "_union")) [x,y];
   emitXMLApply (Literal T__SETMINUS) [x,y] = emitXMLDefaultApply (Literal (Id "_minus")) [x,y];

   emitXMLApply (Literal T_LAMBERTW) [(Literal (ITok 0)),z] = emitXMLApply (Literal (Id "mc_LambertW")) [z];
   emitXMLApply (Literal T_LAMBERTW) [z]                    = emitXMLApply (Literal (Id "mc_LambertW")) [z];
   emitXMLApply (Literal T_LAMBERTW) [k,z]                  = emitXMLApply (Literal (Id "mc_LambertW")) [k,z];

   emitXMLApply (Literal T_BESSEL_I) [(Literal (ITok 0)),z] = emitXMLApply (Literal (Id "mc_I0")) [z];
   emitXMLApply (Literal T_BESSEL_I) [(Literal (ITok 1)),z] = emitXMLApply (Literal (Id "mc_I1")) [z];

   emitXMLApply (Literal T_BESSEL_J) [(Literal (ITok 0)),z] = emitXMLApply (Literal (Id "mc_J0")) [z];
   emitXMLApply (Literal T_BESSEL_J) [(Literal (ITok 1)),z] = emitXMLApply (Literal (Id "mc_J1")) [z];

   emitXMLApply (Literal T_BESSEL_K) [(Literal (ITok 0)),z] = emitXMLApply (Literal (Id "mc_K0")) [z];
   emitXMLApply (Literal T_BESSEL_K) [(Literal (ITok 1)),z] = emitXMLApply (Literal (Id "mc_K1")) [z];

   emitXMLApply (Literal T_BESSEL_Y) [(Literal (ITok 0)),z] = emitXMLApply (Literal (Id "mc_Y0")) [z];
   emitXMLApply (Literal T_BESSEL_Y) [(Literal (ITok 1)),z] = emitXMLApply (Literal (Id "mc_Y1")) [z];

   emitXMLApply (Literal T_BESSEL_I) [n,z] = emitXMLApply (Literal (Id "mc_In")) [n,z];
   emitXMLApply (Literal T_BESSEL_J) [n,z] = emitXMLApply (Literal (Id "mc_Jn")) [n,z];
   emitXMLApply (Literal T_BESSEL_K) [n,z] = emitXMLApply (Literal (Id "mc_Kn")) [n,z];
   emitXMLApply (Literal T_BESSEL_Y) [n,z] = emitXMLApply (Literal (Id "mc_Yn")) [n,z];

   emitXMLApply (Literal T_AIRY_AI) [z] = emitXMLApply (Literal (Id "mc_Ai")) [z];
   emitXMLApply (Literal T_AIRY_AI) [z,(Literal (ITok 0))] = emitXMLApply (Literal (Id "mc_Ai")) [z];
   emitXMLApply (Literal T_AIRY_AI) [z,(Literal (ITok 1))] = emitXMLApply (Literal (Id "mc_DAi")) [z];
   emitXMLApply (Literal T_AIRY_AI) [z,n] =
         (emitXMLApply (Literal T_DN) [(SLam [g0001] (App (Literal (Id "mc_Ai")) [g0001])),n,z])
    where { g0001 = (Literal (Id "g0001")); };  // any name should work since name isn't to be displayed,
                                                // and an absence of conflicts can be guaranteed here,
                                                // but a real gensym function would still be nice. -kmp 18-Apr-2006

   emitXMLApply (Literal T_AIRY_BI) [z] = emitXMLApply (Literal (Id "mc_Bi")) [z];
   emitXMLApply (Literal T_AIRY_BI) [z,(Literal (ITok 0))] = emitXMLApply (Literal (Id "mc_Bi")) [z];
   emitXMLApply (Literal T_AIRY_BI) [z,(Literal (ITok 1))] = emitXMLApply (Literal (Id "mc_DBi")) [z];
   emitXMLApply (Literal T_AIRY_BI) [z,n] =
         (emitXMLApply (Literal T_DN) [(SLam [g0001] (App (Literal (Id "mc_Bi")) [g0001])),n,z])
    where { g0001 = (Literal (Id "g0001")); };  // see remarks about gensym above for Ai. -kmp 18-Apr-2006

   emitXMLApply (Literal T_MuLIMIT)  [expr,spec,side] = emitXMLLimit attrs (SLam [var] expr) val
   where { [var,val] = decodeValArg spec;
           attrs = case side of {
                     (Literal (Id key)) ->
                        if (stringEqual key "Right")
                        then [("direction","right")]
                        else if (stringEqual key "Left")
                             then [("direction","left")]
                             else []; // probably it was "Real" (meaning "Both"), but anyway...
                     _ -> []; // just discard if not understood
                   };
         };

   emitXMLApply (Literal T_MuLIMIT)  [expr,spec] = emitXMLLimit [] (SLam [var] expr) val
   where { [var,val] = decodeValArg spec; };

   decodeValArg :: Expr -> [Expr];
   decodeValArg expr =
    case expr of {
      App (Literal T_EQ) [var, val] -> [var, val];
    };

   emitXMLApply (Literal T_LIMIT)  [lam,x] = emitXMLLimit [] lam x;
   emitXMLApply (Literal T_LIMITR) [lam,x] = emitXMLLimit [("direction","right")] lam x;
   emitXMLApply (Literal T_LIMITL) [lam,x] = emitXMLLimit [("direction","left")]  lam x;

   emitXMLLimit :: [(String,String)] -> Expr -> Expr -> Emitter ();
   emitXMLLimit attrs lam x =
      (emitTagged "ml:apply" []
        (emitSequence XML [(emitEmptyTag "ml:limit" attrs),
                           (emitXMLLam lam),
                           (emitExpr XML x)]));

   emitXMLApply (Literal T_SUBMATRIX) [o,m,r1,r2,c1,c2] =
     // suppress hidden arg.  it'll get added back if re-submitted.
     emitXMLApply (Literal (Id "mc_submatrix")) [m,r1,r2,c1,c2];

   emitRangeProd :: Expr -> Expr -> Emitter();
   emitRangeProd lam rangearg = emitRangeAccumInternal "ml:product"   lam rangearg;

   emitRangeSum  :: Expr -> Expr -> Emitter();
   emitRangeSum  lam rangearg = emitRangeAccumInternal "ml:summation" lam rangearg;

   emitXMLApply (Literal T_RANGESUM) [lam,rangearg]  = emitRangeSum lam rangearg;
   emitXMLApply (Literal T_SUM)      [expr,rangeexp] = emitRangeSum (SLam [var] expr) rangearg
     where { [var,rangearg] = decodeRangeArg rangeexp; };

   emitXMLApply (Literal T_RANGEPRODUCT) [lam,rangearg]  = emitRangeProd lam rangearg;
   emitXMLApply (Literal T_PRODUCT)      [expr,rangeexp] = emitRangeProd (SLam [var] expr) rangearg
     where { [var,rangearg] = decodeRangeArg rangeexp; };

   decodeRangeArg :: Expr -> [Expr];
   decodeRangeArg expr =
    case expr of {
      App _ [var, (App (Literal T_RANGE) [l,u])]  -> [var, (App (Literal T_RANGE) [l, u])];
      App _ [var, (App (Literal T_RANGE2) [l,u])] -> [var, (App (Literal T_RANGE) [l, u])];
      var -> [var, var];
    };

   assureLambda :: Expr -> Expr -> Expr;
   assureLambda lam rangearg = lam;

   simplifyRangearg :: Expr -> Expr;
   simplifyRangearg rangearg =
     case rangearg of {
       App (Literal T_RANGE)
       _ -> rangearg;
     };

   emitRangeAccumInternal :: String -> Expr -> Expr -> Emitter();
   emitRangeAccumInternal mytag lam rangearg =
      (emitTagged "ml:apply" []
        (emitSequence XML ((emitEmptyTag mytag []):pargs)))
   where {
  // (SLam [rangeparam] body) = lam;
  // (Literal rangeparamtok) = rangeparam;
     pargs   =
       case rangearg of {

       // use of an explicit range (i.e., "op_range2_i")
       App (Literal T_RANGE ) [l,u] -> emitRangeAccum2 lam l u;

       // use of an explicit range (i.e., "op_range2")
       App (Literal T_RANGE2) [l,u] -> emitRangeAccum2 lam l u;

       // This error checking didn't seem to work.
       // I'm probably using the wrong predicate. -kmp 11-Feb-2006
       //
    // (Literal tok) | (ib (eq_i4 tok rangeparamtok)) -> emitNoRange lam;
    // _ -> emitRangeAccumError lam rangearg;

       _ -> emitRangeAccum0 lam;
      };
   };

   emitRangeAccum2 :: Expr -> Expr -> Expr -> [Emitter()];
   emitRangeAccum2 lam l u = [(emitXMLLam lam),
                             (emitTagged "ml:bounds" [] (emitExprSeq XML [l,u]))];

   emitRangeAccum0 :: Expr -> [Emitter()];
   emitRangeAccum0 lam = [(emitXMLLam lam)];

   // !!! This is illegal in the Schema and maybe we should just signal an error instead,
   //     but in theory doing this is the only way to avoid data loss if such an expression
   //     is ever constructed. -kmp 11-Feb-2006
   emitRangeAccumError :: Expr -> Expr -> [Emitter()];
   emitRangeAccumError lam rangearg = [(emitXMLLam lam),
                                      (emitExpr XML rangearg)];

// KMP 07-Sep-2006:
//
//   Regarding redisplaying not(op_lt(a,b)) as op_geq(a,b) by customizing T_NOT,
//   See my email of 5/28/2006 (subject line "RE: Preferring one logical syntax to another").
//   which explains in detail why this should not occur in the MPL display code.
//   The better place for that patch is in the parser, since paren decisions have already
//   been made by this point.

   emitXMLApply (Literal T_POW) [b,e] =
    case e of {
                 (App (Literal T_DIVIDE) [(Literal (ITok 1)), (Literal (ITok 2))])  -> (emitXMLApply (Literal T_SQRT) [(stripParens b)]);
         (Parens (App (Literal T_DIVIDE) [(Literal (ITok 1)), (Literal (ITok 2))])) -> (emitXMLApply (Literal T_SQRT) [(stripParens b)]);
         _                                                                          -> (emitXMLDefaultApply (Literal T_POW) [b,e]);
    };

   emitXMLApply (Literal T_SQR) args = emitXMLApply (Literal T_POW)
                                         (concat [args, [Literal (ITok 2)]]);

   // ignore 'eval'
   emitXMLApply (Literal T_EVAL) [arg] = emitExpr XML arg;

   // ignore 'as_i4'
   emitXMLApply (Literal T_AS_I4) [arg] = emitExpr XML arg;

   // nth root needs arguments switched
   emitXMLApply f@(Literal T_NTHROOT) [x,n] = (emitTagged "ml:apply" []
                                                (emitExprSeq XML (f:[n,x])));


   tok_mc_e = Id "mc_e";

   // exp(x) displays as e^x (or just e if x==1)
   emitXMLApply (Literal T_EXP) [(Literal (ITok 1))] = emitToken XML tok_mc_e;

   emitXMLApply (Literal T_EXP) [x] = emitXMLApply (Literal T_POW)
                                        [(Literal tok_mc_e),x];

   emitXMLApply (Literal T_MIXEDNUM) [w,n,d] =
      (emitTagged "ml:mixed" []
        (emitSequence XML [(emitTagged "ml:whole" []
                         (eIndented
                           (emitExpr XML w))),
                       (emitTagged "ml:numerator" []
                         (eIndented
                           (emitExpr XML n))),
                       (emitTagged "ml:denominator" []
                         (eIndented
                             (emitExpr XML d)))]));

   // subscripts
   emitXMLApply (Literal T_SUB1) [m,i,origin] =
      (emitTagged "ml:apply" []
        (emitSequence XML [(emitEmptyTag "ml:indexer" []),
                      (emitExpr XML m),
                           (emitExpr XML i)]));


   emitXMLApply (Literal T_SUB2) [m,i,j,origin] =
      (emitTagged "ml:apply" []
        (emitSequence XML [(emitEmptyTag "ml:indexer" []),
                      (emitExpr XML m),
                      (emitTagged "ml:sequence" []
                            (emitExprSeq XML [i,j]))]));

   // matcol (which is very like a subscript)
   emitXMLApply (Literal T_MATCOL) [m,i,origin] =
      (emitTagged "ml:apply" []
        (emitSequence XML [(emitEmptyTag "ml:matcol" []),
                      (emitExpr XML m),
                           (emitExpr XML i)]));

   emitXMLApply (Literal T_CSORT) [origin,m,i] =
      (emitXMLApply (Literal (Id "mc_csort")) [m,i]);

   emitXMLApply (Literal T_TENSOR_EPSILON) [origin,i,j,k] =
      (emitXMLDefaultApply (Literal T_TENSOR_EPSILON) [i,j,k]);

   emitXMLApply (Literal T_RSORT) [origin,m,i] =
      (emitXMLApply (Literal (Id "mc_rsort")) [m,i]);

   emitXMLApply (Literal T_LOOKUP) [origin,tol,z,a,b] =
      (emitXMLApply (Literal (Id "mc_lookup")) [z,a,b]);

   emitXMLApply (Literal T_HLOOKUP) [origin,tol,z,a,r] =
      (emitXMLApply (Literal (Id "mc_hlookup")) [z,a,r]);

   emitXMLApply (Literal T_VLOOKUP) [origin,tol,z,a,c] =
      (emitXMLApply (Literal (Id "mc_vlookup")) [z,a,c]);

   emitXMLApply (Literal T_MATCH) [origin,tol,z,a] =
      (emitXMLApply (Literal (Id "mc_match")) [z,a]);

   emitXMLApply (Literal T_MULT) [x1,x2] =
      if (expr_eq x1 (Literal (ITok 1)))
      then (emitExpr XML x2)
      else
        if (expr_eq x2 (Literal (ITok 1)))
        then (emitExpr XML x1)
        else
          if (isRealLit x1) 
          then (emitHalfImag [x1,x2])
          else case x1 of {
                 // BEGIN "OPTIONAL ADDITIONAL CHANGE" - See Bug # 061213-151230
                 // Enabled because Beth says Triage wants it.
                 // (a*b*c)*x gets printed as a*b*c*x
                 (Parens x1p@(App (Literal T_MULT) [x1a,x1b]))
                    -> (emitExpr XML (App (Literal T_MULT) [x1p,x2]));
                 // END OF "OPTIONAL ADDITIONAL CHANGE"
                 // (-5)*x gets printed as -5x
                 (Parens x1p@(Literal (ITok n)))
                    -> (emitExpr XML (App (Literal T_MULT) [x1p,x2]));
                 // (-10000000000)*x gets printed as -10000000000x
                 (Parens x1p@(Literal (BigITok n)))
                    -> (emitExpr XML (App (Literal T_MULT) [x1p,x2]));
                 // (-1.0)*x gets pritned as -1.0x
                 (Parens x1p@(Literal (Float n)))
                    -> (emitExpr XML (App (Literal T_MULT) [x1p,x2]));
                 // Rest of stuff
                  _ -> if (expr_eq x2 (Literal TImagUnit))
                       then case x1 of {
                             (App (Literal T_MULT) [x1a, x1b])
                                 -> if (isRealLit x1b)
                                    then (emitXMLDefaultApply (Literal T_MULT) [(App (Literal T_MULT) [x1b, (Literal TImagUnit)]),x1a])
                                    else (emitXMLDefaultApply (Literal T_MULT) [x1,x2]);
                               _ -> (emitXMLDefaultApply (Literal T_MULT) [x1,x2]);
                            }
                       else
                         if (isComplexLit x2)
                         then (emitXMLDefaultApply (Literal T_MULT) [x2,x1])
                         else (emitXMLDefaultApply (Literal T_MULT) [x1,x2]);
             };

   emitXMLApply (Literal T_MINUS) [n1,n2] =
     if (isRealLit n1) && (isImagLit n2)
     then (emitFullComplex [(simplifyRealLit n1),(negative (simplifyImagLit n2))])
     else if (isRealLit n2) && (isImagLit n1)
          then (emitFullComplex [(negative (simplifyRealLit n2)),(simplifyImagLit n1)])
          else (emitXMLDefaultApply (Literal T_MINUS) [n1,n2]);

   emitXMLApply (Literal T_PLUS) [n1,n2] =
     if (isRealLit n1) && (isImagLit n2)
     then (emitFullComplex [(simplifyRealLit n1),(simplifyImagLit n2)])
     else if (isRealLit n2) && (isImagLit n1)
          then (emitFullComplex [(simplifyRealLit n2),(simplifyImagLit n1)])
          else (emitXMLDefaultApply (Literal T_PLUS) [n1,n2]);


   // This case handles the fact that foo((1,2))->
   // evaluates to foo((1,2)) in Mathcad.
   emitXMLApply f [(SList args)] = (emitTagged "ml:apply" []
                                    (emitSequence XML
                                      [(emitExpr XML f),
                                       (emitTagged "ml:parens" []
                                         (emitTagged "ml:sequence" []
                                           (emitExprSeq XML args)))]));

   isComplexLit :: Expr -> Bool;
   isComplexLit x =
     case x of {
       (Parens x) -> (isComplexLit x);
       (App (Literal T_PLUS) [n1,n2])
         -> (((isRealLit n1) && (isImagLit n2)) || ((isImagLit n1) && (isRealLit n2)));
       (App (Literal T_MINUS) [n1,n2])
         -> (((isRealLit n1) && (isImagLit n2)) || ((isImagLit n1) && (isRealLit n2)));
       _ -> False;
     };

   isRealLit :: Expr -> Bool;
   isRealLit x =
     case x of {
       (Literal (ITok    n)) -> True;
       (Literal (BigITok s)) -> True;
       (Literal (Float   s)) -> True;
       (App (Literal T_UMINUS) [(Literal (ITok    n))]) -> True;
       (App (Literal T_UMINUS) [(Literal (BigITok s))]) -> True;
       (App (Literal T_UMINUS) [(Literal (Float   s))]) -> True;
       (Parens x)            -> (isRealLit x);
       _ -> False;
     };

   simplifyRealLit :: Expr -> Expr;
   simplifyRealLit x =
     case x of {
       (Literal (ITok    n)) -> x;
       (Literal (BigITok s)) -> x;
       (Literal (Float   s)) -> x;
       (App (Literal T_UMINUS) [e@(Literal (ITok    n))]) -> (negative e);
       (App (Literal T_UMINUS) [e@(Literal (BigITok s))]) -> (negative e);
       (App (Literal T_UMINUS) [e@(Literal (Float   s))]) -> (negative e);
       (Parens x)            -> (simplifyRealLit x);
       _ -> x;
     };

   simplifyImagLit :: Expr-> Expr;
   simplifyImagLit x =
     case x of {
       (App (Literal T_MULT) [x, (Literal TImagUnit)]) -> (App (Literal T_MULT) [(simplifyRealLit x), (Literal TImagUnit)]);
       (App (Literal T_MULT) [(Literal TImagUnit), x]) -> (App (Literal T_MULT) [(simplifyRealLit x), (Literal TImagUnit)]);
       _ -> x;
     };

   isImagLit :: Expr -> Bool;
   isImagLit x =
     case x of {
       (App (Literal T_MULT) [x, (Literal TImagUnit)]) -> (isRealLit x);
       (App (Literal T_MULT) [(Literal TImagUnit), x]) -> (isRealLit x);
       _ -> False;
     };

   emitFullComplex :: [Expr] -> Emitter();
   emitFullComplex [(Parens x1),x2] = emitFullComplex [x1,x2];
   emitFullComplex [x1@(Literal n1),(App (Literal T_MULT) [n2,(Literal TImagUnit)])] =
      if ( case n1 of {
             (ITok  n)    -> (n == 0);
             (Float fstr) -> (stringEqual fstr "0.0");
          // (BigITok n)  -> False; /* "00000..." ?? Not likely. */
             _            -> False;
           }
         )
      then
         (emitTagged "ml:complex" []
                    (emitXMLNum "ml:imag" n2))
      else
         (emitTagged "ml:complex" []
                    (eTwo (emitXMLNum "ml:real" x1)
                          (emitXMLNum "ml:imag" n2)));

   emitHalfImag :: [Expr] -> Emitter();
   emitHalfImag [x1,x2] =
     if (expr_eq x2 (Literal TImagUnit))
     then (emitTagged "ml:complex" []
            (emitXMLNum "ml:imag" x1))
     else case x1 of {
            (Parens x) -> if (isRealLit x)
                          then (emitXMLDefaultApply (Literal T_MULT) [x,x2])
                          else 
                            case x of { 
                              (App (Literal T_MULT) args)
                                -> (emitExpr XML (App (Literal T_MULT) [x,x2]));
                              _ -> (emitXMLDefaultApply (Literal T_MULT) [x1,x2]);
                            };
            _ -> (emitXMLDefaultApply (Literal T_MULT) [x1,x2]);
          };

   emitXMLApply f args = emitXMLDefaultApply f args;

   emitXMLDefaultApply :: Expr -> [Expr] -> Emitter();
   emitXMLDefaultApply f args = (emitTagged "ml:apply" []
                                  (emitExprSeq XML (f:args)));

   emitRLApply :: Expr -> [Expr] -> Emitter();

   subs_ = Literal (Id "subscript");

   emitRLApply (Literal T_SUB1) [m,i,origin]   = emitRLApply subs_ [m,i];
   emitRLApply (Literal T_SUB2) [m,i,j,origin] = emitRLApply subs_ [m,i,j];

   rsum_    = Literal (Id "op_rangesum");
   no_loop_ = Literal (Id "no-loop");

   emitRLApply (Literal T_SUM) [expr,rng_expr] = emitRLApply rsum_ [lam,nlp]
   where {
     App _ [var,rng] = rng_expr;
     nlp = App no_loop_ [rng];
     lam = SLam [var] expr;
   };

   emitRLApply (Literal T_EVAL_AT) [e,b] =
     case b of {
       (SList [])                        -> (emitExpr RL e);
       (SList bindings)                  -> (emitEvalAtSet RL e bindings []);
       (App (Literal T_SET) [])          -> (emitExpr RL e);
       (App (Literal T_SET) bindings)    -> (emitEvalAtSet RL e bindings []);
       (App (Literal T_EQ) [var,val])    -> (emitEvalAt RL e [(var,val)]);
       (App (Literal T_MC_EQ) [var,val]) -> (emitEvalAt RL e [(var,val)]);
       _ -> (emitParenthesized (emitExprsDelimited RL [e,b] " "));
     };

   emitEvalAt RL e varvals =
      (emitWrapped "let"
        (eThree (emitParenthesized 
                  (emitSequence RL (map (\ (var,val) -> 
                                           (emitParenthesized
                                             (eThree (emitExpr RL var)
                                                     (emitString " ")
                                                     (emitExpr RL val))))
                                        varvals)))
          (emitString " ")
          (emitExpr RL e)));

   emitRLApply f args =
      // display f [a,b,c] as (f a b c)
      emitParenthesized (emitExprsDelimited RL (f:args) " ");

   emitSequence :: Format -> [Emitter ()] -> Emitter ();
   emitSequence MuPad s = eDelimited s (emitString ",");
   emitSequence RL    s = eDelimited s (emitString " ");
   emitSequence XML   s = eDelimited s emitNewline;

   emitSquareBracketed :: Format -> Emitter () -> Emitter ();
   emitSquareBracketed MuPad e = eBracketed
                                  (emitString "[") e (emitString "]");

   emitList :: Format -> [Emitter ()] -> Emitter ();
   emitList MuPad s = emitSquareBracketed MuPad (emitSequence MuPad s);
   emitList RL    s = emitWrapped "list"           (emitSequence RL    s);
   emitList XML   s = emitTagged  "ml:sequence" [] (emitSequence XML   s);

   emitExprSeq :: Format -> [Expr] -> Emitter ();
   emitExprSeq fmt exprs = emitSequence fmt (map (emitExpr fmt) exprs);

   // Convenience function.  Not the sort of thing you typically
   // want to do in XML, though.
   emitExprsDelimited :: Format -> [Expr] -> String -> Emitter ();
   emitExprsDelimited XML _ _         = error "symbolics: XML emission error";
   emitExprsDelimited fmt exprs delim = eDelimited
                                         (map (emitExpr fmt) exprs)
                                         (emitString delim);


   // In general, lambdas should be sent to the UI as the
   // identifier 'function'.
   emitExpr XML (NLam _ _     ) = emitAsId XML "function";
   emitExpr XML (SLam _ _     ) = emitAsId XML "function";

   // In certain special circumstances, we do need to generate
   // XML for a lambda.
   emitXMLLam :: Expr -> Emitter ();
   emitXMLLam (NLam f params)   = emitLam XML params (f params);
   emitXMLLam (SLam params b)   = emitLam XML params b;
   emitXMLLam x                 = emitExpr XML x;

   emitExpr fmt (SLam params b) = emitLam fmt params b;

   emitLam :: Format -> [Expr] -> Expr -> Emitter ();

   emitLam XML params body = (emitTagged "ml:lambda" []
                               (eThree (emitTagged "ml:boundVars" []
                                       (emitExprSeq XML params))
                                       emitNewline
                                (emitExpr XML body)));

   emitLam RL params body = (emitWrapped "lambda"
                              (eTwo
                                (emitParenthesized (emitExprSeq RL params))
                                (emitExpr RL body)));

   emitLam fmt params body = eBracketed (eBeginProc fmt params)
                                        (eTwo eSpace (emitExpr fmt body))
                                        (eTwo eSpace (eEndProc fmt));

   eBeginProc :: Format -> [Expr] -> Emitter ();
   eBeginProc fmt params = eBracketed (emitString "proc")
                                      (emitParenthesized
                                       (emitExprsDelimited fmt params ","))
                                      (eWhen MuPad fmt (emitString " begin"));

   eEndProc :: Format -> Emitter ();
   eEndProc MuPad = emitString "end_proc";

   // Matrices

   emitExpr RL (SMat m) = emitExpr RL e
    where {
           e = App (Literal (Id "op_matrix"))
               [
                unboxed (ITok (rows (as_matrix m))),
                unboxed (ITok (cols (as_matrix m))),
                App (Literal (Id "list")) (vfrom (packmat m))
               ];

           unboxed x = App (Literal (Id "unboxed")) [Literal x];
          };

   emitExpr XML (SMat m) = (emitTagged
                            "ml:matrix"
                            [("rows",(to_string (rows (as_matrix m)))),
                             ("cols",(to_string (cols (as_matrix m))))]
                            (emitExprSeq XML (vfrom (packmat m))));

   emitExpr MuPad (SMat m) =
    let { lrows = partition (cols (as_matrix m))
                            (vfrom (packmat (op_transpose m)));
           op_transpose::M a->M a@"[efimatrix?]Efi.Matrix::transpose";// from EfiMatrix
           } in
     eTwo (emitString "matrix")
          (emitParenthesized
           (emitList MuPad
            (map ((emitList MuPad).(map (emitExpr MuPad))) lrows)));

   // Piecewise

   emitExpr fmt (SPiecewise [])     = emitExpr fmt (Literal T_UNDEFINED);
   emitExpr fmt (SPiecewise [pair]) = emitExpr fmt (SPiecewise [pair,((Literal T_OTHERWISE),(Literal T_UNDEFINED))]);

   emitExpr XML (SPiecewise pairs) =
    emitTagged "ml:program" []
     (emitSequence XML (map (emitIfThen XML) pairs));

   emitExpr RL  (SPiecewise pairs) =
    emitWrapped "progn"
     (emitSequence RL (map (emitIfThen RL) pairs));

   emitExpr fmt (SPiecewise pairs) =
    eTwo (emitString "piecewise")
         (emitParenthesized (emitSequence fmt (map (emitIfThen fmt) pairs)));

   separateProgramBar :: Expr -> Expr;
   separateProgramBar x =
     case x of {
       (App (Literal T_EVAL_AT) args) -> (Parens x);
       (SPiecewise clauses)           -> (Parens x);
       _                              -> x;
     };

   emitIfThen :: Format -> (Expr,Expr) -> Emitter ();
   emitIfThen XML ((Literal T_OTHERWISE),expr) =
    (emitTagged "ml:otherwise" []
      (emitExpr XML (separateProgramBar expr)));

   emitIfThen XML (condition,expr) =
    (emitTagged "ml:ifThen" []
      (emitExprSeq XML [condition,(separateProgramBar expr)]));

   emitIfThen RL ((Literal T_OTHERWISE),expr) =
    emitWrapped "otherwise" (emitExpr RL expr);

   emitIfThen RL (condition,expr) =
    emitWrapped "ifthen" (emitExprSeq RL [condition,expr]);

   emitIfThen fmt (condition,expr) =
    emitList fmt [emitExpr fmt condition,emitExpr fmt expr];

   // Progn

   emitExpr XML   (Progn exprs) = emitTagged "ml:program" []
                                   (emitExprSeq XML exprs);

   emitExpr RL    (Progn exprs) = emitWrapped "progn"
                                   (emitExprSeq RL exprs);

   emitExpr MuPad (Progn exprs) = eDelimited
                                   (map (emitExpr MuPad) exprs)
                                   (emitString "; ");


   // Vectorization
   // We only have to handle it in XML and RL (where it
   // can arise as the result of explicit calculation).
   emitExpr XML (SVec f _) = (emitTagged "ml:vectorize" [] (emitExpr XML f));

   emitExpr RL  (SVec f _) = (emitWrapped "vectorize" (emitExpr RL f));


   // Raw strings
   emitExpr MuPad (SRaw s) = emitString s;
   emitExpr fmt   (SRaw s) = emitExpr fmt (preemit fmt (parseString s));


   emitAsId :: Format -> String -> Emitter ();
   emitAsId XML s           = (emitTaggedInl "ml:id" [] (emitString s));
   emitAsId _   s           = (emitString s);


   emitToken XML (STok str)  = (emitTaggedInl "ml:str"    [] (emitString str));
   emitToken XML x@(ITok n)    = (emitXMLNumToken "ml:real" x);
   emitToken XML x@(BigITok n) = (emitXMLNumToken "ml:real" x);
   emitToken XML x@(Float v)   = (emitXMLNumToken "ml:real" x);

   emitToken XML TImagUnit   = (emitTaggedInl "ml:complex" []
                                 (emitTaggedInl "ml:imag" [] // [("symbol","i")]
                                   (emitString "1")));

   emitToken RL T_RD_NINF =
     (emitWrapped "op_negate"
      (emitAsId RL (from_target "infinity")));

   emitToken XML T_RD_NINF =
     (emitTagged "ml:apply" []
       (eDelimited [(emitToken XML T_UMINUS),
                    (emitAsId XML (from_target "infinity"))]
                   emitNewline));

   emitToken XML T_TRUE         = (emitToken XML (ITok 1));
   emitToken XML T_FALSE        = (emitToken XML (ITok 0));

   emitXMLNumToken :: String -> Token -> Emitter();
   emitXMLNumToken s (ITok n)    = (emitTaggedInl s [] (emitInt n));
   emitXMLNumToken s (BigITok n) = (emitTaggedInl s [] (emitString n));
   emitXMLNumToken s (Float v)   = (emitTaggedInl s [] (emitString v));

   emitXMLNum :: String -> Expr -> Emitter();
   emitXMLNum s (Literal n) = emitXMLNumToken s n;
   emitXMLNum s (Parens (App (Literal T_UMINUS) [(Literal x)])) = (emitXMLNumToken s (negToken x));
   emitXMLNum s (Parens (Literal x)) = (emitXMLNumToken s x);

   emitToken XML T_CROSSPROD    = (emitEmptyTag "ml:crossProduct" []);
   emitToken XML T_PLUS         = (emitEmptyTag "ml:plus"   []);
   emitToken XML T_MINUS        = (emitEmptyTag "ml:minus"  []);
   emitToken XML T_UMINUS       = (emitEmptyTag "ml:neg"    []);
   emitToken XML T_MULT         = (emitEmptyTag "ml:mult"   []);
   emitToken XML T_DIVIDE       = (emitEmptyTag "ml:div"    []);
   emitToken XML T_POW          = (emitEmptyTag "ml:pow"    []);
   emitToken XML T_FACTORIAL    = (emitEmptyTag "ml:factorial" []);
   emitToken XML T_LT           = (emitEmptyTag "ml:lessThan" []);
   emitToken XML T_GT           = (emitEmptyTag "ml:greaterThan" []);
   emitToken XML T_EQ           = (emitEmptyTag "ml:equal" []);
   emitToken XML T_LTEQ         = (emitEmptyTag "ml:lessOrEqual" []);
   emitToken XML T_GTEQ         = (emitEmptyTag "ml:greaterOrEqual" []);
   emitToken XML T_NEQ          = (emitEmptyTag "ml:notEqual" []);
   emitToken XML T_AND          = (emitEmptyTag "ml:and" []);
   emitToken XML T_OR           = (emitEmptyTag "ml:or" []);
   emitToken XML T_XOR          = (emitEmptyTag "ml:xor" []);
   emitToken XML T_NOT          = (emitEmptyTag "ml:not" []);
   emitToken XML T_ABS          = (emitEmptyTag "ml:absval" []);
   emitToken XML T_SQRT         = (emitEmptyTag "ml:sqrt" []);
   emitToken XML T_NTHROOT      = (emitEmptyTag "ml:nthRoot" []);
   emitToken XML T_CONJUGATE    = (emitEmptyTag "ml:conjugate"   []);
   emitToken XML T_SIGMASUM     = (emitEmptyTag "ml:vectorSum" []);
   emitToken XML T_TRANSPOSE    = (emitEmptyTag "ml:transpose" []);

   emitToken XML T_MC_EQ        = emitToken XML T_EQ;
   emitToken XML T_MC_LT        = emitToken XML T_LT;
   emitToken XML T_MC_GT        = emitToken XML T_GT;
   emitToken XML T_MC_NEQ       = emitToken XML T_NEQ;
   emitToken XML T_MC_LTEQ      = emitToken XML T_LTEQ;
   emitToken XML T_MC_GTEQ      = emitToken XML T_GTEQ;

   emitToken XML T_ERROR        = (emitAsId XML "mc_error");

   unicodeIffy :: String -> String;
   unicodeIffy x = // a pun on unicodify -- it's a pretty "iffy" way to do it
      if useUnicodeIdentifiers
      then (from_target x)
      else x;

   emitToken XML T_THE_INTEGERS  = (emitAsId XML (unicodeIffy "Z_")); // "_hex_6D635FE284A4"
   emitToken XML T_THE_RATIONALS = (emitAsId XML (unicodeIffy "Q_")); // "_hex_6D635FE2849A"
   emitToken XML T_THE_REALS     = (emitAsId XML (unicodeIffy "R_")); // "_hex_6D635FE2849D"
   emitToken XML T_THE_COMPLEXES = (emitAsId XML (unicodeIffy "C_")); // "_hex_6D635FE28482"

   isBasicSet :: Expr -> Bool;
   isBasicSet (Literal T_THE_INTEGERS) = True;
   isBasicSet (Literal T_THE_RATIONALS) = True;
   isBasicSet (Literal T_THE_REALS) = True;
   isBasicSet (Literal T_THE_COMPLEXES) = True;
   isBasicSet x = False;

   emitToken XML T_XIN            = (emitAsId XML (from_target "xin")); // "_hex_6D635FE28888" //
   // _hex_6D635FE28888 = element of
   // _hex_6D635FE2888A = small element of

   emitToken XML T_RE           = (emitAsId XML "mc_Re");
   emitToken XML T_IM           = (emitAsId XML "mc_Im");
   emitToken XML T_LN           = (emitAsId XML "mc_ln");
   // Note that log isn't here because MuPAD logs is reversed.  See T_XLOG

   emitToken XML T_ROOT         = (emitAsId XML "root"); // !!! should this be mc_root ?? -kmp
   emitToken XML T_ROOT_BRACKET = (emitAsId XML "root"); // !!! ditto

   emitToken XML T_DIRAC        = (emitAsId XML (from_target "mcad_dirac")); // will back-translate capital Delta

   // translator_unmangle removes any _local added as a postprocessing step
   emitToken XML (Id s)         = (emitAsId XML (translator_unmangle s));

   translator_unmangle :: String->String@"[efisymbolics?]Efi.Symbolics::translator_unmangle";


   emitToken RL  (STok str)  = (emitWrapped "string"
                                 (emitQuoted (emitString str)));
   emitToken RL  (ITok n)    = (emitWrapped "number" (emitInt n));
   emitToken RL  (BigITok n) = (emitWrapped "number" (emitString n));
   emitToken RL  (Float v)   = (emitWrapped "number" (emitString v));
   emitToken RL  TImagUnit   = (emitWrapped "number" (emitString "1i"));
   emitToken RL  (Id s)      = (emitAsId RL (translator_unmangle s));

   emitToken RL  T_TRUE      = (emitWrapped "number" (emitInt 1));
   emitToken RL  T_FALSE     = (emitWrapped "number" (emitInt 0));

   emitToken RL  T_XIN       = (emitAsId RL "op_element_of");
   emitToken RL  T__IN       = (emitAsId RL "op_element_of");

   emitToken MuPad (Id s)    = (emitAsId MuPad (to_mupad (_mangle_hex s)));
   _mangle_hex :: String->String@"[efisymbolics?]Efi.Symbolics::_mangle_hex";


   emitToken MuPad (STok str)  = emitQuoted (emitString str);
   emitToken MuPad (ITok n)    = (emitInt n);
   emitToken MuPad (BigITok n) = (emitString n);
   emitToken MuPad (Float v)   = (eThree (emitString "floatFromString(\"")
                                         (emitString v)
                                         (emitString "\")"));

//                               if (bool_from_registry "UseMcFloats" False) // STR_USE_MC_FLOATS
//                               then (eThree (emitString "mcFloatFromString(\"")
//                                            (emitString v)
//                                            (emitString "\")"))
//                               else (emitString v);

   emitToken MuPad T_XIN        = (emitAsId MuPad "op_element_of");
   emitToken MuPad T__IN        = (emitAsId MuPad "op_element_of");

   emitToken MuPad T_UNION      = (emitString " union ");
   emitToken MuPad T_INTERSECT  = (emitString " intersect ");
   emitToken MuPad T_SETMINUS   = (emitString " minus ");
   emitToken MuPad T_SUBSET     = (emitString " subset ");

   emitToken MuPad T_IN         = (emitString " in ");
   emitToken MuPad T_MOD_DIV    = (emitString " div ");
   emitToken MuPad T_MOD_REM    = (emitString " mod ");
   emitToken MuPad T_PLUS       = (emitString "+");
   emitToken MuPad T_MINUS      = (emitString "-");
   emitToken MuPad T_UMINUS     = (emitString "-");
   emitToken MuPad T_MULT       = (emitString "*");
   emitToken MuPad T_DIVIDE     = (emitString "/");
   emitToken MuPad T_POW        = (emitString "^");
   emitToken MuPad T_FACTORIAL  = (emitString "!");
   emitToken MuPad T_FACTORIAL2 = (emitString "!!");
   emitToken MuPad T_LT         = (emitString "<");
   emitToken MuPad T_GT         = (emitString ">");
   emitToken MuPad T_LTEQ       = (emitString "<=");
   emitToken MuPad T_GTEQ       = (emitString ">=");
   emitToken MuPad T_NEQ        = (emitString "<>");
   emitToken MuPad T_EQ         = (emitString "=");
   emitToken MuPad T_AND        = (emitString " and ");
   emitToken MuPad T_OR         = (emitString " or ");
   emitToken MuPad T_XOR        = (emitString " xor ");
   emitToken MuPad T_NOT        = (emitString "not ");
   emitToken MuPad T_RANGE      = (emitString "..");
   emitToken MuPad T_EVAL_AT    = (emitString "|");
   emitToken MuPad T_ZHULL      = (emitString "...");
   emitToken MuPad T_ZSEQ       = (emitString "$");
   emitToken MuPad T_XD         = (emitString "'");
   emitToken MuPad T_ERROR      = (emitString "mcad_error");

   emitToken fmt   tok         = case (blookupInv tok_id_map tok) of {
                                  Nothing -> error "emission failure";
                                  Just s  -> (emitAsId fmt
                                               (_unmangle_hex
                                                 (to_format fmt s)));
                                 };

   to_format :: Format -> String -> String;
   to_format MuPad s = to_mupad s;
   to_format fmt   s = s; // no special mapping available, assume it's the identity mapping

//***********************************************************************
// Pre-emission
//
// The 'preemit' function is called on expressions before they are
// emitted as RL or XML.
//***********************************************************************

preemit :: Format -> Expr -> Expr;

preemit fmt (Literal tok) = Literal (omaptok fmt tok);

// Symbolic lambda expression.
preemit fmt (SLam params expr) = SLam (map (preemit fmt) params)
                                      (preemit fmt expr);

// Numeric lambda expression.  We should only get here if it is not
// being applied.
preemit fmt (NLam f params) = try (SLam (map (preemit fmt) params)
                                    (preemit fmt (f (map hold params))))
                              catch { _e_ -> (NLam f params) };

hold x  = App id_hold [x];
id_hold = Literal (Id "hold");

// If a numeric lambda is being applied, process the result of
// the application.
preemit fmt (App (NLam f anames) args)
         | ne == ng  = preemit fmt (f args)
         | ne >  ng  = let { rest = drop ng anames; } in
                       preemit fmt (SLam rest (f (args ++ rest)))
         | else      = error (strcat_l ["too_many_arguments\t",
                                        int_to_str ne,"\t",int_to_str ng])
         where {
                ne = length anames; // number of arguments expected
                ng = length args;   // number of arguments given
               };

preemit XML app@(App _ _) = preemitXApp XML app;
preemit RL  app@(App _ _) = preemitXApp RL  app;

preemit fmt (App f args) = App (preemit fmt f) (map (preemit fmt) args);

preemit fmt x
    | maps x = mapExpr (preemit fmt) x
    | else   = x;


// preemitXApp: Special handling for XML and RL

preemitXApp :: Format -> Expr -> Expr;

// Undo the translator's handiwork, fixing bug 060520-135604.
preemitXApp fmt (App f [App (Literal T_CLR_VEC) [n,(SList args)]]) =
                 App (preemit fmt f) (map (preemit fmt) args);

preemitXApp fmt (App (Literal T_AS_BOOL) [x]) = preemit fmt x;
preemitXApp fmt (App (Literal T_BV) [x])      = preemit fmt x;
preemitXApp fmt (App (Literal T_AND_) [x,y])  = App (Literal T_AND)
                                                 [preemit fmt x,preemit fmt y];
preemitXApp fmt (App (Literal T_OR_) [x,y])   = App (Literal T_OR)
                                                 [preemit fmt x,preemit fmt y];
preemitXApp fmt (App (Literal T_XOR_) [x,y])  = App (Literal T_XOR)
                                                 [preemit fmt x,preemit fmt y];

preemitXApp fmt (App (Literal T_MC_INTEGRAL) [tol,cb,lam,l,u,algo]) =
                (App (Literal T_MC_INTEGRAL) args)
where {
  args = (map (preemit fmt) [cb,lam,l,u]) ++ [sunbox algo];
};

preemitXApp fmt (App (Literal T_INTEGRAL_CB) [x,y]) =
                (App (Literal T_INTEGRAL_CB) [sunbox x, sunbox y]);

sunbox :: Expr -> Expr;
sunbox x = App (Literal (Id "unboxed")) [x];

preemitXApp fmt (App (Literal T_INTEGRAL) [expr,lim]) =
case lim of {
  App _ [var,App _ [l1,u1]] -> (App (Literal T_MC_INTEGRAL) [cb,lam,l,u,algo])
      where {
         l    = preemit fmt l1;
         u    = preemit fmt u1;
         cb   = App (Literal (Id "integralcb")) [ub0,ub0];
         lam  = preemit fmt (SLam [var] expr);
         algo = ub0;
         ub0  = sunbox (Literal (ITok 0));
      };

  var -> (App (Literal T_MC_INDEF_INTEGRAL) [lam])
     where {
       lam  = preemit fmt (SLam [var] expr);
     };
};

preemitXApp fmt (App r@(Literal T_REALLY) [x]) = preemit fmt x;

preemitXApp fmt (App f args) = App (preemit fmt f) (map (preemit fmt) args')
where {
       args' = filter not_Null args;
       not_Null :: Expr -> Bool;
       not_Null (Literal T_NULL) = False;
       not_Null _                = True;
};

//***********************************************************************
// display_map
//
// There are certain operators which, though distinct at the level
// of the target symbolic engine, should be represented identically
// in XML or RL.  ('op_add' and '+', for example.)  This map, which
// is used by 'preemit' above, takes care of that.
//
// Note: There are two reasons that these operators can't simply
// be put in the mupad_map like most others with similar issues:
//
//  1. The lexer handles them specially, since their
//     textual representations in the symbolic engine's
//     language contain characters not allowed in
//     identifiers.
//
//  2. We want them to roundtrip distinctly.  For example,
//     both "op_add(1,2)" and "1+2" in MuPAD should roundtrip
//     to themselves.
//
//***********************************************************************

   display_map =
       make_many_to_one_map
       [
        // Long names for operators defined in the op_map of lexOp ...
               (T_OP_ADD,       T_PLUS),      // +
               (T_OP_SUB,       T_MINUS),     // -
               (T_OP_NEGATE,    T_UMINUS),    // - [alternate]
               (T_OP_MULT,      T_MULT),      // *
               (T_OP_DIV,       T_DIVIDE),    // /
               (T_OP_POWER,     T_POW),       // ^
               (T_MC_LT,        T_LT),        // <
               (T_MC_GT,        T_GT),        // >
               (T_MC_LTEQ,      T_LTEQ),      // <= [composed]
               (T_MC_GTEQ,      T_GTEQ),      // >= [composed]
               (T_MC_NEQ,       T_NEQ),       // <> [composed]
               (T_MC_EQ,        T_EQ),        // =
               (T_OP_FACTORIAL, T_FACTORIAL), // !
               (T_OP_AND,       T_AND),       // and
               (T_OP_OR,        T_OR),        // or
               (T_OP_NOT,       T_NOT),       // not
               (T_OP_XOR,       T_XOR)        // xor
       ];

   omaptok :: Format -> Token -> Token;
   omaptok XML tok = case (mlookup display_map tok) of {
                             Nothing   -> tok;
                             Just tok2 -> tok2;
                     };
   omaptok RL  tok = case (mlookupInv display_map tok) of {
                             Nothing   -> tok;
                             Just tok2 -> tok2;
                            };
   omaptok _   tok = tok;

   omap :: Format -> Expr -> Expr;
   omap fmt (Literal tok) = Literal (omaptok fmt tok);
   omap _   x             = x;


//***********************************************************************
// emitExpression
//
// Calls 'preemit' before emitting.
//***********************************************************************

emitExpression :: Format -> Expr -> Emitter ();
// Elegant, but as of 2006-05-31, sometimes causes the MPL compiler
// to crash instead of giving useful error messages when there
// are problems in other parts of the file.
//emitExpression fmt = (emitExpr fmt).(preemit fmt);
emitExpression fmt e = (emitExpr fmt (preemit fmt e));

//***********************************************************************
// Utilities
//***********************************************************************

   packmat::Matrix a -> Vector a @"instance[mplrun]Mcd.MatVal::PackObjects()";

   // Partition a list into a lists of lists, each of length n
   partition n []   = [];
   partition n list = let { (p,r) = split_at n list; }
    in (p:(partition n r));


// IMPORTANT
// These next three methods are found by reflection.  If their
// names or signatures are changed, corresponding changes must be
// made to SymbolicValue.cs in the automationmgd project.

   emitToXML :: Expr -> String;
   emitToXML e = emitToString (emitExpression XML e);
   // A bit nicer, perhaps, but if defined this way, "emitToXML" will
   // show up as an object in the generated assembly and not a method.
   //emitToXML = emitToString.(emitExpression XML);

   emitToRL :: Expr -> String;
   emitToRL e = emitToString (emitExpression RL e);
   // See comment for emitToXML.
   //emitToRL = emitToString.(emitExpression RL);

   exprSize :: Expr -> Int;
   exprSize e = count (emitExpression XML e);


//***********************************************************************
// Functions for use in test files
//***********************************************************************

   checkOutput :: Format -> Expr -> String -> ();
   checkOutput fmt e expected
       | (ib (eq_i4 actual expected)) = ()
       | else                         = report_error expected actual
   where {
     actual = try (emitToString (emitExpression fmt e))
              catch { er -> error (strcat_l ["error emitting ",
                                             to_string e,"; expected ",
                                             expected]); };
     report_error ex ac = error (strcat_l ["output error: expected ",ex,
                                           ", got ",ac]);
   };

   checkRoundtrip :: Format -> String -> ();
   checkRoundtrip fmt s
       | (ib (eq_i4 s rt)) = ()
       | else              = report_error s rt
   where {
     rt = try (emitToString (emitExpression fmt (parseString s)))
          catch { e -> error (strcat_l ["error trying to roundtrip ",s]); };
     report_error s rt = error (strcat_l ["roundtrip error: ",s,
                                          " roundtripped to ",rt]);
   };

   check :: String->a->String;
   check label _ = strcat_l [label,": passed."];

   showOutput :: Format -> String -> String;
   showOutput fmt s =
     try (emitToString (emitExpression fmt (parseString s)))
            catch { e -> error (strcat_l ["error trying to show ",s]); };

   mcshowOutput :: Format -> String -> String;
   mcshowOutput fmt s =
     try (emitToString (emitExpression fmt (parseMathcadString s)))
            catch { e -> error (strcat_l ["error trying to show ",s]); };

   showXML   = showOutput XML;
   showMuPad = showOutput MuPad;
   showRL    = showOutput RL;

   mcshowXML   = mcshowOutput XML;
   mcshowMuPad = mcshowOutput MuPad;
   mcshowRL    = mcshowOutput RL;

   findFormat :: String -> Format;
   findFormat fmt 
     | (stringEqual fmt "Mathcad") = Mathcad
     | (stringEqual fmt "MuPad")   = MuPad
     | (stringEqual fmt "RL")      = RL
     | (stringEqual fmt "XML")     = XML;

   parseMathcad = parseMathcadString;
   parseMuPad   = parseMuPadString;

// ****************************************************************
// Symbolics functions called directly in translator-generated code
// ****************************************************************

   // special contants
   sym_zero_ :: Expr;
   sym_zero_ = Literal (ITok 0);

   sym_no_value_ :: Expr;
   sym_no_value_ = Literal T_UNDEFINED; //was (Id "no_value_"); changed for Bug # 060901-125017

   // '%' is a variable defined to be 0.01 in Mathcad
   sym_mc__25_ = make_sym_real "0.01";

   make_sym :: String -> Expr;
   make_sym s = Literal tok where {
     tok = case blookup tok_id_map (_mangle_hex s) of {
            Nothing   -> Id s;
            Just tok  -> tok;
           };

     _mangle_hex :: String->String@"[efisymbolics?]Efi.Symbolics::_mangle_hex";
   };

   make_sym_string :: String -> Expr;
   make_sym_string s = Literal (STok (_escape s)) where {
     _escape :: String->String@"[efisymbolics?]Efi.Symbolics::_mupad_escape";
   };

   symbolic_as_bool :: Expr -> Bool;
   symbolic_as_bool x = symbolic_to_bool x;


   make_sym_real :: String -> Expr;
   make_sym_real = parseMathcadNumber;

   make_sym_imag :: String -> Expr;
   make_sym_imag = make_imag.parseMathcadNumber;


   make_sym_range :: [Expr] -> Expr;
   make_sym_range exprs =
       case exprs of
       {
        [_,_]   -> App (Literal T_RANGE2) exprs;
        [_,_,_] -> App (Literal T_RANGE3) exprs;
        _       -> error "illegal range";
       };


   sym_op_range2 :: Expr -> Expr -> Expr;
   sym_op_range2 fv lv = make_sym_range [fv,lv];

   sym_op_range2_i = sym_op_range2;

   sym_op_range3 :: Expr -> Expr -> Expr -> Expr;
   sym_op_range3 fv nv lv = make_sym_range [fv,nv,lv];

   sym_forRange2 :: Expr -> Expr -> NullOr(VIterator{});
   sym_forRange2 fv lv = forRange2 (to_numeric_e fv) (to_numeric_e lv);

   sym_forRange3 :: Expr -> Expr -> Expr -> NullOr(VIterator{});
   sym_forRange3 fv nv lv =
       forRange3 (to_numeric_e fv ) (to_numeric_e nv) (to_numeric_e lv);

   // convert a numeric value to a symbolic one
   to_symbolic :: V{} -> Expr;
   to_symbolic x = (parseString (to_symbolic_string x))
   where { to_symbolic_string :: V{}->String @ "[efisymbolics?]Efi.Symbolics::to_symbolic_string"; };

   to_numeric :: Expr -> V{};
   to_numeric x = case (maybe_to_numeric x) of {
                   Nothing -> error "must be scalar";
                   Just v  -> v;
                  };

   i4_to_symbolic :: I4 -> Expr;
   i4_to_symbolic i' = Literal (ITok (I i'));

   symeval :: Expr -> Expr;

   symeval n@(NLam _     _)   = n;
   symeval (SNPair expr  v)   = SNPair (symeval expr) v;

   symeval (App (Literal T_RANGE)  args) = App (Literal T_RANGE)  (mpsym args);
   symeval (App (Literal T_RANGE2) args) = App (Literal T_RANGE2) (mpsym args);
   symeval (App (Literal T_RANGE3) args) = App (Literal T_RANGE3) (mpsym args);

   symeval x = svectorize mupad_eval (pse x);

   // Helper for symeval
   mpsym :: [Expr] -> [Expr];
   mpsym exprs = map symeval exprs;

   // Symbolic matrices
   make_sym_matrix :: Expr -> Expr -> Expr -> Expr;
   make_sym_matrix sr sc (SList vals) = SMat (init_array r c vals)
   where {
     r = (as_i4 (to_numeric_e sr));
     c = (as_i4 (to_numeric_e sc));
   };

   // Symbolic subscripts

   symsubscript1 :: Expr -> Expr -> V{} -> Expr;
   symsubscript1 expr i org = App (Literal T_SUB1) [expr,i,(sym org)];


   symsubscript2 :: Expr -> Expr -> Expr -> V{} -> Expr;
   symsubscript2 expr i j org = App (Literal T_SUB2) [expr,i,j,(sym org)];


   default_matrix = mm default_matrix';

   sym_upd_1' :: Expr -> Expr -> Expr -> Expr;
   sym_upd_1' (SMat m) i v = SMat (setm_1 m' i' v)
    where {
     i' = (as_i4 (to_numeric_e i));
     m' = _sym_ensure_size m (add_i4 i' 1$) 1$ sym_zero_;
    };
   sym_upd_1' (SRaw s) i v = sym_upd_1' (parseString s) i v;
   sym_upd_1' _        i v = sym_upd_1' (SMat default_matrix) i v;

   sym_upd_2' :: Expr -> Expr -> Expr -> Expr -> Expr;
   sym_upd_2' (SMat m) i j v = SMat (setm_2 m' i' j' v)
    where {
     i' = (as_i4 (to_numeric_e i));
     j' = (as_i4 (to_numeric_e j));
     m' = _sym_ensure_size m (add_i4 i' 1$) (add_i4 j' 1$) sym_zero_;
    };
   sym_upd_2' (SRaw s) i j v = sym_upd_2' (parseString s) i j v;
   sym_upd_2' _        i j v = sym_upd_2' (SMat default_matrix) i j v;

   // Matcol

   symgetm_col :: Expr -> Expr -> V{} -> Expr;
   symgetm_col expr i org = App (Literal T_MATCOL) [expr,i,(sym org)];

   sym_upd_matcol :: Expr -> Expr -> Expr -> Expr;
   sym_upd_matcol (SMat m) i c = SMat m''
    where {
     i'  = (as_i4 (to_numeric_e i));
     c'  = get_mat c;
     nr' = max_i4 (rows' (cast c')) (rows' (cast m));
     c'' = _sym_ensure_size c' nr'            1$  sym_zero_;
     m'  = _sym_ensure_size m  nr' (add_i4 i' 1$) sym_zero_;
     m'' = set_matcol m' i' c'';

     get_mat :: Expr -> (Matrix Expr);
     get_mat (SMat col) = col;
     get_mat (SRaw s)   = get_mat (parseString s);
     get_mat x          = (cast (init_array 1$ 1$ [x]));

     cast :: a -> b @ 46;

     // Copied here, as mcdrun doesn't export it
     max_i4 x y = x `add_i4` ( (cgt_i4 y x) `mul_i4` (y `sub_i4` x));

     // This is defined in mcdtranslator.mpl, but that file
     // depends on this one.
     set_matcol :: Matrix a -> I4 -> Matrix a -> Matrix a  @"[mplrun]Mcd.MatVal::mcd_setcolumn";
    };
   sym_upd_matcol (SRaw s) i c = sym_upd_matcol (parseString s)       i c;
   sym_upd_matcol _        i c = sym_upd_matcol (SMat default_matrix) i c;

   sym_is_vector :: Expr -> Expr;
   sym_is_vector (SMat m) = Literal (ITok (if (cols (as_matrix m))==1
                                              then 1
                                              else 0));
   sym_is_vector (SRaw s) = sym_is_vector (parseString s);
   sym_is_vector _        = Literal (ITok 0);

   sym_is_matrix :: Expr -> Expr;
   sym_is_matrix (SMat m) = Literal (ITok 1);
   sym_is_matrix (SRaw s) = sym_is_matrix (parseString s);
   sym_is_matrix _        = Literal (ITok 0);



   // Matrix reallocation

   sym_realloc :: Expr -> I4 -> I4 -> Expr;
   sym_realloc (SMat m) i j = SMat (_sym_realloc m i' j' sym_zero_)
    where {
     i' = (add_i4 i 1$);
     j' = (add_i4 j 1$);
    };
   sym_realloc (SRaw s) i j = sym_realloc (parseString s)       i j;
   sym_realloc _        i j = sym_realloc (SMat default_matrix) i j;

   sym_as_matrix_value :: a->a;
   sym_as_matrix_value x = x;

   sym_unify :: a->a->a;
   sym_unify x y = y;

   sym_as_bool :: Expr -> Expr;
   sym_as_bool x = App (Literal (Id "as_bool")) [x];

   sym_add  = make_sym "op_add";
   sym_sub  = make_sym "op_sub";
   sym_mult = make_sym "op_mult";
   sym_div  = make_sym "op_div";
   
   sym_op_add x y    = App sym_add  [x,y];
   sym_op_sub x y    = App sym_sub  [x,y];
   sym_op_mult x y   = App sym_mult [x,y];
   sym_op_div x y    = App sym_div  [x,y];

   // Keywords

   data Keyword = Keyword String;
   data KeyExpr = KeyExpr Keyword [Expr];
   // Dummy is there to work around an MPL issue
   data KeyHold = Dummy | KEY_HOLD_1 | KEY_HOLD_ALL;

   make_sym_apply_key :: Expr -> [KeyExpr] -> Expr;
   make_sym_apply_key x [] = x;
   make_sym_apply_key x ((KeyExpr k args):rk) =
       make_sym_apply_key (appk k args x) rk
   where {
          appk k args s = App (mkey k) nargs
          where {
            nargs = case (hlookup key_hold_map kname) of {
                     Nothing           -> (s:args);
                     Just KEY_HOLD_1   -> ((hold s):args);
                     Just KEY_HOLD_ALL -> map hold (s:args);
                    };
            Keyword kname = k;
          };

          mkey (Keyword ks) = Literal (Id (strcat "keyword_" ks));

          key_hold_map = make_hash_map
                         [
                          // ("assume",KEY_HOLD_1),
                          // ("complex",KEY_HOLD_1),
                          // ("float",KEY_HOLD_1)
                         ];

   };

   // Support for explicit calculation

   type Mask = Maybe (Hashtable String Bool);

   make_mask :: [String] -> Mask;
   make_mask [] = Nothing;
   make_mask l  = Just (make_hash_map (map (\s -> (s,True)) l));

   // If "mc_ALL" is present in the mask, the meaning of
   // the mask is reversed (i.e., explicit calculation works
   // as originally specified).  This fixes bug 050722-140509.
   is_masked :: Mask -> String -> Bool;
   is_masked m s
       | is_masked_ m "mc_ALL" = (not (is_masked_ m s))
       | else                  = is_masked_ m s
   where {
          is_masked_ :: Mask -> String -> Bool;
          is_masked_ Nothing  _ = False;
          is_masked_ (Just h) s = case (hlookup h s) of {
                                   Nothing -> False;
                                   Just t  -> t;
                                  };
         };

   // Dummy function to help translation of 'Jacob', 'nabla'
   max_subscript :: a->b->c @ 46;


// **********************************************************************
// Symbolics functions never called directly in translator-generated code
// **********************************************************************

   symbolic_to_bool :: Expr -> Bool;
   symbolic_to_bool (Literal T_TRUE)      = True;
   symbolic_to_bool (Literal T_FALSE)     = False;
   symbolic_to_bool (Literal T_UNKNOWN)   = error "must be scalar";
   symbolic_to_bool (Literal (ITok n))    = not (n==0);
   symbolic_to_bool (Literal (BigITok s)) = to_bool s;
   symbolic_to_bool (Literal (Float s))   = to_bool s;
   symbolic_to_bool (SRaw s)              = symbolic_to_bool (parseString s);
   symbolic_to_bool x                     = (symbolic_to_bool
                                              (symeval (App _bool [x])))
   where {
     _bool = (Literal (Id "toBool"));
   };

   to_bool :: String -> Bool @ "[efisymbolics?]Efi.Symbolics::to_bool";

   // Convenient alias
   sym = to_symbolic;

   // Create a "raw" string.  This allows us to make parsing of
   // the string lazy.
   make_raw :: String -> Expr;
   make_raw s = SRaw s;

   // Where possible, we avoid creating a string representation of
   // a matrix.  (The string representation of a large symbolic matrix
   // could be enormous.)  Rather, we evaluate each element separately.
   svectorize :: (Expr->Expr) -> Expr -> Expr;
   svectorize f (SMat m) = SMat (smap_1 (svectorize f) m);
   svectorize f x        = f x;

// The definition of smap_1 moved to efisymbolicsparser.mpl
// because I needed it in both files and this one imports that one.
//  -kmp 13-Apr-2006

   // convert a symbolic value to a numeric one
   maybe_to_numeric :: Expr -> Maybe (V{});
   maybe_to_numeric (SRaw s)              = maybe_to_numeric (parseString s);
   maybe_to_numeric (SNPair _ v)          = Just v;
   maybe_to_numeric (Literal T_TRUE)      = Just (iv' 1$);
   maybe_to_numeric (Literal T_FALSE)     = Just (iv' 0$);
   maybe_to_numeric (Literal (ITok n))    = Just (iv n);
   maybe_to_numeric (Literal (BigITok s)) = Just (rv' (parse_number s)) where {parse_number:: String->F8{}@ "[eficore?]Efi.Core::parse_number";};
   maybe_to_numeric (Literal (Float s))   = Just (rv' (parse_number s)) where {parse_number:: String->F8{}@ "[eficore?]Efi.Core::parse_number";};
   maybe_to_numeric (Literal TImagUnit)   = Just (_mk 0.0$ 1.0$)        where {_mk :: F8{} -> F8{} -> V{} @ "[mplrun]Mcd.NumVal::.ctor(System.Double,System.Double)";};
   maybe_to_numeric (App (Literal T_RANGE2) [fv,lv]) = Just (mkRange2 nfv nlv)
   where {
          nfv = (to_numeric_e fv);
          nlv = (to_numeric_e lv);
         };
   maybe_to_numeric (App (Literal T_RANGE3) [fv,nv,lv]) =
       Just (mkRange3 nfv nnv nlv)
   where {
          nfv = (to_numeric_e fv);
          nnv = (to_numeric_e nv);
          nlv = (to_numeric_e lv);
         };
   maybe_to_numeric (App (Literal T_UMINUS) [x]) = Just (op_negate x')
   where {
          Just x' = maybe_to_numeric x;
          op_negate :: V{a}->V{a} @ 69; // from EfiCore.mpl
         };
   maybe_to_numeric _ = Nothing;


   // Like maybe_to_numeric, but attempts a symbolic evaluation
   // if necessary.
   maybe_to_numeric_with_eval :: Expr -> Maybe (V{});
   maybe_to_numeric_with_eval x =
                 case (maybe_to_numeric x) of {
                  Nothing -> case (maybe_to_numeric (symeval x)) of {
                              Nothing -> Nothing;
                              Just v  -> Just v;
                             };
                  Just v  -> Just v;
                 };

   to_numeric_e :: Expr -> V{};
   to_numeric_e x = case (maybe_to_numeric_with_eval x) of {
                     Nothing -> error "must be scalar";
                                      // Useful for debugging:
                                      //(strcat "must be scalar: "
                                      //        (to_string x));
                     Just v -> v;
                    };

   _sym_ensure_size :: (Matrix Expr) -> I4 -> I4 -> Expr -> (Matrix Expr) @ "[efisymbolics?]Efi.Symbolics::_sym_ensure_size";
   _sym_realloc :: (Matrix Expr) -> I4 -> I4 -> Expr -> (Matrix Expr) @ "[efisymbolics?]Efi.Symbolics::_sym_realloc";

   _dbg :: a->a @ "[efisymbolics?]Efi.Symbolics::_dbg";

   sym_export :: Expr -> Expr;
   sym_export (SMat m) = SMat (export m)
   where {
     export :: a -> a @ "[mplrun]Mcd.MatVal::FixForExport(System.Object)";
   };
   sym_export (SRaw s) = sym_export (parseString s);
   sym_export x        = x;

   make_imag x = App (Literal T_MULT) [x,Literal TImagUnit];

   make_sym_cast :: V{} -> String -> Expr;
   make_sym_cast expr sig = parseString (unitMonomial (to_symbolic_string expr) sig) where {
      to_symbolic_string :: V{}->String @ "[efisymbolics?]Efi.Symbolics::to_symbolic_string";
      unitMonomial :: String -> String -> String @ "[efisymbolics?]Efi.Symbolics::unitMonomial";
   };

   mupad_eval :: Expr -> Expr;
   mupad_eval = make_raw._mupad_eval.emitToString.(emitExpression MuPad);
   _mupad_eval :: String->String@"[efisymbolics?]Efi.Symbolics::mc_mupad_eval";

   // Symbolic evaluation which never results in SRaw
   psymeval :: Expr -> Expr;
   psymeval x = parseRaw (symeval x);
   // This results in "dependency cycle" errors...
   //psymeval = parseRaw.symeval;


   // Helper for symeval.  Handles matrix operations and vectorization.
   pse :: Expr -> Expr;
   pse (SVec (NLam f _) args) = sym_vec f        (map psymeval args);
   pse (SVec fn         args) = sym_vec (App fn) (map psymeval args);


   pse s@(App (Literal T_SUB1) [(SMat m),i,org]) =
       case (get_subs org' [i']) of
       {
        (Just [ni]) -> (get_1 m ni);
        _           -> s;
       }
   where { [i',org'] = map psymeval [i,org]; };

   pse s@(App (Literal T_SUB2) [(SMat m),i,j,org]) =
       case (get_subs org' [i',j']) of
       {
        (Just [ni,nj]) -> (get_2 m ni nj);
        _              -> s;
       }
   where { [i',j',org'] = map psymeval [i,j,org]; };

   pse s@(App (Literal T_MATCOL) [(SMat m),i,org]) =
       case (get_subs org' [i']) of
       {
        (Just [ni]) -> SMat (getm_col m (as_i4 ni));
        _           -> s;
       }
   where { [i',org'] = map psymeval [i,org]; };

   pse (App (Literal T_ROWS) [(SMat m)]) = (Literal (ITok
                                                     (rows (as_matrix m))));

   pse (App (Literal T_COLS) [(SMat m)]) = (Literal (ITok
                                                     (cols (as_matrix m))));


   get_subs :: Expr -> [Expr] -> Maybe ([V{}]);
   get_subs org s = case (maybe_to_numeric org) of
                    {
                     (Just norg) -> get_subs1 norg s;
                     _           -> Nothing;
                    };

   get_subs1 :: V{} -> [Expr] -> Maybe ([V{}]);
   get_subs1 norg (x:r) = case ((maybe_to_numeric x),get_subs1 norg r) of
                          {
                           ((Just nx),(Just nr)) -> Just ((op_sub nx norg):nr);
                           _                     -> Nothing;
                          } where
                          {
                              op_sub :: V{a}->V{a}->V{a} @ 66;// from EfiCore.mpl
                          };
   get_subs1 _    _     = Just [];


   pse x
       | maps x = mapExpr pse x
       | else   = x;


   sym_vec :: ([Expr]->Expr) -> [Expr] -> Expr;
   sym_vec f mats = case (vsize mats (1,1)) of
                    {
                     (1,1) -> f (velem mats 0$ 0$);
                     (r,c) -> (SMat (mm (fillmat r c
                                         (\i j -> (f (velem mats i j))))));
                    };

   vsize :: [Expr] -> (Int,Int) -> (Int,Int);
   vsize (x:rest) (1,1) = vsize rest (vsize1 x);
   vsize (x:rest) (r,c) = case (vsize1 x) of
   {
    (1,1) -> vsize rest (r,c);
    (r',c') -> if (r==r') && (c==c')
               then vsize rest (r,c)
               else error "unequal vector dimensions";
   };
   vsize _ (r,c) = (r,c);

   vsize1 :: Expr -> (Int,Int); // Caution: (I4,I4) causes crashes
   vsize1 (SMat m) = (rows (as_matrix m), cols (as_matrix m));
   vsize1 _        = (1,1);

   velem :: [Expr]->I4->I4->[Expr];
   velem ((SMat m):rest) i j = let { e = (get_2' (as_matrix m) i j); } in
                               (e:(velem rest i j));
   velem (x:rest) i j        = (x:(velem rest i j));
   velem _ _ _               = [];

   fillmat :: Int -> Int -> (I4 -> I4 -> b) -> MatVal b;
   fillmat (I r) (I c) f = seq (doelem 0$ 0$) m'
   where {
          new_matrix :: I4->I4->(MatVal b) @ "[efisymbolics?]Efi.Symbolics::_sym_new_matrix";
          m' = new_matrix r c;

          doelem i j
              | (ib (ceq_i4 i r)) = ()
              | (ib (ceq_i4 j c)) = doelem (add_i4 i 1$) 0$
              | else = seq (upd_2' m' i j (f i j))
                       (doelem i (add_i4 j 1$));

   };

   parseRaw :: Expr -> Expr;
   parseRaw (SRaw s) = parseString s;
   parseRaw x        = x;
}
