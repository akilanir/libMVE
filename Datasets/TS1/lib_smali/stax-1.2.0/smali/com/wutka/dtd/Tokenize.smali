.class Lcom/wutka/dtd/Tokenize;
.super Ljava/lang/Object;
.source "Tokenize.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dumpAttribute(Lcom/wutka/dtd/DTDAttribute;)V
    .registers 6
    .param p0, "attr"    # Lcom/wutka/dtd/DTDAttribute;

    .prologue
    .line 213
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lcom/wutka/dtd/DTDAttribute;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 214
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_6b

    .line 216
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    iget-object v3, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/Object;)V

    .line 243
    :cond_27
    :goto_27
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    if-eqz v2, :cond_47

    .line 245
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    iget-object v4, v4, Lcom/wutka/dtd/DTDDecl;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 248
    :cond_47
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->defaultValue:Ljava/lang/String;

    if-eqz v2, :cond_65

    .line 250
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lcom/wutka/dtd/DTDAttribute;->defaultValue:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 253
    :cond_65
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2}, Ljava/io/PrintStream;->println()V

    .line 254
    return-void

    .line 218
    :cond_6b
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    instance-of v2, v2, Lcom/wutka/dtd/DTDEnumeration;

    if-eqz v2, :cond_9f

    .line 220
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 221
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    check-cast v2, Lcom/wutka/dtd/DTDEnumeration;

    invoke-virtual {v2}, Lcom/wutka/dtd/DTDEnumeration;->getItems()[Ljava/lang/String;

    move-result-object v1

    .line 223
    .local v1, "items":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_81
    array-length v2, v1

    if-ge v0, v2, :cond_97

    .line 225
    if-lez v0, :cond_8d

    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 226
    :cond_8d
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 223
    add-int/lit8 v0, v0, 0x1

    goto :goto_81

    .line 228
    :cond_97
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_27

    .line 230
    .end local v0    # "i":I
    .end local v1    # "items":[Ljava/lang/String;
    :cond_9f
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    instance-of v2, v2, Lcom/wutka/dtd/DTDNotationList;

    if-eqz v2, :cond_27

    .line 232
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Notation ("

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 233
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    check-cast v2, Lcom/wutka/dtd/DTDNotationList;

    invoke-virtual {v2}, Lcom/wutka/dtd/DTDNotationList;->getItems()[Ljava/lang/String;

    move-result-object v1

    .line 235
    .restart local v1    # "items":[Ljava/lang/String;
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_b5
    array-length v2, v1

    if-ge v0, v2, :cond_cb

    .line 237
    if-lez v0, :cond_c1

    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 238
    :cond_c1
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 235
    add-int/lit8 v0, v0, 0x1

    goto :goto_b5

    .line 240
    :cond_cb
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_27
.end method

.method public static dumpDTDItem(Lcom/wutka/dtd/DTDItem;)V
    .registers 5
    .param p0, "item"    # Lcom/wutka/dtd/DTDItem;

    .prologue
    .line 142
    if-nez p0, :cond_3

    .line 209
    :cond_2
    :goto_2
    return-void

    .line 144
    :cond_3
    instance-of v2, p0, Lcom/wutka/dtd/DTDAny;

    if-eqz v2, :cond_1c

    .line 146
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Any"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 197
    :cond_e
    :goto_e
    iget-object v2, p0, Lcom/wutka/dtd/DTDItem;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    sget-object v3, Lcom/wutka/dtd/DTDCardinal;->OPTIONAL:Lcom/wutka/dtd/DTDCardinal;

    if-ne v2, v3, :cond_d3

    .line 199
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "?"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_2

    .line 148
    :cond_1c
    instance-of v2, p0, Lcom/wutka/dtd/DTDEmpty;

    if-eqz v2, :cond_28

    .line 150
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Empty"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_e

    .line 152
    :cond_28
    instance-of v2, p0, Lcom/wutka/dtd/DTDName;

    if-eqz v2, :cond_37

    .line 154
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move-object v2, p0

    check-cast v2, Lcom/wutka/dtd/DTDName;

    iget-object v2, v2, Lcom/wutka/dtd/DTDName;->value:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_e

    .line 156
    :cond_37
    instance-of v2, p0, Lcom/wutka/dtd/DTDChoice;

    if-eqz v2, :cond_66

    .line 158
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    move-object v2, p0

    .line 159
    check-cast v2, Lcom/wutka/dtd/DTDChoice;

    invoke-virtual {v2}, Lcom/wutka/dtd/DTDChoice;->getItems()[Lcom/wutka/dtd/DTDItem;

    move-result-object v1

    .line 161
    .local v1, "items":[Lcom/wutka/dtd/DTDItem;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4a
    array-length v2, v1

    if-ge v0, v2, :cond_5e

    .line 163
    if-lez v0, :cond_56

    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "|"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 164
    :cond_56
    aget-object v2, v1, v0

    invoke-static {v2}, Lcom/wutka/dtd/Tokenize;->dumpDTDItem(Lcom/wutka/dtd/DTDItem;)V

    .line 161
    add-int/lit8 v0, v0, 0x1

    goto :goto_4a

    .line 166
    :cond_5e
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_e

    .line 168
    .end local v0    # "i":I
    .end local v1    # "items":[Lcom/wutka/dtd/DTDItem;
    :cond_66
    instance-of v2, p0, Lcom/wutka/dtd/DTDSequence;

    if-eqz v2, :cond_96

    .line 170
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    move-object v2, p0

    .line 171
    check-cast v2, Lcom/wutka/dtd/DTDSequence;

    invoke-virtual {v2}, Lcom/wutka/dtd/DTDSequence;->getItems()[Lcom/wutka/dtd/DTDItem;

    move-result-object v1

    .line 173
    .restart local v1    # "items":[Lcom/wutka/dtd/DTDItem;
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_79
    array-length v2, v1

    if-ge v0, v2, :cond_8d

    .line 175
    if-lez v0, :cond_85

    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 176
    :cond_85
    aget-object v2, v1, v0

    invoke-static {v2}, Lcom/wutka/dtd/Tokenize;->dumpDTDItem(Lcom/wutka/dtd/DTDItem;)V

    .line 173
    add-int/lit8 v0, v0, 0x1

    goto :goto_79

    .line 178
    :cond_8d
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_e

    .line 180
    .end local v0    # "i":I
    .end local v1    # "items":[Lcom/wutka/dtd/DTDItem;
    :cond_96
    instance-of v2, p0, Lcom/wutka/dtd/DTDMixed;

    if-eqz v2, :cond_c6

    .line 182
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    move-object v2, p0

    .line 183
    check-cast v2, Lcom/wutka/dtd/DTDMixed;

    invoke-virtual {v2}, Lcom/wutka/dtd/DTDMixed;->getItems()[Lcom/wutka/dtd/DTDItem;

    move-result-object v1

    .line 185
    .restart local v1    # "items":[Lcom/wutka/dtd/DTDItem;
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_a9
    array-length v2, v1

    if-ge v0, v2, :cond_bd

    .line 187
    if-lez v0, :cond_b5

    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 188
    :cond_b5
    aget-object v2, v1, v0

    invoke-static {v2}, Lcom/wutka/dtd/Tokenize;->dumpDTDItem(Lcom/wutka/dtd/DTDItem;)V

    .line 185
    add-int/lit8 v0, v0, 0x1

    goto :goto_a9

    .line 190
    :cond_bd
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_e

    .line 192
    .end local v0    # "i":I
    .end local v1    # "items":[Lcom/wutka/dtd/DTDItem;
    :cond_c6
    instance-of v2, p0, Lcom/wutka/dtd/DTDPCData;

    if-eqz v2, :cond_e

    .line 194
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "#PCDATA"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_e

    .line 201
    :cond_d3
    iget-object v2, p0, Lcom/wutka/dtd/DTDItem;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    sget-object v3, Lcom/wutka/dtd/DTDCardinal;->ZEROMANY:Lcom/wutka/dtd/DTDCardinal;

    if-ne v2, v3, :cond_e2

    .line 203
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "*"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 205
    :cond_e2
    iget-object v2, p0, Lcom/wutka/dtd/DTDItem;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    sget-object v3, Lcom/wutka/dtd/DTDCardinal;->ONEMANY:Lcom/wutka/dtd/DTDCardinal;

    if-ne v2, v3, :cond_2

    .line 207
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "+"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method public static main([Ljava/lang/String;)V
    .registers 15
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 19
    const/4 v8, 0x0

    .line 22
    .local v8, "parser":Lcom/wutka/dtd/DTDParser;
    const/4 v11, 0x0

    :try_start_2
    aget-object v11, p0, v11

    const-string v12, "://"

    invoke-virtual {v11, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v11

    if-lez v11, :cond_b0

    .line 24
    new-instance v9, Lcom/wutka/dtd/DTDParser;

    new-instance v11, Ljava/net/URL;

    const/4 v12, 0x0

    aget-object v12, p0, v12

    invoke-direct {v11, v12}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    const/4 v12, 0x1

    invoke-direct {v9, v11, v12}, Lcom/wutka/dtd/DTDParser;-><init>(Ljava/net/URL;Z)V

    .end local v8    # "parser":Lcom/wutka/dtd/DTDParser;
    .local v9, "parser":Lcom/wutka/dtd/DTDParser;
    move-object v8, v9

    .line 32
    .end local v9    # "parser":Lcom/wutka/dtd/DTDParser;
    .restart local v8    # "parser":Lcom/wutka/dtd/DTDParser;
    :goto_1b
    const/4 v11, 0x1

    invoke-virtual {v8, v11}, Lcom/wutka/dtd/DTDParser;->parse(Z)Lcom/wutka/dtd/DTD;

    move-result-object v2

    .line 34
    .local v2, "dtd":Lcom/wutka/dtd/DTD;
    iget-object v11, v2, Lcom/wutka/dtd/DTD;->rootElement:Lcom/wutka/dtd/DTDElement;

    if-eqz v11, :cond_40

    .line 36
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "Root element is probably: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, v2, Lcom/wutka/dtd/DTD;->rootElement:Lcom/wutka/dtd/DTDElement;

    iget-object v13, v13, Lcom/wutka/dtd/DTDElement;->name:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 40
    :cond_40
    iget-object v11, v2, Lcom/wutka/dtd/DTD;->elements:Ljava/util/Hashtable;

    invoke-virtual {v11}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .line 42
    .local v3, "e":Ljava/util/Enumeration;
    :cond_46
    :goto_46
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v11

    if-eqz v11, :cond_c7

    .line 44
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/wutka/dtd/DTDElement;

    .line 46
    .local v4, "elem":Lcom/wutka/dtd/DTDElement;
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "Element: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, v4, Lcom/wutka/dtd/DTDElement;->name:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 47
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v12, "   Content: "

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 48
    iget-object v11, v4, Lcom/wutka/dtd/DTDElement;->content:Lcom/wutka/dtd/DTDItem;

    invoke-static {v11}, Lcom/wutka/dtd/Tokenize;->dumpDTDItem(Lcom/wutka/dtd/DTDItem;)V

    .line 49
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v11}, Ljava/io/PrintStream;->println()V

    .line 51
    iget-object v11, v4, Lcom/wutka/dtd/DTDElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v11}, Ljava/util/Hashtable;->size()I

    move-result v11

    if-lez v11, :cond_46

    .line 53
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v12, "   Attributes: "

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 54
    iget-object v11, v4, Lcom/wutka/dtd/DTDElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v11}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 55
    .local v1, "attrs":Ljava/util/Enumeration;
    :goto_92
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v11

    if-eqz v11, :cond_c1

    .line 57
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v12, "        "

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 58
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wutka/dtd/DTDAttribute;

    .line 59
    .local v0, "attr":Lcom/wutka/dtd/DTDAttribute;
    invoke-static {v0}, Lcom/wutka/dtd/Tokenize;->dumpAttribute(Lcom/wutka/dtd/DTDAttribute;)V
    :try_end_a8
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_a8} :catch_a9

    goto :goto_92

    .line 134
    .end local v0    # "attr":Lcom/wutka/dtd/DTDAttribute;
    .end local v1    # "attrs":Ljava/util/Enumeration;
    .end local v2    # "dtd":Lcom/wutka/dtd/DTD;
    .end local v3    # "e":Ljava/util/Enumeration;
    .end local v4    # "elem":Lcom/wutka/dtd/DTDElement;
    :catch_a9
    move-exception v6

    .line 136
    .local v6, "exc":Ljava/lang/Exception;
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v6, v11}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    .line 138
    .end local v6    # "exc":Ljava/lang/Exception;
    :cond_af
    return-void

    .line 28
    :cond_b0
    :try_start_b0
    new-instance v9, Lcom/wutka/dtd/DTDParser;

    new-instance v11, Ljava/io/File;

    const/4 v12, 0x0

    aget-object v12, p0, v12

    invoke-direct {v11, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v12, 0x1

    invoke-direct {v9, v11, v12}, Lcom/wutka/dtd/DTDParser;-><init>(Ljava/io/File;Z)V

    .end local v8    # "parser":Lcom/wutka/dtd/DTDParser;
    .restart local v9    # "parser":Lcom/wutka/dtd/DTDParser;
    move-object v8, v9

    .end local v9    # "parser":Lcom/wutka/dtd/DTDParser;
    .restart local v8    # "parser":Lcom/wutka/dtd/DTDParser;
    goto/16 :goto_1b

    .line 61
    .restart local v1    # "attrs":Ljava/util/Enumeration;
    .restart local v2    # "dtd":Lcom/wutka/dtd/DTD;
    .restart local v3    # "e":Ljava/util/Enumeration;
    .restart local v4    # "elem":Lcom/wutka/dtd/DTDElement;
    :cond_c1
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v11}, Ljava/io/PrintStream;->println()V

    goto :goto_46

    .line 65
    .end local v1    # "attrs":Ljava/util/Enumeration;
    .end local v4    # "elem":Lcom/wutka/dtd/DTDElement;
    :cond_c7
    iget-object v11, v2, Lcom/wutka/dtd/DTD;->entities:Ljava/util/Hashtable;

    invoke-virtual {v11}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .line 67
    :cond_cd
    :goto_cd
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v11

    if-eqz v11, :cond_18d

    .line 69
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/wutka/dtd/DTDEntity;

    .line 71
    .local v5, "entity":Lcom/wutka/dtd/DTDEntity;
    iget-boolean v11, v5, Lcom/wutka/dtd/DTDEntity;->isParsed:Z

    if-eqz v11, :cond_e4

    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v12, "Parsed "

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 73
    :cond_e4
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "Entity: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, v5, Lcom/wutka/dtd/DTDEntity;->name:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 75
    iget-object v11, v5, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    if-eqz v11, :cond_11c

    .line 77
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "    Value: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, v5, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 80
    :cond_11c
    iget-object v11, v5, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    if-eqz v11, :cond_142

    .line 82
    iget-object v11, v5, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    instance-of v11, v11, Lcom/wutka/dtd/DTDSystem;

    if-eqz v11, :cond_162

    .line 84
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "    System: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, v5, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    iget-object v13, v13, Lcom/wutka/dtd/DTDExternalID;->system:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 96
    :cond_142
    :goto_142
    iget-object v11, v5, Lcom/wutka/dtd/DTDEntity;->ndata:Ljava/lang/String;

    if-eqz v11, :cond_cd

    .line 98
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "    NDATA "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, v5, Lcom/wutka/dtd/DTDEntity;->ndata:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_cd

    .line 89
    :cond_162
    iget-object v10, v5, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    check-cast v10, Lcom/wutka/dtd/DTDPublic;

    .line 91
    .local v10, "pub":Lcom/wutka/dtd/DTDPublic;
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "    Public: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, v10, Lcom/wutka/dtd/DTDPublic;->pub:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, v10, Lcom/wutka/dtd/DTDPublic;->system:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_142

    .line 101
    .end local v5    # "entity":Lcom/wutka/dtd/DTDEntity;
    .end local v10    # "pub":Lcom/wutka/dtd/DTDPublic;
    :cond_18d
    iget-object v11, v2, Lcom/wutka/dtd/DTD;->notations:Ljava/util/Hashtable;

    invoke-virtual {v11}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .line 103
    :cond_193
    :goto_193
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v11

    if-eqz v11, :cond_af

    .line 105
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/wutka/dtd/DTDNotation;

    .line 107
    .local v7, "notation":Lcom/wutka/dtd/DTDNotation;
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "Notation: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, v7, Lcom/wutka/dtd/DTDNotation;->name:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 109
    iget-object v11, v7, Lcom/wutka/dtd/DTDNotation;->externalID:Lcom/wutka/dtd/DTDExternalID;

    if-eqz v11, :cond_193

    .line 111
    iget-object v11, v7, Lcom/wutka/dtd/DTDNotation;->externalID:Lcom/wutka/dtd/DTDExternalID;

    instance-of v11, v11, Lcom/wutka/dtd/DTDSystem;

    if-eqz v11, :cond_1e0

    .line 113
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "    System: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, v7, Lcom/wutka/dtd/DTDNotation;->externalID:Lcom/wutka/dtd/DTDExternalID;

    iget-object v13, v13, Lcom/wutka/dtd/DTDExternalID;->system:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_193

    .line 118
    :cond_1e0
    iget-object v10, v7, Lcom/wutka/dtd/DTDNotation;->externalID:Lcom/wutka/dtd/DTDExternalID;

    check-cast v10, Lcom/wutka/dtd/DTDPublic;

    .line 120
    .restart local v10    # "pub":Lcom/wutka/dtd/DTDPublic;
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "    Public: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, v10, Lcom/wutka/dtd/DTDPublic;->pub:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 122
    iget-object v11, v10, Lcom/wutka/dtd/DTDPublic;->system:Ljava/lang/String;

    if-eqz v11, :cond_210

    .line 124
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    iget-object v12, v10, Lcom/wutka/dtd/DTDPublic;->system:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_193

    .line 128
    :cond_210
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v11}, Ljava/io/PrintStream;->println()V
    :try_end_215
    .catch Ljava/lang/Exception; {:try_start_b0 .. :try_end_215} :catch_a9

    goto/16 :goto_193
.end method
