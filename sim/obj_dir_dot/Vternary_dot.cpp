// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vternary_dot__pch.h"

//============================================================
// Constructors

Vternary_dot::Vternary_dot(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vternary_dot__Syms(contextp(), _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , rst_n{vlSymsp->TOP.rst_n}
    , valid_in{vlSymsp->TOP.valid_in}
    , activation{vlSymsp->TOP.activation}
    , weight_enc{vlSymsp->TOP.weight_enc}
    , valid_out{vlSymsp->TOP.valid_out}
    , debug_valid_in_out{vlSymsp->TOP.debug_valid_in_out}
    , debug_activation_out{vlSymsp->TOP.debug_activation_out}
    , debug_weight_enc_out{vlSymsp->TOP.debug_weight_enc_out}
    , debug_valid_out_out{vlSymsp->TOP.debug_valid_out_out}
    , acc_out{vlSymsp->TOP.acc_out}
    , debug_acc_out_out{vlSymsp->TOP.debug_acc_out_out}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vternary_dot::Vternary_dot(const char* _vcname__)
    : Vternary_dot(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vternary_dot::~Vternary_dot() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vternary_dot___024root___eval_debug_assertions(Vternary_dot___024root* vlSelf);
#endif  // VL_DEBUG
void Vternary_dot___024root___eval_static(Vternary_dot___024root* vlSelf);
void Vternary_dot___024root___eval_initial(Vternary_dot___024root* vlSelf);
void Vternary_dot___024root___eval_settle(Vternary_dot___024root* vlSelf);
void Vternary_dot___024root___eval(Vternary_dot___024root* vlSelf);

void Vternary_dot::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vternary_dot::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vternary_dot___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vternary_dot___024root___eval_static(&(vlSymsp->TOP));
        Vternary_dot___024root___eval_initial(&(vlSymsp->TOP));
        Vternary_dot___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vternary_dot___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vternary_dot::eventsPending() { return false; }

uint64_t Vternary_dot::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vternary_dot::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vternary_dot___024root___eval_final(Vternary_dot___024root* vlSelf);

VL_ATTR_COLD void Vternary_dot::final() {
    contextp()->executingFinal(true);
    Vternary_dot___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vternary_dot::hierName() const { return vlSymsp->name(); }
const char* Vternary_dot::modelName() const { return "Vternary_dot"; }
unsigned Vternary_dot::threads() const { return 1; }
void Vternary_dot::prepareClone() const { contextp()->prepareClone(); }
void Vternary_dot::atClone() const {
    contextp()->threadPoolpOnClone();
}
