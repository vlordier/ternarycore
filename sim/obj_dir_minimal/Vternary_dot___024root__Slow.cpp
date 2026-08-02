// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vternary_dot.h for the primary calling header

#include "Vternary_dot__pch.h"

void Vternary_dot___024root___ctor_var_reset(Vternary_dot___024root* vlSelf);

Vternary_dot___024root::Vternary_dot___024root(Vternary_dot__Syms* symsp, const char* namep)
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vternary_dot___024root___ctor_var_reset(this);
}

void Vternary_dot___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vternary_dot___024root::~Vternary_dot___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
