10 REM text Lissajou       K Moerman 2026
15 PRINT "Lissajou on a text screen": CPI = 3.1415927#
20 FX% = 3: FY% = 5: REM hor. and vert. frequencies
30 P$ = "*": A$ = ".": REM symbols to use plot and axes
40 XA% = 37: YA% = 10: REM hor. and vert ampl. in char
45 PH = CPI / 4: REM phase shift y vs x
50 IF FX% > FY% THEN NK% = FX% ELSE NK% = FY%
60 FOR Y% = -YA% TO YA%
70 IF Y% <> 0 THEN GOTO 100
80 L$ = STRING$(2 * XA%, A$)
90 GOTO 110
100 L$ = STRING$(XA%, " ") + A$ + STRING$(XA% - 1, " ")
110 FOR K% = 0 TO NK% - 1
120 R = Y% / YA%: GOSUB 240
130 T = 1 / FY% * (AR + K% * 2 * CPI - PH)
140 GOSUB 290
150 MID$(L$, X%, 1) = P$
160 T = 1 / FY% * (-AR + (1 - 2 * K%) * CPI - PH)
170 GOSUB 290
180 MID$(L$, X%, 1) = P$
190 NEXT K%
200 PRINT L$
210 NEXT Y%
220 END
230 REM Inverse sine of R --> AR
240 IF ABS(R) < 1 THEN AR = ATN(R / SQR(1 - (R * R)))
250 IF R = 1 THEN AR = CPI / 2
260 IF R = -1 THEN AR = -CPI / 2
270 RETURN
280 REM calculate char position X% out of T
290 X% = INT(XA% * (1 + .96 * COS(FX% * T)) + .5)
300 RETURN
