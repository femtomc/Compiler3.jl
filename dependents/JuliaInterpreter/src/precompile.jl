function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    @assert precompile(Tuple{typeof(maybe_evaluate_builtin), Frame, Expr, Bool})
    @assert precompile(Tuple{typeof(getargs), Vector{Any}, Frame})
    @assert precompile(Tuple{typeof(get_call_framecode), Vector{Any}, FrameCode, Int})
    @assert precompile(evaluate_call_recurse!, (Function, Frame, Expr))
    @assert precompile(evaluate_call_compiled!, (Compiled, Frame, Expr))
    for f in (evaluate_structtype,
              evaluate_abstracttype,
              evaluate_primitivetype)
        @assert precompile(Tuple{typeof(f), Any, Frame, Expr})
    end
    @assert precompile(Tuple{typeof(evaluate_foreigncall), Frame, Expr})
    @assert precompile(Tuple{typeof(evaluate_methoddef), Frame, Expr})
    @assert precompile(Tuple{typeof(lookup_global_refs!), Expr})
    @assert precompile(Tuple{typeof(lookup_or_eval), Any, Frame, Any})
    @assert precompile(Tuple{typeof(eval_rhs), Any, Frame, Expr})
    @assert precompile(Tuple{typeof(step_expr!), Any, Frame, Any, Bool})
    for f in (finish!, finish_and_return!, finish_stack!, next_call!, maybe_next_call!, next_line!)
        @assert precompile(Tuple{typeof(f), Any, Frame, Bool})
    end
    @assert precompile(Tuple{typeof(through_methoddef_or_done!), Any, Frame})
    @assert precompile(Tuple{typeof(split_expressions), Module, Expr})
    @assert precompile(Tuple{typeof(Core.kwfunc(split_expressions)), NamedTuple{(:extract_docexprs,),Tuple{Bool}}, typeof(split_expressions), Module, Expr})
    @assert precompile(Tuple{typeof(split_expressions!), Vector{Tuple{Module,Expr}}, Dict{Module,Vector{Expr}}, Expr, Module, Expr})
    @assert precompile(Tuple{typeof(prepare_thunk), Module, Expr})
    @assert precompile(Tuple{typeof(prepare_thunk), Module, Expr, Bool})
    @assert precompile(Tuple{typeof(prepare_framedata), FrameCode, Vector{Any}, SimpleVector, Bool})
    @assert precompile(Tuple{typeof(prepare_args), Any, Vector{Any}, Vector{Any}})
    @assert precompile(Tuple{typeof(prepare_call), Any, Vector{Any}})
    @assert precompile(Tuple{typeof(Core.kwfunc(prepare_call)), NamedTuple{(:enter_generated,),Tuple{Bool}}, typeof(prepare_call), Function, Vector{Any}})
    # For some reason the PC statement below returns `false` on earlier Julia versions
    precompile(Tuple{typeof(Core.kwfunc(prepare_framecode)), NamedTuple{(:enter_generated,),Tuple{Bool}}, typeof(prepare_framecode), Method, Any})
    @assert precompile(Tuple{typeof(prepare_frame), FrameCode, Vector{Any}, Core.SimpleVector})
    @assert precompile(Tuple{typeof(extract_args), Module, Expr})
    @assert precompile(Tuple{typeof(enter_call), Int, Int})
    @assert precompile(Tuple{typeof(enter_call_expr), Expr})
    @assert precompile(Tuple{typeof(copy_codeinfo), Core.CodeInfo})
    @assert precompile(Tuple{typeof(optimize!), Core.CodeInfo, Module})
    @assert precompile(Tuple{typeof(optimize!), Core.CodeInfo, Method})
    @assert precompile(Tuple{typeof(build_compiled_call!), Expr, Symbol, Core.CodeInfo, Int, Int, Vector{Symbol}, Module})
    @assert precompile(Tuple{typeof(renumber_ssa!), Vector{Any}, Vector{Int}})
    @assert precompile(Tuple{typeof(set_structtype_const), Module, Symbol})
    @assert precompile(Tuple{typeof(namedtuple), Vector{Any}})
    @assert precompile(Tuple{typeof(resolvefc), Frame, Any})
    @assert precompile(Tuple{typeof(check_isdefined), Frame, Any})
    @assert precompile(Tuple{typeof(find_used), Core.CodeInfo})
    @assert precompile(Tuple{typeof(do_assignment!), Frame, Any, Any})
    @assert precompile(Tuple{typeof(pc_expr), Frame})
end
