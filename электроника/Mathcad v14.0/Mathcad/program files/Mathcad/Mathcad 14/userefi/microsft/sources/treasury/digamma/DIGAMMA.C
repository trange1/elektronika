/* $Id: digamma.c,v 1.1 1994/08/23 13:34:54 lorczak Exp $   */
/*                 $Revision: 1 $        */
#include "mcadincl.h"

#include "math.h"



#define PI 3.141592653589793



#define  DOMAIN_ERROR           1

#define  NUMBER_OF_ERRORS       1   



    // Table of error messages.

    // 

    // There is one message to signal the case of an input

    // for which digamma is undefined.  Note there is no interrupt

    // message, since this function simply does a little 

    // arithmetic and so will be be too fast to interrupt.



    char * myErrorMessageTable[NUMBER_OF_ERRORS] =  

    {    "domain error"

    };

    

    

    // This code executes the digamma function computation.

 

    LRESULT  DigammaFunction(  COMPLEXSCALAR * const p, 

        const COMPLEXSCALAR * const z)

    {

        double Ber[16];

        double xr,xi,c1,c2,norm,xm12r,xm12i,tr,ti,sumr,sumi,trtemp;

        double sr,cr,shi,chi,fac;



        unsigned int i, Situation;



        // check for integer inputs less than or equal to 0



        if ( (z->imag == 0.0) && (z->real <= 0.0) && (floor(z->real) == ceil(z->real)))

                        return MAKELRESULT(DOMAIN_ERROR, 1 );





        // Create a vector containing the values of the necessary 

        // even-order Bernoulli numbers.



        Ber[1] = 0.166666666666667;

        Ber[2] = -0.033333333333333;

        Ber[3] = 0.023809523809524;

        Ber[4] = -0.033333333333334;

        Ber[5] = 0.075757575757579;

        Ber[6] = -0.253113553113593;

        Ber[7] = 1.166666666667406;

        Ber[8] = -7.092156862763144;

        Ber[9] = 54.97117794542229;

        Ber[10] = -529.1242424458143;

        Ber[11] = 6.192123189415645e+3;

        Ber[12] = -8.658025317003414e+4;

        Ber[13] = 1.425517170386453e+6;

        Ber[14] = -2.729823135274775e+7;

        Ber[15] = 6.015808990172174e+8;



        // Given the argument to digamma determine which situation

        // is present (large real value, small real value, etc.).



              Situation = 3;

        if (z->real >= 7.0)

              Situation = 0;

        if (z->real <= -6.0)

              Situation = 1;

        if  ((z->real >=  0.0) && (z->real <7.0))

              Situation = 2;



        // If you examine the Mathcad implementation of the digamma algorithm

        // you'll see that for a given input z, the basic large value model

        // is subsequently applied to either

        //          x = z

        //          x = 1 - z

        //          x =  z + 7

        //          x = 8 - z

        // These are the 4 situations tested for above.  The corresponding value of

        // x is computed below.  





        switch(Situation)

         {

             case 0:

                      xr = z->real;

                      xi = z->imag;

                      break;



             case 1:

                      xr = 1.0 - z->real;

                      xi =  - z->imag;

                      break;



             case 2:

                      xr = 7.0 + z->real;

                      xi = z->imag;

                      break;

 

             case 3:

                      xr = 8.0 - z->real;

                      xi = -z->imag;

                      break;

         }



        // The value of x will now have real part xr >= 7.0 so

        // compute digamma(x) using the large x model.



        // Start with the summation involving the Bernoulli numbers.

        // The statements below compute the first term of the sum

        //              Ber[1]/(2*(x-1)^2)

        // Note we have to allow for complex arithmetic.



        c1 =  2.0*xi*(xr-1.0);

        c2 =  xr*xr - 2.0*xr - xi*xi +1.0;

        norm = c1*c1 + c2*c2;



        xm12r = c2/norm;

        xm12i = -c1/norm;



        tr = xm12r;

        ti = xm12i;

        sumr = (Ber[1]/2.0) * tr;

        sumi = (Ber[1]/2.0) * ti;



        // Compute the rest of the summation piece.



        for (i=2;i<16;i++)

            {

                  trtemp = xm12r*tr - xm12i*ti;

                  ti = xm12r*ti + xm12i*tr;

                  tr = trtemp;



                  sumr = sumr + (Ber[i]/(2.0 * (double) i))*tr;

                  sumi = sumi + (Ber[i]/(2.0 * (double) i))*ti;



             }





        // Compute 1/(2*(x-1)).



        tr = (xr - 1.0) /(2.0 * ((xr-1.0) * (xr-1.0) + xi*xi)) - sumr;

        ti = - xi /(2.0 * ((xr-1.0) * (xr-1.0) + xi*xi)) - sumi;



        // Finally, add the possibly complex natural log(x - 1).



        p->real = tr + 0.5*log((xr-1.0) * (xr-1.0) + xi*xi) ;

        p->imag = ti + atan2(xi,xr-1.0);





        // The structure p now contains the value Psi(x).

        // Depending on the situation, p must be adjusted by either

        //               Pi/tan(Pi*z)

        //  or           sum(1/(z+i),i=1..6)

        //  or both to produce Psi(z).

        //  The appropriate adjustment is done below.   



        switch(Situation)

         {

             case 0:          // Psi(x) = Psi(z)

                      break;



             case 1:         // adjust by Pi(tan(Pi*z)



                      // compute possibly complex Pi/tan(Pi*z)



                      sr = sin(PI*z->real);

                      cr = cos(PI*z->real);

                      shi = sinh(PI*z->imag);

                      chi = cosh(PI*z->imag);



                      fac = PI*(cr*cr + shi*shi)/(cr*cr*sr*sr + chi*chi*shi*shi);

                      tr = sr*cr*fac;

                      ti = -shi*chi*fac;



                      p->real -= tr;

                      p->imag -= ti;



                      break;



             case 2:          // adjust by summation



                      tr = 0.0;

                      ti = 0.0;

                      for (i=0;i<7;i++)

                           { 

                              tr = tr + (z->real + i)/ ((z->real + i)* (z->real + i) + (z->imag)*(z->imag));

                              ti = ti + 1.0/ ((z->real + i)* (z->real + i) + (z->imag)*(z->imag));

                            }



                      ti = -(z->imag)*ti;



                      p->real -= tr;

                      p->imag -= ti;



                      break;



             case 3:         // adjust by summation and value of Pi/tan(Pi*z)



                      sr = sin(PI*z->real);

                      cr = cos(PI*z->real);

                      shi = sinh(PI*z->imag);

                      chi = cosh(PI*z->imag);



                      fac = PI*(cr*cr + shi*shi)/(cr*cr*sr*sr + chi*chi*shi*shi);

                      tr = sr*cr*fac;

                      ti = -shi*chi*fac;



                      p->real -= tr;

                      p->imag -= ti;





                      tr = 0.0;

                      ti = 0.0;

                      for (i=1;i<8;i++)

                           { 

                              tr = tr + (i - z->real)/ ((i - z->real )* (i - z->real) + (z->imag)*(z->imag));

                              ti = ti + 1.0/ ((i - z->real )* (i - z->real)  + (z->imag)*(z->imag));

                            }



                      ti = (z->imag)*ti;



                      p->real -= tr;

                      p->imag -= ti;





                      break;

         }



        // All done.



        return 0;

    }



    // Fill out a FUNCTIONINFO structure with

    // the information needed for registering the

    // function with Mathcad.

    FUNCTIONINFO Psi = 

    {

    // First, the name by which Mathcad will recognize the function.

    "Psi",        

    

    // Second, adescription of "Psi" parameters to be used

    // by the Insert Function dialog box.

    "z",   

    

    // Then a description of the function for the Insert Function dialog box.       

    "Digamma function for complex z",    

    

    // Now a pointer to the executable code,

    // i.e., code that should be executed

    // when a user types in "Psi(z)=".

    (LPCFUNCTION)DigammaFunction,  

        

    // Psi(z) returns a complex array.

    COMPLEX_SCALAR,

        

    // Psi(z) takes one argument.

    1,   

    

    // a complex scalar.

    COMPLEX_SCALAR 

    };

    



    // DLL entry point code.

    // The _CRT_INIT function is needed

    // if you are using Microsoft's 32-bit compiler

 

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

                        // And if the errors register OK

                        // go ahead and

                        // register user function.

                        CreateUserFunction( hDLL, &Psi );

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



    



