.class public Lcom/bea/xml/stream/util/SymbolTable;
.super Ljava/lang/Object;
.source "SymbolTable.java"


# instance fields
.field private depth:I

.field private table:Lcom/bea/xml/stream/util/Stack;

.field private values:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lcom/bea/xml/stream/util/SymbolTable;->depth:I

    .line 42
    new-instance v0, Lcom/bea/xml/stream/util/Stack;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/util/SymbolTable;->table:Lcom/bea/xml/stream/util/Stack;

    .line 43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/util/SymbolTable;->values:Ljava/util/Map;

    .line 44
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 148
    new-instance v0, Lcom/bea/xml/stream/util/SymbolTable;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/SymbolTable;-><init>()V

    .line 149
    .local v0, "st":Lcom/bea/xml/stream/util/SymbolTable;
    invoke-virtual {v0}, Lcom/bea/xml/stream/util/SymbolTable;->openScope()V

    .line 150
    const-string v1, "x"

    const-string v2, "foo"

    invoke-virtual {v0, v1, v2}, Lcom/bea/xml/stream/util/SymbolTable;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    const-string v1, "y"

    const-string v2, "bar"

    invoke-virtual {v0, v1, v2}, Lcom/bea/xml/stream/util/SymbolTable;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "1 x:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v0, v3}, Lcom/bea/xml/stream/util/SymbolTable;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 153
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "1 y:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "y"

    invoke-virtual {v0, v3}, Lcom/bea/xml/stream/util/SymbolTable;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 154
    invoke-virtual {v0}, Lcom/bea/xml/stream/util/SymbolTable;->openScope()V

    .line 155
    const-string v1, "x"

    const-string v2, "bar"

    invoke-virtual {v0, v1, v2}, Lcom/bea/xml/stream/util/SymbolTable;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    const-string v1, "y"

    const-string v2, "foo"

    invoke-virtual {v0, v1, v2}, Lcom/bea/xml/stream/util/SymbolTable;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    invoke-virtual {v0}, Lcom/bea/xml/stream/util/SymbolTable;->openScope()V

    .line 158
    const-string v1, "x"

    const-string v2, "barbie"

    invoke-virtual {v0, v1, v2}, Lcom/bea/xml/stream/util/SymbolTable;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    invoke-virtual {v0}, Lcom/bea/xml/stream/util/SymbolTable;->openScope()V

    .line 160
    invoke-virtual {v0}, Lcom/bea/xml/stream/util/SymbolTable;->closeScope()V

    .line 162
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "3 x:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v0, v3}, Lcom/bea/xml/stream/util/SymbolTable;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 163
    invoke-virtual {v0}, Lcom/bea/xml/stream/util/SymbolTable;->closeScope()V

    .line 164
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "2 x:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v0, v3}, Lcom/bea/xml/stream/util/SymbolTable;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 165
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "2 y:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "y"

    invoke-virtual {v0, v3}, Lcom/bea/xml/stream/util/SymbolTable;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 166
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->print(Ljava/lang/Object;)V

    .line 167
    invoke-virtual {v0}, Lcom/bea/xml/stream/util/SymbolTable;->closeScope()V

    .line 168
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "1 x:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v0, v3}, Lcom/bea/xml/stream/util/SymbolTable;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 169
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "1 y:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "y"

    invoke-virtual {v0, v3}, Lcom/bea/xml/stream/util/SymbolTable;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 170
    invoke-virtual {v0}, Lcom/bea/xml/stream/util/SymbolTable;->closeScope()V

    .line 171
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->print(Ljava/lang/Object;)V

    .line 172
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 47
    const/4 v0, 0x0

    iput v0, p0, Lcom/bea/xml/stream/util/SymbolTable;->depth:I

    .line 48
    iget-object v0, p0, Lcom/bea/xml/stream/util/SymbolTable;->table:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v0}, Lcom/bea/xml/stream/util/Stack;->clear()V

    .line 49
    iget-object v0, p0, Lcom/bea/xml/stream/util/SymbolTable;->values:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 50
    return-void
.end method

