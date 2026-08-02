// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vternary_dot.h for the primary calling header

#ifndef VERILATED_VTERNARY_DOT___024ROOT_H_
#define VERILATED_VTERNARY_DOT___024ROOT_H_  // guard

#include "verilated.h"


class Vternary_dot__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vternary_dot___024root final {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(rst_n,0,0);
    VL_IN8(valid_in,0,0);
    VL_IN8(activation,7,0);
    VL_IN8(weight_enc,1,0);
    VL_OUT8(valid_out,0,0);
    VL_OUT8(debug_valid_in_out,0,0);
    VL_OUT8(debug_activation_out,7,0);
    VL_OUT8(debug_weight_enc_out,1,0);
    VL_OUT8(debug_valid_out_out,0,0);
    CData/*7:0*/ ternary_dot__DOT__weighted;
    CData/*0:0*/ ternary_dot__DOT__vector_done;
    CData/*0:0*/ ternary_dot__DOT__vector_done_delayed;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __VstlPhaseResult;
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__rst_n__0;
    CData/*0:0*/ __VactPhaseResult;
    CData/*0:0*/ __VnbaPhaseResult;
    SData/*15:0*/ ternary_dot__DOT__count;
    VL_OUT(acc_out,31,0);
    VL_OUT(debug_acc_out_out,31,0);
    IData/*31:0*/ ternary_dot__DOT__weighted_ext;
    IData/*31:0*/ ternary_dot__DOT__acc;
    IData/*31:0*/ ternary_dot__DOT__result_latch;
    IData/*31:0*/ ternary_dot__DOT__next_acc;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<QData/*63:0*/, 1> __VstlTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vternary_dot__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vternary_dot___024root(Vternary_dot__Syms* symsp, const char* namep);
    ~Vternary_dot___024root();
    VL_UNCOPYABLE(Vternary_dot___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
