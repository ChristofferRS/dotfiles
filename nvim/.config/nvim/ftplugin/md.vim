set wrap linebreak nolist
"Enviorments{{{

inoremap ;nu \begin{enumerate}<Enter>\end{enumerate}<Enter><Enter><++><Esc>?enum<Enter>O\item
inoremap ;it \begin{itemize}<Enter>\end{itemize}<Enter><Enter><++><Esc>?item<Enter>O\item
inoremap ;ta \begin{tabular}{}<Enter><++><Enter>\end{tabular}<Enter><++><Esc>?{}<CR>a
inoremap ;tab \begin{table}[h]<CR>\centering<CR>\caption{<++>}<CR>\label{fig:<++>}<CR>\end{table}<CR><++><Esc>?caption<CR>O
inoremap ;ce \begin{center}<Enter>\end{center}<Enter><++><Esc>?cen<CR>O
inoremap ;fi \begin{figure}[]<Enter>\centering<Enter><++><Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{figure}<Enter><++><Esc>?[]<Enter>a
inoremap ;gr \includegraphics[width=\textwidth]{<++>}<Esc>?=<Enter>a
inoremap ;sf \begin{subfigure}[]{<++>\textwidth}<Enter>\centering<Enter><++><Enter>\caption{<++>}<Enter>\label{subfig:<++>}<Enter>\end{subfigure}<Enter><++><Esc>?[]<Enter>a
inoremap ;mp \begin{minipage}[]<Enter><++><Enter>\end{minipage}<Enter><Enter><++><Esc>?[]<CR>a
inoremap ;i \textit{}<Space><++><Esc>F}i
inoremap ;b \textbf{}<Space><++><Esc>F}i
inoremap ;l \\<Enter>
inoremap ;pa <Enter>\bigskip<Enter><Enter>
inoremap ;s \section{}<Enter><Enter><++><Esc>?}<Enter>i
inoremap ;ss \subsection{}<Enter><Enter><++><Esc>?}<Enter>i
inoremap ;al \begin{align*}<Enter>\end{align*}<Enter><++><Esc>?gn*<Enter>O
inoremap ;aln \begin{align}<Enter>\end{align}<Enter><++><Esc>?align<Enter>O
inoremap ;sp \begin{split}<Enter>\end{split}<Enter><++><Esc>?it}<Enter>O
inoremap ;e $$<++><Esc>F$i
inoremap ;eq \begin{equation*}<Enter>\end{equation*}<Enter><Enter><++><Esc>?tion<Enter>O
inoremap ;eqn \begin{equation}\label{eq:}<Enter><++><Enter>\end{equation}<Enter><++><Esc>?:<Enter>a
inoremap ;ga \begin{gather*}<Enter>\end{gather*}<Enter><Enter><++><Esc>?ther<Enter>O
inoremap ;gan \begin{gather}\label{eq:}<Enter><++><Enter>\end{gather}<Enter><++><Esc>?:<Enter>a


"}}}
"MATH{{{
"inoremap ;c \cdot
inoremap ;si \SI{}{<++>}<++><Esc>F}F}i
inoremap ;SI \SI{}{<++>}<++><Esc>F}F}i
inoremap <C-f> \frac{}{<++>}<++><Esc>F}F}i
inoremap <C-l> _{}<++><Esc>F}i
inoremap <C-h> ^{}<++><Esc>F}i
"inoremap ;br \bra{}<++><Esc>F}i
"inoremap ;ke \ket{}<++><Esc>F}i
"inoremap ;bk \braket{}<++><Esc>F}i
"inoremap ;pma \begin{pmatrix}<Enter>\end{pmatrix}<Enter><++><Esc>?rix<Enter>O
"inoremap ;bma \begin{bmatrix}<Enter>\end{pmatrix}<Enter><++><Esc>?rix<Enter>O
"inoremap <C-l> \left
"inoremap <C-r> \right

"greek_letters{{{


inoremap <leader><leader>a \alpha
inoremap <leader><leader>n \nu
inoremap <leader><leader>b \beta
inoremap <leader><leader>x \xi
inoremap <leader><leader>X \Xi
inoremap <leader><leader>g \gamma
inoremap <leader><leader>G \Gamma
inoremap <leader><leader>d \delta
inoremap <leader><leader>D \Delta
inoremap <leader><leader>e \epsilon
inoremap <leader><leader>ve \varepsilon
inoremap <leader><leader>r \rho
inoremap <leader><leader>vr \varrho
inoremap <leader><leader>z \zeta
inoremap <leader><leader>s \sigma
inoremap <leader><leader>S \Sigma
inoremap <leader><leader>et \eta
inoremap <leader><leader>t \tau
inoremap <leader><leader>vth \vartheta
inoremap <leader><leader>Th \Theta
inoremap <leader><leader>th \theta
inoremap <leader><leader>u \upsilon
inoremap <leader><leader>U \Upsilon
inoremap <leader><leader>i \iota
inoremap <leader><leader>f \phi
inoremap <leader><leader>F \Phi
inoremap <leader><leader>vp \varphi
inoremap <leader><leader>P \Phi
inoremap <leader><leader>k \kappa
inoremap <leader><leader>kh \chi
inoremap <leader><leader>l \lambda
inoremap <leader><leader>L \Lambda
inoremap <leader><leader>P \psi
inoremap <leader><leader>p \Psi
inoremap <leader><leader>m \mu
inoremap <leader><leader>o \omega
inoremap <leader><leader>O \Omega

" inoremap <leader><leader>p \pi
" inoremap <leader><leader>P \Pi
"}}}


"}}}


