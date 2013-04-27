%%% The organization of this file follows the Erlang Reference Manual:
%%%
%%% http://erlang.org/doc/reference_manual/users_guide.html

%%% ===========================================================================
%%% 1 Introduction
%%% ===========================================================================

%%% ===========================================================================
%%% 1.6 Character Set
%%% ===========================================================================

string_characters() ->
    "���� �� � �� �� � ��",
    ok.

variable_characters() ->
    ��������,
    ok.

%%% ===========================================================================
%%% 2 Data Types
%%% ===========================================================================

%%% ===========================================================================
%%% 2.2 Number
%%% ===========================================================================

number_examples() ->
    42,
    $A,
    $\n,
    2#101,
    16#1f,
    2.3,
    2.3e3,
    2.3e-3,
    ok.

%%% ===========================================================================
%%% 2.3 Atom
%%% ===========================================================================

atom_examples() ->
    hello,
    phone_number,
    hello@you,
    'Monday',
    'phone number',
    case@case,
    ok.

multiline_atoms() ->
    f('foo
f
      bar((('),
    'foo
      bar', [a,
             b],
    [a,
     b], 'my
  atom',
    ok.

'my function'() ->
 ok.

%%% ===========================================================================
%%% 2.9 Tuple
%%% 2.10 List
%%% ===========================================================================

tuple_examples() ->
    P = {adam,24,{july,29}},
    tuple_size({}),
    ok.

list_examples() ->
    L1 = [a,2,{c,4}],
    [H|T] = L1,
    ok.

embedded_terms() ->
    f(
     ),
    {A},
    {A, B},

    {A,
     B},

    {{A,
      B},
     C,
     D},
    {[A,
      B]},
    {{A,
      {{B,
        C},
       D
      }}},
    [A
    ],

    {[A,B
     ]},

    {[A,B
     ]
    },
    ok.

embedded_terms() ->
    f(
     ),
    {
     A
    },
    {
     A,
     B
    },

    {
     {
      A,
      B
     },
     C,
     D
    },
    {
     [
      A,
      B
     ]
    },
    {{
      A,
      {
       {
        B,
        C
       },
       D
      }}},
    [
     A
    ],

    {[
      A,B
     ]},

    {
     [
      A
      ,
      B
     ]
    },
    ok.

embedded_terms() ->

    % {Difference from Emacs}
    %
    % Emacs:
    %     long_expression, {
    %       A
    %     }.
    long_expression, {
                      A
                     },

    % {Difference from Emacs}
    %
    % Emacs:
    %     long + expression, {
    %              A
    %             }.
    long + expression, {
                        A
                       },

    ok.

list_head_tail() ->
    [H|_] = [H|_],

    [H|
     _] = [H|
           _],

    [H
     |_] = [H
            |_],

    [
     H
     |
     _
    ]
    =
    [
     H
     |
     _
    ],
    ok.

%%% ===========================================================================
%%% 2.11 String
%%% ===========================================================================

multiline_string() ->
    x("foo
f
        bar(((").

multiline_string() ->
    x("foo
        bar((("), % string continuation lines like this one are level changed
    x("foo
      bar((("),
    x("foo
      bar\\"),
    f("foo
      bar
      spam"),
    "foo
       bar",
    ok,
    "foo
      bar
      spam",

    "foo
      bar
      spam begin
      end",

    "foo
",

    ok,
    "foo
      bar", [a,
             b],
    [a,
     b]),
                                        ok. % syntax error in the prev.line

multiline_string() ->
    x("foo
      %        bar")
    ,
    ok.

% This function tests that we handle string quotes and atom quotes separately
multiline_strings_and_atoms() ->
    x("foo ',
f,
    '
      %        bar")
    ,
    ok.

multiline() ->
"x",
    "
"
    ,
    ok.

%%% ===========================================================================
%%% 3 Pattern Matching
%%% ===========================================================================

%%% ===========================================================================
%%% 3.1 Pattern Matching
%%% ===========================================================================

pattern_matching_examples() ->

    X = 2,

    X =
    2,

    {X, Y} = A,

    {X,
     Y} = A,

    {X,
     Y} = {A,
           B},

    Variable = 1 +
    2,

    Variable =
    1 +
    2,

    Variable = (1 +
                2),

    Variable =
    (1 +
     2),

    ok.

%%% ===========================================================================
%%% 4 Modules
%%% ===========================================================================

%%% ===========================================================================
%%% 4.1 Module Syntax
%%% ===========================================================================

-attr().
-attr(value).
-module(m).

%%% ===========================================================================
%%% 4.3 Comments
%%% ===========================================================================

% Comment
%% Comment
comments() ->
    % {Difference from Emacs}
    % Emacs indents comments with a single percentage sign to column 49.

    % Comment
    %% Comment
    ok.
% Comment
%% Comment

%%% ===========================================================================
%%% Functions
%%% ===========================================================================

%%% ===========================================================================
%%% 5.1  Function Declaration Syntax
%%% ===========================================================================

f() ->
    ok.

f({A,
   B}, C) ->
    ok.

% Multiple clauses
f() ->
    ok;
f() ->
    ok.

% One expression after "when"
f(A) when A == 0 ->
    ok.

f(A)
  when A == 0
       ->
    ok.

f(A)
  when
      A == 0
      ->
    ok.

% Two expressions after "when"
f(A) when A == 0; B == 0 ->
    ok.

f(A)
  when A == 0;
       B == 0
       ->
    ok.

f(A)
  when
      A == 0;
      B == 0
      ->
    ok.

% Multiple clauses + when
f({X,
   Y})
  when A == 0;
       B == 0
       ->
    {X,
     Y};
f({X,
   Y})
  when A == 0;
       B == 0
       ->
    ok.

f({X, Y}) when A == 0; B == 0 -> {X, Y};
f({X, Y}) when A == 0; B == 0 -> ok.

f({X, Y}) when A == 0 -> {X, Y}; f({X, Y}) when A == 0 -> ok.

f(
   A,
   B
 ) ->
    ok.

%%% ===========================================================================
%%% 6 Types and Function Specifications
%%% ===========================================================================

%%% ===========================================================================
%%% 6.3  Type declarations of user-defined types
%%% ===========================================================================

-type my_struct_type() :: Type.
-opaque my_opaq_type() :: Type.
-type orddict(Key, Val) :: [{Key, Val}].

-type orddict(Key, Val) :: [{Key,
                             Val}].

-type my_fun_type() :: fun()                  %% any function
                           | fun((...) -> Type)     %% any arity, returning Type
                                        | fun(() -> Type)
                                        | fun((A) -> Type)
                                        | fun((A, B) -> Type).
-type my_bitstring_type :: <<>>
| <<_:1>>
| <<_:_*1>>
| <<_:1, _:_*1>>.

%%% ===========================================================================
%%% 6.4  Type information in record declarations
%%% ===========================================================================

-record(rec, {f1 = 42 :: integer(),
              f2      :: 'undefined' | float(),
              f3      :: 'undefined' |
              'a' | 'b'}).

-record(rec, {f1 = 42 :: integer(),
              f2      :: float(),
              f3      :: 'a' | fun() |
                                   'b'}).

%%% ===========================================================================
%%% 6.5  Specifications for functions
%%% ===========================================================================

-spec func(A, B) -> ReturnType.
func() ->
    ok.

-spec module:func(A, B) -> ReturnType.
func() ->
    ok.

-spec func(A,
           B) -> ReturnType.
func() ->
    ok.

% Overloading
-spec func(A, B) -> ReturnType;
(A,
 B) -> ReturnType.
func() ->
    ok.

-spec func(A, B) -> ReturnType
    ; (A,
       B) -> ReturnType.
func() ->
    ok.

% Guards
-spec id(A) -> A when A :: tuple().
-spec id(A) -> A when A :: tuple(), B :: tuple().

-spec id(A)
->
    A
      when
          A
          ::
          tuple().
-spec id(A)
->
    A
      when
          A;
          B
          ::
          tuple().

% One guard + overloading
-spec func(A, B) -> ReturnType when A :: t();
                                    (A,
                                     B) -> ReturnType when A :: t().
func() ->
    ok.

-spec func(A, B) ->
    ReturnType
      when
          A
          ::
          t()
          ;
          (A,
           B) -> ReturnType
      when
          A
          ::
          t().
func() ->
    ok.

% Two guards + overloading
-spec func(A, B) -> ReturnType when A :: t(), B :: t();
                                    (A,
                                     B) -> ReturnType when A :: t(), B :: t().
func() ->
    ok.

-spec func(A, B)
->
    ReturnType
      when
          A
          ::
          t(),
          B
          ::
          t()
          ;
          (A,
           B)
          ->
    ReturnType
      when
          A
          ::
          t(),
          B
          ::
          t().
func() ->
    ok.

%%% ===========================================================================
%%% 7 Expressions
%%% ===========================================================================

%%% ===========================================================================
%%% 7.3 Variables
%%% ===========================================================================

variables() ->
    X,
    Name1,
    PhoneNumber,
    Phone_number,
    _,
    _Height,
    Var@case, % just a variable
    ok.

%%% ===========================================================================
%%% 7.6 Function calls
%%% ===========================================================================

func_calls() ->

    func(),

    mod:func(),

    mod : func(),

    mod
    :
    func(),

    ok.

f() ->
    ok.

f
(
)
->
    ok.

f() ->
    g(A, B,
      C,
      D),
    ok.

f() ->
    long_function(
                   A, B,
                   C,
                   D),
    ok.

f() ->

    f(A,
      B),

    f(A, B,
      C),

    long_function_name(other_long_function_name(A,
                                                B),
                       C),

    long_function_name(A,
                       other_long_function_name(A,
                                                B),
                       C).

f() ->
    function_call),
                                        ok. % syntax error in prev.line

%%% ===========================================================================
%%% 7.7 If
%%% ===========================================================================

% if -- with linebreaks
f() ->

    % if with 0 branch
    if end, % not valid Erlang, but why not behave nicely

    % if with 1 branch
    if
        A -> A
    end,

    if
        A ->
            A
    end,

    % if with 2 branches
    if
        A -> A;
        B -> B
    end,

    if
        A ->
            A;
        B ->
            B
    end,

    ok.

% if -- one-liners
f() ->
    if A -> A end,
    if A -> A; B -> B end,

    % half-liners
    if A -> A end, if A -> A end,
    if A -> A; B -> B end, if A -> A; B -> B end,
    ok.

%%% ===========================================================================
%%% 7.8 Case
%%% ===========================================================================

case_example(Signal) ->
    case Signal of
        {signal, _What, _From, _To} ->
            true;
        {signal, _What, _To} ->
            true;
        _Else ->
            false
    end.

f() ->
                                        end. % syntax error

f() ->
    case X,
         Y of
        A ->
            A
    end,

    case X of
        A ->
            A
    end,

    case
        X
    of
        A ->
            A
    end,

    case
        X
    of
        A ->
            A
    end,

    case X of
        A ->
            A;
        B ->
            B
    end,

    case X of
        A
        ->
            A
    end,

    ok.

f() ->
    case A of A -> case B of B -> B end end,
    ok.

f() ->
    case A of
        A ->
            case B of
                B -> B
            end
    end,
    ok.

f() ->
    case A of A -> A1,
            A2;
        B -> B1,
            B2
    end,
    ok.

f() ->
    case A of A ->
            A1,
            A2;
        B -> B1,
            B2
    end,
    ok.

f() ->
    f(case X of
          A -> A
      end),
    ok.

f() ->
    ffffff(case X of
               A -> fffffff(case X of
                                B -> B
                            end)
           end),
    ok.

% case and when

f() ->
    case A of
        B when B > 0 ->
            ok;
        B
          when
              B > 0 ->
            ok;

        B
          when
              B > 0;
              B < 0
              ->
            ok
    end,
    ok.

%%% ===========================================================================
%%% 7.9 Send
%%% ===========================================================================

f() ->
    a ! b,
    a
    !
    b,
    ok.

%%% ===========================================================================
%%% 7.10 Receive
%%% ===========================================================================

% receive -- with linebreaks
f() ->

    % receive with 0 branch
    receive end, % not valid Erlang, but why not behave nicely

    % receive with 1 branch
    receive
        A -> A
    end,

    receive
        A ->
            A
    end,

    % receive with 2 branches
    receive
        A -> A;
        B -> B
    end,

    receive
        A ->
            A;
        B ->
            B
    end,

    ok.

% receive + after -- with linebreaks
f() ->

    % receive with 0 branch
    receive
    after
        T -> T
    end,

    % receive with 1 branch
    receive
        A -> A
    after
        T -> T
    end,

    receive
        A ->
            A
    after
        T ->
            T
    end,

    % receive with 2 branches
    receive
        A -> A;
        B -> B
    after
        T -> T
    end,

    receive
        A ->
            A;
        B ->
            B
    after
        T -> T
    end,

    ok.

% receive -- one-liners
f() ->
    receive A -> A end,
    receive A -> A; B -> B end,

    % half-liners
    receive A -> A end, receive A -> A end,
    receive A -> A; B -> B end, receive A -> A; B -> B end,
    ok.

% receive + after -- one-liners
f() ->

    receive after T -> T end,
    receive A -> A after T -> T end,
    receive A -> A; B -> B after T -> T end,

    % half-liners
    receive after T -> T end, receive after T -> T end,
    receive A -> A after T -> T end, receive A -> A after T -> T end,
    receive A -> A; B -> B after T -> T end, receive A -> A; B -> B after T -> T end,
    ok.

% tricky scenarios which may catch some heuristics
f() ->
    receive
        A ->
            "receive"
    after
        T -> T
    end.

f() ->
    ok, receive
        after
            T -> T
        end.

%%% ===========================================================================
%%% 7.11 Term Comparisons
%%% ===========================================================================

term_comparisons() ->
    A == A,
    A /= A,
    A =< A,
    A < A,
    A >= A,
    A > A,
    A =:= A,
    A =/= A,

    A ==
    A,

    A
    ==
    A,

    ok.

%%% ===========================================================================
%%% 7.12 Arithmetic Expressions
%%% ===========================================================================

unary_operators() ->
    + A,
    - A,
    bnot A,

    +
    A,

    bnot
    A,

    ok.

binary_operators() ->
    A + A,
    A - A,
    A * A,
    A / A,
    A div A,
    A rem A,
    A band A,
    A bor A,
    A bxor A,
    A bsl A,
    A bsr A,

    A +
    A,

    A
    +
    A,

    A div
    A,

    A
    div
    A,

    ok.

%%% ===========================================================================
%%% 7.13 Boolean Expressions
%%% ===========================================================================

unary_boolean() ->
    not A,
    ok.

binary_boolean() ->
    A and A,
    A or A,
    A xor A,
    ok.

%%% ===========================================================================
%%% 7.14 Short-Circuit Expressions
%%% ===========================================================================

short_circuit() ->
    A andalso A,
    A orelse A,

    A andalso
    A,

    A
    andalso
    A,

    ok.

%%% ===========================================================================
%%% 7.15 List Operations
%%% ===========================================================================

list_operations() ->
    A ++ A,
    A -- A,

    A ++
    A,

    A
    ++
    A,

    ok.

%%% ===========================================================================
%%% 7.16 Bit Syntax Expressions
%%% ===========================================================================

bit_syntax() ->
    <<>>,

    <<
    >>,

    <<A>>,
    <<A:1>>,
    << A : 1 >>,

    <<A/bits>>,
    <<A:1/bits>>,
    << A : 1 / bits >>,

    <<A/integer>>,
    <<A:1/integer>>,
    << A : 1 / integer >>,

    <<<<1>>/binary>>,
    <<<<1,
        2>>/binary,
      3>>,

    bit_syntax() ->
    <<A
    >>,

    <<A:1
    >>,

    <<A
      /
      bits
    >>,

    <<A:1
      /
      bits
    >>,

    <<<<1>>
      /
      binary>>,

    ok.

bit_syntax() ->
    <<
      A
    >>,

    <<
      A:1
    >>,

    <<
      A
      /
      bits
    >>,

    <<
      A:1
      /
      bits
    >>,

    ok.

bit_syntax() ->
    <<A,
      B>>.

%%% ===========================================================================
%%% 7.17 Fun Expressions
%%% ===========================================================================

% fun - without linebreaks
f() ->
    fun func/0,
    fun mod:func/0,
    fun (A) -> A end,
    fun (A) -> A; (B) -> B end,
    ok.

% fun - with some linebreaks
f() ->
    fun (A) -> A
    end,
    fun (A) -> A;
        (B) -> B
    end,
    ok.

% fun - with more linebreaks
f() ->
    fun (A) ->
            A
    end,
    fun (A) ->
            A;
        (B) ->
            B
    end,
    ok.

% fun - with some linebreaks with less space
f() ->
    fun(A) -> A
    end,
    fun(A) -> A;
       (B) -> B
    end,
    ok.

% fun - with more linebreaks with less space
f() ->
    fun(A) ->
            A
    end,
    fun(A) ->
            A;
       (B) ->
            B
    end,
    ok.

% fun - with extra linebreaks
f() ->

    fun
    func/0,

    fun
    func
    /
    0,

    fun
    mod:func/0,

    fun
    mod
    :
    func
    /
    0,

    fun
        (A) ->
            A
    end,

    fun
        (A) ->
            A;
        (B) ->
            B
    end,
    ok.

% fun - without linebreaks + when
f() ->
    fun (A) when A > 0 -> A end,
    fun (A) when A > 0 -> A; (B) when B > 0 -> B end,
    ok.

% fun - with some linebreaks + when
f() ->
    fun (A) when A > 0 -> A
    end,
    fun (A) when A > 0 -> A;
        (B) when B > 0 -> B
    end,
    ok.

% fun - with more linebreaks + when
f() ->
    fun (A) when A > 0 ->
            A
    end,
    fun  (A) when A > 0 ->
            A;
         (B) when B > 0 ->
            B
    end,
    ok.

% fun - with some linebreaks with less space + when
f() ->
    fun(A) when A > 0 -> A
    end,
    fun(A) when A > 0 -> A;
       (B) when B > 0 -> B
    end,
    ok.

% fun - with more linebreaks with less space + when
f() ->
    fun(A) when A > 0 ->
            A
    end,
    fun(A) when A > 0 ->
            A;
       (B) when B > 0 ->
            B
    end,
    ok.

% fun - with extra linebreaks + when
f() ->

    fun
        (A) when A > 0 ->
            A
    end,

    fun
        (A) when A > 0 ->
            A;
        (B) when B > 0 ->
            B
    end,
    ok.

%%% ===========================================================================
%%% 7.18 Catch and Throw
%%% ===========================================================================

catch_example() ->
catch 1 + 2,
      A = (catch 1 + 2),
      A = catch 1 + 2, % syntax error
                ok.

throw_example() ->
    throw(hello).

%%% ===========================================================================
%%% 7.19 Try
%%% ===========================================================================

try_example() ->
    try
        f()
    of
        A -> B
    catch
        throw:E -> E;
        exit:E -> E;
        error:E -> E
    after
        AfterBody
    end,

    ok.

syntax_error() ->
    try
    end, % syntax error

    try X
    of
    end, % syntax error

    ok.

%%% Plain

try_without_of__one_branch() ->

    % try-catch-end
    try
        f()
    catch
        A ->
            B
    end,

    % try-after-end
    try
        f()
    after
        AfterBody1
    end,

    % try-catch-after-end
    try
        f()
    catch
        A ->
            B
    after
        AfterBody1
    end,

    ok.

try_with_of__one_branch() ->

    % try-of-catch-end
    try
        f()
    of
        A ->
            B
    catch
        A ->
            B
    end,

    % try-of-after-end
    try
        f()
    of
        A ->
            B
    after
        AfterBody1
    end,

    % try-of-catch-after-end
    try
        f()
    of
        A ->
            B
    catch
        A ->
            B
    after
        AfterBody1
    end,

    ok.

try_without_of__two_branches() ->

    % try-catch-end
    try
        f()
    catch
        A ->
            B;
        A ->
            B
    end,

    % try-after-end
    try
        f()
    after
        AfterBody1,
        AfterBody2
    end,

    % try-catch-after-end
    try
        f()
    catch
        A ->
            B;
        A ->
            B
    after
        AfterBody1,
        AfterBody2
    end,

    ok.

try_with_of__two_branches() ->

    % try-of-catch-end
    try
        f()
    of
        A ->
            B;
        A ->
            B
    catch
        A ->
            B
    end,

    % try-of-after-end
    try
        f()
    of
        A ->
            B;
        A ->
            B
    after
        AfterBody1,
        AfterBody2
    end,

    % try-of-catch-after-end
    try
        f()
    of
        A ->
            B;
        A ->
            B
    catch
        A ->
            B;
        A ->
            B
    after
        AfterBody1,
        AfterBody2
    end,

    ok.

%%% With guards

try_without_of__one_branch__guards() ->

    % try-catch-end
    try
        f()
    catch
        A when A > 0->
            B
    end,

    % try-after-end
    try
        f()
    after
        AfterBody1
    end,

    % try-catch-after-end
    try
        f()
    catch
        A when A > 0 ->
            B
    after
        AfterBody1
    end,

    ok.

try_with_of__one_branch__guards() ->

    % try-of-catch-end
    try
        f()
    of
        A when A > 0 ->
            B
    catch
        A when A > 0 ->
            B
    end,

    % try-of-after-end
    try
        f()
    of
        A when A > 0 ->
            B
    after
        AfterBody1
    end,

    % try-of-catch-after-end
    try
        f()
    of
        A when A > 0 ->
            B
    catch
        A when A > 0 ->
            B
    after
        AfterBody1
    end,

    ok.

try_without_of__two_branches__guards() ->

    % try-catch-end
    try
        f()
    catch
        A when A > 0 ->
            B;
        A when A > 0 ->
            B
    end,

    % try-after-end
    try
        f()
    after
        AfterBody1,
        AfterBody2
    end,

    % try-catch-after-end
    try
        f()
    catch
        A when A > 0 ->
            B;
        A when A > 0 ->
            B
    after
        AfterBody1,
        AfterBody2
    end,

    ok.

try_with_of__two_branches__guards() ->

    % try-of-catch-end
    try
        f()
    of
        A when A > 0 ->
            B;
        A when A > 0 ->
            B
    catch
        A when A > 0 ->
            B
    end,

    % try-of-after-end
    try
        f()
    of
        A when A > 0 ->
            B;
        A when A > 0 ->
            B
    after
        AfterBody1,
        AfterBody2
    end,

    % try-of-catch-after-end
    try
        f()
    of
        A when A > 0 ->
            B;
        A when A > 0 ->
            B
    catch
        A when A > 0 ->
            B;
        A when A > 0 ->
            B
    after
        AfterBody1,
        AfterBody2
    end,

    ok.

%%% No linebreak after keywords

try_without_of__two_branches() ->

    % try-catch-end
    try f()
    catch A ->
            B;
        A ->
            B
    end,

    % try-after-end
    try f()
    after AfterBody1,
        AfterBody2
    end,

    % try-catch-after-end
    try f()
    catch A ->
            B;
        A ->
            B
    after AfterBody1,
        AfterBody2
    end,

    ok.

try_with_of__two_branches() ->

    % try-of-catch-end
    try f()
    of A ->
            B;
        A ->
            B
    catch A ->
            B
    end,

    % try-of-after-end
    try f()
    of A ->
            B;
        A ->
            B
    after AfterBody1,
        AfterBody2
    end,

    % try-of-catch-after-end
    try f()
    of A ->
            B;
        A ->
            B
    catch A ->
            B;
        A ->
            B
    after AfterBody1,
        AfterBody2
    end,

    ok.

%%% One-liners

try_without_of__one_branch() ->
    try f() catch A -> B end,
    try f() after AfterBody1 end,
    try f() catch A -> B after AfterBody1 end,
    ok.

try_with_of__one_branch() ->
    try f() of A -> B catch A -> B end,
    try f() of A -> B after AfterBody1 end,
    try f() of A -> B catch A -> B after AfterBody1 end,
    ok.

try_without_of__two_branches() ->
    try f() catch A -> B; A -> B end,
    try f() after AfterBody1, AfterBody2 end,
    try f() catch A -> B; A -> B after AfterBody1, AfterBody2 end,
    ok.

try_with_of__two_branches() ->
    try f() of A -> B; A -> B catch A -> B end,
    try f() of A -> B; A -> B after AfterBody1, AfterBody2 end,
    try f() of A -> B; A -> B catch A -> B; A -> B after AfterBody1, AfterBody2 end,
    ok.

%%% Guards again

f() ->
    try
        X
    of
        A ->
            A
    end.

f() ->
    try A of
        B when B > 0 ->
            ok;
        B
          when
              B > 0 ->
            ok;

        B
          when
              B > 0;
              B < 0
              ->
            ok
    end,
    ok.

f() ->
    try A of
        B when B > 0 ->
            ok;
        B
          when
              B > 0 ->
            ok;
        B
          when B > 0;
               B < 0
               ->
            ok;
        B
          when
              B > 0;
              B < 0
              ->
            ok
    catch
        B when B > 0 ->
            ok;
        B
          when
              B > 0 ->
            ok;

        B
          when B > 0;
               B < 0
               ->
            ok;
        B
          when
              B > 0;
              B < 0
              ->
            ok
    end,
    ok.

%%% ===========================================================================
%%% 7.20 Parenthesized Expressions
%%% ===========================================================================

f() ->
    11 +
    22 * 33,

    % {Difference from Emacs}
    %
    % Emacs indentation:
    %
    %     (11 +
    %         22) * 3
    (11 +
     22) * 3,

    (
      A,
      B
    )

    ok.

%%% ===========================================================================
%%% 7.21 Block Expressions
%%% ===========================================================================

f() ->
    begin A,
          B
    end,
    begin
        A,
        B
    end,
    begin A,
          begin B
          end,
          C
    end,
    begin
        A,
        begin
            B
        end,
        C, D,
        E
    end,
    begin
        A,
        B, begin
               C
           end,
        D
    end,
    ok.

f() ->
    begin A, B end,
    begin A, begin B end, C end,
    ok.

f() ->
    begin f, f(
                A
              )
    end,
    ok.

%%% ===========================================================================
%%% 7.22 List Comprehensions
%%% ===========================================================================

list_comprehension() ->

    % {Difference from Emacs}
    %
    % Emacs indentation:
    %
    %     [A ||
    %         A <- L]
    [A ||
     A <- L],

    [ A ||
      A <- L],

    [A
     || A <- L],

    [ A
      || A <- L],

    [ {A, B} ||
      {A, B} <- [A, B], f(X), {A, B} <- [A, B], f(X)],

    [ {A, B}
      || {A, B} <- [A, B], f(X), {A, B} <- [A, B], f(X)],

    [ {A, B}
      || {A,
          B} <- [A,
                 B],
      f(X),
      {A,
       B} <- [A,
              B],
      f(X)],

    [ {A, B} ||
      <<A, B>> <= <<A, B>>, f(X), <<A, B>> <= <<A, B>>, f(X)],

    ok.

%%% ===========================================================================
%%% 7.23 Bit String Comprehensions
%%% ===========================================================================

bit_string_comprehension() ->

    % {Difference from Emacs}
    %
    % Emacs indentation:
    %
    %     <<A ||
    %         A <- L>>
    <<A ||
      A <- L>>,

    << A ||
       A <- L>>,

    <<A
      || A <- L>>,

    << A
       || A <- L>>,

    << <<A, B>> ||
       <<A, B>> <- <<A, B>>, f(X), <<A, B>> <- <<A, B>>, f(X)>>,

    << <<A, B>>
       || <<A, B>> <- <<A, B>>, f(X), <<A, B>> <- <<A, B>>, f(X)>>,

    << <<A, B>>
       || <<A,
            B>> <- <<A,
                     B>>,
       f(X),
       <<A,
         B>> <- <<A,
                  B>>,
       f(X)>>,

    << <<A, B>> ||
       {A, B} <- [A, B], f(X), {A, B} <- [A, B], f(X)>>,

    ok.

%%% ===========================================================================
%%% 7.x: Other expressions
%%% ===========================================================================

%% Comma

f() ->
    1
    ,
    2
    .

%% Period

f() ->
    (
      .

f() ->
    (
      . % xx

f() ->
    (
      .% xx

f() ->
    % Not valid Erlang; the indent script thinks 'B' is the start of a new
    % clause, so it indents 'ok' below 'B'.
    A . B,
        ok.

% Not valid Erlang, but why not behave nicely
ok.
f() ->
    ok.

f() ->
    A = #a{},

    %A#a . f1, % syntax error
    A#a .f1,   % valid Erlang

    %A#a.      % syntax error
    %f1,

    A#a
    .f1,   % valid Erlang

    _ = 1.2,   % valid Erlang
    %_ = 1 .2,  % syntax error
    %_ = 1 . 2, % syntax error
    %_ = 1. 2,  % syntax error

    _ = " .
    ", % valid Erlang

    _ = ' .
    ', % valid Erlang

    ok.

f() -> 1. f() ->
              3.

%%% ===========================================================================
%%% 8 The Preprocessor
%%% ===========================================================================

%%% ===========================================================================
%%% 8.1 File Inclusion
%%% ===========================================================================

-include("my_records.hrl").
-include("incdir/my_records.hrl").
-include("/home/user/proj/my_records.hrl").
-include("$PROJ_ROOT/my_records.hrl").
-include_lib("kernel/include/file.hrl").

%%% ===========================================================================
%%% 8.2 Defining and Using Macros
%%% ===========================================================================

-define(TIMEOUT,
        200).

call(Request) ->
    server:call(refserver, Request, ?TIMEOUT).

-define(MACRO1(X,
               Y),
        {a, X,
         b, Y}).

bar(X) ->
    ?MACRO1(a, b),
    ?MACRO1(X, 123),
    ok.

-define(TESTCALL(Call), io:format("Call ~s: ~w~n", [??Call, Call])).

?TESTCALL(myfunction(1,
                     2)).

%%% ===========================================================================
%%% 9 Records
%%% ===========================================================================

%%% ===========================================================================
%%% 9.1 Defining Records
%%% ===========================================================================

-record(person, {name,
                 phone=0,
                 address}).

-record(person,
        {name,
         phone=
         0,
         address=
         0}).

% {Difference in Emacs}
%
% Emacs indentation:
%
%    -record(person,
%            {name
%             =
%                 0,
%             phone
%             =
%                 0,
%             address
%             =
%                 0}).
-record(person,
        {name,
         =
         0,
         phone
         =
         0,
         address
         =
         0}).

-record(person,
        {name
         =0,
         phone
         =0,
         address
         =0
        }).

%%% ===========================================================================
%%% 9.2 Creating Records
%%% ===========================================================================

lookup(Name, Tab) ->

    ets:match_object(Tab, #person{name=Name,
                                  _='_'}),

    ets:match_object(Tab,
                     #person{name
                             =
                             Name,
                             _
                             =
                             '_'}),

    ok.

%%% ===========================================================================
%%% 9.3 Accessing Record Fields
%%% ===========================================================================

lookup(Name, List) ->

    A#rec.field,
    A#rec
    .field,
    ok,

    lists:keysearch(Name, #person.name, List),

    lists:keysearch(Name, #person
                    .name, List),

    % {Difference in Emacs}
    %
    % Emacs indentation:
    %
    %     lists:keysearch(Name, #
    %                       person
    %                     .name, List),

    lists:keysearch(Name, #
                    person
                    .name, List),

    ok.

%%% ===========================================================================
%%% 9.4 Updating Records
%%% ===========================================================================

f() ->

    Expr#Name{Field1=
              Expr1,
              FieldK=
              ExprK},

    Expr
    #
    Name{Field1
         =
         Expr1,
         FieldK
         =
         ExprK},

    ok.

%%% ===========================================================================
%%% 9.5 Records in Guards
%%% ===========================================================================

handle(Msg, State) when Msg
                        ==
                        #msg{to=
                             void,
                             no=
                             3} ->
    ok;
handle(Msg, State) when Msg
                        ==
                        #msg{
                             to=
                             void,
                             no=
                             3} ->
    ok;
handle(Msg, State) when State#state.running
                        ==
                        true ->
    ok.

%%% ===========================================================================
%%% 9.6 Records in Patterns
%%% ===========================================================================

f() ->
    #person{name=
            Name} =
    Person.

%%% ===========================================================================
%%% 9.7 Nested records
%%% ===========================================================================

-record(nrec0, {name = "nested0"}).
-record(nrec1, {name = "nested1", nrec0=#nrec0{}}).
-record(nrec2, {name = "nested2", nrec1=#nrec1{}}).

f() ->

    N2 = #nrec2{},

    "nested0" = ((N2#nrec2.nrec1)#
                 nrec1.nrec0)#nrec0.name,

    N0n = ((N2#nrec2.nrec1)#nrec1.nrec0)#
    nrec0{name = "nested0a"},

    "nested0" = N2#nrec2
    .nrec1
    #nrec1.nrec0#
    nrec0.name,

    N0n = N2#nrec2
    .nrec1
    #nrec1.nrec0#
    nrec0{name = "nested0a"},

    ok.

%%% ===========================================================================
%%% Issue #1: https://github.com/hcs42/vim-erlang/issues/1
%%% ===========================================================================

rand_pprint_slice() ->
    F = fun pprint/3,
    Rand = fun() ->
                   Bytes = crypto:rand_bytes(random:uniform(?MAX_BIN_SIZE)),
                   Pos = random:uniform(byte_size(Bytes)),
                   Len = random:uniform(byte_size(Bytes)),
                   {Bytes, Pos, Len}
           end,
    Tests = [ Rand() || _ <- lists:seq(1, ?RUNS) ],
    Title = fun(Size, Slice) ->
                    iolist_to_binary(io_lib:format("Random pprint w/ slice: (~p) ~p", [Size, Slice]))
            end,
    [ { Title(byte_size(Bytes), {Pos, Len}), fun() -> ?assertEqual(ok, F(Bytes, {Pos, Len}, [])) end }
      || { Bytes, Pos, Len } <- Tests ].

rand_pprint_opts() ->
    F = fun pprint/2,
    CustomPrinter = fun(B) when is_list(B) -> works end,
    OptsMap = [
               %% Option                          %% Predicate
               { {return,  binary},               fun erlang:is_binary/1  },
               { {return,  iolist},               fun erlang:is_list/1    },

               { {printer, CustomPrinter},        fun(works) -> true; (_) -> false end  },
               { {invalid, option},               fun({'EXIT', {badarg, _}}) -> true; (O) -> O end }
              ],
    Range = lengthOptsMap,
    Rand = fun() ->
                   Input = crypto:rand_bytes(random:uniform(?MAX_BIN_SIZE)),
                   {Opt, Predicate} = lists:nth(random:uniform(Range), OptsMap),
                   {Input, Opt, Predicate}
           end,
    Tests = [ Rand() || _ <- lists:seq(1, ?RUNS) ],
    Title = fun(Opt) ->
                    iolist_to_binary([ "Random pprint w/ opt: ", io_lib:format("~p", [Opt]) ]) end,
    [ { Title(Opt), fun() -> ?assertEqual(true, Pred( catch( F(I, [Opt]) ) )) end }
      || {I, Opt, Pred} <- Tests ].
