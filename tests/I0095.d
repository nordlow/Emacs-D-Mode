// #run: (d-test-fontification)

alias Type = int;

void foo(const(Type) param);

const(Type) bar(const(Type) param);

const(Type) baz(ref const(Type) param, lazy int param2);
