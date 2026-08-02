// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vternary_mac__pch.h"

//============================================================
// Constructors

Vternary_mac::Vternary_mac(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vternary_mac__Syms(contextp(), _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , rst_n{vlSymsp->TOP.rst_n}
    , valid_in{vlSymsp->TOP.valid_in}
    , activation{vlSymsp->TOP.activation}
    , weight_enc{vlSymsp->TOP.weight_enc}
    , valid_out{vlSymsp->TOP.valid_out}
    , acc_in{vlSymsp->TOP.acc_in}
    , acc_out{vlSymsp->TOP.acc_out}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vternary_mac::Vternary_mac(const char* _vcname__)
    : Vternary_mac(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vternary_mac::~Vternary_mac() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vternary_mac___024root___eval_debug_assertions(Vternary_mac___024root* vlSelf);
#endif  // VL_DEBUG
void Vternary_mac___024root___eval_static(Vternary_mac___024root* vlSelf);
void Vternary_mac___024root___eval_initial(Vternary_mac___024root* vlSelf);
void Vternary_mac___024root___eval_settle(Vternary_mac___024root* vlSelf);
void Vternary_mac___024root___eval(Vternary_mac___024root* vlSelf);

void Vternary_mac::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vternary_mac::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vternary_mac___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vternary_mac___024root___eval_static(&(vlSymsp->TOP));
        Vternary_mac___024root___eval_initial(&(vlSymsp->TOP));
        Vternary_mac___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vternary_mac___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vternary_mac::eventsPending() { return false; }

uint64_t Vternary_mac::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vternary_mac::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vternary_mac___024root___eval_final(Vternary_mac___024root* vlSelf);

VL_ATTR_COLD void Vternary_mac::final() {
    contextp()->executingFinal(true);
    Vternary_mac___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vternary_mac::hierName() const { return vlSymsp->name(); }
const char* Vternary_mac::modelName() const { return "Vternary_mac"; }
unsigned Vternary_mac::threads() const { return 1; }
void Vternary_mac::prepareClone() const { contextp()->prepareClone(); }
void Vternary_mac::atClone() const {
    contextp()->threadPoolpOnClone();
}
