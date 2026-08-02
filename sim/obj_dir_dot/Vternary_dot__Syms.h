// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VTERNARY_DOT__SYMS_H_
#define VERILATED_VTERNARY_DOT__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vternary_dot.h"

// INCLUDE MODULE CLASSES
#include "Vternary_dot___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) Vternary_dot__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vternary_dot* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vternary_dot___024root         TOP;

    // CONSTRUCTORS
    Vternary_dot__Syms(VerilatedContext* contextp, const char* namep, Vternary_dot* modelp);
    ~Vternary_dot__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard
