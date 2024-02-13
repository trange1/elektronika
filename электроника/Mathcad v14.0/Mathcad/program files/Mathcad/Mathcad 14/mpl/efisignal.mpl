//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*
//*  Version : $Header: /MathcadClient/Trunk/efi/efisignal/mpl/efisignal.mpl   22   2006-10-19 10:57:57-04:00   cghaddar $
//*
//*
//*  Purpose : Defines the Mathcad Signal Function Library.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//*
//****************************************************************************

module EfiSignal where
{
// Module Imports

   import McdRun;

// Signal Processing Functions

   mc_bandpass    :: V{}->V{}->V{}->D{}->V{}          @"[efisignal?]Efi.Signal::bandpass";
   mc_bandstop    :: V{}->V{}->V{}->D{}->V{}          @"[efisignal?]Efi.Signal::bandstop";
   mc_burg        :: V{a}->V{}->V{}                   @"[efisignal?]Efi.Signal::burg";
   mc_ccepstrum   :: V{a}->V{a 2}                     @"[efisignal?]Efi.Signal::ccepstrum";
   mc_cepstrum    :: V{a}->V{a 2}                     @"[efisignal?]Efi.Signal::cepstrum";
   mc_chirpz      :: V{a}->V{}->V{}->V{}->V{a}        @"[efisignal?]Efi.Signal::chirp";
   mc_coherence   :: V{a}->V{b}->V{}->V{}->D{}->V{}   @"[efisignal?]Efi.Signal::coherence";
   mc_convol      :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::convol";
   mc_costr       :: V{a}->V{a}                       @"[efisignal?]Efi.Signal::costr";
   mc_covar       :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::covar";
   mc_cspectrum   :: V{a}->V{b}->V{}->V{}->D{}->V{a b}@"[efisignal?]Efi.Signal::cspectrum";
   mc_deconvol    :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::deconvol";
   mc_detrend     :: V{a}->V{a}                       @"[efisignal?]Efi.Signal::detrend";
   mc_dwavelet    :: V{}->V{}                         @"[efisignal?]Efi.Signal::dwavelet";
   mc_expsmooth   :: V{a}->V{}->V{a}                  @"[efisignal?]Efi.Signal::expsmooth";
   mc_fftfilt     :: V{a}->V{}->D{}->V{a}             @"[efisignal?]Efi.Signal::fftfilt";
   mc_gain        :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::gain";
   mc_dht         :: V{a}->V{a}                       @"[efisignal?]Efi.Signal::hartley";
   mc_highpass    :: V{}->V{}->D{}->V{}               @"[efisignal?]Efi.Signal::highpass";
   mc_hilbert     :: V{a}->V{a}                       @"[efisignal?]Efi.Signal::hilbert";
   mc_icostr      :: V{a}->V{a}                       @"[efisignal?]Efi.Signal::icostr";
   mc_idwavelet   :: V{}->V{}                         @"[efisignal?]Efi.Signal::idwavelet";
   mc_interpolate :: V{a}->V{}->V{a}                  @"[efisignal?]Efi.Signal::interpolate";
   mc_idht        :: V{a}->V{a}                       @"[efisignal?]Efi.Signal::invhartley";
   mc_isintr      :: V{a}->V{a}                       @"[efisignal?]Efi.Signal::isintr";
   mc_lcorr       :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::lcorr";
   mc_lowpass     :: V{}->V{}->D{}->V{}               @"[efisignal?]Efi.Signal::lowpass";
   mc_mag         :: V{a}->V{a}                       @"[efisignal?]Efi.Signal::magnitude";
   mc_makeri      :: V{a}->V{}->V{a}                  @"[efisignal?]Efi.Signal::makeri";
   mc_medfilt1d   :: V{a}->V{}->V{a}                  @"[efisignal?]Efi.Signal::medfilt1d";
   mc_movavg      :: V{a}->V{}->V{a}                  @"[efisignal?]Efi.Signal::movavg";
   mc_multirate   :: V{a}->V{}->V{}->D{}->V{a}        @"[efisignal?]Efi.Signal::multirate";
   mc_phase       :: V{a}->V{}                        @"[efisignal?]Efi.Signal::phase";
   mc_phasecor    :: V{}->V{}                         @"[efisignal?]Efi.Signal::phasecor";
   mc_plcorr      :: V{}->V{}                         @"[efisignal?]Efi.Signal::plcorr";
   mc_pspectrum   :: V{a}->V{}->V{}->D{}->V{a 2}      @"[efisignal?]Efi.Signal::pspectrum";
   mc_quantize    :: V{a}->V{}->V{a}                  @"[efisignal?]Efi.Signal::quantize";
   mc_recenter    :: V{a}->V{a}                       @"[efisignal?]Efi.Signal::fftshift";
   mc_remez       :: V{}->V{}->V{}->V{}->V{}          @"[efisignal?]Efi.Signal::remez";
   mc_resample    :: V{a}->V{}->V{}->V{a}             @"[efisignal?]Efi.Signal::resample";
   mc_response    :: V{a}->V{}->V{}->V{a}             @"[efisignal?]Efi.Signal::response";
   mc_sintr       :: V{a}->V{a}                       @"[efisignal?]Efi.Signal::sintr";
   mc_snr         :: V{a}->V{b}->V{}->V{}->D{}->V{}   @"[efisignal?]Efi.Signal::snr";
   mc_stft        :: V{a}->D{}->D{}->D{}->V{}         @"[efisignal?]Efi.Signal::stft";
   mc_twodconvol  :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::twoDconv";
   mc_timecorr    :: V{a}->V{}->V{}->V{}->D{}->V{}    @"[efisignal?]Efi.Signal::timecorr";
   mc_timefreq    :: V{a}->V{}->V{}->V{}->D{}->V{}    @"[efisignal?]Efi.Signal::timefreq";
   mc_walsh       :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::walsh";
   mc_yulew       :: V{a}->V{}->V{a}                  @"[efisignal?]Efi.Signal::yulew";

// Noise Functions