.method public closeScope()V
    .registers 6

    .prologue
    .line 115
    iget-object v3, p0, Lcom/bea/xml/stream/util/SymbolTable;->table:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v3}, Lcom/bea/xml/stream/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bea/xml/stream/util/Symbol;

    .line 116
    .local v0, "symbol":Lcom/bea/xml/stream/util/Symbol;
    iget v1, v0, Lcom/bea/xml/stream/util/Symbol;->depth:I

    .line 119
    .local v1, "symbolDepth":I
    :goto_a
    iget v3, p0, Lcom/bea/xml/stream/util/SymbolTable;->depth:I

    if-ne v1, v3, :cond_3e

    iget-object v3, p0, Lcom/bea/xml/stream/util/SymbolTable;->table:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v3}, Lcom/bea/xml/stream/util/Stack;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3e

    .line 120
    iget-object v3, p0, Lcom/bea/xml/stream/util/SymbolTable;->table:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v3}, Lcom/bea/xml/stream/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "symbol":Lcom/bea/xml/stream/util/Symbol;
    check-cast v0, Lcom/bea/xml/stream/util/Symbol;

    .line 123
    .restart local v0    # "symbol":Lcom/bea/xml/stream/util/Symbol;
    iget-object v3, p0, Lcom/bea/xml/stream/util/SymbolTable;->values:Ljava/util/Map;

    iget-object v4, v0, Lcom/bea/xml/stream/util/Symbol;->name:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bea/xml/stream/util/Stack;

    .line 124
    .local v2, "valueStack":Lcom/bea/xml/stream/util/Stack;
    invoke-virtual {v2}, Lcom/bea/xml/stream/util/Stack;->pop()Ljava/lang/Object;

    .line 127
    iget-object v3, p0, Lcom/bea/xml/stream/util/SymbolTable;->table:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v3}, Lcom/bea/xml/stream/util/Stack;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3e

    .line 128
    iget-object v3, p0, Lcom/bea/xml/stream/util/SymbolTable;->table:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v3}, Lcom/bea/xml/stream/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "symbol":Lcom/bea/xml/stream/util/Symbol;
    check-cast v0, Lcom/bea/xml/stream/util/Symbol;

    .line 129
    .restart local v0    # "symbol":Lcom/bea/xml/stream/util/Symbol;
    iget v1, v0, Lcom/bea/xml/stream/util/Symbol;->depth:I

    .line 131
    goto :goto_a

    .line 132
    .end local v2    # "valueStack":Lcom/bea/xml/stream/util/Stack;
    :cond_3e
    iget v3, p0, Lcom/bea/xml/stream/util/SymbolTable;->depth:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/bea/xml/stream/util/SymbolTable;->depth:I

    .line 133
    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 83
    iget-object v1, p0, Lcom/bea/xml/stream/util/SymbolTable;->values:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bea/xml/stream/util/Stack;

    .line 84
    .local v0, "valueStack":Lcom/bea/xml/stream/util/Stack;
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Lcom/bea/xml/stream/util/Stack;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 85
    :cond_10
    const/4 v1, 0x0

    .line 86
    :goto_11
    return-object v1

    :cond_12
    invoke-virtual {v0}, Lcom/bea/xml/stream/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_11
.end method

.method public getAll(Ljava/lang/String;)Ljava/util/Set;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 91
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 92
    .local v1, "result":Ljava/util/HashSet;
    iget-object v3, p0, Lcom/bea/xml/stream/util/SymbolTable;->table:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v3}, Lcom/bea/xml/stream/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 93
    .local v0, "i":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_29

    .line 94
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bea/xml/stream/util/Symbol;

    .line 95
    .local v2, "s":Lcom/bea/xml/stream/util/Symbol;
    invoke-virtual {v2}, Lcom/bea/xml/stream/util/Symbol;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 96
    invoke-virtual {v2}, Lcom/bea/xml/stream/util/Symbol;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 98
    .end local v2    # "s":Lcom/bea/xml/stream/util/Symbol;
    :cond_29
    return-object v1
.end method

.method public getDepth()I
    .registers 2

    .prologue
    .line 56
    iget v0, p0, Lcom/bea/xml/stream/util/SymbolTable;->depth:I

    return v0
.end method

.method public openScope()V
    .registers 2

    .prologue
    .line 105
    iget v0, p0, Lcom/bea/xml/stream/util/SymbolTable;->depth:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/bea/xml/stream/util/SymbolTable;->depth:I

    .line 106
    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 67
    iget-object v1, p0, Lcom/bea/xml/stream/util/SymbolTable;->table:Lcom/bea/xml/stream/util/Stack;

    new-instance v2, Lcom/bea/xml/stream/util/Symbol;

    iget v3, p0, Lcom/bea/xml/stream/util/SymbolTable;->depth:I

    invoke-direct {v2, p1, p2, v3}, Lcom/bea/xml/stream/util/Symbol;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v1, v2}, Lcom/bea/xml/stream/util/Stack;->push(Ljava/lang/Object;)V

    .line 68
    iget-object v1, p0, Lcom/bea/xml/stream/util/SymbolTable;->values:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    .line 69
    new-instance v0, Lcom/bea/xml/stream/util/Stack;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/Stack;-><init>()V

    .line 70
    .local v0, "valueStack":Lcom/bea/xml/stream/util/Stack;
    invoke-virtual {v0, p2}, Lcom/bea/xml/stream/util/Stack;->push(Ljava/lang/Object;)V

    .line 71
    iget-object v1, p0, Lcom/bea/xml/stream/util/SymbolTable;->values:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    :goto_21
    return-void

    .line 73
    .end local v0    # "valueStack":Lcom/bea/xml/stream/util/Stack;
    :cond_22
    iget-object v1, p0, Lcom/bea/xml/stream/util/SymbolTable;->values:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bea/xml/stream/util/Stack;

    .line 74
    .restart local v0    # "valueStack":Lcom/bea/xml/stream/util/Stack;
    invoke-virtual {v0, p2}, Lcom/bea/xml/stream/util/Stack;->push(Ljava/lang/Object;)V

    goto :goto_21
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 136
    iget-object v3, p0, Lcom/bea/xml/stream/util/SymbolTable;->table:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v3}, Lcom/bea/xml/stream/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 137
    .local v0, "i":Ljava/util/Iterator;
    const-string v1, ""

    .line 138
    .local v1, "retVal":Ljava/lang/String;
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 139
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bea/xml/stream/util/Symbol;

    .line 140
    .local v2, "symbol":Lcom/bea/xml/stream/util/Symbol;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 141
    goto :goto_8

    .line 142
    .end local v2    # "symbol":Lcom/bea/xml/stream/util/Symbol;
    :cond_2c
    return-object v1
.end method

.method public withinElement()Z
    .registers 2

    .prologue
    .line 60
    iget v0, p0, Lcom/bea/xml/stream/util/SymbolTable;->depth:I

    if-lez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method
