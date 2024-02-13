#include "mcadincl.h"
    
    LRESULT transposeFunction( LPCOMPLEXARRAY      Y,
                                LPCCOMPLEXARRAY     X );

    FUNCTIONINFO    transpose = 
    { 
    "transpose",                                    // Name by which mathcad will recognize the function
    "X",                                            // transpose will be called as transpose(X)
    "returns a transpose of X"  ,                   // description of transpose(X)
    (LPCFUNCTION)transposeFunction,                 // pointer to the executible code
    COMPLEX_ARRAY,                                  // the output is a complex array
    1,                                              // the function takes on 1 argument
    { COMPLEX_ARRAY}    // the input type is a complex array
    };
    
    
    LRESULT transposeFunction( LPCOMPLEXARRAY      Y,
                                LPCCOMPLEXARRAY     X   )
    {
        unsigned int i, j;
        
        // allocate space for the return array Y
        if ( !MathcadArrayAllocate( Y,  // allocate space for Y 
                    X->cols,    //  with X cols
                    X->rows,    //  and X rows
                    X->hReal != NULL,   //  allocate the real part if X has a real part 
                    X->hImag != NULL    //  allocate the imaginary part if X has 
                                //  an imaginary part
                    ) ) 
            return 2;           // if allocation is insufficient
                                // return the error code
                        
        
        
        for ( i = 0; i < Y->cols; i++ )
        {
            if ( isUserInterrupted( ) ) 
            {
                MathcadArrayFree( Y );
                return  3;      // user interrupted
            }
            
            for ( j = 0; j < Y->rows; j++ )     
            {
                
                if ( X->hReal != NULL )     
                    Y->hReal[i][j] = X->hReal[j][i];
                if ( X->hImag != NULL )     
                    Y->hImag[i][j] = X->hImag[j][i]; 
            }
        }               
        
        return 0;               // return 0 to indicate there was no error
            
    }           
    
