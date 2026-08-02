// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vternary_dot.h for the primary calling header

#include "Vternary_dot__pch.h"

VL_ATTR_COLD void Vternary_dot___024root___eval_static(Vternary_dot___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___eval_static\n"); );
    Vternary_dot__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
    vlSelfRef.__Vtrigprevexpr___TOP__rst_n__0 = vlSelfRef.rst_n;
}

VL_ATTR_COLD void Vternary_dot___024root___eval_initial(Vternary_dot___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___eval_initial\n"); );
    Vternary_dot__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vternary_dot___024root___eval_final(Vternary_dot___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___eval_final\n"); );
    Vternary_dot__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vternary_dot___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vternary_dot___024root___eval_phase__stl(Vternary_dot___024root* vlSelf);

VL_ATTR_COLD void Vternary_dot___024root___eval_settle(Vternary_dot___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___eval_settle\n"); );
    Vternary_dot__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VstlIterCount;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VstlIterCount)))) {
#ifdef VL_DEBUG
            Vternary_dot___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
#endif
            VL_FATAL_MT("../rtl/../rtl/ternary_dot.v", 24, "", "DIDNOTCONVERGE: Settle region did not converge after '--converge-limit' of 10000 tries");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        vlSelfRef.__VstlPhaseResult = Vternary_dot___024root___eval_phase__stl(vlSelf);
        vlSelfRef.__VstlFirstIteration = 0U;
    } while (vlSelfRef.__VstlPhaseResult);
}

VL_ATTR_COLD bool Vternary_dot___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vternary_dot___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(Vternary_dot___024root___trigger_anySet__stl(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD bool Vternary_dot___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___trigger_anySet__stl\n"); );
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

VL_ATTR_COLD bool Vternary_dot___024root___eval_phase__stl(Vternary_dot___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___eval_phase__stl\n"); );
    Vternary_dot__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VstlExecute;
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__stl
        vlSelfRef.__VstlTriggered[0U] = ((0xfffffffffffffffeULL 
                                          & vlSelfRef.__VstlTriggered[0U]) 
                                         | (IData)((IData)(vlSelfRef.__VstlFirstIteration)));
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vternary_dot___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
    }
#endif
    __VstlExecute = Vternary_dot___024root___trigger_anySet__stl(vlSelfRef.__VstlTriggered);
    if (__VstlExecute) {
        {
            // Inlined CFunc: _eval_stl
            if ((1ULL & vlSelfRef.__VstlTriggered[0U])) {
                {
                    // Inlined CFunc: _stl_sequent__TOP__0
                    vlSelfRef.valid_out = vlSelfRef.ternary_dot__DOT__vector_done;
                }
            }
        }
    }
    return (__VstlExecute);
}

bool Vternary_dot___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vternary_dot___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(Vternary_dot___024root___trigger_anySet__act(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: @(posedge clk)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 1U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 1 is active: @(negedge rst_n)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vternary_dot___024root___ctor_var_reset(Vternary_dot___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vternary_dot___024root___ctor_var_reset\n"); );
    Vternary_dot__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->vlNamep);
    vlSelf->clk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16707436170211756652ull);
    vlSelf->rst_n = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1638864771569018232ull);
    vlSelf->valid_in = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16540271516330450727ull);
    vlSelf->activation = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 2320115052395106594ull);
    vlSelf->weight_enc = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 5887195072097697783ull);
    vlSelf->acc_out = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15809775069397034522ull);
    vlSelf->valid_out = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8744939437868816662ull);
    vlSelf->debug_valid_in_out = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7345143471806823675ull);
    vlSelf->debug_activation_out = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 17680150588359895074ull);
    vlSelf->debug_weight_enc_out = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 7402628535329438368ull);
    vlSelf->debug_acc_out_out = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2554454736840417250ull);
    vlSelf->debug_valid_out_out = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4650893285184024757ull);
    vlSelf->ternary_dot__DOT__weighted = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 17988373188066100903ull);
    vlSelf->ternary_dot__DOT__weighted_ext = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 307127381125750497ull);
    vlSelf->ternary_dot__DOT__acc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 3066222316018282723ull);
    vlSelf->ternary_dot__DOT__count = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 4293772544424403420ull);
    vlSelf->ternary_dot__DOT__vector_done = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11816915867300794807ull);
    vlSelf->ternary_dot__DOT__result_latch = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13285753625668559233ull);
    vlSelf->ternary_dot__DOT__vector_done_delayed = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14472137637369489412ull);
    vlSelf->ternary_dot__DOT__next_acc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4532832135223596725ull);
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VstlTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggered[__Vi0] = 0;
    }
    vlSelf->__Vtrigprevexpr___TOP__clk__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__rst_n__0 = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VnbaTriggered[__Vi0] = 0;
    }
}
