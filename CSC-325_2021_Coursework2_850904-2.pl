s(s(NP,VP)) --> np(NP,Person,Number,subject),vp(VP,Person,Number).
/*
s is for the sentence as a whole
np(_,np(Det,N)) --> det(Det),n(N).
np(Person) --> pn(). pn being proper nouns
*/
np(np(PRONOUN),Person,Number,Z) --> pro(PRONOUN,Person,Number,Z).
np(np(DET,NBAR,PP),Person,Number,Z) --> det(DET,Person),nbar(NBAR,Person),pp(PP,Person,Number,Z).
np(np(DET,NBAR),Person,_,_) --> det(DET,Person), nbar(NBAR,Person).

vp(vp(V,NP,PP),Person,Number) --> v(V,Person,Number),np(NP,_,Number,object), pp(PP,Person,Number,_).
vp(vp(V,NP),Person,Number) --> v(V,Person,Number),np(NP,_,Number,object).
vp(vp(V),Person,Number) --> v(V,Person,Number).

nbar(nbar(SECTION),Person) --> n(SECTION,Person).
nbar(nbar(SECTION),Person) --> jp(SECTION,Person).
%nbar(nbar(SECTION)) --> n(SECTION),pp(SECTION).
% nbar must have a nouns, can have a prepostional phrases
pp(pp(X,_),_,_,_) --> prep(X).
pp(pp(X,Y),Z,Number,A) --> prep(X),np(Y,Z,Number,A).
% pp stands for prepostional phrases. Contains prepostions (prep), np
% and nbar
jp(jp(ADJ,NOUN),Number) --> adj(ADJ),n(NOUN,Number). %done
jp(jp(ADJ,NOUN),Number) --> adj(ADJ),jp(NOUN,Number). %done
%jointphrase e.g. Adjectives then Nouns

%prep stands for prepostions
%tv(tv(TV),X) --> [TV], {lex(TV,tv,X)}.
%tv stands for transitive verb

%iv(iv(IV),X) --> [IV], {lex(IV,iv,X)}.

prep(prep(PREP)) --> [PREP], {lex(PREP,prep)}. %Done
det(det(DET),X) --> [DET], {lex(DET,det, X)}. %Done
pro(pro(PRO),X,Number,Z) --> [PRO], {lex(PRO,pro,X,Number,Z)}. %X means singlar or plural
n(n(NOUN),X) --> [NOUN], {lex(NOUN,n,X)}. %Done
v(v(VERB),X,Number) --> [VERB], {lex(VERB,v,X,Number)}.
adj(adj(ADJECTIVE)) --> [ADJECTIVE], {lex(ADJECTIVE,adj)}. %done

%parse

%Lexicon Beginning
%Determiners

lex(the, det, _).
lex(a, det, single).
lex(two, det, plural).

%Nouns (Single and Plural)

lex(woman, n,single).
lex(man, n,single).
lex(apple, n,single).
lex(chair, n,single).
lex(room, n,single).

lex(women, n,plural).
lex(men, n,plural).
lex(apples, n,plural).
lex(chairs, n,plural).
lex(rooms, n,plural).

%Pronouns (Single and Plural)

lex(i, pro, single, 1, subject).
lex(you, pro,single, 2, subject).
lex(he, pro, single, 3, subject).
lex(she, pro, single, 3, subject).
lex(it, pro, single, 3, subject).

lex(me, pro, single, 1, object).
lex(you, pro, single, 2, object).
lex(him, pro, single, 3, object).
lex(her, pro, single, 3, object).
lex(it, pro, single, 3, object).

lex(we, pro, plural,1,subject).
lex(you, pro, plural,2,subject).
lex(they, pro, plural,3,subject).

lex(them, pro, plural,3,object).
lex(us, pro, plural,1,object).
lex(you, pro, plural,2,object).


%Transitive verbs
lex(know, v, single, 1).
lex(know, v, single, 2).
lex(knows, v, single, 3).
lex(know, v, plural, _).

lex(see, v, single, 1).
lex(see, v, single, 2).
lex(sees, v, single, 3).
lex(see, v, plural, _).

lex(hire, v, single, 1).
lex(hire, v, single, 2).
lex(hires, v, single, 3).
lex(hire, v, plural, _).

%Intranstive verbs
lex(fall, v, single, 1).
lex(fall, v, single, 2).
lex(falls, v, single, 3).
lex(fall, v, plural, _).

lex(sleep, v, single, 1).
lex(sleep, v, single, 2).
lex(sleeps, v, single, 3).
lex(sleep, v, plural, _).


%Prep

lex(on, prep).
lex(in, prep).
lex(under, prep).

%Adjectives

lex(old, adj).
lex(young, adj).
lex(red, adj).
lex(short, adj).
lex(tall, adj).

/*
Lex(and,conj).
lex(while,conj).
*/


