.class public Lorg/apache/commons/cli/PosixParser;
.super Lorg/apache/commons/cli/Parser;
.source "PosixParser.java"


# instance fields
.field private currentOption:Lorg/apache/commons/cli/Option;

.field private eatTheRest:Z

.field private options:Lorg/apache/commons/cli/Options;

.field private tokens:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/apache/commons/cli/Parser;-><init>()V

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    return-void
.end method

.method private gobble(Ljava/util/Iterator;)V
    .registers 4
    .param p1, "iter"    # Ljava/util/Iterator;

    .prologue
    .line 166
    iget-boolean v0, p0, Lorg/apache/commons/cli/PosixParser;->eatTheRest:Z

    if-eqz v0, :cond_14

    .line 168
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 170
    iget-object v0, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 173
    :cond_14
    return-void
.end method

.method private init()V
    .registers 2

    .prologue
    .line 53
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/cli/PosixParser;->eatTheRest:Z

    .line 54
    iget-object v0, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 55
    return-void
.end method

.method private processNonOptionToken(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "stopAtNonOption"    # Z

    .prologue
    .line 184
    if-eqz p2, :cond_18

    iget-object v0, p0, Lorg/apache/commons/cli/PosixParser;->currentOption:Lorg/apache/commons/cli/Option;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lorg/apache/commons/cli/PosixParser;->currentOption:Lorg/apache/commons/cli/Option;

    invoke-virtual {v0}, Lorg/apache/commons/cli/Option;->hasArg()Z

    move-result v0

    if-nez v0, :cond_18

    .line 186
    :cond_e
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/cli/PosixParser;->eatTheRest:Z

    .line 187
    iget-object v0, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    const-string v1, "--"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    :cond_18
    iget-object v0, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    return-void
.end method

.method private processOptionToken(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "stopAtNonOption"    # Z

    .prologue
    .line 207
    if-eqz p2, :cond_d

    iget-object v0, p0, Lorg/apache/commons/cli/PosixParser;->options:Lorg/apache/commons/cli/Options;

    invoke-virtual {v0, p1}, Lorg/apache/commons/cli/Options;->hasOption(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 209
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/cli/PosixParser;->eatTheRest:Z

    .line 212
    :cond_d
    iget-object v0, p0, Lorg/apache/commons/cli/PosixParser;->options:Lorg/apache/commons/cli/Options;

    invoke-virtual {v0, p1}, Lorg/apache/commons/cli/Options;->hasOption(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 214
    iget-object v0, p0, Lorg/apache/commons/cli/PosixParser;->options:Lorg/apache/commons/cli/Options;

    invoke-virtual {v0, p1}, Lorg/apache/commons/cli/Options;->getOption(Ljava/lang/String;)Lorg/apache/commons/cli/Option;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/cli/PosixParser;->currentOption:Lorg/apache/commons/cli/Option;

    .line 217
    :cond_1d
    iget-object v0, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    return-void
.end method


# virtual methods
.method protected burstToken(Ljava/lang/String;Z)V
    .registers 8
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "stopAtNonOption"    # Z

    .prologue
    .line 248
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_52

    .line 250
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    .line 252
    .local v0, "ch":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/commons/cli/PosixParser;->options:Lorg/apache/commons/cli/Options;

    invoke-virtual {v2, v0}, Lorg/apache/commons/cli/Options;->hasOption(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_53

    .line 254
    iget-object v2, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 255
    iget-object v2, p0, Lorg/apache/commons/cli/PosixParser;->options:Lorg/apache/commons/cli/Options;

    invoke-virtual {v2, v0}, Lorg/apache/commons/cli/Options;->getOption(Ljava/lang/String;)Lorg/apache/commons/cli/Option;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/cli/PosixParser;->currentOption:Lorg/apache/commons/cli/Option;

    .line 257
    iget-object v2, p0, Lorg/apache/commons/cli/PosixParser;->currentOption:Lorg/apache/commons/cli/Option;

    invoke-virtual {v2}, Lorg/apache/commons/cli/Option;->hasArg()Z

    move-result v2

    if-eqz v2, :cond_64

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v3, v1, 0x1

    if-eq v2, v3, :cond_64

    .line 259
    iget-object v2, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 275
    .end local v0    # "ch":Ljava/lang/String;
    :cond_52
    :goto_52
    return-void

    .line 264
    .restart local v0    # "ch":Ljava/lang/String;
    :cond_53
    if-eqz p2, :cond_5e

    .line 266
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {p0, v2, v3}, Lorg/apache/commons/cli/PosixParser;->processNonOptionToken(Ljava/lang/String;Z)V

    goto :goto_52

    .line 271
    :cond_5e
    iget-object v2, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_52

    .line 248
    :cond_64
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method protected flatten(Lorg/apache/commons/cli/Options;[Ljava/lang/String;Z)[Ljava/lang/String;
    .registers 11
    .param p1, "options"    # Lorg/apache/commons/cli/Options;
    .param p2, "arguments"    # [Ljava/lang/String;
    .param p3, "stopAtNonOption"    # Z

    .prologue
    const/4 v6, -0x1

    .line 97
    invoke-direct {p0}, Lorg/apache/commons/cli/PosixParser;->init()V

    .line 98
    iput-object p1, p0, Lorg/apache/commons/cli/PosixParser;->options:Lorg/apache/commons/cli/Options;

    .line 101
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 104
    .local v0, "iter":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_86

    .line 107
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 110
    .local v3, "token":Ljava/lang/String;
    const-string v4, "--"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_57

    .line 112
    const/16 v4, 0x3d

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 113
    .local v2, "pos":I
    if-ne v2, v6, :cond_38

    move-object v1, v3

    .line 115
    .local v1, "opt":Ljava/lang/String;
    :goto_2b
    invoke-virtual {p1, v1}, Lorg/apache/commons/cli/Options;->hasOption(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3e

    .line 117
    invoke-direct {p0, v3, p3}, Lorg/apache/commons/cli/PosixParser;->processNonOptionToken(Ljava/lang/String;Z)V

    .line 153
    .end local v1    # "opt":Ljava/lang/String;
    .end local v2    # "pos":I
    :cond_34
    :goto_34
    invoke-direct {p0, v0}, Lorg/apache/commons/cli/PosixParser;->gobble(Ljava/util/Iterator;)V

    goto :goto_e

    .line 113
    .restart local v2    # "pos":I
    :cond_38
    const/4 v4, 0x0

    invoke-virtual {v3, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_2b

    .line 121
    .restart local v1    # "opt":Ljava/lang/String;
    :cond_3e
    invoke-virtual {p1, v1}, Lorg/apache/commons/cli/Options;->getOption(Ljava/lang/String;)Lorg/apache/commons/cli/Option;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/cli/PosixParser;->currentOption:Lorg/apache/commons/cli/Option;

    .line 123
    iget-object v4, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    if-eq v2, v6, :cond_34

    .line 126
    iget-object v4, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_34

    .line 132
    .end local v1    # "opt":Ljava/lang/String;
    .end local v2    # "pos":I
    :cond_57
    const-string v4, "-"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_65

    .line 134
    iget-object v4, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_34

    .line 136
    :cond_65
    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_82

    .line 138
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x2

    if-eq v4, v5, :cond_7a

    invoke-virtual {p1, v3}, Lorg/apache/commons/cli/Options;->hasOption(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7e

    .line 140
    :cond_7a
    invoke-direct {p0, v3, p3}, Lorg/apache/commons/cli/PosixParser;->processOptionToken(Ljava/lang/String;Z)V

    goto :goto_34

    .line 145
    :cond_7e
    invoke-virtual {p0, v3, p3}, Lorg/apache/commons/cli/PosixParser;->burstToken(Ljava/lang/String;Z)V

    goto :goto_34

    .line 150
    :cond_82
    invoke-direct {p0, v3, p3}, Lorg/apache/commons/cli/PosixParser;->processNonOptionToken(Ljava/lang/String;Z)V

    goto :goto_34

    .line 156
    .end local v3    # "token":Ljava/lang/String;
    :cond_86
    iget-object v4, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    iget-object v5, p0, Lorg/apache/commons/cli/PosixParser;->tokens:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    check-cast v4, [Ljava/lang/String;

    return-object v4
.end method
