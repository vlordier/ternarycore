// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vternary_mac.h for the primary calling header

#include "Vternary_mac__pch.h"

void Vternary_mac___024root___ctor_var_reset(Vternary_mac___024root* vlSelf);

Vternary_mac___024root::Vternary_mac___024root(Vternary_mac__Syms* symsp, const char* namep)
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vternary_mac___024root___ctor_var_reset(this);
}

void Vternary_mac___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vternary_mac___024root::~Vternary_mac___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