   mc_gaussn      :: V{}->V{}                         @"[efisignal?]Efi.Signal::gaussnoise";
   mc_onefn       :: V{}->V{}                         @"[efisignal?]Efi.Signal::onefnoise";
   mc_whiten      :: V{}->V{}                         @"[efisignal?]Efi.Signal::whitenoise";

// Window Functions

   mc_bessel      :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::bessel";
   mc_butter      :: V{}->V{}                         @"[efisignal?]Efi.Signal::butter";
   mc_blackman    :: V{}->V{}                         @"[efisignal?]Efi.Signal::blackman";
   mc_cheby       :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::cheby";
   mc_cheby1      :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::cheby1";
   mc_cheby2      :: V{}->V{}->V{}->V{}               @"[efisignal?]Efi.Signal::cheby2";
   mc_costaper    :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::costaper";
   mc_gaussian    :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::gaussian";
   mc_hamming     :: V{}->V{}                         @"[efisignal?]Efi.Signal::hamming";
   mc_hanning     :: V{}->V{}                         @"[efisignal?]Efi.Signal::hanning";
   mc_iirhigh     :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::iirhigh";
   mc_iirlow      :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::iirlow";
   mc_iirpass     :: V{}->V{}->V{}->V{}               @"[efisignal?]Efi.Signal::iirpass";
   mc_iirstop     :: V{}->V{}->V{}->V{}               @"[efisignal?]Efi.Signal::iirstop";
   mc_kaiser      :: V{}->V{}->V{}                    @"[efisignal?]Efi.Signal::kaiser";
   mc_nuttall     :: V{}->V{}                         @"[efisignal?]Efi.Signal::nuttall";
   mc_setwindow   :: V{}->V{}                         @"[efisignal?]Efi.Signal::setwindow";
   mc_taprect     :: V{}->V{}                         @"[efisignal?]Efi.Signal::taprect";
   mc_triangular  :: V{}->V{}                         @"[efisignal?]Efi.Signal::triangular";
}

//****************************************************************************
