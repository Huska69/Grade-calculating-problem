:- use_module(library(csv)).
main :-
 grade_main.

 read_csv_file(File, Rows):-
 csv_read_file(File, Rows, [functor(row)]).

 weighted_mean([]).
 weighted_mean([row(_, ID, _, HW1, HW2, HW3, MIDTERM, FINAL)|REST]):-
 (
 number(FINAL) ->
 Weighted_Factors = [0.1, 0.1, 0.1, 0.3, 0.4],
 Fields = [HW1, HW2, HW3, MIDTERM, FINAL],
 weighted_mean_single(Fields, Weighted_Factors, 0, Result),
 round(Result, RoundedResult),
 grading(RoundedResult, Grade),
 format('~w : [Score : ~2f ] [Grade : ~w]~n', [ID, Result, Grade])
 ;
 writeln('ID SCORE GRADE')
 ), weighted_mean(REST).
 %WHY NEED WEIGHTED HERE

 %RECURRSION HERE TO GET THE RIGHT WEIGHTED SUBJECT SCORES
 weighted_mean_single([], [], Result, Result).
 weighted_mean_single([Field|RestFields], [Factor|RestFactors], Acc, Result) :-
 WeightedField is Factor * Field,
 NewAcc is Acc + WeightedField,
 weighted_mean_single(RestFields, RestFactors, NewAcc, Result).

 grading(RoundedScore, Grade) :-
 RoundedScore >= 0, RoundedScore =< 49, Grade = 'E';
 RoundedScore >= 50, RoundedScore =< 59, Grade = 'D';
 RoundedScore >= 60, RoundedScore =< 62, Grade = 'C-';
 RoundedScore >= 63, RoundedScore =< 66, Grade = 'C';
 RoundedScore >= 67, RoundedScore =< 69, Grade = 'C+';
 RoundedScore >= 70, RoundedScore =< 72, Grade = 'B-';
 RoundedScore >= 73, RoundedScore =< 76, Grade = 'B';
 RoundedScore >= 77, RoundedScore =< 79, Grade = 'B+';
 RoundedScore >= 80, RoundedScore =< 84, Grade = 'A-';
 RoundedScore >= 85, RoundedScore =< 89, Grade = 'A';
 RoundedScore >= 90, RoundedScore =< 100, Grade = 'A+'.
 grade_main :-
 File = 'HW2data.csv',
 read_csv_file(File, Rows),
 weighted_mean(Rows).

:- main.
