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

    s("env", fmta([[
    \begin{<>}
        <>
    \end{<>}
    ]],{i(1),i(2),rep(1)})),

},
{
    s({trig = "inc", wordTrig = true},
    fmta("\\includegraphics[width=<>\\textwidth]{<>}",{i(1),i(0)})),
}
