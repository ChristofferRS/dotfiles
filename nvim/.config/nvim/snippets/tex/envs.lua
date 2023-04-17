return 
{
    s("fi", fmta([[
    \begin{figure}[<>]
        \centering
        <>
        \caption{<>}
        \label{fig:<>}
    \end{figure}
    ]],{i(1),i(2),i(3),i(4)})),
    s("sfi", fmta([[
    \begin{subfigure}[<>]{<>\textwidth}
        \centering
        <>
        \caption{<>}
        \label{sfig:<>}
    \end{subfigure}
    ]],{i(1),i(2),i(3),i(4),i(5)})),

    s("env", fmta([[
    \begin{<>}
        <>
    \end{<>}
    ]],{i(1),i(2),rep(1)})),
    s({trig = "inc", wordTrig = true},
    fmta("\\includegraphics[width=<>\\textwidth]{<>}",{i(1),i(0)})),
},
{
}
