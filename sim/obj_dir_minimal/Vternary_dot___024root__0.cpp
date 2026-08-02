// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vternary_dot.h for the primary calling header

#include "Vternary_dot__pch.h"

bool Vternary_dot___024root___trigger_anySet__ico(const VlUnpacked<QData/*63:0*/, 2> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___trigger_anySet__ico\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((2U > n));
    return (0U);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vternary_dot___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 2> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Vternary_dot___024root___eval_phase__ico(Vternary_dot___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___eval_phase__ico\n"); );
    Vternary_dot__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VicoExecute;
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__ico
        vlSelfRef.__VicoTriggered[0U] = (QData)((IData)(
                                                        ((((IData)(vlSelfRef.weight_enc) 
                                                           != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__weight_enc__0)) 
                                                          << 4U) 
                                                         | (((((IData)(vlSelfRef.activation) 
                                                               != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__activation__0)) 
                                                              << 3U) 
                                                             | (((IData)(vlSelfRef.valid_in) 
                                                                 != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__valid_in__0)) 
                                                                << 2U)) 
                                                            | ((((IData)(vlSelfRef.rst_n) 
                                                                 != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__rst_n__0)) 
                                                                << 1U) 
                                                               | ((IData)(vlSelfRef.clk) 
                                                                  != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clk__0)))))));
        vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
        vlSelfRef.__Vtrigprevexpr___TOP__rst_n__0 = vlSelfRef.rst_n;
        vlSelfRef.__Vtrigprevexpr___TOP__valid_in__0 
            = vlSelfRef.valid_in;
        vlSelfRef.__Vtrigprevexpr___TOP__activation__0 
            = vlSelfRef.activation;
        vlSelfRef.__Vtrigprevexpr___TOP__weight_enc__0 
            = vlSelfRef.weight_enc;
        if (VL_UNLIKELY(((1U & (~ (IData)(vlSelfRef.__VicoDidInit)))))) {
            vlSelfRef.__VicoDidInit = 1U;
            vlSelfRef.__VicoTriggered[0U] = (1ULL | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (2ULL | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (4ULL | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (8ULL | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (0x0000000000000010ULL 
                                             | vlSelfRef.__VicoTriggered[0U]);
        }
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vternary_dot___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
    }
#endif
    __VicoExecute = Vternary_dot___024root___trigger_anySet__ico(vlSelfRef.__VicoTriggered);
    if (__VicoExecute) {
        {
            // Inlined CFunc: _eval_ico
            if ((0x0000000000000018ULL & vlSelfRef.__VicoTriggered[0U])) {
                {
                    // Inlined CFunc: _ico_comb__TOP__0
                    vlSelfRef.ternary_dot__DOT__weighted 
                        = (0x000001ffU & (((1U == (IData)(vlSelfRef.weight_enc))
                                            ? VL_EXTENDS_II(9,8, (IData)(vlSelfRef.activation))
                                            : (- VL_EXTENDS_II(9,8, (IData)(vlSelfRef.activation)))) 
                                          & (- (IData)(
                                                       (0U 
                                                        != (IData)(vlSelfRef.weight_enc))))));
                    vlSelfRef.ternary_dot__DOT__next_acc 
                        = (vlSelfRef.ternary_dot__DOT__acc 
                           + (((- (IData)((1U & ((IData)(vlSelfRef.ternary_dot__DOT__weighted) 
                                                 >> 8U)))) 
                               << 9U) | (IData)(vlSelfRef.ternary_dot__DOT__weighted)));
                }
            }
        }
    }
    return (__VicoExecute);
}

bool Vternary_dot___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___trigger_anySet__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

void Vternary_dot___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___trigger_orInto__act_vec_vec\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = (out[n] | in[n]);
        n = ((IData)(1U) + n);
    } while ((0U >= n));
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vternary_dot___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Vternary_dot___024root___eval_phase__act(Vternary_dot___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___eval_phase__act\n"); );
    Vternary_dot__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__act
        vlSelfRef.__VactTriggered[0U] = (QData)((IData)(
                                                        ((((~ (IData)(vlSelfRef.rst_n)) 
                                                           & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__rst_n__1)) 
                                                          << 1U) 
                                                         | ((IData)(vlSelfRef.clk) 
                                                            & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clk__1))))));
        vlSelfRef.__Vtrigprevexpr___TOP__clk__1 = vlSelfRef.clk;
        vlSelfRef.__Vtrigprevexpr___TOP__rst_n__1 = vlSelfRef.rst_n;
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vternary_dot___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    Vternary_dot___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    return (0U);
}

