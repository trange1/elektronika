//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*
//*  Version : $Header: /MathcadClient/releases/Mathcad_14.0.1/eng/mctranslator/mpl/mcdtranslator.mpl   170   2007-04-05 13:48:08-04:00   ltravis $
//*
//*
//*  Purpose : Runtime support for code emitted by mctranslator.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//*
//****************************************************************************

module McdTranslator where 
{
// Module Imports

   import McdRun as McdTranslator;                       // Basic definitions
   import McdEfi;                                        // Installed EFI's

// Data Types

   data Io a = Io a;                                     // Io type for monadic translations
   compute :: a -> Io a @ 46;                            // turn value a into computation a
   reset_fpu :: Bool -> Bool @ "[mccore12?]Engine.MplEval::ResetFpu";
   unify x y = if True then x else y;                    // return first argument requiring second to have same type

   magnitude :: Value{a} -> Value{} @ 46;

// Mathcad Operators

   op_mixednum i n d
      | lt_b i zero_ = op_sub i (op_div n d)
      | else         = op_add i (op_div n d);

   // inline 1 op_range2, op_range3;
   op_range2         = mkRange2;
   op_range3         = mkRange3;


// Matrix initialization
   infixl 2 <|;     
   suffix 1 <|>;     
   op_matrix   :: I4->I4->MatVal a                      @"[mplrun]Mcd.MatVal::reserve(System.Int32,System.Int32)";
   (<|)        :: MatVal a->a->MatVal a                 @"instance[mplrun]Mcd.MatVal::PushRaw(System.Object)";
   (<|>)       :: MatVal a -> Matrix a                  @"instance[mplrun]Mcd.MatVal::SetShape()";

   //op_matrix r 1$ es = mm (fix' (init_vector' r es));
   //op_matrix r c es  = mm (fix' (init_array' r c es));

   // inline 1 op_matcol;
   op_matcol         = getcol;
   op_parens         :: a -> a @ 29;

// Integral range constructor referenced by the translations for the range sum
// and range product operators. See 'compute.txt'. Notice the argument numbers
// index those of the range sum/product operators, not of this function.

   op_range2_i :: Value{} -> Value{} -> Rng{};
   op_range2_i fv lv = range2 f l where
   {
      f = conv_f8(as_i4_a 2$ fv);                        // ...cast to real
      l = conv_f8(as_i4_a 3$ lv);                        // ...cast to real
   };

// In case one of these slips through...

   default_          = mm (fix' (vec' 0$));

// A polymorphic value the translator uses to initialize Mathcad local variables.

   no_value_         :: a @ "[mplrun]Mcd.NumVal::NoValue";
   uninitialized_    = zero_;
   zero_             :: a @ "[mplrun]Mcd.NumVal::Zero"; // zero must be dimensionally polymorphic
   one_              =  iv' 1$;
   inc i n           =  as_i4 i `add_i4` n;

// Erase dimension information (make polymorphic)
// Very unpleasant hack performed on values falling into While loops
   as_generic_val    :: a -> b @ 46;

   realloc           :: Matrix a  -> I4 -> I4 -> MatVal a @ "[mplrun]Mcd.MatVal::realloc";

