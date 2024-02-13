//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*
//*  Version : $Header: /MathcadClient/Trunk/efi/efidebug/mpl/efidebug.mpl   4   2006-10-19 10:58:00-04:00   cghaddar $
//*
//*
//*  Purpose : Defines the Mathcad Debug Function Library.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//*
//****************************************************************************

module EfiDebug where
{
// Module Imports

   import McdRun;

// Debug Functions

   mc_format   :: (Object,String)->N (Object,String)->V{}         @"[efidebug?]Efi.Debug::format";
   mc_trace	   :: (i->o)->(Object,String)->N (Object,String)->V{}	@"[efidebug?]Efi.Debug::trace";
   mc_pause	   :: (i->o)->(Object,String)->N (Object,String)->V{}	@"[efidebug?]Efi.Debug::pause";
}

//****************************************************************************
