module McdRun where
{
   import Mpl           as McdRun;                       // Primitive types
// Module Imports

// Module Imports


// Operator Fixities

   infixr 9 .;
   infixl 7 *, / ;
   infixl 7 *.,/.;
   infixl 6 +, - ;
   infixl 6 +.,-.;
   infix  4 ==, !=, <, <=, >=, > ;
   infix  4 ==.,!=.,<.,<=.,>=.,>.;

   id                   :: a -> a;
   id x                 =  x;

   const                :: a -> b -> a;
   const x _            =  x;

   fst                  :: (a,b) -> a;
   fst (x,y)            =  x;

   snd                  :: (a,b) -> b;
   snd (x,y)            =  y;

   swap                 :: (a,b) -> (b,a);
   swap (x,y)           =  (y,x);

   flip                 :: (a->b->c) -> (b->a->c);
   flip f x y           =  f y x;

   (.)                  :: (b->c) -> (a->b) -> a -> c;
   (.) f g x            =  f(g x);

   curry                :: ((a,b)->c) -> (a->b->c);
   curry f x y          =  f(x,y);

   uncurry              :: (a->b->c) -> ((a,b)->c);
   uncurry f(x,y)       =  f x y;

   as_type_of           :: a -> a -> a;
   as_type_of a _       =  a;

   until                :: (a->Bool) -> (a->a) -> a->a;
   until p f x          =  if p x then x else until p f (f x);

// data Bool =  True | False;

   not                  :: Bool -> Bool;
   not True             =  False;
   not False            =  True;

   xor                  :: Bool -> Bool -> Bool;
   xor False True       =  True;
   xor True  False      =  True;
   xor  _      _        =  False;

   data Maybe  a        =  Nothing | Just a;

   maybe                :: b -> (a->b) -> Maybe a -> b;
   maybe n f Nothing    =  n;
   maybe n f (Just x)   =  f x;

   data Either a b      =  Left a | Right b;

   either               :: (a->c) -> (b->c) -> Either a b -> c;
   either f g (Left  l) =  f l;
   either f g (Right r) =  g r;

// data Int             =  I I4;

   (*), (/), (+),(-),(%)         :: Int -> Int -> Int;
   (==),(!=),(<),(>),(<=),(>=)   :: Int -> Int -> Bool;

   I x *  I y           =  I(mul_i4 x y);
   I x /  I y           =  I(div_i4 x y);
   I x +  I y           =  I(add_i4 x y);
   I x -  I y           =  I(sub_i4 x y);
   I x %  I y           =  I(rem_i4 x y);
   I x == I y           =  case ceq_i4 x y of {0$->False;_->True;};
   I x != I y           =  case cne_i4 x y of {0$->False;_->True;};
   I x  > I y           =  case cgt_i4 x y of {0$->False;_->True;};
   I x  < I y           =  case clt_i4 x y of {0$->False;_->True;};
   I x >= I y           =  case cge_i4 x y of {0$->False;_->True;};
   I x <= I y           =  case cle_i4 x y of {0$->False;_->True;};

   neg,abs              :: Int -> Int;
   neg (I x)            =  I(neg_i4 x);
   abs x                =  if x < 0 then neg x else x;

   max,min              :: Int -> Int -> Int;
   max x y              =  if x > y then x else y;
   min x y              =  if x < y then x else y;

   even,odd             :: Int -> Bool;
   even n               =  n % 2 == 0;
   odd  n               =  n % 2 == 1;

   gcd                  :: Int -> Int -> Int;
   gcd 0 0              =  error "MplPrelude.gcd: gcd 0 0 is undefined";
   gcd x y              =  euclid (abs x) (abs y) where
   {
      euclid x 0        =  x;
      euclid x y        =  euclid y (x % y);
   };

   lcm                  :: Int -> Int -> Int;
   lcm _ 0              =  0;
   lcm 0 _              =  0;
   lcm x y              =  abs ((x / (gcd x y)) * y);

// data Real{a}         =  R(F8 a);

   (+.),(-.)            :: Real{a} -> Real{a} -> Real{a};
   (*.)                 :: Real{a} -> Real{b} -> Real{a b};
   (/.)                 :: Real{a} -> Real{b} -> Real{a b-1};
   (==.),(!=.)          :: Real{a} -> Real{a} -> Bool;
   (<.),(>.),(<=.),(>=.):: Real{a} -> Real{a} -> Bool;

   R x *.  R y          =  R(mul_f8 x y);
   R x /.  R y          =  R(div_f8 x y);
   R x +.  R y          =  R(add_f8 x y);
   R x -.  R y          =  R(sub_f8 x y);
   R x ==. R y          =  case ceq_f8 x y of {0$->False;_->True;};
   R x !=. R y          =  case cne_f8 x y of {0$->False;_->True;};
   R x  >. R y          =  case cgt_f8 x y of {0$->False;_->True;};
   R x  <. R y          =  case clt_f8 x y of {0$->False;_->True;};
   R x >=. R y          =  case cge_f8 x y of {0$->False;_->True;};
   R x <=. R y          =  case cle_f8 x y of {0$->False;_->True;};

   max',min'            :: Real{a} -> Real{a} -> Real{a};
   max' x y             =  if x >. y then x else y;
   min' x y             =  if x <. y then x else y;

   neg',abs'            :: Real{a} -> Real{a};
   neg' (R x)           =  R(neg_f8 x);
   abs' x               =  if x <. 0.0 then neg' x else x;

   ir                   :: Int -> Real{};
   ir (I x)             =  R(conv_f8 x);

   ri                   :: Real{a} -> Int;
   ri (R x)             =  I(conv_i4 x);

// From System.Math:

   acos                 :: Real{} -> Real{};
   asin                 :: Real{} -> Real{};
   atan                 :: Real{} -> Real{};
   atan2                :: Real{} -> Real{} -> Real{};
   cos                  :: Real{} -> Real{};
   exp                  :: Real{} -> Real{};
   floor                :: Real{} -> Real{};
   log                  :: Real{} -> Real{};
   logb                 :: Real{} -> Real{} -> Real{};
   log10                :: Real{} -> Real{};
   pow                  :: Real{} -> Real{} -> Real{};
   round                :: Real{} -> Real{};
   sign                 :: Real{} -> Int;
   sin                  :: Real{} -> Real{};
   sinh                 :: Real{} -> Real{};
   sqrt                 :: Real{a 2}->Real{a};
   tan                  :: Real{} -> Real{};
   tanh                 :: Real{} -> Real{};

   acos (R r)           =  R(f r)   where {f::F8{}->F8{}       @"[mscorlib]System.Math::Acos(System.Double)"};
   asin (R r)           =  R(f r)   where {f::F8{}->F8{}       @"[mscorlib]System.Math::Asin(System.Double)"};
   atan (R r)           =  R(f r)   where {f::F8{}->F8{}       @"[mscorlib]System.Math::Atan(System.Double)"};
   atan2(R r)(R s)      =  R(f r s) where {f::F8{}->F8{}->F8{} @"[mscorlib]System.Math::Atan2(System.Double,System.Double)"};
   cos  (R r)           =  R(f r)   where {f::F8{}->F8{}       @"[mscorlib]System.Math::Cos(System.Double)"};
   exp  (R r)           =  R(f r)   where {f::F8{}->F8{}       @"[mscorlib]System.Math::Exp(System.Double)"};
   floor(R r)           =  R(f r)   where {f::F8{}->F8{}       @"[mscorlib]System.Math::Floor(System.Double)"};
   log  (R r)           =  R(f r)   where {f::F8{}->F8{}       @"[mscorlib]System.Math::Log(System.Double)"};
   logb (R r)(R s)      =  R(f r s) where {f::F8{}->F8{}->F8{} @"[mscorlib]System.Math::Log(System.Double,System.Double)"};
   log10(R r)           =  R(f r)   where {f::F8{}->F8{}       @"[mscorlib]System.Math::Log10(System.Double)"};
   pow  (R r)(R s)      =  R(f r s) where {f::F8{}->F8{}->F8{} @"[mscorlib]System.Math::Pow(System.Double,System.Double)"};
   round(R r)           =  R(f r)   where {f::F8{}->F8{}       @"[mscorlib]System.Math::Round(System.Double)"};
   sign (R r)           =  I(f r)   where {f::F8{}->I4         @"[mscorlib]System.Math::Sign(System.Double)"};
   sin  (R r)           =  R(f r)   where {f::F8{}->F8{}       @"[mscorlib]System.Math::Sin(System.Double)"};
   sinh (R r)           =  R(f r)   where {f::F8{}->F8{}       @"[mscorlib]System.Math::Sinh(System.Double)"};
   sqrt (R r)           =  R(f r)   where {f::F8{a 2}->F8{a}   @"[mscorlib]System.Math::Sqrt(System.Double)"};
   tan  (R r)           =  R(f r)   where {f::F8{}->F8{}       @"[mscorlib]System.Math::Tan(System.Double)"};
   tanh (R r)           =  R(f r)   where {f::F8{}->F8{}       @"[mscorlib]System.Math::Tanh(System.Double)"};
// Module Imports


// Operator Fixities

