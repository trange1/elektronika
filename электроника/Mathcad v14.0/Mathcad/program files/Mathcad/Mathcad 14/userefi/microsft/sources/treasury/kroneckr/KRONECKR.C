/* $Id: kroneckr.c,v 1.1 1994/08/23 13:35:20 lorczak Exp $   */
/*                 $Revision: 1 $        */
#include "mcadincl.h"

#include "math.h"



#define  INTERRUPTED            1

#define  INSUFFICIENT_MEMORY    2

#define  MUST_BE_SQUARE           3

#define  NUMBER_OF_ERRORS       3   



    // Set up the table of error messages.

    // We allow for three error messages:

    //     interrupted - if the user hits ESC while calculating

    //     insufficient memory - if there is no room to create the 

    //                          product matrix

    //     must be square - if the input arrays are not both square



    char * myErrorMessageTable[NUMBER_OF_ERRORS] =  

    {   "interrupted",

        "insufficient memory",

        "must be square"

    };

    

    

    // This code performs the Kronecker product computation.



     LRESULT  KroneckerProduct(  COMPLEXARRAY * const Product, 

        const COMPLEXARRAY * const Array1, const COMPLEXARRAY * const Array2 )

     {

        unsigned int i,j,i1,j1,i2,j2,Psize,n,types,types1,types2;



        // Check that the array arguments are square.



        // Check the first argument.



        if ( Array1->rows != Array1->cols )

            return MAKELRESULT( MUST_BE_SQUARE, 1 );       



         // Check the second argument.



        if ( Array2->rows != Array2->cols )

            return MAKELRESULT( MUST_BE_SQUARE, 2 );       



        // Compute size (# of rows or cols) of the product.

        // Store the size of the second array argument in n.



        Psize =  (Array1->rows) * (Array2->rows);

        n = Array2->rows;



        // Note: If an input array does not have a real or imaginary part

        // that part will not exist.  Mathcad DOES NOT set these values to

        // 0.0; it simply logs the fact that they are not there.  This is

        // to reduce array storage requirements.  Therefore we cannot use 

        // one set of arithmetic computations to compute the Kronecker

        // product.  Each input array can fall into one of three categories:

        //            real  - no imaginary part

        //            pure imaginary - no real part

        //            complex - real and imaginary parts

        // Given two arguments there are then 9 cases which can arise.

        // The computation below determines an integer "types" with

        // a value between 0 and 8 uniquely determined by the types

        // of the input arrays.



        types1 = (Array1->hReal != NULL) + 2*(Array1->hImag != NULL) - 1;

        types2 = (Array2->hReal != NULL) + 2*(Array2->hImag != NULL) - 1;

        types = types1 + 3*types2;







        // The cases below compute the Kronecker product for each possible case

        // (real x real, pure x complex, etc.).  Each case works basically the

        // same way.  First space is allocated for the result.  Since we know the

        // types of the inputs we know the types of the output (for example,

        // real x real = real) so we need not allocate an imaginary part in

        // some cases, hence saving space.  This also means that if an output

        // array has no imaginary part in Mathcad, you will not see "+ 0*i"

        // added to every term.  If there is not enough space an error is 

        // issued.

        //

        // Once space is allocated, the product is determined according

        // to the formula derived in Mathcad.  The arithmetic is done 

        // using only the available real and imaginary parts, again

        // because we know the input types.

        //

        // Also note there is a regular check for user interruption.

        //

        // These 9 cases may seem redundant, but remember only one case will be

        // executed for any one set of inputs.  It may result in longer code 

        // but the end result is less memory is used and the calculations

        // are faster!





        switch(types)



	{

	case 0:      // Real x Real

	    

	    if ( !MathcadArrayAllocate( Product,  Psize, Psize, 

				       TRUE ,  FALSE ))  return  INSUFFICIENT_MEMORY;



	    

	    for (  j = 0; j < Psize; j++ )

	    {

		if ( isUserInterrupted() )

		{

		    MathcadArrayFree( Product );

		    return INTERRUPTED;

		}



		j1 = (int)  floor( (double) j / (double) n);

		j2 =  (int) fmod( (double) j , (double) n);



		for ( i = 0; i < Psize; i++ )

		{ 

		    i1 =  (int)  floor( (double) i / (double) n);

		    i2 =  (int) fmod( (double) i , (double) n);



		    Product->hReal[j][i] = 

			Array1->hReal[j1][i1]*Array2->hReal[j2][i2];

                }

	    } 

	    break;







	case 1:    // Pure x Real



	    if ( !MathcadArrayAllocate( Product,  Psize, Psize, 

				       TRUE ,  TRUE ))  return  INSUFFICIENT_MEMORY;



	    for (  j = 0; j < Psize; j++ )

	    {

		if ( isUserInterrupted() )

		{

		    MathcadArrayFree( Product );

		    return INTERRUPTED;

		}



		j1 = (int)  floor( (double) j / (double) n);

		j2 =  (int) fmod( (double) j , (double) n);



		for ( i = 0; i < Psize; i++ )

		{ 

		    i1 =  (int)  floor( (double) i / (double) n);

		    i2 =  (int) fmod( (double) i , (double) n);



		    Product->hImag[j][i] =  

			Array1->hImag[j1][i1]*Array2->hReal[j2][i2];

                }

	    } 

	    break;  





	case 2:    //Complex x Real



	    if ( !MathcadArrayAllocate( Product,  Psize, Psize, 

				       TRUE ,  TRUE ))  return  INSUFFICIENT_MEMORY;

  

             

	    for (  j = 0; j < Psize; j++ )

	    {

		if ( isUserInterrupted() )

		{

		    MathcadArrayFree( Product );

		    return INTERRUPTED;

		}



		j1 = (int)  floor( (double) j / (double) n);

		j2 =  (int) fmod( (double) j , (double) n);



		for ( i = 0; i < Psize; i++ )

		{ 

		    i1 =  (int)  floor( (double) i / (double) n);

		    i2 =  (int) fmod( (double) i , (double) n);



		    Product->hReal[j][i] = 

			Array1->hReal[j1][i1]*Array2->hReal[j2][i2]; 

		    Product->hImag[j][i] = 

			Array1->hImag[j1][i1]*Array2->hReal[j2][i2];

                }

	    } 

	    break;







	case 3:   // Real x Pure

	    if ( !MathcadArrayAllocate( Product,  Psize, Psize, 

				       TRUE ,  TRUE ))  return  INSUFFICIENT_MEMORY;



	    for (  j = 0; j < Psize; j++ )

	    {

		if ( isUserInterrupted() )

		{

		    MathcadArrayFree( Product );

		    return INTERRUPTED;

		}



		j1 = (int)  floor( (double) j / (double) n);

		j2 =  (int) fmod( (double) j , (double) n);



		for ( i = 0; i < Psize; i++ )

		{ 

		    i1 =  (int)  floor( (double) i / (double) n);

		    i2 =  (int) fmod( (double) i , (double) n);



		    Product->hImag[j][i] = 

			Array1->hReal[j1][i1]*Array2->hImag[j2][i2];

                }

	    } 

	    break;  





	case 4:   // Pure x Pure



	    if ( !MathcadArrayAllocate( Product,  Psize, Psize, 

				       TRUE ,  FALSE ))  return  INSUFFICIENT_MEMORY;



	    for (  j = 0; j < Psize; j++ )

	    {

		if ( isUserInterrupted() )

		{

		    MathcadArrayFree( Product );

		    return INTERRUPTED;

		}



		j1 = (int)  floor( (double) j / (double) n);

		j2 =  (int) fmod( (double) j , (double) n);



		for ( i = 0; i < Psize; i++ )

		{ 

		    i1 =  (int)  floor( (double) i / (double) n);

		    i2 =  (int) fmod( (double) i , (double) n);



		    Product->hReal[j][i] =

			-Array1->hImag[j1][i1]*Array2->hImag[j2][i2];



                }

	    } 

	    break;  









	case 5:   // Complex x Pure



	    if ( !MathcadArrayAllocate( Product,  Psize, Psize, 

				       TRUE ,  TRUE ))  return  INSUFFICIENT_MEMORY;



	    for (  j = 0; j < Psize; j++ )

	    {

		if ( isUserInterrupted() )

		{

		    MathcadArrayFree( Product );

		    return INTERRUPTED;

		}



		j1 = (int)  floor( (double) j / (double) n);

		j2 =  (int) fmod( (double) j , (double) n);



		for ( i = 0; i < Psize; i++ )

		{ 

		    i1 =  (int)  floor( (double) i / (double) n);

		    i2 =  (int) fmod( (double) i , (double) n);



		    Product->hReal[j][i] = 

			- Array1->hImag[j1][i1]*Array2->hImag[j2][i2];



		    Product->hImag[j][i] = 

			Array1->hReal[j1][i1]*Array2->hImag[j2][i2];

                }

	    } 

	    break;  





	case 6:   //Real x Complex



	    if ( !MathcadArrayAllocate( Product,  Psize, Psize, 

				       TRUE ,  TRUE ))  return  INSUFFICIENT_MEMORY;

  



	    for (  j = 0; j < Psize; j++ )

	    {

		if ( isUserInterrupted() )

		{

		    MathcadArrayFree( Product );

		    return INTERRUPTED;

		}



		j1 = (int)  floor( (double) j / (double) n);

		j2 =  (int) fmod( (double) j , (double) n);



		for ( i = 0; i < Psize; i++ )

		{ 

		    i1 =  (int)  floor( (double) i / (double) n);

		    i2 =  (int) fmod( (double) i , (double) n);



		    Product->hReal[j][i] = 

			Array1->hReal[j1][i1]*Array2->hReal[j2][i2];



		    Product->hImag[j][i] = 

			Array1->hReal[j1][i1]*Array2->hImag[j2][i2];

                }

	    } 

	    break;





	case 7:   // Pure x Complex



	    if ( !MathcadArrayAllocate( Product,  Psize, Psize, 

				       TRUE ,  TRUE ))  return  INSUFFICIENT_MEMORY;



	    for (  j = 0; j < Psize; j++ )

	    {

		if ( isUserInterrupted() )

		{

		    MathcadArrayFree( Product );

		    return INTERRUPTED;

		}



		j1 = (int)  floor( (double) j / (double) n);

		j2 =  (int) fmod( (double) j , (double) n);



		for ( i = 0; i < Psize; i++ )

		{ 

		    i1 =  (int)  floor( (double) i / (double) n);

		    i2 =  (int) fmod( (double) i , (double) n);



		    Product->hReal[j][i] = 

			-Array1->hImag[j1][i1]*Array2->hImag[j2][i2];



		    Product->hImag[j][i] = 

			Array1->hImag[j1][i1]*Array2->hReal[j2][i2];

                }

	    } 

	    break;  





	case 8:   // Complex x Complex



	    if ( !MathcadArrayAllocate( Product,  Psize, Psize, 

				       TRUE ,  TRUE ))  return  INSUFFICIENT_MEMORY;



	    for (  j = 0; j < Psize; j++ )

	    {

		if ( isUserInterrupted() )

		{

		    MathcadArrayFree( Product );

		    return INTERRUPTED;

		}



		j1 = (int)  floor( (double) j / (double) n);

		j2 =  (int) fmod( (double) j , (double) n);



		for ( i = 0; i < Psize; i++ )

		{ 

		    i1 =  (int)  floor( (double) i / (double) n);

		    i2 =  (int) fmod( (double) i , (double) n);



		    Product->hReal[j][i] = 

			Array1->hReal[j1][i1]*Array2->hReal[j2][i2] - 

			    Array1->hImag[j1][i1]*Array2->hImag[j2][i2];



		    Product->hImag[j][i] = 

			Array1->hReal[j1][i1]*Array2->hImag[j2][i2] + 

			    Array1->hImag[j1][i1]*Array2->hReal[j2][i2];

                }

	    } 

	    break;  



	}



        // All done.

	    return 0;

    }





    // Fill out a FUNCTIONINFO structure with

    // the information needed for registering the

    // function with Mathcad.

    FUNCTIONINFO kronecker = 

    {

    // Name by which Mathcad will recognize the function.

    "kronecker",        

    

    // Description of "multiply" parameters to be used

    // by the Insert Function dialog box.

    "M,N",   

    

    // Description of the function for the Insert Function dialog box       

    "Kronecker product of a square matrix M and a square matrix N",    

    

    // Pointer to the executable code,

    // i.e., code that should be executed

    // when a user types in "kronecker(M,N)="

    (LPCFUNCTION) KroneckerProduct,  

        

    // kronecker(M,N) returns a complex array.

    COMPLEX_ARRAY,

        

    // kronecker(M,N) takes on two arguments.

    2,   

    

    // Both arguments are complex arrays.

    { COMPLEX_ARRAY, COMPLEX_ARRAY} 

    };

    



 

