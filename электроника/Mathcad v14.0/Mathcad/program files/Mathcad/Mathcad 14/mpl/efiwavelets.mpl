//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*
//*  Version : $Header: /MathcadClient/Trunk/efi/efiwavelets/mpl/efiwavelets.mpl   7   2006-10-19 10:57:50-04:00   cghaddar $
//*
//*
//*  Purpose : Defines the Mathcad Wavelets Function Library.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//*
//****************************************************************************

module EfiWavelets where
{
// Module Imports

   import McdRun;

// Wavelets Functions

   mc_applybs           :: V{}->V{}->(V{}->V{})->V{}                                @"[efiwavelets?]Efi.Wavelets::applybs";
   mc_applytbl          :: V{}->(V{}->V{})->V{}                                     @"[efiwavelets?]Efi.Wavelets::applytbl";
   mc_basis_5F_display2d:: V{}->V{}                                                 @"[efiwavelets?]Efi.Wavelets::basis_display2d";
   mc_best_5F_basis     :: V{}->(V{}->V{})->V{}                                     @"[efiwavelets?]Efi.Wavelets::best_basis";
   mc_bl                :: V{}->V{}                                                 @"[efiwavelets?]Efi.Wavelets::bl";
   mc_Bspline           :: V{}->V{}->V{}                                            @"[efiwavelets?]Efi.Wavelets::Bspline";
   mc_coiflet           :: V{}->V{}                                                 @"[efiwavelets?]Efi.Wavelets::coiflet";
   mc_symmlet           :: V{}->V{}                                                 @"[efiwavelets?]Efi.Wavelets::symmlet";
   mc_daublet           :: V{}->V{}                                                 @"[efiwavelets?]Efi.Wavelets::daublet";
   mc_cpt               :: V{}->V{}->V{}                                            @"[efiwavelets?]Efi.Wavelets::cpt";
   mc_lct               :: V{}->V{}->(V{}->V{})->V{}                                @"[efiwavelets?]Efi.Wavelets::lct";
   mc_ilct              :: V{}->V{}->V{}->(V{}->V{})->V{}                           @"[efiwavelets?]Efi.Wavelets::ilct";
   mc_icpt              :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::icpt";
   mc_create_5F_level   :: V{}->V{}->V{}                                            @"[efiwavelets?]Efi.Wavelets::create_level";
   mc_evaltbl           :: V{}->(V{}->V{})->V{}                                     @"[efiwavelets?]Efi.Wavelets::evaltbl";
   mc_extract_5F_basis  :: V{}->V{}->V{}                                            @"[efiwavelets?]Efi.Wavelets::extract_basis";
   mc_dlfather          :: V{}->V{}->D{}->D{}->V{}                                  @"[efiwavelets?]Efi.Wavelets::dlfather";
   mc_dlfather2d        :: V{}->V{}->V{}->D{}->D{}->D{}->V{}                        @"[efiwavelets?]Efi.Wavelets::dlfather2d";
   mc_dlmother          :: V{}->V{}->D{}->D{}->V{}                                  @"[efiwavelets?]Efi.Wavelets::dlmother";
   mc_dlmother2d        :: V{}->V{}->V{}->V{}->D{}->D{}->D{}->V{}                   @"[efiwavelets?]Efi.Wavelets::dlmother2d";
   mc_dlwavelet         :: V{}->V{}->V{}->V{}->V{}->D{}->D{}->V{}                   @"[efiwavelets?]Efi.Wavelets::dlwavelet";
   mc_dlwavelet2d       :: V{}->V{}->V{}->V{}->V{}->V{}->V{}->V{}->D{}->D{}->V{}    @"[efiwavelets?]Efi.Wavelets::dlwavelet2d";
   mc_dwt               :: V{}->V{}->V{}->D{}->D{}->V{}                             @"[efiwavelets?]Efi.Wavelets::dwt";
   mc_dwti              :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::dwti";
   mc_dwts              :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::dwts";
   mc_evalbs            :: V{}->V{}->(V{}->V{})->V{}                                @"[efiwavelets?]Efi.Wavelets::evalbs";
   mc_wavelet           :: V{}->V{}->V{}->V{}->V{}->D{}->D{}->V{}                   @"[efiwavelets?]Efi.Wavelets::wavelet";
   mc_father            :: V{}->V{}->D{}->D{}->V{}                                  @"[efiwavelets?]Efi.Wavelets::father";
   mc_wavelet2d         :: V{}->V{}->V{}->V{}->V{}->V{}->V{}->V{}->D{}->D{}->V{}    @"[efiwavelets?]Efi.Wavelets::wavelet2d";
   mc_father2d          :: V{}->V{}->V{}->D{}->D{}->D{}->V{}                        @"[efiwavelets?]Efi.Wavelets::father2d";
   mc_get_5F_detail     :: V{}->V{}->V{}                                            @"[efiwavelets?]Efi.Wavelets::get_detail";
   mc_get_5F_detail2d   :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::get_detail2d";
   mc_get_5F_smooth     :: V{}->V{}->V{}                                            @"[efiwavelets?]Efi.Wavelets::get_smooth";
   mc_get_5F_smooth2d   :: V{}->V{}->V{}                                            @"[efiwavelets?]Efi.Wavelets::get_smooth2d";
   mc_get_5F_subband    :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::get_subband";
   mc_get_5F_subband2d  :: V{}->V{}->V{}->V{}->V{}                                  @"[efiwavelets?]Efi.Wavelets::get_subband2d";
   mc_idwt              :: V{}->V{}->V{}->D{}->D{}->V{}                             @"[efiwavelets?]Efi.Wavelets::idwt";
   mc_idwti             :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::idwti";
   mc_idwts             :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::idwts";
   mc_iwpt              :: V{}->V{}->V{}->D{}->D{}->V{}                             @"[efiwavelets?]Efi.Wavelets::iwpt";
   mc_iwpti             :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::iwpti";
   mc_iwpts             :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::iwpts";
   mc_mother            :: V{}->V{}->D{}->D{}->V{}                                  @"[efiwavelets?]Efi.Wavelets::mother";
   mc_mother2d          :: V{}->V{}->V{}->V{}->D{}->D{}->D{}->V{}                   @"[efiwavelets?]Efi.Wavelets::mother2d";
   mc_put_5F_detail     :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::put_detail";
   mc_put_5F_detail2d   :: V{}->V{}->V{}->V{}->V{}                                  @"[efiwavelets?]Efi.Wavelets::put_detail2d";
   mc_put_5F_smooth     :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::put_smooth";
   mc_put_5F_smooth2d   :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::put_smooth2d";
   mc_put_5F_subband    :: V{}->V{}->V{}->V{}->V{}                                  @"[efiwavelets?]Efi.Wavelets::put_subband";
   mc_put_5F_subband2d  :: V{}->V{}->V{}->V{}->V{}->V{}                             @"[efiwavelets?]Efi.Wavelets::put_subband2d";
   mc_swaveterp         :: V{}->V{}->V{}->V{}->V{}->V{}                             @"[efiwavelets?]Efi.Wavelets::swaveterp";
   mc_swaveterp2d       :: V{}->V{}->V{}->V{}->V{}->V{}->V{}->V{}                   @"[efiwavelets?]Efi.Wavelets::swaveterp2d";
   mc_wavebs            :: V{}->V{}->V{}                                            @"[efiwavelets?]Efi.Wavelets::wavebs";
   mc_waveterp          :: V{}->V{}->V{}->V{}->V{}->D{}->D{}->V{}                   @"[efiwavelets?]Efi.Wavelets::waveterp";
   mc_waveterp2d        :: V{}->V{}->V{}->V{}->V{}->V{}->V{}->D{}->D{}->V{}         @"[efiwavelets?]Efi.Wavelets::waveterp2d";
   mc_wpt               :: V{}->V{}->V{}->D{}->D{}->V{}                             @"[efiwavelets?]Efi.Wavelets::wpt";
   mc_wpti              :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::wpti";
   mc_wpts              :: V{}->V{}->V{}->V{}                                       @"[efiwavelets?]Efi.Wavelets::wpts";
}

//****************************************************************************
