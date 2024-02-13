//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*
//*  Version : $Header: /MathcadClient/Trunk/efi/efidata/mpl/efidata.mpl   20   2006-10-19 10:58:00-04:00   cghaddar $
//*
//*
//*  Purpose : Defines the Mathcad Data Function Library.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//*
//****************************************************************************

module EfiData where
{
// Module Imports

   import McdRun;

// Data Analysis Functions

   mc_percentile     :: V{a}->V{}->V{a}                     @"[efidata?]Efi.Data::percentile";
   mc_polyiter       :: V{}->V{}->V{}->V{}->V{}->V{}        @"[efidata?]Efi.Data::polyiter";
   mc_qqplot         :: V{}->D{}->V{}                       @"[efidata?]Efi.Data::qqplot";
   mc_Rank           :: V{a}->V{}                           @"[efidata?]Efi.Data::Rank";
   mc_order          :: O->V{}->V{}                         @"[efidata?]Efi.Data::order";
   mc_Scale          :: V{a}->V{a}->V{a}->V{a}              @"[efidata?]Efi.Data::Scale";
   mc_VSmooth        :: T->V{a}->V{}->V{a}                  @"[efidata?]Efi.Data::VSmooth";
   mc_Thiele         :: V{a}->V{}->V{a}->V{}                @"[efidata?]Efi.Data::Thiele";
   mc_Thielecoeff    :: V{}->V{}->V{}                       @"[efidata?]Efi.Data::Thielecoeff";
   mc_localmin       :: N(V{})->V{}                         @"[efidata?]Efi.Data::localmin";
   mc_localmax       :: N(V{})->V{}                         @"[efidata?]Efi.Data::localmax";
   mc_trim           :: O->V{a}->V{}->V{a}                  @"[efidata?]Efi.Data::trim";
   mc_markNaN        :: O->V{a}->V{}->V{a}                  @"[efidata?]Efi.Data::markNaN";
   mc_matchNaN       :: O->V{}->V{}                         @"[efidata?]Efi.Data::matchNaN";
   mc_filterNaN      :: V{a}->V{a}                          @"[efidata?]Efi.Data::filterNaN";

// Lookup Functions

   mc_Match          :: O->T->V{a}->V{a}->V{}->V{}          @"[efimatrix?]Efi.EfiLookup::Match";
   mc_Lookup         :: O->T->V{a}->V{a}->V{c}->V{}->V{c}   @"[efimatrix?]Efi.EfiLookup::Lookup";
   mc_Hlookup        :: O->T->V{a}->V{a}->V{}->V{}->V{a}    @"[efimatrix?]Efi.EfiLookup::Hlookup";
   mc_Vlookup        :: O->T->V{a}->V{a}->V{}->V{}->V{a}    @"[efimatrix?]Efi.EfiLookup::Vlookup";
   mc_VHlookup       :: O->T->V{a}->V{a}->V{a}->V{}->V{a}   @"[efimatrix?]Efi.EfiLookup::VHlookup";
   mc_vhlookup       :: O->T->V{a}->V{a}->V{a}->V{a}        @"[efimatrix?]Efi.EfiLookup::vhlookup";

// Inutech Functions

   mc_confidence     :: V{}->V{}->(V{}->a)->V{}->V{}->V{}   @"[efidata?]Efi.Data::confidence";
   mc_rationalfit    :: N(V{})->V{}                         @"[efidata?]Efi.Data::rationalfit";
   mc_rationalfitnp  :: N(V{})->V{}                         @"[efidata?]Efi.Data::rationalfitnp";
   mc_LeastSquaresFit:: V{}->V{}->(V{}->a)->V{}->V{}->D{}->D{}->D{}->V{} @"[efidata?]Efi.Data::LeastSquaresFit";
   mc_Grubbs         :: O->V{a}->V{}->V{}                   @"[efidata?]Efi.Data::Grubbs";
   mc_ThreeSigma     :: O->V{}->V{}                         @"[efidata?]Efi.Data::ThreeSigma";
   mc_GrubbsClassic  :: O->V{a}->V{}->V{}                   @"[efidata?]Efi.Data::GrubbsClassic";
   mc_Spline2        :: N(V{})->V{}                         @"[efidata?]Efi.Data::Spline2";
   mc_Binterp        :: V{}->V{}->V{}                       @"[efidata?]Efi.Data::Binterp";
   mc_DWS            :: V{}->V{}                            @"[efidata?]Efi.Data::DWS";
   mc_Nipals         :: V{}->V{}->V{}->V{}->V{}->V{}        @"[efidata?]Efi.Data::Nipals";
   mc_Nipals2        :: V{}->V{}->V{}                       @"[efidata?]Efi.Data::Nipals2";
   mc_loadings       :: V{}->V{}                            @"[efidata?]Efi.Data::loadings";
   mc_scores         :: V{}->V{}                            @"[efidata?]Efi.Data::scores";
   mc_PCAeigenvals   :: V{}->V{}                            @"[efidata?]Efi.Data::PCAeigenvals";
   mc_PCAvariance    :: V{}->V{}                            @"[efidata?]Efi.Data::PCAvariance";

// Numerical Recipes Functions

   mc_contingtbl     :: V{}->V{}                            @"[efidata?]Efi.Data::contingtbl";
   mc_Ftest          :: V{a}->V{a}->V{}                     @"[efidata?]Efi.Data::Ftest";
   mc_kendltau       :: V{}->V{}->V{}                       @"[efidata?]Efi.Data::kendltau";
   mc_kendltau2      :: V{}->V{}                            @"[efidata?]Efi.Data::kendltau2";
   mc_polycoeff      :: V{}->V{}->V{}                       @"[efidata?]Efi.Data::polycoeff";
   mc_polyint        :: V{a}->V{b}->V{a}->V{b}              @"[efidata?]Efi.Data::polyint";
   mc_rationalint    :: V{a}->V{b}->V{a}->V{b}              @"[efidata?]Efi.Data::rationalint";
   mc_Spear          :: V{}->V{}->V{}                       @"[efidata?]Efi.Data::Spear";
   mc_Bicubic2D      :: V{a}->V{b}->V{c}->V{a}->V{b}->V{c}  @"[efidata?]Efi.Data::Bicubic2D";
}

//****************************************************************************