// DLL entry point code.

    // The _CRT_INIT function is needed

    // if you are using Microsoft's 32 bit compiler.

 

    BOOL WINAPI _CRT_INIT(HINSTANCE hinstDLL, DWORD dwReason, LPVOID lpReserved);



    BOOL WINAPI  DllEntryPoint (HINSTANCE hDLL, DWORD dwReason, LPVOID lpReserved)

    {

        switch (dwReason)

        {

                case DLL_PROCESS_ATTACH:



                //

                // DLL is attaching to the address space of 

                // the current process.

                //

                    if (!_CRT_INIT(hDLL, dwReason, lpReserved)) 

                        return FALSE;

                

                

                    // Register the error message table.

                    // Note that if your function never returns

                    // an error, you do not need to 

                    // register an error message table.

                    if ( CreateUserErrorMessageTable(

                            hDLL, NUMBER_OF_ERRORS, myErrorMessageTable ) )

                        // And if the errors register OK,

                        // go ahead and

                        // register user function.

                        CreateUserFunction( hDLL, &kronecker );

                    break;





                case DLL_THREAD_ATTACH:

                case DLL_THREAD_DETACH:

                case DLL_PROCESS_DETACH:



                    if (!_CRT_INIT(hDLL, dwReason, lpReserved)) 

                        return FALSE;

                    break;

                    

        }

        return TRUE;

    }



#undef INTERRUPTED    

#undef INSUFFICIENT_MEMORY

#undef MUST_BE_REAL   

#undef NUMBER_OF_ERRORS     



    



