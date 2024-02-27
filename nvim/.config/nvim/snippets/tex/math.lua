local function parmatch(par,_) 
    local p1 = par[1][1]
    if(p1=="(") then return ")"
    elseif(p1=="[") then return "]"
    elseif(p1=="\\{") then return "\\}"
    else return p1
    end
end

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
    \begin{align*}
        <>
    \end{align*}
    ]],{i(1)})),
    s("aln", fmta([[
    \begin{align}
        <>
    \end{align}
    ]],{i(1)})),
    s("\\la", fmta("\\left\\langle <> \\right\\vert",{i(1)})),
    s("\\ra", fmta("\\left\\vert <> \\right\\rangle",{i(1)})),
},
{
    s("ff", fmta("\\frac{<>}{<>}",{i(1),i(2)})),
    s("df", fmta("\\dfrac{<>}{<>}",{i(1),i(2)})),
    s({trig = "__",wordTrig = false}, fmta("_{<>}",{i(1)})),
    s({trig = "^",wordTrig = false}, fmta("^{<>}",{i(1)})),
    s({trig = "ll",wordTrig = true}, 
        fmta("\\left<> <> \\right<>",
        {i(1),i(2),
        f(parmatch,{1}),
    })),
    s({trig = "mm", wordTrig = true}, fmta("$<>$",{i(1)})),
    s({trig = "pd", wordTrig = true}, t("\\partial")),
    s({trig = "mc", wordTrig = true}, fmta("\\mathcal{<>}",{i(1)})),
}
