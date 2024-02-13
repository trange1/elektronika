//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*
//*  Version : $Header: /MathcadClient/Trunk/efi/efiimage/mpl/efiimage.mpl   22   2006-10-19 10:57:59-04:00   cghaddar $
//*
//*
//*  Purpose : Defines the Mathcad Image Function Library.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//*
//****************************************************************************

module EfiImage where
{
// Module Imports

   import McdRun;

// Image Functions

   mc_addnoise             :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::addnoise";
   mc_and                  :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::and";
   mc_augment3             :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::augment3";
   mc_binarize             :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::binarize";
   mc_binarize2            :: V{}->V{}->V{}->V{}->V{}->V{}      @"[efiimage?]Efi.Image::binarize2";
   mc_binarize_5F_auto     :: V{}->V{}                          @"[efiimage?]Efi.Image::binarize_auto";
   mc_blend                :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::blend";
   mc_canny                :: V{}->V{}->V{}->V{}->V{}           @"[efiimage?]Efi.Image::canny";
   mc_center               :: V{}->V{}                          @"[efiimage?]Efi.Image::center";
   mc_centsmooth           :: V{}->V{}                          @"[efiimage?]Efi.Image::centsmooth";
   mc_clip                 :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::clip";
   mc_close                :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::close";
   mc_cnvxhull             :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::cnvxhull";
   mc_colgrad              :: V{}->V{}                          @"[efiimage?]Efi.Image::colgrad";
   mc_compgrad             :: V{}->V{}                          @"[efiimage?]Efi.Image::compgrad";
   mc_concomp              :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::concomp";
   mc_convol2d             :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::convol2d";
   mc_convolve3            :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::convolve3";
   mc_convolve5            :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::convolve5";
   mc_dct2d                :: V{}->V{}                          @"[efiimage?]Efi.Image::dct2d";
   mc_diacrisp             :: V{}->V{}                          @"[efiimage?]Efi.Image::diacrisp";
   mc_difedge              :: V{}->V{}                          @"[efiimage?]Efi.Image::difedge";
   mc_dilate               :: O->V{}->V{}->V{}->V{}->V{}->V{}   @"[efiimage?]Efi.Image::dilate";
   mc_dilate4              :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::dilate4";
   mc_dilate8              :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::dilate8";
   mc_distform             :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::distform";
   mc_equalize             :: V{}->V{}                          @"[efiimage?]Efi.Image::equalize";
   mc_erode                :: O->V{}->V{}->V{}->V{}->V{}->V{}   @"[efiimage?]Efi.Image::erode";
   mc_erode4               :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::erode4";
   mc_erode8               :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::erode8";
   mc_extract              :: V{}->D{}->V{}                     @"[efiimage?]Efi.Image::extract2";
   mc_freichen             :: V{}->V{}                          @"[efiimage?]Efi.Image::freichen";
   mc_funconv              :: V{}->(V{}->V{})->V{}              @"[efiimage?]Efi.Image::funconv";
   mc_funcdeconv           :: V{}->(V{}->V{})->V{}->V{}         @"[efiimage?]Efi.Image::funcdeconv";
   mc_funmap               :: V{}->(V{}->V{})->V{}              @"[efiimage?]Efi.Image::funmap";
   mc_gaussconv            :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::gaussconv";
   mc_gaussdeconv          :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::gaussdeconv";
   mc_getnoise             :: V{}->V{}                          @"[efiimage?]Efi.Image::getnoise";
   mc_gray_5F_close        :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::gray_close";
   mc_gray_5F_dilate       :: O->V{}->V{}->V{}->V{}->V{}        @"[efiimage?]Efi.Image::gray_dilate";
   mc_gray_5F_erode        :: O->V{}->V{}->V{}->V{}->V{}        @"[efiimage?]Efi.Image::gray_erode";
   mc_gray_5F_open         :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::gray_open";
   mc_gray_5F_to_5F_rgb    :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::gray_to_rgb";
   mc_hist2d               :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::hist2d";
   mc_hls_5F_to_5F_rgb     :: V{}->D{}->D{}->V{}                @"[efiimage?]Efi.Image::hls_to_rgb3";
   mc_horzflip             :: V{}->V{}                          @"[efiimage?]Efi.Image::horzflip";
   mc_hsv_5F_to_5F_rgb     :: V{}->D{}->D{}->V{}                @"[efiimage?]Efi.Image::hsv_to_rgb3";
   mc_idct2d               :: V{}->V{}                          @"[efiimage?]Efi.Image::idct2d";
   mc_imhist               :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::imhist";
   mc_imhist2              :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::imhist2";
   mc_immse                :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::immse";
   mc_imsnr                :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::imsnr";
   mc_invert               :: V{}->V{}                          @"[efiimage?]Efi.Image::invert";
   mc_invert2              :: V{}->V{}                          @"[efiimage?]Efi.Image::invert2";
   mc_imquant              :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::imquant";
   mc_imquant2             :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::imquant2";
   mc_iwave2d              :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::iwave2d";
   mc_kirsch               :: V{}->V{}                          @"[efiimage?]Efi.Image::kirsch";
   mc_laplace4             :: V{}->V{}                          @"[efiimage?]Efi.Image::laplace4";
   mc_laplace8             :: V{}->V{}                          @"[efiimage?]Efi.Image::laplace8";
   mc_laplace24            :: V{}->V{}                          @"[efiimage?]Efi.Image::laplace24";
   mc_levelmap             :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::levelmap";
   mc_mask                 :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::mask";
   mc_matconv              :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::matconv";
   mc_matdeconv            :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::matdeconv";
   mc_medfilt              :: V{}->V{}                          @"[efiimage?]Efi.Image::medfilt";
   mc_moment_5F_invariant  :: V{}->V{}                          @"[efiimage?]Efi.Image::moment_invariant";
   mc_open                 :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::open";
   mc_or                   :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::or";
   mc_orthocrisp           :: V{}->V{}                          @"[efiimage?]Efi.Image::orthocrisp";
   mc_orthocrisp5          :: V{}->V{}                          @"[efiimage?]Efi.Image::orthocrisp5";
   mc_orthosmooth          :: V{}->V{}                          @"[efiimage?]Efi.Image::orthosmooth";
   mc_orthosmooth5         :: V{}->V{}                          @"[efiimage?]Efi.Image::orthosmooth5";
   mc_prewitt              :: V{}->V{}                          @"[efiimage?]Efi.Image::prewitt";
   mc_putregion            :: O->V{}->V{}->V{}->V{}->V{}        @"[efiimage?]Efi.Image::putregion";
   mc_quantfilt            :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::quantfilt";
   mc_relerror             :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::relerror";
   mc_replace              :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::replace";
   mc_reg_5F_grow          :: V{}->V{}->V{}->V{}->V{}           @"[efiimage?]Efi.Image::reg_grow";
   mc_rgb_5F_to_5F_gray    :: V{}->D{}->D{}->V{}                @"[efiimage?]Efi.Image::rgb_to_gray3";
   mc_rgb_5F_to_5F_hls     :: V{}->D{}->D{}->V{}                @"[efiimage?]Efi.Image::rgb_to_hls3";
   mc_rgb_5F_to_5F_hsv     :: V{}->D{}->D{}->V{}                @"[efiimage?]Efi.Image::rgb_to_hsv3";
   mc_rgb_5F_to_5F_yiq     :: V{}->D{}->D{}->V{}                @"[efiimage?]Efi.Image::rgb_to_yiq3";
   mc_rgb_5F_to_5F_ycbcr   :: V{}->D{}->D{}->V{}                @"[efiimage?]Efi.Image::rgb_to_ycbcr3";
   mc_roberts              :: V{}->V{}                          @"[efiimage?]Efi.Image::roberts";
   mc_robinson3            :: V{}->V{}                          @"[efiimage?]Efi.Image::robinson3";
   mc_robinson5            :: V{}->V{}                          @"[efiimage?]Efi.Image::robinson5";
   mc_rotate               :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::rotate";
   mc_rotate90             :: V{}->V{}                          @"[efiimage?]Efi.Image::rotate90";
   mc_rotate180            :: V{}->V{}                          @"[efiimage?]Efi.Image::rotate180";
   mc_rotate270            :: V{}->V{}                          @"[efiimage?]Efi.Image::rotate270";
   mc_rowgrad              :: V{}->V{}                          @"[efiimage?]Efi.Image::rowgrad";
   mc_scale                :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::scale";
   mc_shape_5F_features    :: V{}->V{}                          @"[efiimage?]Efi.Image::shape_features";
   mc_skeleton             :: V{}->V{}                          @"[efiimage?]Efi.Image::skeleton";
   mc_skeleton2            :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::skeleton2";
   mc_sobel                :: V{}->V{}                          @"[efiimage?]Efi.Image::sobel";
   mc_subcolor             :: O->V{}->V{}->V{}->V{}->V{}->V{}   @"[efiimage?]Efi.Image::subcolor";
   mc_thin                 :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::thin";
   mc_threshold            :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::threshold";
   mc_translate            :: V{}->V{}->V{}->V{}->V{}           @"[efiimage?]Efi.Image::translate";
   mc_unicrisp             :: V{}->V{}                          @"[efiimage?]Efi.Image::unicrisp";
   mc_unismooth            :: V{}->V{}                          @"[efiimage?]Efi.Image::unismooth";
   mc_unismooth5           :: V{}->V{}                          @"[efiimage?]Efi.Image::unismooth5";
   mc_vertflip             :: V{}->V{}                          @"[efiimage?]Efi.Image::vertflip";
   mc_warp                 :: O->V{}->V{}->V{}                  @"[efiimage?]Efi.Image::warp";
   mc_wave2d               :: V{}->V{}->V{}                     @"[efiimage?]Efi.Image::wave2d";
   mc_wavescale            :: V{}->V{}->V{}->V{}->V{}           @"[efiimage?]Efi.Image::wavescale";
   mc_wiener2d             :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::wiener2d";
   mc_ycbcr_5F_to_5F_rgb   :: V{}->D{}->D{}->V{}                @"[efiimage?]Efi.Image::ycbcr_to_rgb3";
   mc_yiq_5F_to_5F_rgb     :: V{}->D{}->D{}->V{}                @"[efiimage?]Efi.Image::yiq_to_rgb3";
   mc_zoom                 :: V{}->V{}->V{}->V{}                @"[efiimage?]Efi.Image::zoom";

   mc_READRAW              :: C->V{}->V{}->V{}->V{}->V{}->V{}->V{}  @"[efiimage?]Efi.Image::imgread_raw";
   mc_WRITERAW             :: C->V{}->V{}->V{}->V{}->V{}            @"[efiimage?]Efi.Image::imgwrite_raw";
}

//****************************************************************************