void Vternary_dot___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

bool Vternary_dot___024root___eval_phase__nba(Vternary_dot___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___eval_phase__nba\n"); );
    Vternary_dot__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = Vternary_dot___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        {
            // Inlined CFunc: _eval_nba
            if ((3ULL & vlSelfRef.__VnbaTriggered[0U])) {
                {
                    // Inlined CFunc: _nba_sequent__TOP__0
                    SData/*15:0*/ __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count;
                    __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count = 0;
                    __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count 
                        = vlSelfRef.ternary_dot__DOT__count;
                    if (vlSelfRef.rst_n) {
                        if (vlSelfRef.valid_in) {
                            if ((1U == (IData)(vlSelfRef.ternary_dot__DOT__count))) {
                                vlSelfRef.acc_out = vlSelfRef.ternary_dot__DOT__next_acc;
                                vlSelfRef.ternary_dot__DOT__vector_done = 1U;
                                vlSelfRef.ternary_dot__DOT__acc = 0U;
                                __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count = 8U;
                            } else {
                                __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count 
                                    = (0x0000ffffU 
                                       & ((IData)(vlSelfRef.ternary_dot__DOT__count) 
                                          - (IData)(1U)));
                                vlSelfRef.ternary_dot__DOT__vector_done = 0U;
                                vlSelfRef.ternary_dot__DOT__acc 
                                    = vlSelfRef.ternary_dot__DOT__next_acc;
                            }
                        } else {
                            vlSelfRef.ternary_dot__DOT__vector_done = 0U;
                        }
                    } else {
                        vlSelfRef.ternary_dot__DOT__acc = 0U;
                        __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count = 8U;
                        vlSelfRef.acc_out = 0U;
                        vlSelfRef.ternary_dot__DOT__vector_done = 0U;
                    }
                    vlSelfRef.ternary_dot__DOT__count 
                        = __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count;
                    vlSelfRef.valid_out = vlSelfRef.ternary_dot__DOT__vector_done;
                    vlSelfRef.ternary_dot__DOT__next_acc 
                        = (vlSelfRef.ternary_dot__DOT__acc 
                           + (((- (IData)((1U & ((IData)(vlSelfRef.ternary_dot__DOT__weighted) 
                                                 >> 8U)))) 
                               << 9U) | (IData)(vlSelfRef.ternary_dot__DOT__weighted)));
                }
            }
        }
        Vternary_dot___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

void Vternary_dot___024root___eval(Vternary_dot___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___eval\n"); );
    Vternary_dot__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VicoIterCount;
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VicoIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VicoIterCount)))) {
#ifdef VL_DEBUG
            Vternary_dot___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
#endif
            VL_FATAL_MT("../rtl/ternary_dot.v", 26, "", "DIDNOTCONVERGE: Input combinational region did not converge after '--converge-limit' of 10000 tries");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
        vlSelfRef.__VicoPhaseResult = Vternary_dot___024root___eval_phase__ico(vlSelf);
    } while (vlSelfRef.__VicoPhaseResult);
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vternary_dot___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("../rtl/ternary_dot.v", 26, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 10000 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vternary_dot___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                VL_FATAL_MT("../rtl/ternary_dot.v", 26, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 10000 tries");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactPhaseResult = Vternary_dot___024root___eval_phase__act(vlSelf);
        } while (vlSelfRef.__VactPhaseResult);
        vlSelfRef.__VnbaPhaseResult = Vternary_dot___024root___eval_phase__nba(vlSelf);
    } while (vlSelfRef.__VnbaPhaseResult);
}

#ifdef VL_DEBUG
void Vternary_dot___024root___eval_debug_assertions(Vternary_dot___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___eval_debug_assertions\n"); );
    Vternary_dot__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY(((vlSelfRef.clk & 0xfeU)))) {
        Verilated::overWidthError("clk");
    }
    if (VL_UNLIKELY(((vlSelfRef.rst_n & 0xfeU)))) {
        Verilated::overWidthError("rst_n");
    }
    if (VL_UNLIKELY(((vlSelfRef.valid_in & 0xfeU)))) {
        Verilated::overWidthError("valid_in");
    }
    if (VL_UNLIKELY(((vlSelfRef.weight_enc & 0xfcU)))) {
        Verilated::overWidthError("weight_enc");
    }
}
#endif  // VL_DEBUG
