#include "mcadincl.h"
    
    extern FUNCTIONINFO realsum, transpose;
    
    
    char *ErrorMessageTable[] = {
    "argument must be real",    //  error 1 --  argument must be real
    "insufficient memory",      //  error 2 --  memory allocation error
    "interrupted"               //  error 3 --  execution interrupted
    };


BOOL WINAPI _CRT_INIT(HINSTANCE hinstDLL, DWORD dwReason, LPVOID lpReserved);

BOOL WINAPI DllEntryPoint (HANDLE hDLL, DWORD dwReason, LPVOID lpReserved)
{
  switch (dwReason)
  {
    case DLL_PROCESS_ATTACH:
    {

      // DLL is attaching to the address space of the current process.
      //
        if (!_CRT_INIT(hDLL, dwReason, lpReserved)) {
            return FALSE;
        }

        if (!CreateUserErrorMessageTable( hDLL, 3, ErrorMessageTable ) )
            break;
        
        if ( CreateUserFunction( hDLL, &realsum ) == NULL )
            break;
                        
        CreateUserFunction( hDLL, &transpose);            
        
        break;
    }

    case DLL_THREAD_ATTACH:        // A new thread is being created in the current process.
    case DLL_THREAD_DETACH:        // A thread is exiting cleanly.
    case DLL_PROCESS_DETACH:      // The calling process is detaching the DLL from its address space.

      if (!_CRT_INIT(hDLL, dwReason, lpReserved))
        return FALSE;
      break;
  }
  return TRUE;
}

    