/*

Results:

s(Tree,[the,woman,sees,the,apples],[]) .
[2]  ?- s(Tree,[a, woman, knows, him] ,[]).
Tree = s(np(det(a), nbar(n(woman))), vp(v(knows), np(pro(him)))) .

[2]  ?- s(Tree,[two, woman, hires, a, man] ,[]).
false.

[2]  ?- s(Tree,[two, women, hire, a, man] ,[]).
Tree = s(np(det(two), nbar(n(women))), vp(v(hire), np(det(a), nbar(n(man))))) .

[2]  ?- s(Tree,[she, knows, her] ,[]).
Tree = s(np(pro(she)), vp(v(knows), np(pro(her)))) .

[2]  ?- s(Tree,[she, know, the, man] ,[]).
false.

[2]  ?- s(Tree,[us, see, the, apple] ,[]).
false.

[2]  ?- s(Tree,[we, see, the, apple] ,[]).
Tree = s(np(pro(we)), vp(v(see), np(det(the), nbar(n(apple))))) .

[2]  ?- s(Tree,[i, know, a, short, man] ,[]).
Tree = s(np(pro(i)), vp(v(know), np(det(a), nbar(jp(adj(short), n(man)))))) .

[2]  ?- s(Tree,[he, hires, they] ,[]).
false.

[2]  ?- s(Tree,[two, apples, fall] ,[]).
Tree = s(np(det(two), nbar(n(apples))), vp(v(fall))) .

[2]  ?- s(Tree,[the, apple, falls] ,[]).
Tree = s(np(det(the), nbar(n(apple))), vp(v(falls))) .

[2]  ?- s(Tree,[the, apples, fall] ,[]).
Tree = s(np(det(the), nbar(n(apples))), vp(v(fall))) .

[2]  ?- s(Tree,[i, sleep] ,[]).
Tree = s(np(pro(i)), vp(v(sleep))) .

[2]  ?- s(Tree,[you, sleep] ,[]).
Tree = s(np(pro(you)), vp(v(sleep))) .

[2]  ?- s(Tree,[she, sleeps] ,[]).
Tree = s(np(pro(she)), vp(v(sleeps))) .

[2]  ?- s(Tree,[he, sleep] ,[]).
false.

[2]  ?-
|    s(Tree,[them, sleep] ,[]).
false.

[2]  ?- s(Tree,[a, men, sleep] ,[]).
false.

[2]  ?- s(Tree,[the, tall, woman, sees, the, red] ,[]).
false.

[2]  ?- s(Tree,[the, young, tall, man, knows, the, old, short, woman] ,[]).
Tree = s(np(det(the), nbar(jp(adj(young), jp(adj(tall), n(man))))), vp(v(knows), np(det(the), nbar(jp(adj(old), jp(adj(short), n(woman))))))) .

[2]  ?- s(Tree,[a, man, tall, knows, the, short, woman] ,[]).
false.

[2]  ?- s(Tree,[a, man, on, a, chair, sees, a, woman, in, a, room] ,[]).
Tree = s(np(det(a), nbar(n(man)), pp(prep(on), np(det(a), nbar(n(chair))))), vp(v(sees), np(det(a), nbar(n(woman))), pp(prep(in), np(det(a), nbar(n(room)))))) .

[2]  ?- s(Tree,[a, man, on, a, chair, sees, a, woman, a, room, in] ,[]).
false.

[2]  ?- s(Tree,[the, tall, young, woman, in, a, room, on, the, chair, in, a, room, in, the, room, sees, the, red, apples, under, the, chair] ,[]).
Tree = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))), pp(prep(in), np(det(a), nbar(n(room)), pp(prep(on), np(det(the), nbar(n(chair)), pp(prep(in), np(det(a), nbar(n(...)), pp(prep(...), np(..., ...))))))))), vp(v(sees), np(det(the), nbar(jp(adj(red), n(apples)))), pp(prep(under), np(det(the), nbar(n(chair)))))) .

[2]  ?- s(Tree,[the, woman, sees, the, apples] ,[]).
Tree = s(np(det(the), nbar(n(woman))), vp(v(sees), np(det(the), nbar(n(apples))))) .

[2]  ?- s(Tree,[a, woman, knows, him] ,[]).
Tree = s(np(det(a), nbar(n(woman))), vp(v(knows), np(pro(him)))) .

[2]  ?- s(Tree,[the, man, sleeps] ,[]).
Tree = s(np(det(the), nbar(n(man))), vp(v(sleeps))) .

[2]  ?- s(Tree,[the, room, sleeps] ,[]).
Tree = s(np(det(the), nbar(n(room))), vp(v(sleeps))) .

[2]  ?- s(Tree,[the, apple, sees, the, chair] ,[]).
Tree = s(np(det(the), nbar(n(apple))), vp(v(sees), np(det(the), nbar(n(chair))))) .

[2]  ?- s(Tree,[the, rooms, know, the, man] ,[]).
Tree = s(np(det(the), nbar(n(rooms))), vp(v(know), np(det(the), nbar(n(man))))) .

[2]  ?- s(Tree,[the, apple, falls] ,[]).
Tree = s(np(det(the), nbar(n(apple))), vp(v(falls))) .

[2]  ?- s(Tree,[the, man, falls],[]) .
Tree = s(np(det(the), nbar(n(man))), vp(v(falls))) .
*/
