return 
{
    s("eq", fmta([[
    \begin{equation*}
        <>
    \end{equation*}
    ]],{i(1)})),

    s("eqn", fmta([[
    \begin{equation}
        <>
    \end{equation}
    ]],{i(1)})),

    s("al", fmta([[
    \begin{align}
        <>
    \end{align}
    ]],{i(1)})),


},
{
    s("ff", fmta("\\frac{<>}{<>}",{i(1),i(2)})),
    s("df", fmta("\\dfrac{<>}{<>}",{i(1),i(2)})),
    s({trig = "_",wordTrig = false}, fmta("_{<>}",{i(1)})),
    s({trig = "^",wordTrig = false}, fmta("^{<>}",{i(1)})),
    s({trig = "ll",wordTrig = true}, fmta("\\left<> \\right<>",{i(1),i(2),i(0)})),
    s({trig = "mm", wordTrig = true}, fmta("$<>$",{i(1)})),
}