// Note: fix' calls in the initializers below will ensure
// that the matrix gets copied.

   init_matrix_1 m i val      = set_1 (default_1 (null_or_matrix m) i) i val
    where {
      default_1 (Really m) i  = mm (fix' m);
      default_1 _          i  = mm (vec' (inc i 1$));
   };

   init_matrix_2 m i j val    = set_2 (default_2 (null_or_matrix m) i j) i j val
    where {
     default_2 (Really m) i j = mm (fix' m);
     default_2 _          i j = mm (mat' (inc i 1$) (inc j 1$));
    };

   set_matcol :: Matrix a -> I4 -> Matrix a -> Matrix a  @"[mplrun]Mcd.MatVal::mcd_setcolumn";

   upd_matcol :: MatVal a -> I4 -> Matrix a -> MatVal a  @"instance[mplrun]Mcd.MatVal::setcolumn(System.Int32,System.Object)";

   // If the argument is a matrix, mark it as immutable.
   // This prevents side-effecting operations in other regions
   // from inadvertently mutating this matrix.
   export  :: a -> a @ "[mplrun]Mcd.MatVal::FixForExport(System.Object)";
   // For use by the front end.  ('export' is a keyword in ARL,
   // so the front end can't use it as a function name when
   // generating code for translation.)
   export_ :: a -> a @ "[mplrun]Mcd.MatVal::FixForExport(System.Object)";

   fix m          =  case null_or_matrix m of
   {
      Really m    -> mm (fix' m);
       _          -> m;
   };

   and_           :: Bool->Bool->Bool @ 1;
   or_            :: Bool->Bool->Bool @ 0;

   // helper for PDE blocks
   sort_list :: (a->a->Bool)->[a]->[a];
   sort_list c (x:xs) = l ++ g
   where
   {
      l = sort_list c (filter (\y -> (c y x)) xs);
      g = x : sort_list c (filter (\y -> (not (c y x))) xs);
   };
   sort_list c [] = [];

   sort_by_indices :: (a->a->Bool)->[a]->[b]->[b];
   sort_by_indices c indices items = sitems
   where 
   {
      pairs  = zip indices items;
      spairs = sort_list (\(i,x) (i',x') -> c i i') pairs;
      sitems = map snd spairs;
   };

   list2vec    :: [Value{}] -> Value{};
   list2vec s  =  init_vector n s         where {I n = length s};

// Return the element of a list: similar to (!!) defined in the MplPrelude.

   nth            :: I4 -> [a] -> a;
   nth 0$ (x:_)   =  x;
   nth n  (_:xs)  =  nth (sub_i4 n 1$) xs;

// Return the primitive integer 'i' that sits inside the given boxed integer.

   unbox          :: Int -> I4;
   unbox (I i)    =  i;

// Helpers for ODE blocks

   tfst :: (a,b,c) -> a;
   tfst (x,y,z) = x;

   tsnd :: (a,b,c) -> b;
   tsnd (x,y,z) = y;

   ttrd :: (a,b,c) -> c;
   ttrd (x,y,z) = z;

   remove_duplicates :: [V{}] -> [V{}];
   remove_duplicates [] = [];
   remove_duplicates (x:xs) = x : remove_helper x xs
     where {
       remove_helper x []     = [];
       remove_helper x (y:xs) =
          (if (as_bool (op_eq x y)) then (remove_helper x xs)
                                else (y : remove_helper y xs));
     };

   cons :: a -> [a] -> [a];
   cons x l = x : l;

// Debugging Utilities

   dbg :: a -> a @"[engutils-mgd?]MplUtils::Dbg";

//****************************************************************************
//* RESULT
//*
//* Box the result of a Mathcad evaluation with an automation object that also
//* carries a simplified representation of the value's units.
//*
//*   'value'     The result of the evaluation, which will be either a string,
//*               function, number or matrix.
//*
//*   'signature' The type signature of 'v' returned by the primitive 'typeof'
//*               operator. It is this string that is fed as input to the unit
//*               system for simplification.
//*
//****************************************************************************

   assert_valid :: a -> a @ "[mplrun]Mcd.NumVal::NotNoValue(System.Object)";
   result :: a->Signature->Object;
	result v s = to_auto (assert_valid v) s where 
	{
		to_auto :: a->Signature->Object @ "[automationmgd]Mathcad.Automation.ValueFactory::ToAutomation(System.Object,System.String)";
	};

	// Extract an engine value from an automation wrapper.
   core :: Object->V{}   @"[automationmgd]Mathcad.Automation.ValueFactory::FromAutomation(System.Object)";

//****************************************************************************
//* UNITS support
//*
//* Functions for scaling values from and to their SI representation

	scale_to_SI   :: a->Signature->b @"[mplrun]Mcd.Utilities::ScaleToSI";
	scale_from_SI :: a->Signature->b @"[mplrun]Mcd.Utilities::ScaleFromSI";

//****************************************************************************
//* 2D PLOT DIMENSION CHECKING AND SCALING support
//* 
//* To correctly scale 2D plots (i.e. to display values in terms of the current
//* unit system, e.g. ft = 1, not 0.31) we have to correctly infer the types of 
//* the domain and range of each of the X and Y expressions.  To do this we 
//* cook up a dummy function check_trace_N which has a twofold purpose.  It enforces
//* consistency between the dimensions of the domains of the X and Y lambdas (e.g. 
//* x+sec @ x+ft should fail) and range dimensions (e.g. i+1@i when i is in feet 
//* should fail even though i and i+1 are dimensionally consistent).  The second
//* purpose of check_trace_N is to return a tuple of the dimension products of the
//* X and Y lambda ranges.  When we use typeof on this tuple we can pass the resulting
//* signature to scale_factors which returns the scaling factor for each range.
//*
//* - quick_range is a way to represent quick plot variables in a way which is 
//* consistent with the check_trace_N function and which reflects the fact that a 
//* quick plot variable can be any dimension
	
	quick_range :: Rng{a} @46;

	data KindTuple {b}{c}; 
	check_trace_0 :: () -> (()->V{b}) -> (()->V{c}) -> KindTuple{b}{c} @46;
	check_trace_1 :: (Rng{a1}) -> (V{a1}->V{b}) -> (V{a1}->V{c}) -> KindTuple{b}{c} @46;
	check_trace_2 :: (Rng{a1},Rng{a2}) -> (V{a1}->V{a2}->V{b}) -> (V{a1}->V{a2}->V{c}) -> KindTuple{b}{c} @46;
	check_trace_3 :: (Rng{a1},Rng{a2},Rng{a3}) -> (V{a1}->V{a2}->V{a3}->V{b}) -> (V{a1}->V{a2}->V{a3}->V{c}) -> KindTuple{b}{c} @46;
	check_trace_4 :: (Rng{a1},Rng{a2},Rng{a3},Rng{a4}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{b}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{c}) -> KindTuple{b}{c} @46;
	check_trace_5 :: (Rng{a1},Rng{a2},Rng{a3},Rng{a4},Rng{a5}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{a5}->V{b}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{a5}->V{c}) -> KindTuple{b}{c} @46;
	check_trace_6 :: (Rng{a1},Rng{a2},Rng{a3},Rng{a4},Rng{a5},Rng{a6}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{a5}->V{a6}->V{b}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{a5}->V{a6}->V{c}) -> KindTuple{b}{c} @46;
	check_trace_7 :: (Rng{a1},Rng{a2},Rng{a3},Rng{a4},Rng{a5},Rng{a6},Rng{a7}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{a5}->V{a6}->V{a7}->V{b}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{a5}->V{a6}->V{a7}->V{c}) -> KindTuple{b}{c} @46;

	check_limits :: [V{a}] -> a @46;

	scale_factor  :: Signature -> F8{} @"[efiplot?]Efi.Plot::scale_factor";
	scale_factors :: String->Vector (F8{}) @"[efiplot?]Efi.Plot::scale_factors";

	trace2D_0 :: () -> (()->V{b}) -> (()->V{c}) -> KindTuple{b}{c} @46;
	trace2D_1 :: (Rng{a1}) -> (V{a1}->V{b}) -> (V{a1}->V{c}) -> KindTuple{b}{c} @46;
	trace2D_2 :: (Rng{a1},Rng{a2}) -> (V{a1}->V{a2}->V{b}) -> (V{a1}->V{a2}->V{c}) -> KindTuple{b}{c} @46;
	trace2D_3 :: (Rng{a1},Rng{a2},Rng{a3}) -> (V{a1}->V{a2}->V{a3}->V{b}) -> (V{a1}->V{a2}->V{a3}->V{c}) -> KindTuple{b}{c} @46;
	trace2D_4 :: (Rng{a1},Rng{a2},Rng{a3},Rng{a4}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{b}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{c}) -> KindTuple{b}{c} @46;
	trace2D_5 :: (Rng{a1},Rng{a2},Rng{a3},Rng{a4},Rng{a5}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{a5}->V{b}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{a5}->V{c}) -> KindTuple{b}{c} @46;
	trace2D_6 :: (Rng{a1},Rng{a2},Rng{a3},Rng{a4},Rng{a5},Rng{a6}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{a5}->V{a6}->V{b}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{a5}->V{a6}->V{c}) -> KindTuple{b}{c} @46;
	trace2D_7 :: (Rng{a1},Rng{a2},Rng{a3},Rng{a4},Rng{a5},Rng{a6},Rng{a7}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{a5}->V{a6}->V{a7}->V{b}) -> (V{a1}->V{a2}->V{a3}->V{a4}->V{a5}->V{a6}->V{a7}->V{c}) -> KindTuple{b}{c} @46;

//****************************************************************************
//* Component Support

   // get an element of a CLR array
   getAt v i = f v i where
   {
      f::Vector a->I4->a@"instance[mscorlib]System.Array::GetValue(System.Int32)";
   };

	// callback mechanism - the first parameter is the callback identifier
	// the rest are callback specific
   notify component msg tree inputs = f component msg (vector (t:inputs)) where
   {
      t = as_object (I tree);
      f :: I4->I4->Vector a->Vector a @"[componentsmgd]Mathcad.Components.Exports::SendMessage";
   };

   mc_eval_component_ :: C->O->I4->[(Object,Signature)]->Vector Object;
   mc_eval_component_ cwd origin component inputs = really ret where
   {
      // Convert the Object,Signature inputs to a list of automation values
      // by mapping over them with the 'result' function.
      ainputs = map ivalue inputs where
      {
         ivalue (o,s) = result o s;
      };

      // Evaluate the component. The outputs are a CLR array of automation values
      ret = evalComponent cwd origin component (vector ainputs) where
      {
         evalComponent::C->O->I4->Vector Object->NullOr (Vector Object)@"[componentsmgd]Mathcad.Components.Exports::EvalComponent";
      };
   };

   mc_eval_component_dimless_ :: C->O->I4->[(Object,Signature)]->V{};
   mc_eval_component_dimless_ cwd origin component inputs = really ret where
   {
      // Convert the Object,Signature inputs to a list of automation values
      // by mapping over them with the 'result' function and scaling them to 
		// the current unit system
      ainputs = map ivalue inputs where
      {
         ivalue (o,s) = result (scale_from_SI o s) s;
      };

      // Evaluate the component. The outputs are a vector of automation values.
      aoutputs = evalComponent cwd origin component (vector ainputs) where
      {
         evalComponent::C->O->I4->Vector Object->NullOr (Vector Object)@"[componentsmgd]Mathcad.Components.Exports::EvalComponent";
      };

      // Convert ainputs to a list of engine values by mapping  over it with
      // the core function and scaling them to the SI unit system 
      eoutputs = case aoutputs of
      {
         Null     -> Null;
         Really a -> Really (map evalue (vfrom a)) where
			{
				signature :: a->Signature @"instance[automationmgd]Mathcad.Automation.Value::get_Signature()";
				evalue a = scale_to_SI (core a) (signature a);
			};
      };

      // If there is only one output then return it, otherwise return a MatVal
      // containing the outputs.
      ret = case eoutputs of
      {
         Null       -> Null;
         Really [v] -> Really v;
         Really a   -> Really (init_vector (unbox (length a)) a);
      };
   };

   mc_eval_3dplot_ :: C->O->I4->[(Object,Signature)]->V{};
   mc_eval_3dplot_ cwd origin component inputs = ret where
   {
      // Process the inputs to the 3D plot so functions are evaluated
      // einputs is a vector of engine values (NumVal, etc.)
      einputs = processInputs component (vector (map (\(o,s) -> (scale_from_SI o s)) inputs)) where
      {
         processInputs::I4->Vector Object->Vector Object@"[efigraphics?]Efi.Graphics::ProcessInputs";
      };

      // Add dummy signatures to the processed inputs to produce
      // a list suitable for passing to mc_eval_component_dimless_
      inputs_ = map (\o -> (o,"Value{}")) (vfrom einputs);

      // Delegate to mc_eval_component_dimless_
      ret = mc_eval_component_dimless_ cwd origin component inputs_;
   };

//****************************************************************************
//* CALLBACK support
//*
//* These functions allow EFIs to call back into Mathcad with some information 
//* without knowing about Mathcad.  They just call a function with certain
//* arguments.  The trick is that the translator curries one of the functions
//* below with information that comes in the RL including a COM interface pointer
//* to the equation region and a tree node pointer

   // helper callback for chained symbolic results
   symboliccb        :: I4->I4->Object->Object;
   symboliccb comp tree res = seq (notify comp 2$ tree [res]) res;

   // helper callback for op_integral
   integralcb        :: I4->I4->Object->Vector Object;
   integralcb comp tree opt = notify comp 3$ tree [opt];

   // helper callback for solver functions
   solvecb           :: I4->I4->I4->Vector Object;
   solvecb comp tree opt = notify comp 4$ tree [(as_object (I opt))];

   // helper callback for 2D plot functions
   plotcb            :: I4->I4->Object->Vector Object;
   plotcb comp tree opt = notify comp 5$ tree [opt];

   // helper callback for the debug trace function
	tracecb           :: I4->I4->String->Vector Object;
	tracecb comp tree str = notify comp 6$ tree [as_object str];

   // helper callback for the debug break function
	pausecb           :: I4->I4->String->Vector Object;
	pausecb comp tree str = notify comp 7$ tree [as_object str];

   // helper callback for chained symbolic results
   numericcb         :: I4->I4->Object->Object;
   numericcb comp tree res = seq (notify comp 8$ tree [res]) res;


//****************************************************************************

   // throw an MPL app exception with the given tag handle and parameter number
   error2 message handle parameter = throw (exception message parameter handle) where
   {
      exception :: V{}->I4->I4->Exception @"[mplrun]Mpl.Run.AppException::.ctor(System.String,System.UInt32,System.UInt32)";
   };

   error0 message = error2 message 0$ 0$;

   // functions which extract the first element of a Range
   range_first r = rv' (range_initial r);

   // Create Mathcad matrix from Mpl vector
   vec2mat           :: Vector a -> Matrix a                   @"[mplrun]Mcd.MatVal::.ctor(System.Object[])";

   // Mark the matrix 'm' so that it displays as a table.
   set_IsRange       :: MatVal a -> MatVal a;
   set_IsRange m     =  case (f m True) of
   {
      IoVoid Void -> m;
   }
   where
   {
      f::MatVal a->Bool->IoVoid @ "instance[mplrun]Mcd.MatVal::set_IsRange(System.Boolean)";
   };

   // Convert uniform tuples to Mathcad Matrix
   // TODO: Find a better way to do this
   tuple_to_matrix1  x = x;
   tuple_to_matrix2  x = vec2mat (tup2vec_2 x);
   tuple_to_matrix3  x = vec2mat (tup2vec_3 x);
   tuple_to_matrix4  x = vec2mat (tup2vec_4 x);
   tuple_to_matrix5  x = vec2mat (tup2vec_5 x);
   tuple_to_matrix6  x = vec2mat (tup2vec_6 x);
   tuple_to_matrix7  x = vec2mat (tup2vec_7 x);
   tuple_to_matrix8  x = vec2mat (tup2vec_8 x);
   tuple_to_matrix9  x = vec2mat (tup2vec_9 x);
   tuple_to_matrix10 x = vec2mat (tup2vec_10 x);
   tuple_to_matrix11 x = vec2mat (tup2vec_11 x);
   tuple_to_matrix12 x = vec2mat (tup2vec_12 x);
   tuple_to_matrix13 x = vec2mat (tup2vec_13 x);
   tuple_to_matrix14 x = vec2mat (tup2vec_14 x);
   tuple_to_matrix15 x = vec2mat (tup2vec_15 x);
   tuple_to_matrix16 x = vec2mat (tup2vec_16 x);
   tuple_to_matrix17 x = vec2mat (tup2vec_17 x);
   tuple_to_matrix18 x = vec2mat (tup2vec_18 x);
   tuple_to_matrix19 x = vec2mat (tup2vec_19 x);
   tuple_to_matrix20 x = vec2mat (tup2vec_20 x);
   tuple_to_matrix21 x = vec2mat (tup2vec_21 x);
   tuple_to_matrix22 x = vec2mat (tup2vec_22 x);
   tuple_to_matrix23 x = vec2mat (tup2vec_23 x);
   tuple_to_matrix24 x = vec2mat (tup2vec_24 x);
   tuple_to_matrix25 x = vec2mat (tup2vec_25 x);
   tuple_to_matrix26 x = vec2mat (tup2vec_26 x);
   tuple_to_matrix27 x = vec2mat (tup2vec_27 x);
   tuple_to_matrix28 x = vec2mat (tup2vec_28 x);
   tuple_to_matrix29 x = vec2mat (tup2vec_29 x);
   tuple_to_matrix30 x = vec2mat (tup2vec_30 x);

//****************************************************************************
//* The following special forms are all translated into applications of other
//* functions which take implicit argumnets. Adding signatures here allows the
//* implicit argument mechanism to recognize these dependencies; the functions
//* are never actually called.

   mc_odesolve:: T -> U -> a @46;
}