   infixl 9 !!;
   infixr 5 ++;
   infix  4 `elem`,`not_elem`;

   (++)                 :: [a] -> [a] -> [a];
   (++) []     ys       =  ys;
   (++) (x:xs) ys       =  x : (xs++ys);

   map                  :: (a->b) -> [a] -> [b];
   map f []             =  [];
   map f (x:xs)         =  f x : map f xs;

   filter               :: (a->Bool) -> [a] -> [a];
   filter p []          =  [];
   filter p (x:xs)
      | p x             =  x : filter p xs
      | else            =      filter p xs;

   concat               :: [[a]] -> [a];
   concat xss           =  foldr (++) [] xss;

   concat_map           :: (a->[b]) -> [a] -> [b];
   concat_map f         =  concat . map f;

// head and tail extract the first element and remaining elements,
// respectively, of a list, which must be non-empty.  last and init
// are the dual functions working from the end of a finite list,
// rather than the beginning.

   head                 :: [a] -> a;
   head []              =  error "MplPrelude.head: empty list";
   head (x:_)           =  x;

   tail                 :: [a] -> [a];
   tail []              =  error "MplPrelude.tail: empty list";
   tail (_:xs)          =  xs;

   last                 :: [a] -> a;
   last []              =  error "MplPrelude.last: empty list";
   last [x]             =  x;
   last (_:xs)          =  last xs;

   init                 :: [a] -> [a];
   init []              =  error "MplPrelude.init: empty list";
   init [x]             =  [];
   init (x:xs)          =  x : init xs;

   null                 :: [a] -> Bool;
   null []              =  True;
   null _               =  False;

// length returns the length of a finite list as an Int.

