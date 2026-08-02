// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vternary_dot.h for the primary calling header

#include "Vternary_dot__pch.h"

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
                                                           & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__rst_n__0)) 
                                                          << 1U) 
                                                         | ((IData)(vlSelfRef.clk) 
                                                            & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clk__0))))));
        vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
        vlSelfRef.__Vtrigprevexpr___TOP__rst_n__0 = vlSelfRef.rst_n;
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
                    CData/*0:0*/ __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__vector_done;
                    __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__vector_done = 0;
                    SData/*15:0*/ __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count;
                    __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count = 0;
                    __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count 
                        = vlSelfRef.ternary_dot__DOT__count;
                    __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__vector_done 
                        = vlSelfRef.ternary_dot__DOT__vector_done;
                    if (vlSelfRef.rst_n) {
                        vlSelfRef.debug_weight_enc_out 
                            = vlSelfRef.weight_enc;
                        vlSelfRef.debug_activation_out 
                            = vlSelfRef.activation;
                        vlSelfRef.debug_acc_out_out 
                            = vlSelfRef.acc_out;
                        vlSelfRef.acc_out = ((IData)(vlSelfRef.ternary_dot__DOT__vector_done)
                                              ? vlSelfRef.ternary_dot__DOT__result_latch
                                              : 0U);
                        vlSelfRef.ternary_dot__DOT__weighted 
                            = ((0U == (IData)(vlSelfRef.weight_enc))
                                ? 0U : (0x000000ffU 
                                        & ((1U == (IData)(vlSelfRef.weight_enc))
                                            ? (IData)(vlSelfRef.activation)
                                            : (- (IData)(vlSelfRef.activation)))));
                        vlSelfRef.ternary_dot__DOT__weighted_ext 
                            = (((- (IData)((1U & ((IData)(vlSelfRef.ternary_dot__DOT__weighted) 
                                                  >> 7U)))) 
                                << 8U) | (IData)(vlSelfRef.ternary_dot__DOT__weighted));
                        vlSelfRef.ternary_dot__DOT__next_acc 
                            = (vlSelfRef.ternary_dot__DOT__acc 
                               + vlSelfRef.ternary_dot__DOT__weighted_ext);
                        if (((IData)(vlSelfRef.valid_in) 
                             & ((~ (IData)(vlSelfRef.ternary_dot__DOT__vector_done)) 
                                | (IData)(vlSelfRef.ternary_dot__DOT__vector_done_delayed)))) {
                            if ((1U == (IData)(vlSelfRef.ternary_dot__DOT__count))) {
                                vlSelfRef.ternary_dot__DOT__result_latch 
                                    = vlSelfRef.ternary_dot__DOT__next_acc;
                                __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__vector_done = 1U;
                                vlSelfRef.ternary_dot__DOT__acc = 0U;
                                __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count = 8U;
                            } else {
                                __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count 
                                    = (0x0000ffffU 
                                       & ((IData)(vlSelfRef.ternary_dot__DOT__count) 
                                          - (IData)(1U)));
                                __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__vector_done = 0U;
                                vlSelfRef.ternary_dot__DOT__acc 
                                    = vlSelfRef.ternary_dot__DOT__next_acc;
                            }
                        } else {
                            __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__vector_done 
                                = vlSelfRef.ternary_dot__DOT__vector_done;
                        }
                        vlSelfRef.debug_valid_out_out 
                            = vlSelfRef.ternary_dot__DOT__vector_done;
                    } else {
                        vlSelfRef.debug_weight_enc_out = 0U;
                        vlSelfRef.debug_activation_out = 0U;
                        vlSelfRef.debug_acc_out_out = 0U;
                        vlSelfRef.acc_out = 0U;
                        vlSelfRef.ternary_dot__DOT__acc = 0U;
                        __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count = 8U;
                        __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__vector_done = 0U;
                        vlSelfRef.ternary_dot__DOT__result_latch = 0U;
                        vlSelfRef.debug_valid_out_out = 0U;
                    }
                    vlSelfRef.debug_valid_in_out = 
                        ((IData)(vlSelfRef.rst_n) && (IData)(vlSelfRef.valid_in));
                    vlSelfRef.ternary_dot__DOT__count 
                        = __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__count;
                    vlSelfRef.ternary_dot__DOT__vector_done_delayed 
                        = ((IData)(vlSelfRef.rst_n) 
                           && (IData)(vlSelfRef.ternary_dot__DOT__vector_done));
                    vlSelfRef.ternary_dot__DOT__vector_done 
                        = __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vdly__ternary_dot__DOT__vector_done;
                    vlSelfRef.valid_out = vlSelfRef.ternary_dot__DOT__vector_done;
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
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vternary_dot___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("../rtl/../rtl/ternary_dot.v", 24, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 10000 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vternary_dot___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                VL_FATAL_MT("../rtl/../rtl/ternary_dot.v", 24, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 10000 tries");
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
