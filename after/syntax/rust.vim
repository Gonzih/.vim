if !has('conceal') || &enc != 'utf-8'
  finish
endif

syntax match rsCuteOperator "->" conceal cchar=→