   length               :: [a] -> Int;
   length xs            =  I (length' xs 0$) where
   {
      length' []     n  =  n;
      length' (x:xs) n  =  length' xs (n `add_i4` 1$);
   };

// List index (subscript) operator, 0-origin

   (!!)                 :: [a] -> Int -> a;
   xs     !! n | n<0    =  error "MplPrelude.!!: negative index";
   []     !! _          =  error "MplPrelude.!!: index too large";
   (x:_ ) !! 0          =  x;
   (_:xs) !! n          =  xs !! (n-1);

// foldl, applied to a binary operator, a starting value (typically the
// left-identity of the operator), and a list, reduces the list using
// the binary operator, from left to right:
//  foldl f z [x1, x2, ..., xn] == (...((z `f` x1) `f` x2) `f`...) `f` xn
// foldl1 is a variant that has no starting value argument, and  thus must
// be applied to non-empty lists.  scanl is similar to foldl, but returns
// a list of successive reduced values from the left:
//      scanl f z [x1, x2, ...] == [z, z `f` x1, (z `f` x1) `f` x2, ...]
// Note that  last (scanl f z xs) == foldl f z xs.
// scanl1 is similar, again without the starting element:
//      scanl1 f [x1, x2, ...] == [x1, x1 `f` x2, ...]

   foldl                :: (a -> b -> a) -> a -> [b] -> a;
   foldl f z []         =  z;
   foldl f z (x:xs)     =  foldl f (f z x) xs;

   foldl1               :: (a -> a -> a) -> [a] -> a;
   foldl1 _ []          =  error "MplPrelude.foldl1: empty list";
   foldl1 f (x:xs)      =  foldl f x xs;

   scanl                :: (a->b->a) -> a -> [b] -> [a];
   scanl f q []         =  [q];
   scanl f q (x:xs)     =  q : scanl f (f q x) xs;

   scanl1               :: (a->a->a) -> [a] -> [a];
   scanl1 _ []          =  [];
   scanl1 f (x:xs)      =  scanl f x xs;

// foldr, foldr1, scanr, and scanr1 are the right-to-left duals of the
// above functions.

   foldr                :: (a->b->b) -> b -> [a] -> b;
   foldr f z []         =  z;
   foldr f z (x:xs)     =  f x (foldr f z xs);

   foldr1               :: (a -> a -> a) -> [a] -> a;
   foldr1 _ []          =  error "MplPrelude.foldr1: empty list";
   foldr1 f [x]         =  x;
   foldr1 f (x:xs)      =  f x (foldr1 f xs);

   scanr                :: (a->b->b) -> b -> [a] -> [b];
   scanr f q0 []        =  [q0];
   scanr f q0 (x:xs)    =  f x q : qs where 
   {
      qs@(q:_)          = scanr f q0 xs;
   };

   scanr1               :: (a->a->a) -> [a] -> [a];
   scanr1 f []          =  [];
   scanr1 f [x]         =  [x];
   scanr1 f (x:xs)      =  f x q : qs where
   {
      qs@(q:_)          =  scanr1 f xs;
   };

// replicate n x is a list of length n with x the value of every element

   replicate            :: Int -> a -> [a];
   replicate 0 x        =  [];
   replicate n x | n > 0=  x : replicate (n-1) x;

// take n, applied to a list xs, returns the prefix of xs of length n,
// or xs itself if n > length xs.  drop n xs returns the suffix of xs
// after the first n elements, or [] if n > length xs.  splitAt n xs
// is equivalent to (take n xs, drop n xs).

   take                 :: Int -> [a] -> [a];
   take n _      |n<=0  =  [];
   take _ []            =  [];
   take n (x:xs)        =  x : take (n-1) xs;

   drop                 :: Int -> [a] -> [a];
   drop n xs     |n<=0  =  xs;
   drop _ []            =  [];
   drop n (_:xs)        =  drop (n-1) xs;

   split_at             :: Int -> [a] -> ([a],[a]);
   split_at n xs        =  (take n xs, drop n xs);

// take_while, applied to a predicate p and a list xs, returns the longest
// prefix (possibly empty) of xs of elements that satisfy p.  dropWhile p xs
// returns the remaining suffix.  span p xs is equivalent to 
// (takeWhile p xs, dropWhile p xs), while break p uses the negation of p.

   take_while           :: (a -> Bool) -> [a] -> [a];
   take_while p []      =  [];
   take_while p (x:xs)
               | p x    =  x : take_while p xs
               | else   =  [];

   drop_while           :: (a -> Bool) -> [a] -> [a];
   drop_while p []      =  [];
   drop_while p xs@(x:xs')
               | p x    =  drop_while p xs'
               | else   =  xs;

   span                 :: (a->Bool) -> [a] -> ([a],[a]);
   span p []            = ([],[]);
   span p xs@(x:xs') 
               | p x    =  (x:ys,zs) 
               | else   =  ([],xs) where 
   {
      (ys,zs) = span p xs'
   };

   break                :: (a->Bool) -> [a] -> ([a],[a]);
   break p              =  span (not . p);

// reverse xs returns the elements of xs in reverse order.  xs must be finite.

   reverse              :: [a] -> [a];
   reverse              =  foldl (flip (:)) [];

// and returns the conjunction of a Boolean list.  For the result to be
// True, the list must be finite; False, however, results from a False
// value at a finite index of a finite or infinite list.  or is the
// disjunctive dual of and.

   and,or               :: [Bool] -> Bool;
   and                  =  foldr (&&) True;
   or                   =  foldr (||) False;

// Applied to a predicate and a list, any determines if any element
// of the list satisfies the predicate.  Similarly, for all.

   any,all              :: (a -> Bool) -> [a] -> Bool;
   any p                =  or  . map p;
   all p                =  and . map p;

// elem is the list membership predicate, usually written in infix form,
// e.g., x `elem` xs.  notElem is the negation.

   elem,not_elem        :: Int -> [Int] -> Bool;
   elem x               =  any (_ == x);
   not_elem x           =  all (_ != x);

// lookup key assocs looks up a key in an association list.

   lookup               :: Int -> [(Int,b)] -> Maybe b;
   lookup key []        =  Nothing;
   lookup key ((x,y):xys)
      | key == x        =  Just y
      | else            =  lookup key xys;

// sum and product compute the sum or product of a finite list of numbers.

   sum,product          :: [Int] -> Int;
   sum                  =  foldl (+) 0;
   product              =  foldl (*) 1;

// maximum and minimum return the maximum or minimum value from a list,
// which must be non-empty, finite, and of an ordered type.

   maximum,minimum      :: [Int] -> Int;
   maximum []           =  error "MplPrelude.maximum: empty list";
   maximum xs           =  foldl1 max xs;

   minimum []           =  error "MplPrelude.minimum: empty list";
   minimum xs           =  foldl1 min xs;

// zip takes two lists and returns a list of corresponding pairs.  If one
// input list is short, excess elements of the longer list are discarded.
// zip3 takes three lists and returns a list of triples.  Zips for larger
// tuples are in the List library

   zip                  :: [a] -> [b] -> [(a,b)];
   zip                  =  zip_with (,);

   zip3                 :: [a] -> [b] -> [c] -> [(a,b,c)];
   zip3                 =  zip_with3 (,,);

// The zip_with family generalises the zip family by zipping with the
// function given as the first argument, instead of a tupling function.
// For example, zipWith (+) is applied to two lists to produce the list
// of corresponding sums.

   zip_with                :: (a->b->c) -> [a]->[b]->[c];
   zip_with z(a:as)(b:bs)  =  z a b : zip_with z as bs;
   zip_with _   _     _    =  [];

   zip_with3                        :: (a->b->c->d) -> [a]->[b]->[c]->[d];
   zip_with3 z (a:as) (b:bs) (c:cs) =  z a b c : zip_with3 z as bs cs;
   zip_with3 _   _      _      _    =  [];

// unzip transforms a list of pairs into a pair of lists.  

   unzip                :: [(a,b)] -> ([a],[b]);
   unzip                =  foldr (\(a,b) (as,bs) -> (a:as,b:bs)) ([],[]);

   unzip3               :: [(a,b,c)] -> ([a],[b],[c]);
   unzip3               =  foldr (\(a,b,c) (as,bs,cs) -> (a:as,b:bs,c:cs)) ([],[],[]);
// Module Imports

// Module Imports


// Throw the string 's' if the object reference 'a' is null, otherwise return
// 'a' retyped as the object that it really is. Implements a kind of 'checked
// cast' operator for the NullOr type.

   assert               :: String -> NullOr a -> a;
   assert s a
      | not_null a      =  really a                      // ...extract object
      | else            =  error s;                      // ...throw exception

// Return true if the argument is a valid, that is non-null, object reference.
// Can be safely called with any argument, although when the result is true it
// may print oout strangely.

   not_null             :: NullOr a -> Bool     @ 46;    // Coerce argument

// Return the argument, retyped as the object reference it really is. Can only
// be safely called once when the argument is known to be non-null.

   really               :: NullOr a -> a        @ 46;    // Coerce argument

// Return true if the argument is a null object reference.

   is_null              :: NullOr a -> Bool;
   is_null Null         =  True;
   is_null _            =  False;

// Return true if the argument is the primitive integer zero.

   is_zero_i4           :: I4 -> Bool;
   is_zero_i4 0$        =  True;
   is_zero_i4 _         =  False;

// Return true if the argument is the primtive floating point zero.

   is_zero_f8           :: F8{a} -> Bool;
   is_zero_f8 0.0$      =  True;
   is_zero_f8 _         =  False;

// Implements the logical negation operator for primitive booleans, which are
// represented as unboxed integers.

   not_i4               :: I4 -> I4;
   not_i4 0$            =  1$;
   not_i4 _             =  0$;


   infixr 1 |>;
   (|>) :: Void -> a -> a  @ 74; // seq_void

   infixr 1 =>;
   (=>) :: a -> b -> b     @ 75; // seq


// Uniform tuple abbreviations. Not very elegant.

   type UniTup2   a = (a,a);
   type UniTup3   a = (a,a,a);
   type UniTup4   a = (a,a,a,a);
   type UniTup5   a = (a,a,a,a,a);
   type UniTup6   a = (a,a,a,a,a,a);
   type UniTup7   a = (a,a,a,a,a,a,a);
   type UniTup8   a = (a,a,a,a,a,a,a,a);
   type UniTup9   a = (a,a,a,a,a,a,a,a,a);
   type UniTup10  a = (a,a,a,a,a,a,a,a,a,a);
   type UniTup11  a = (a,a,a,a,a,a,a,a,a,a,a);
   type UniTup12  a = (a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup13  a = (a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup14  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup15  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup16  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup17  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup18  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup19  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup20  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup21  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup22  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup23  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup24  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup25  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup26  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup27  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup28  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup29  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);
   type UniTup30  a = (a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a);

// Uniform tuples to Vector conversion functions -- tuples are implemented as vectors
   tup2vec_0 () = newvec 0$;
   tup2vec_1  :: a -> Vector a;
   tup2vec_1 a = stelem (newvec 1$) 0$ a;
   tup2vec_2  :: UniTup2   a -> Vector a @ 46;
   tup2vec_3  :: UniTup3   a -> Vector a @ 46;
   tup2vec_4  :: UniTup4   a -> Vector a @ 46;
   tup2vec_5  :: UniTup5   a -> Vector a @ 46;
   tup2vec_6  :: UniTup6   a -> Vector a @ 46;
   tup2vec_7  :: UniTup7   a -> Vector a @ 46;
   tup2vec_8  :: UniTup8   a -> Vector a @ 46;
   tup2vec_9  :: UniTup9   a -> Vector a @ 46;
   tup2vec_10 :: UniTup10  a -> Vector a @ 46;
   tup2vec_11 :: UniTup11  a -> Vector a @ 46;
   tup2vec_12 :: UniTup12  a -> Vector a @ 46;
   tup2vec_13 :: UniTup13  a -> Vector a @ 46;
   tup2vec_14 :: UniTup14  a -> Vector a @ 46;
   tup2vec_15 :: UniTup15  a -> Vector a @ 46;
   tup2vec_16 :: UniTup16  a -> Vector a @ 46;
   tup2vec_17 :: UniTup17  a -> Vector a @ 46;
   tup2vec_18 :: UniTup18  a -> Vector a @ 46;
   tup2vec_19 :: UniTup19  a -> Vector a @ 46;
   tup2vec_20 :: UniTup20  a -> Vector a @ 46;
   tup2vec_21 :: UniTup21  a -> Vector a @ 46;
   tup2vec_22 :: UniTup22  a -> Vector a @ 46;
   tup2vec_23 :: UniTup23  a -> Vector a @ 46;
   tup2vec_24 :: UniTup24  a -> Vector a @ 46;
   tup2vec_25 :: UniTup25  a -> Vector a @ 46;
   tup2vec_26 :: UniTup26  a -> Vector a @ 46;
   tup2vec_27 :: UniTup27  a -> Vector a @ 46;
   tup2vec_28 :: UniTup28  a -> Vector a @ 46;
   tup2vec_29 :: UniTup29  a -> Vector a @ 46;
   tup2vec_30 :: UniTup30  a -> Vector a @ 46;

// Operator Fixities

   infixl 5 :=;                                          // Index-value pair

// Data Types

   data Assign a  = (:=) I4 a;                           // Index-value pair
   data MplVec a  = MplVec I4 (Vector a);

// Create a vector from the list of 'n' elements 'es'.

   vector            :: [a] -> Vector a;
   vector x          =  f 0$ x where
   {
      f n []         =  newvec n;
      f n (a:as)     =  stelem (f (add_i4 n 1$) as) n a;
   };

// Construct a vector of length 'n' with default values (zeros).

   valloc            :: Int -> Vector a;
   valloc (I n)      =  newvec n;

// Return the length of the vector 'v'.

   vlength v         =  I (veclen v);

// Assign the value 'e' to the 'i'th element of the vector 'v'.

   assign            :: Vector a -> Assign a -> Vector a;
   assign v (i:=e)   =  stelem v i e;

// Load the 'i'th element of the vector 'v'.

   ld                :: Vector a -> Int -> a;
   ld v (I i)        =  ldelem v i;

// Store the value 'e' in element 'i' of the vector 'v'.

   st                :: Vector a -> Int -> a -> Vector a;
   st v (I i) e      =  stelem v i e;

// Make the assignments 'as' to the vector 'v'.

   set               :: Vector a -> [Assign a] -> Vector a;
   set v as          =  foldl assign v as;

// Destructively update the vector 'v' with the elements taken from list 'es'

   update            :: Vector a -> [a] -> I4;
   update v es       =  foldl f 0$ es where
   {
      f i e          =  seq_void (stelem_void v i e) (add_i4 i 1$);
   };

// Construct a vector of length 'n' from the list of 'n' elements 'es'.

   clr_vec           :: I4 -> [a] -> Vector a;
   clr_vec n es      =  seq (update v es) v where {v = newvec n;};

// Allocate a vector and initialize it with the list of assignments 'as'.

   array             :: I4 -> [Assign a] -> Vector a;
   array n as        =  set (newvec n) as;

// Specialisations of 'vector' for primitive types.

   vector_i4         :: [Int] -> Vector I4;
   vector_i4 x       =  f 0$ x where
   {
      f n []         =  newvec_i4 n;
      f n ((I a):as) =  stelem_i4 (f (add_i4 n 1$) as) n a;
   };

   vector_f8         :: [Real{a}] -> Vector(F8{a});
   vector_f8 x       =  f 0$ x where
   {
      f n []         =  newvec_f8 n;
      f n ((R a):as) =  stelem_f8 (f (add_i4 n 1$) as) n a;
   };

//****************************************************************************
// Internal stuff...
/*
   vfoldl f init vec = vfoldl' init 0$
                       where {
                         ceq_i4_b  :: I4->I4->Bool @ 10;
                         n = veclen vec;
                         vfoldl' i val
                            | ceq_i4_b i n = val
                            | else         = vfoldl' (add_i4 i 1$) (f val (ldelem vec i));
                        };

   vfoldr f init vec = vfoldr' (veclen vec) init
                       where {
                         vfoldr' 0$ val = val;
                         vfoldr' i  val =
                            let { i1 = sub_i4 i 1$ }
                            in vfoldr' i1 (f (ldelem vec i1) val);
                        };
*/
// Convert vector to list.
// vfrom v = build (vfrom' v (veclen v));

   vfrom                :: Vector a -> [a];
   vfrom v              =  f v (veclen v) [] where
   {
      f v 0$ xs         =  xs;
      f v i  xs         =  let {im1 = sub_i4 i 1$;} in f v im1 ((ldelem v im1):xs);
   };

// Allocate a vector and initialize with a specific value;

   replicateV           :: a -> I4 -> Vector a;
   replicateV a n       =  replicateV' v n where
   {
      v                 =  newvec n;
      replicateV' v 0$  =  v;
      replicateV' v i   =  let {im1 = sub_i4 i 1$;} in replicateV' (stelem v im1 a) im1;
   };

//
   loop_1 :: (e -> a -> (NullOr ee, a)) -> a -> Vector e -> (MplVec ee, a);

   loop_1 mutator acc vec = loop_1' 0$ 0$ acc where
   {
      ceq_i4_b  :: I4->I4->Bool @ 10;
      n              = veclen vec;
      vec'           = newvec n;

      maybe_push v j Null       = j;
      maybe_push v j (Really x) = seq_void (stelem_void v j x) (add_i4 j 1$);

      loop_1' i j a
      | ceq_i4_b i n = (MplVec j vec',a)
      | else         = let {
                         (me,a') = mutator (ldelem vec i) a;
                       }
                       in
                       loop_1' (add_i4 i 1$) (maybe_push vec' j me) a'
   };

// Evaluate 'a' for its side effects and then return 'b'.
   seq               :: a -> b -> b       @ 75;
// Specializes 'seq' for when the type 'a' is 'IoVoid'.
   seq_void          :: IoVoid -> b -> b  @ 74;
   inline 1 pi', e', gamma';
   pi'    = 3.1415926535897932384626433$;
   pi     = 3.1415926535897932384626433;
   e'     = 2.7182818284590452353602874$;
   e      = 2.7182818284590452353602874;
   // Euler-Mascheroni constant
   gamma' = 0.5772156649015328606065120$;
   gamma  = 0.5772156649015328606065120;

// Type Synonyms

   type V{d}            = Value{d};                      // A Mathcad value
   type M a             = Matrix a;                      // A Mathcad matrix

// For loop / range value
   data Iterator a;                                      // Iterable collection of a's
   type VIterator{d}    = Iterator(V{d});                // Old iterator parameterization style
   type R d             = Value d;                       // Range injected into Value
   type Rng d           = Matrix(R d);                   // Hack to prevent typechecker from obliterating 'R' type synonym


// Implicit, or 'Hidden', EFI Function Arguments

   type C               = String;                        // The CWD
   type O               = I4;                            // The ORIGIN
   type P               = I4;                            // The PRNPRECISION
   type T               = F8{};                          // The TOL
   type U               = F8{};                          // The CTOL
   type W               = I4;                            // The PRNCOLWIDTH
   type D{d}            = NullOr(Value{d});              // A default argument
   type N a             = Vector a;                      // The remaining args
   type I a             = a;                             // Any other implicit

// Field selectors for the Range datatype

// range_initial     :: Range{d} -> F8{d}                // ...initial value
   range_initial r    = range_initial'       (as_range r);
   range_initial'     (Range init _    _     _     _)     = init;
// range_increment   :: Range{d} -> F8{d}                // ...increment size

   range_increment r   = range_increment'    (as_range r);
   range_increment'   (Range _    incr _     _     _)     = incr;
// range_steps       :: Range{d} -> I4                   // ...number of steps
   range_steps r       = range_steps'        (as_range r);
   range_steps'       (Range _    _    steps _     _)     = steps;
// range_final       :: Range{d} -> Value{d}             // ...final element

   range_final r       = range_final'        (as_range r);
   range_final'       (Range _    _    _     final _)     = final;
// range_is_integral :: Range{d} -> Bool                 // ...integral unit?
   range_is_integral r = range_is_integral'  (as_range r);
   range_is_integral' (Range _    _    _     _     is_int)= is_int;

   range_Nth         :: Range{d} -> I4 -> F8{d};
   range_Nth         (Range init incr _ _ _) i = init `add_f8` (incr `mul_f8` (conv_f8 i));
   range_NthLast     :: Range{d} -> I4 -> F8{d};
   range_NthLast     (Range init incr n _ _) i = init `add_f8` (incr `mul_f8` (conv_f8 (n `sub_i4` i)));

   range             :: Rng a -> Range a             @ 46; // range :: coerce Rng to Range

// Return the object carried by the 'NullOr' argument 'a' unless it's null, in
// which case return the default value 'b' instead. Used to supply the default
// values for EFI functions that accept a variable number of arguments.

   (|=)                 :: NullOr a -> a -> a;
   (|=) (Really a) _    =  a;
   (|=)  Null      b    =  b;

// Value Constructors

   bv                   :: Bool -> Value{}   @ 70;
   ibv                  :: I4   -> Value{}   @ 73; // I4 -> Mcd Bool (NumVal::Zero or One)

 //iv'                  :: I4  -> Value{};
   iv                   :: Int -> Value{};
   iv (I i)             =  iv' i;

 //rv'                  :: F8{d}   -> Value{d};
   rv                   :: Real{d} -> Value{d};
   rv (R r)             =  rv' r;

 //rrv'                 :: F8{d}   -> F8{d}   -> Value{d};
   rrv                  :: Real{d} -> Real{d} -> Value{d};
   rrv (R r) (R i)      =  rrv' r i;

   sv                   :: String   -> Value{d}          @ 46;
   mm                   :: MatVal a -> Matrix a          @ 46;

// Other Coercions

   ib                   :: I4 -> Bool;
   ib 0$                =  False;
   ib _                 =  True;

// Relational Operators

   eq_i4                :: a -> a -> I4                  @"virtual System.Object::Equals(System.Object)";
   lt_i4'               :: NumVal{d} -> NumVal{d} -> I4  @"[mplrun]Mcd.NumVal::LessThan";
   gt_i4'               :: NumVal{d} -> NumVal{d} -> I4  @"[mplrun]Mcd.NumVal::GreaterThan";
   le_i4'               :: NumVal{d} -> NumVal{d} -> I4  @"[mplrun]Mcd.NumVal::LessEqThan";
   ge_i4'               :: NumVal{d} -> NumVal{d} -> I4  @"[mplrun]Mcd.NumVal::GreaterEqThan";

   lt_i4(Num x)(Num y)  =  lt_i4' x y;
   lt_i4(Str x)(Str y)  =  clt_i4 (strcmp x y) 0$;
   lt_i4  _ _           =  error "incomparable";

   gt_i4(Num x)(Num y)  =  gt_i4' x y;
   gt_i4(Str x)(Str y)  =  cgt_i4 (strcmp x y) 0$;
   gt_i4  _ _           =  error "incomparable";

   leq_i4(Num x)(Num y) =  le_i4' x y;
   leq_i4(Str x)(Str y) =  cle_i4 (strcmp x y) 0$;
   leq_i4  _ _          =  error "incomparable";

   geq_i4(Num x)(Num y) =  ge_i4' x y;
   geq_i4(Str x)(Str y) =  cge_i4 (strcmp x y) 0$;
   geq_i4  _ _          =  error "incomparable";

   eq_b x y             =  ib  (eq_i4 x y);
   lt_b x y             =  ib  (lt_i4 x y);
   gt_b x y             =  ib  (gt_i4 x y);

   eq x y               =  ibv (eq_i4 x y);
   op_eq x y            =  ibv (eq_i4 x y);
   lt x y               =  ibv (lt_i4 x y);
   gt x y               =  ibv (gt_i4 x y);

   neq_i4 x y           =  not_i4 (eq_i4 x y);
   neq_b  x y           =  ib  (neq_i4 x y);
   neq    x y           =  ibv (neq_i4 x y);
   op_neq x y           =  ibv (neq_i4 x y);

   leq_b  x y           =  ib  (leq_i4 x y);
   leq    x y           =  ibv (leq_i4 x y);

   geq_b  x y           =  ib  (geq_i4 x y);
   geq    x y           =  ibv (geq_i4 x y);

// Value Destructors

   type Arg             =  I4;                           // An argument index
   type Msg             =  String;                       // An error message

   arg_error            :: Msg -> Arg ->             a   @"[mplrun]Mpl.Run.AppException::Raise(System.String,System.UInt32)";
   cast                 :: Msg -> Arg -> NullOr a -> a;

   real'                :: NumVal{d} -> F8{d}            @"instance[mplrun]Mcd.NumVal::get_Real()";
   imag'                :: NumVal{d} -> F8{d}            @"instance[mplrun]Mcd.NumVal::get_Imag()";
   real,imag            :: NumVal{d} -> Real{d};

   rows'                :: MatVal a -> I4                @"instance[mplrun]Mcd.MatVal::get_Rows()";
   cols'                :: MatVal a -> I4                @"instance[mplrun]Mcd.MatVal::get_Cols()";
   rows,cols            :: MatVal a -> Int;

   null_or_number       :: Value{d} -> NullOr(NumVal{d}) @ 49;
   null_or_string       :: Value{d} -> NullOr(String)    @ 50;
   null_or_matrix       :: Matrix a -> NullOr(MatVal a)  @ 48;
   null_or_range        :: Matrix a -> NullOr(Matrix a)  @ 71; //avoid constraining matrix element type in failing case.
   null_or_function     :: value    -> NullOr(d->r)      @ 56;

   as_object            :: value    -> Object            @ 46;

   is_number            ::               Value{d} -> Bool;
   as_number            ::               Value{d} -> NumVal{d};
   as_number_a          ::        Arg -> Value{d} -> NumVal{d};
   as_number_m          :: Msg ->        Value{d} -> NumVal{d};
   as_number_ma         :: Msg -> Arg -> Value{d} -> NumVal{d};

   is_matrix            ::               Matrix a -> Bool;
   as_matrix            ::               Matrix a -> MatVal a;
   as_matrix_a          ::        Arg -> Matrix a -> MatVal a;
   as_matrix_m          :: Msg ->        Matrix a -> MatVal a;
   as_matrix_ma         :: Msg -> Arg -> Matrix a -> MatVal a;

   is_string            ::               Value{d} -> Bool;
   as_string            ::               Value{d} -> String;
   as_string_a          ::        Arg -> Value{d} -> String;
   as_string_m          :: Msg ->        Value{d} -> String;
   as_string_ma         :: Msg -> Arg -> Value{d} -> String;

   as_matrix_value      :: MatVal a -> Matrix a          @ 46;

   is_f8                ::               Value{d} -> Bool;
   as_f8                ::               Value{d} -> F8{d};
   as_f8_a              ::        Arg -> Value{d} -> F8{d};
   as_f8_m              :: Msg ->        Value{d} -> F8{d};
   as_f8_ma             :: Msg -> Arg -> Value{d} -> F8{d};

   is_real              ::               Value{d} -> Bool;
   as_real              ::               Value{d} -> Real{d};
   as_real_a            ::        Arg -> Value{d} -> Real{d};
   as_real_m            :: Msg ->        Value{d} -> Real{d};
   as_real_ma           :: Msg -> Arg -> Value{d} -> Real{d};

   is_i4                ::               Value{}  -> Bool;
   as_i4                ::               Value{}  -> I4 @ 72;
   as_i4_a              ::        Arg -> Value{}  -> I4;
   as_i4_m              :: Msg ->        Value{}  -> I4;
   as_i4_ma             :: Msg -> Arg -> Value{}  -> I4;

   is_int               ::               Value{}  -> Bool;
   as_int               ::               Value{}  -> Int;
   as_int_a             ::        Arg -> Value{}  -> Int;
   as_int_m             :: Msg ->        Value{}  -> Int;
   as_int_ma            :: Msg -> Arg -> Value{}  -> Int;

   is_vector            ::               Matrix a -> Bool;
   as_vector            ::               Matrix a -> MatVal a;
   as_vector_a          ::        Arg -> Matrix a -> MatVal a;
   as_vector_m          :: Msg ->        Matrix a -> MatVal a;
   as_vector_ma         :: Msg -> Arg -> Matrix a -> MatVal a;

   is_real_vector       ::               Matrix a -> Bool;
   as_real_vector       ::               Matrix a -> MatVal a;
   as_real_vector_a     ::        Arg -> Matrix a -> MatVal a;
   as_real_vector_m     :: Msg ->        Matrix a -> MatVal a;
   as_real_vector_ma    :: Msg -> Arg -> Matrix a -> MatVal a;

   is_range             ::               Value a -> Bool;
   as_range             ::               Value a -> Range a;
   as_range_a           ::        Arg -> Value a -> Range a;
   as_range_m           :: Msg ->        Value a -> Range a;
   as_range_ma          :: Msg -> Arg -> Value a -> Range a;

//****************************************************************************

   real n               =  R(real' n);
   imag n               =  R(imag' n);
   rows m               =  I(rows' m);
   cols m               =  I(cols' m);

   cast m a r
      | not_null r      =  really r
      | else            =  arg_error m a;

//****************************************************************************

   as_number        v   =  cast "must be scalar" 0$ (null_or_number v);
   as_number_a    a v   =  cast "must be scalar" a  (null_or_number v);
   as_number_m  m   v   =  cast m                0$ (null_or_number v);
   as_number_ma m a v   =  cast m                a  (null_or_number v);
   is_number v          =  not_null                 (null_or_number v);

//****************************************************************************

   default_matrix'      :: MatVal a;            // Immutable and polymorphic
   default_matrix'      =  fix' (vec' 0$);

   to_matrix        v   =  to_matrix' (null_or_matrix v) where
   {
      to_matrix' m
         | not_null m   =  really m
         | else         =  default_matrix';
   };

   as_matrix        v   =  cast "must be matrix" 0$ (null_or_matrix v);
   as_matrix_a    a v   =  cast "must be matrix" a  (null_or_matrix v);
   as_matrix_m  m   v   =  cast m                0$ (null_or_matrix v);
   as_matrix_ma m a v   =  cast m                a  (null_or_matrix v);
   is_matrix v          =  not_null                 (null_or_matrix v);


//****************************************************************************

   as_string        v   =  cast "must be string" 0$ (null_or_string v);
   as_string_a    a v   =  cast "must be string" a  (null_or_string v);
   as_string_m  m   v   =  cast m                0$ (null_or_string v);
   as_string_ma m a v   =  cast m                a  (null_or_string v);
   is_string v          =  not_null                 (null_or_string v);

//****************************************************************************

   is_real              =  is_f8;
   as_real        v     =  R(as_f8        v);
   as_real_a    a v     =  R(as_f8_a    a v);
   as_real_m  m   v     =  R(as_f8_m  m   v);
   as_real_ma m a v     =  R(as_f8_ma m a v);

//****************************************************************************

   is_f8 v              =  case (null_or_number v) of
   {
      Null              -> False;
      Really n          -> f n where
      {
         f::NumVal{d}->Bool @ "instance[mplrun]Mcd.NumVal::get_IsPureReal()";
      };
   };

   as_f8        v       =  as_f8_ma "must be real" 0$ v;
   as_f8_a    a v       =  as_f8_ma "must be real" a  v;
   as_f8_m  m   v       =  as_f8_ma  m             0$ v;
   as_f8_ma m a v       =  f (as_number_ma m a v) m a where
   {
      f::NumVal{d}->Msg->Arg->F8{d} @ "instance[mplrun]Mcd.NumVal::asReal(System.String,System.UInt32)";
   };

//****************************************************************************

   is_i4 v              =  case (null_or_number v) of
   {
      Null              -> False;
      Really n          -> f n where
      {
         f::NumVal{d}->Bool @ "instance[mplrun]Mcd.NumVal::get_IsInt()";
      };
   };

// as_i4        v       =  as_i4_ma "must be integer" 0$ v; // @ 72
   as_i4_a    a v       =  as_i4_ma "must be integer" a  v;
   as_i4_m  m   v       =  as_i4_ma  m                0$ v;
   as_i4_ma m a v       =  f (as_number_ma m a v) m a where
   {
      f::NumVal{}->Msg->Arg->I4 @ "instance[mplrun]Mcd.NumVal::asInt(System.String,System.UInt32)";
   };

//****************************************************************************

   is_int               =  is_i4;
   as_int        v      =  I(as_i4        v);
   as_int_a    a v      =  I(as_i4_a    a v);
   as_int_m  m   v      =  I(as_i4_m  m   v);
   as_int_ma m a v      =  I(as_i4_ma m a v);

//****************************************************************************

   is_vector v          =  case (null_or_matrix v) of
   {
      Null              -> False;
      Really n          -> f n where
      {
         f::MatVal a->Bool @ "instance[mplrun]Mcd.MatVal::get_IsVector()";
      };
   };

   as_vector        v   =  as_vector_ma "must be vector" 0$ v;
   as_vector_a    a v   =  as_vector_ma "must be vector" a  v;
   as_vector_m  m   v   =  as_vector_ma m                0$ v;
   as_vector_ma m a v
      | cols m' == 1    =  m'
      | else            =  arg_error m a where
   {
      m'                =  as_matrix_ma m a v;
   };

//****************************************************************************

   is_real_vector v     =  case (null_or_matrix v) of
   {
      Null              -> False;
      Really n          -> f n where
      {
         f::MatVal a->Bool @ "instance[mplrun]Mcd.MatVal::get_IsRealVector()";
      };
   };

   as_real_vector        v =  as_real_vector_ma "must be real vector" 0$ v;
   as_real_vector_a    a v =  as_real_vector_ma "must be real vector" a  v;
   as_real_vector_m  m   v =  as_real_vector_ma m                     0$ v;
   as_real_vector_ma m a v
      | f m'               =  m'
      | else               =  arg_error m a where
   {
      f::MatVal a->Bool @ "instance[mplrun]Mcd.MatVal::get_IsRealVector()";
      m'                   =  as_matrix_ma m a v;
   };

//****************************************************************************

   is_range r           =  not_null                       (null_or_range r);
   as_range        r    =  range (cast "must be range" 0$ (null_or_range r));
   as_range_a    a r    =  range (cast "must be range"  a (null_or_range r));
   as_range_m  m   r    =  range (cast m               0$ (null_or_range r));
   as_range_ma m a r    =  range (cast m                a (null_or_range r));

//****************************************************************************
// Parse argument 'aa' as a string index 'ii' specified relative to the origin
// 'oo'. Checks the flag in the RuntimeOptions structure to see whether or not
// we must adjust the index to be relative to the origin 'oo'.

   as_string_index_a      :: Arg -> O -> Value{} -> I4;
   as_string_index_a aa oo ii
      | ib x            =  i `sub_i4` oo
      | else            =  i
   where
   {
      x :: I4 @"[mplrun]Mcd.RuntimeOptions::strings_indexed_from_origin";
      i                 = as_i4_a aa ii;
   };

//****************************************************************************
// Create a real vector from a list of reals.

   rvec                 :: [Real{d}] -> Value{d};
   rvec rs              =  rmat (length rs) rs;

// Create a real matrix from a list of reals and the number of rows.

   rmat                 :: Int -> [Real{d}] -> Value{d};
   rmat r rs
    | r*c == n          =  ia r c
    | else              =  error "bad matrix list length" where
   {
      n                 =  length rs;
      c                 =  n / r;
      ia (I r) (I c)    =  init_array r c (map rv rs);
   };

// Access Functions

   vec'                 :: I4 -> MatVal a                @"[mplrun]Mcd.MatVal::.ctor(System.Int32)";
   mat'                 :: I4 -> I4 -> MatVal a          @"[mplrun]Mcd.MatVal::.ctor(System.Int32,System.Int32)";

   get_1'               :: MatVal a -> I4 -> a           @"instance[mplrun]Mcd.MatVal::mcd_get_1(System.UInt32)";
   getm_1               :: Matrix a -> I4 -> a           @"[mplrun]Mcd.MatVal::mcd_getm_1(System.Object,System.Int32)";
   get_1                :: Matrix a -> Value{} -> a;
   get_1 m i            =  get_1' (as_matrix_ma "must be vector" 0$ m) (as_i4 i);
                        // Note: get_1' verifies that m is a vector

// Get item from vector without allocation -- returning scalars by mutating the Number argument

   get_1_na             :: MatVal a -> NumVal{} -> I4 -> a  @"instance [mplrun]Mcd.MatVal::get_1_na([mplrun]Mcd.NumVal,System.Int32)";

// Update this vector in place -- do not copy

   upd_1'               :: MatVal a -> I4 -> a -> MatVal a  @"instance [mplrun]Mcd.MatVal::mcd_upd_1(System.Int32,System.Object)";

// Update vector -- copying if immutable

   set_1'               :: MatVal a -> I4 -> a -> MatVal a  @"instance [mplrun]Mcd.MatVal::mcd_set_1(System.Int32,System.Object)";
   setm_1               :: Matrix a -> I4 -> a -> Matrix a  @"[mplrun]Mcd.MatVal::mcd_setm_1(System.Object,System.Int32,System.Object)";
   set_1                :: Matrix a -> Value{} -> a -> Matrix a;
   set_1 m i v          =  mm (set_1' (to_matrix m) (as_i4 i) v);

   get_2'               :: MatVal a -> I4 -> I4 -> a        @"instance [mplrun]Mcd.MatVal::mcd_get_2(System.UInt32,System.UInt32)";
   getm_2               :: Matrix a -> I4 -> I4 -> a        @"[mplrun]Mcd.MatVal::mcd_getm_2(System.Object,System.Int32,System.Int32)";

   get_2                :: Matrix a -> Value{} -> Value{} -> a;
   get_2 m i j          =  get_2' (as_matrix m) (as_i4 i) (as_i4 j);

// Get item from matrix without allocation -- returning scalars by mutating the Number argument

   get_2_na             :: MatVal a -> NumVal{} -> I4 -> I4 -> a  @"instance[mplrun]Mcd.MatVal::get_2_na([mplrun]Mcd.NumVal,System.Int32,System.Int32)";

// First argument must be matrix, but type checker doesn't enforce it.

   get_2_na'            :: a -> NumVal{} -> I4 -> I4 -> c   @"instance [mplrun]Mcd.MatVal::get_2_na([mplrun]Mcd.NumVal,System.Int32,System.Int32)";

// Update this matrix in place -- do not copy

   upd_2'               :: MatVal a -> I4 -> I4 -> a -> MatVal a @"instance [mplrun]Mcd.MatVal::mcd_upd_2(System.Int32,System.Int32,System.Object)";

// Update matrix -- copying if immutable

   set_2'               :: MatVal a -> I4-> I4 -> a -> MatVal a @"instance[mplrun]Mcd.MatVal::mcd_set_2(System.Int32,System.Int32,System.Object)";
   setm_2               :: Matrix a -> I4 -> I4-> a -> Matrix a  @"[mplrun]Mcd.MatVal::mcd_setm_2(System.Object,System.Int32,System.Int32,System.Object)";
   set_2                :: Matrix a -> Value{} -> Value{} -> a -> Matrix a;
   set_2 m i j v        =  mm (set_2' (to_matrix m) (as_i4 i) (as_i4 j) v);

   getcol'              :: MatVal a -> I4 -> MatVal a       @"instance[mplrun]Mcd.MatVal::Column(System.Int32)";
   getm_col             :: Matrix a -> I4 -> Matrix a       @"[mplrun]Mcd.MatVal::mcd_column(System.Object,System.Int32)";
   getcol               :: Matrix a -> Value{} -> Matrix a;
   getcol m i           =  mm (getcol' (as_matrix m) (as_i4 i));

   not_matrix v         =  is_null  (maybe_matrix v) where
   {
     maybe_matrix       :: a -> NullOr(a)  @ 48;   // same as null_or_matrix without the assumption that 'a' is a Value
   };

   is_integral          :: F8{d} -> Bool;
   is_integral r        =
   try ib(r `ceq_f8` conv_f8' (conv_i4 r))
   catch {
      e -> False;
   }
   where
   {
      conv_f8' i        =  inject_dim (conv_f8 i);
      inject_dim        :: F8{} -> F8{d} @ 46;
   };

// Unsafe (unchecked) type coercions

   coerce_string        :: Value{d} -> String               @ 46;
   coerce_number        :: Value{d} -> NumVal{d}            @ 46;
   coerce_matrix        :: Matrix a -> MatVal{a}            @ 46;
   coerce_string'       :: a -> String                      @ 46;
   coerce_number'       :: a -> NumVal{d}                   @ 46;
   coerce_matrix'       :: a -> MatVal{d}                   @ 46;

// Vectorization
// 
// We define a series of functions that map their first function argument over
// a second tuple of various sizes. All are implemented in terms of the under-
// lying function MatVal.vectorize, which can map a function of any arity over
// a primitive array of arguments. For arities greater than 9,  the translator
// will synthesize an appropriate foreign delcaration for this function on the
// fly. For arities 1, 2 , and 3,  we also provide specialized implementations
// that check to see if any of the tuple components are actually matrices;  if
// not, we skip the call to MatVal.vectorize() (which uses refelection to call
// back on its function arguemnt) altogether.

   vectorize_1 :: (a->b)                          -> (a)                  -> b;
   vectorize_2 :: (a->b->c)                       -> (a,b)                -> c;
   vectorize_3 :: (a->b->c->d)                    -> (a,b,c)              -> d;
   vectorize_4 :: (a->b->c->d->e)                 -> (a,b,c,d)            -> e @"[mplrun]Mcd.MatVal::vectorize";
   vectorize_5 :: (a->b->c->d->e->f)              -> (a,b,c,d,e)          -> f @"[mplrun]Mcd.MatVal::vectorize";
   vectorize_6 :: (a->b->c->d->e->f->g)           -> (a,b,c,d,e,f)        -> g @"[mplrun]Mcd.MatVal::vectorize";
   vectorize_7 :: (a->b->c->d->e->f->g->h)        -> (a,b,c,d,e,f,g)      -> h @"[mplrun]Mcd.MatVal::vectorize";
   vectorize_8 :: (a->b->c->d->e->f->g->h->i)     -> (a,b,c,d,e,f,g,h)    -> i @"[mplrun]Mcd.MatVal::vectorize";
   vectorize_9 :: (a->b->c->d->e->f->g->h->i->j)  -> (a,b,c,d,e,f,g,h,i)  -> j @"[mplrun]Mcd.MatVal::vectorize";

   vectorize_1 f t@(a)
    | not_matrix a      = f a
    | else              = v f (stelem (newvec 1$) 0$ a)
   where
   {
      v :: (a->b) -> Vector a -> b        @"[mplrun]Mcd.MatVal::vectorize";
   };

   vectorize_2 f t@(a,b)
    | not_matrix a &&
      not_matrix b      = f a b
    | else              = v f t
   where
   {
      v :: (a->b->c) -> (a,b) -> d        @"[mplrun]Mcd.MatVal::vectorize";
   };

   vectorize_2' f a b    // for op_lt etc. delays forming tuple if possible
    | not_matrix a &&
      not_matrix b      = f a b
    | else              = v f(a,b)
   where
   {
      v :: (a->b->c) -> (a,b) -> d        @"[mplrun]Mcd.MatVal::vectorize";
   };

   vectorize_3 f t@(a,b,c)
    | not_matrix a &&
      not_matrix b &&
      not_matrix c      = f a b c
    | else              = v f t
   where
   {
      v :: (a->b->c->d) -> (a,b,c) -> d   @"[mplrun]Mcd.MatVal::vectorize";
   };

// Render matrix immutable

   fix'                 :: MatVal a -> MatVal a          @"instance[mplrun]Mcd.MatVal::Fix()";

// Create a 0 size vector with n allocated rows (eg, anr == n, rows == 0)

   reserve'             :: I4 -> MatVal a                @ "[mplrun]Mcd.MatVal::reserve(System.Int32)";
   reserve              :: Value{} -> Matrix a;
   reserve n            =  mm (reserve' (as_i4 n));

// Append element to end of vector -- efficient when used with a vector created by reserve.

   push'                :: MatVal a -> a -> MatVal a     @"instance[mplrun]Mcd.MatVal::Push(System.Object)";
   push_raw'            :: MatVal a -> a -> MatVal a     @"instance[mplrun]Mcd.MatVal::PushRaw(System.Object)";
   push_raw''           :: MatVal a -> b -> MatVal a     @"instance[mplrun]Mcd.MatVal::PushRaw(System.Object)";
   push_raw_index'      :: MatVal a -> Value{} -> I4     @"instance[mplrun]Mcd.MatVal::PushRawIndex(System.Object)";
   push m v             =  mm (push' (as_vector m) v);

// Construct a new matrix with (max i (rows m)) rows and (max j (cols m)) cols
// with the same elements as m for all index pairs in the domain of m.

   realloc2             :: Matrix a -> I4 -> MatVal a                   @"[mplrun]Mcd.MatVal::ReAlloc(System.Object,System.Int32)";
   realloc3             :: Matrix a -> I4 -> I4 -> MatVal a             @"[mplrun]Mcd.MatVal::ReAlloc(System.Object,System.Int32,System.Int32)";
   fill_vector'         :: MatVal a -> b -> I4 -> I4 -> I4 -> MatVal a  @"instance[mplrun]Mcd.MatVal::Fill(System.Object,System.Int32,System.Int32,System.Int32)";
   reshape'             :: MatVal a -> I4 -> I4 -> MatVal a             @"instance[mplrun]Mcd.MatVal::Reshape(System.Int32,System.Int32)";
   replicateM'          :: a -> I4 -> MatVal a                          @"[mplrun]Mcd.MatVal::Replicate(System.Object,System.Int32)";
   replicateM           :: a -> I4 -> Matrix a;
   replicateM init n    =  mm (replicateM' init n);

   init_vector'         :: I4 -> [a] -> MatVal a;
   init_vector' n xs    =  foldl push_raw' (reserve' n) xs;

   init_vector          :: I4 -> [a] -> Matrix a;
   init_vector  n xs    =  mm (init_vector' n xs);

   init_array'          :: I4 -> I4 -> [a] -> MatVal a;
   init_array' r c xs   =  reshape' (init_vector' (mul_i4 r c) xs) r c;

   init_array           :: I4 -> I4 -> [a] -> Matrix a;
   init_array  r c xs   =  mm (init_array' r c xs);

//****************************************************************************
// RANGE UTILITY FUNCTIONS

// Create a range from the first 'f', second 's', and last 'l' real numbers as
// specified in the Mathcad range initialization syntax 'f,s..l'.

   range3 :: F8 d -> F8 d -> F8 d -> Rng d;
   range3 f s l
    | f<s && f>l ||
      f>s && f<l  = error "illegal range"
    | else        = r(s - f)
   where
   {
      cast  :: Range d -> Rng d @ 46;

      r i@0.0$
       | f!=l  = error "range overflow"
       | else  = cast (Range f i 1$ (rv' f) (is_integral f));   // i.e: f == s == l

      r i      = cast (Range f i n v q)
      where
      {
         n     = try ++conv_i4(1.00000000001$ * (l-f)/i) // ...number of steps
                 catch {e-> error "range overflow"};     // ...report error
         v     = rv'(f + i * conv_f8 (--n));             // ...terminal value
         q     = is_integral f && is_integral i;         // ...integral flag
      };

      prefix ++,--; // local overloads until type classes are implemented
      infixl 7 *,/;
      infixl 6 +,-;
      infix  4 ==,!=,<,<=,>=,>;

      ++x      = add_i4 x 1$;
      --x      = sub_i4 x 1$;
      x *  y   = mul_f8 x y;
      x /  y   = div_f8 x y;
      x +  y   = add_f8 x y;
      x -  y   = sub_f8 x y;
      x <  y   = ib(clt_f8 x y);
      x >  y   = ib(cgt_f8 x y);
      x <= y   = ib(cle_f8 x y);
      x >= y   = ib(cge_f8 x y);
      x == y   = ib(ceq_f8 x y);
      x != y   = ib(cne_f8 x y);
   };

// Create a range from the first 'f' and last 'l' real numbers as specified in
// the Mathcad range initialization syntax 'f..l'.  Ranges constructed without
// an explict `next` parameter must be dimensionless, because the increment is
// assumed to be either +1 or -1, both of which are themselves dimensionless.

   range2 :: F8{} -> F8{} -> Rng{};
   range2 f l  = range3 f i l
   where
   {
      i = if   ib (cle_f8 f l)                           // ...if   f<l
          then f `add_f8` 1.0$                           // ...then f+1
          else f `sub_f8` 1.0$;                          // ...else f-1
   };

// Create a range from the first 'f', second 's', and last 'l' Mathcad values,
// as specified in the Mathcad range initialization syntax 'f,s..l'.

   mkRange3 :: Value{d} -> Value{d} -> Value{d} -> Rng{d};
   mkRange3 fv sv lv = range3 f s l where
   {
      f = as_f8_a 1$ fv;                                 // ...cast to real
      s = as_f8_a 2$ sv;                                 // ...cast to real
      l = as_f8_a 3$ lv;                                 // ...cast to real
  };

// Create a range from the first 'f' and last 'l' Mathcad values, as specified
// in the Mathcad range initialization syntax 'f..l'.  Ranges constructed with
// no explict `next` parameter must be dimensionless, because the increment is
// assumed to be either +1 or -1, both of which are themselves dimensionless.

   mkRange2 :: Value{} -> Value{} -> Rng{};
   mkRange2 fv lv = range2 f l where
   {
      f = as_f8_a 1$ fv;                                 // ...cast to real
      l = as_f8_a 2$ lv;                                 // ...cast to real
   };

//****************************************************************************

  preallocate2 m vi     = realloc2 m (as_i4 vi `add_i4` 1$);
  preallocate3 m vi vj  = realloc3 m (as_i4 vi `add_i4` 1$) (as_i4 vj `add_i4` 1$);

//****************************************************************************
// rng_loop_var :: I4->Range{}->(V{a})->(V{}->V{a})->V{a};
// Special case


  rng_loop_var origin (Range init incr n final is_int) m fv
     | is_int  = loop_i4 array init_i4 n
     | else    = error "must be integer"
  where
  {
     init_i4= conv_i4 init;   // known to be integral
     incr_i4= conv_i4 incr;   // known to be integral
     array  = realloc2 m ((max_i4 init_i4 (as_i4 final)) `sub_i4` origin);

     max_i4 x y = x `add_i4` ( (cgt_i4 y x) `mul_i4` (y `sub_i4` x));

     loop_i4 arr i 0$ = mm arr;
     loop_i4 arr i n  = loop_i4  (upd_1' arr index val)
                                 (add_i4 i incr_i4)
                                 (sub_i4 n 1$)
      where
      {
         index = i `sub_i4` origin;
         val   = fv (iv' i);
      };
  };


//****************************************************************************
// rng_loop_1 :: Range{b}->(V{a})->((V{b})->(V{}))->(V{b}->V{a})->V{a};

   rng_loop_1 (Range init incr n final is_int) m fi fv
    | is_int =  loop_i4 array (conv_i4 init) n
    | else   =  loop_f8 array init n
   where
   {
      iv''  :: I4  -> Value{d} @"[mplrun]Mcd.NumVal::.ctor(System.Int32)";

      array = preallocate2 m (fi final); // Preallocate the array.

   // Note use of iv'' in index expression to recover dimension
   // The computation of finalindex (above) ensures dimensional consistency

      loop_i4 arr i 0$ = mm arr;
      loop_i4 arr i n  = loop_i4 (upd_1' arr index val)
                               (add_i4 i inc)
                               (sub_i4 n 1$)
      where
      {
         index = as_i4 (fi (iv'' i));
         val   = fv (iv' i);
         inc = conv_i4 incr;
      };

      loop_f8 arr i 0$ = mm arr;
      loop_f8 arr i n  = loop_f8 (upd_1' arr index val)
                                    (add_f8 i incr)
                                    (sub_i4 n 1$)
      where
      {
         relmt = rv' i;
         index = as_i4 (fi relmt);
         val   = fv relmt;
      };
   };

//****************************************************************************
// NOTE:: Doesn't work for backwards ranges, eg 4..0
// rng_loop_2 :: Range{a} -> Range{b} -> V{c}
//            -> (V{a} -> V{b} -> V{})
//            -> (V{a} -> V{b} -> V{})
//            -> (V{a} -> V{b} -> V{c})
//            -> V{c};

  rng_loop_2 (Range init_i incr_i n_i final_i is_int_i)
             (Range init_j incr_j n_j final_j is_int_j)
             m fi fj fv
   | is_int_i && is_int_j = loop_i4 array
   | else                 = loop_f8 array

  where {
    array = preallocate3 m (fi final_i final_j) (fj final_j final_j); // Preallocate the array.

    lt_b :: I4->I4->Bool @ 12;

    // ****************************************************************************
    // Integer loop
    loop_i4 arr = mm (loop_i arr init_i')
    where {
      iv''  :: I4  -> Value{d} @"[mplrun]Mcd.NumVal::.ctor(System.Int32)";
      init_i' = conv_i4 init_i;
      init_j' = conv_i4 init_j;
      inc_i   = conv_i4 incr_i;
      inc_j   = conv_i4 incr_j;
      end_i   = init_i' `add_i4` n_i;
      end_j   = init_j' `add_i4` n_j;
      loop_i arr i
         | i `lt_b` end_i = let {
                              i'   = iv'' i;
                              loop_j arr j

                                | j `lt_b` end_j = let {
                                                      j'      = iv'' j;
                                                      index_i = as_i4 (fi i' j');
                                                      index_j = as_i4 (fj i' j');
                                                      val     = fv i' j';
                                                   } in
                                                   loop_j (upd_2' arr index_i index_j val)
                                                          (j `add_i4` inc_j)

                                | else = loop_i arr (i `add_i4` inc_i);
                             }
                             in loop_j arr init_j'
         | else = arr;
    };

// Float loop

   loop_f8 arr = mm (loop_i arr init_i n_i)
    where {

      loop_i arr i 0$   = arr;
      loop_i arr i ni   = loop_j arr init_j n_j
      where {
        i'   = rv' i;
        loop_j arr j 0$ = loop_i arr (i `add_f8` incr_i) (ni `sub_i4` 1$);
        loop_j arr j nj =
        let {
          j'      = rv' j;
          index_i = as_i4 (fi i' j');
          index_j = as_i4 (fj i' j');
          val     = fv i' j';
        }
        in loop_j (upd_2' arr index_i index_j val)
                          (j `add_f8` incr_j)
                          (nj `sub_i4` 1$);
      };
    };
  };

   strcmp :: String->String->I4  @"[mscorlib]System.String::CompareOrdinal(System.String,System.String)";
   strlen :: String->I4          @"instance [mscorlib]System.String::get_Length()";

//****************************************************************************
// Unit Simplification Support

   data Unit;                                            // An atomic unit
   data Units;                                           // A derived unit
   data UnitSystem;                                      // A unit system
   type UnitSystemCode  = Int;                           // A unit system code
   type GUID            = String;                        // A unit system guid
   type Signature       = String;                        // A type signature

   unit                    :: (String,String,String,Value{a},Signature) -> Unit;
   unit_system             :: (String,UnitSystemCode,GUID,[Unit],[Unit])-> UnitSystem;
   set_unit_system_details :: UnitSystem -> [Unit] -> [Unit] -> ();

// Construct a unit from its name, symbol, quantity, magnitude, and signature.

   unit(name,symbol,quantity,magnitude,signature) =
      f name symbol quantity (as_f8 magnitude) signature where
   {
      f :: String->String->String->F8{a}->Signature->Unit
      @"[mplrun]Mcd.Unit::.ctor(System.String,System.String,System.String,System.Double,System.String)";
   };

// Construct a unit from a linearly independent set of base units.

   unit_system(name,(I code),guid,basis,defaults) =
      f name code guid (vector basis) (vector defaults) where
   {
      f :: String->I4->GUID->Vector Unit->Vector Unit->UnitSystem
      @"[mplrun]Mcd.UnitSystem::.ctor(System.String,System.UInt32,System.String,[mplrun]Mcd.Unit[],[mplrun]Mcd.Unit[])";
   };

// Update both the basis and default collections of units used by 'system' to
// simplify results with dimension types.

   set_unit_system_details system basis defaults =

      b system (vector basis)    `seq_void`
     (d system (vector defaults) `seq_void` ())

   where
   {
      b::UnitSystem->Vector Unit->IoVoid @ "instance[mplrun]Mcd.UnitSystem::set_Basis([mplrun]Mcd.Unit[])";
      d::UnitSystem->Vector Unit->IoVoid @ "instance[mplrun]Mcd.UnitSystem::set_Defaults([mplrun]Mcd.Unit[])";
   };

// Recursively multiply or divide all numeric elements of the given argument by 
// the given scale factor skipping non-numeric elements.

   divide_by_float   :: Value{d}->F8{e}->Value{d e-1} @"[mplrun]Mcd.Utilities::Divide(System.Object,System.Double)";
   multiply_by_float :: Value{d}->F8{e}->Value{d e} @"[mplrun]Mcd.Utilities::Multiply(System.Object,System.Double)";

// Multiply the value 'v' by the real scalar 'u'. If the value 'v' is a matrix
// then recursively multiply its numeric elements, but fix everything else.

   multiply_by_unit     :: Value{d} -> Value{e} -> Value{d e};
   multiply_by_unit v u =  multiply_by_float v (as_f8_a 2$ u);

// Divide the value 'v' by the non-zero real 'u'. If the value 'v' is a matrix
// then recursively divide its numeric elements, but fix everything else.

   divide_by_unit       :: Value{d} -> Value{e} -> Value{d e-1};
   divide_by_unit v u = divide_by_float v (as_f8_a 2$ u);

// Apply the given function recursively to evey numeric element of the value.

   apply_affine_unit :: Value{d} -> (Value{d}->a) -> a;
   apply_affine_unit v f = vectorize_1 f v;              // Vectorize + apply

//****************************************************************************
// 'For' loop Support

   forRangeVar' :: F8{d}->F8{d}->I4->NullOr(VIterator{d}) @ "[mplrun]Mcd.Iterator::forRange(System.Double,System.Double,System.Int32)";
   forRangeVar  :: Rng{d} -> NullOr(VIterator{d});
   forRangeVar r = forRangeFields (as_range r)
      where {
         forRangeFields (Range init incr n _ _) = forRangeVar' init incr n;
      };

   forRange2' :: F8{} ->F8{} ->       NullOr(VIterator{}) @ "[mplrun]Mcd.Iterator::forRange(System.Double,System.Double)";
   forRange3' :: F8{d}->F8{d}->F8{d}->NullOr(VIterator d) @ "[mplrun]Mcd.Iterator::forRange(System.Double,System.Double,System.Double)";

   // inline 1 forRange2, forRange3;

   forRange2 :: Value{} -> Value{} -> NullOr(VIterator{});
   forRange2 init end = forRange2' (as_f8 init) (as_f8 end);

   forRange3 :: Value{d} -> Value{d} -> Value{d} -> NullOr(VIterator{d});
   forRange3 init next end = forRange3' (as_f8 init) (as_f8 next) (as_f8 end);

   forValue' :: Matrix a -> NullOr(Iterator a)            @ "[mplrun]Mcd.Iterator::forValue(System.Object)";
   forValue  :: Matrix a -> NullOr(Iterator a);           // This is the signature needed.
   forValue r = fv (null_or_range r)
      where {
         fv    Null     = forValue' r;                    // This case gives correct type to forValue
         fv (Really rr) = barf(forRangeVar (barf rr));
         barf :: a -> b @ 46;                             // barf to avoid constraining element type.
      };

   forValues :: Vector (NullOr(Iterator a)) -> NullOr(Iterator a) @"[mplrun]Mcd.Iterator::forValues([mplrun]Mcd.Iterator[])";
   ri_first  :: NullOr(Iterator a) -> a                   @ "instance [mplrun]Mcd.RangeIterator::ri_first()";
   ri_next   :: NullOr(Iterator a) -> NullOr(Iterator a)  @ "instance [mplrun]Mcd.RangeIterator::ri_next()";
   val_first :: NullOr(Iterator a) -> a                   @ "virtual [mplrun]Mcd.Iterator::first()";
   val_next  :: NullOr(Iterator a) -> NullOr(Iterator a)  @ "virtual [mplrun]Mcd.Iterator::next()";
   val_more  :: NullOr(Iterator a) -> Bool                @ "virtual [mplrun]Mcd.Iterator::next()";
}
