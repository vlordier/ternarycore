// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vternary_mac.h for the primary calling header

#ifndef VERILATED_VTERNARY_MAC___024ROOT_H_
#define VERILATED_VTERNARY_MAC___024ROOT_H_  // guard

#include "verilated.h"


class Vternary_mac__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vternary_mac___024root final {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(rst_n,0,0);
    VL_IN8(valid_in,0,0);
    VL_IN8(activation,7,0);
    VL_IN8(weight_enc,1,0);
    VL_OUT8(valid_out,0,0);
    CData/*7:0*/ ternary_mac__DOT__weighted;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __VstlPhaseResult;
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__rst_n__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__valid_in__0;
    CData/*7:0*/ __Vtrigprevexpr___TOP__activation__0;
    CData/*1:0*/ __Vtrigprevexpr___TOP__weight_enc__0;
    CData/*0:0*/ __VicoDidInit;
    CData/*0:0*/ __VicoPhaseResult;
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__1;
    CData/*0:0*/ __Vtrigprevexpr___TOP__rst_n__1;
    CData/*0:0*/ __VactPhaseResult;
    CData/*0:0*/ __VnbaPhaseResult;
    VL_IN(acc_in,31,0);
    VL_OUT(acc_out,31,0);
    IData/*31:0*/ __Vtrigprevexpr___TOP__acc_in__0;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<QData/*63:0*/, 1> __VstlTriggered;
    VlUnpacked<QData/*63:0*/, 2> __VicoTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vternary_mac__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vternary_mac___024root(Vternary_mac__Syms* symsp, const char* namep);
    ~Vternary_mac___024root();
    VL_UNCOPYABLE(Vternary_mac___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
