.class public Lorg/apache/commons/digester/SimpleRegexMatcher;
.super Lorg/apache/commons/digester/RegexMatcher;
.source "SimpleRegexMatcher.java"


# static fields
.field private static final baseLog:Lorg/apache/commons/logging/Log;

.field static class$org$apache$commons$digester$SimpleRegexMatcher:Ljava/lang/Class;


# instance fields
.field private log:Lorg/apache/commons/logging/Log;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    sget-object v0, Lorg/apache/commons/digester/SimpleRegexMatcher;->class$org$apache$commons$digester$SimpleRegexMatcher:Ljava/lang/Class;

    if-nez v0, :cond_13

    const-string v0, "org.apache.commons.digester.SimpleRegexMatcher"

    invoke-static {v0}, Lorg/apache/commons/digester/SimpleRegexMatcher;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/digester/SimpleRegexMatcher;->class$org$apache$commons$digester$SimpleRegexMatcher:Ljava/lang/Class;

    :goto_c
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/digester/SimpleRegexMatcher;->baseLog:Lorg/apache/commons/logging/Log;

    return-void

    :cond_13
    sget-object v0, Lorg/apache/commons/digester/SimpleRegexMatcher;->class$org$apache$commons$digester$SimpleRegexMatcher:Ljava/lang/Class;

    goto :goto_c
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/commons/digester/RegexMatcher;-><init>()V

    .line 45
    sget-object v0, Lorg/apache/commons/digester/SimpleRegexMatcher;->baseLog:Lorg/apache/commons/logging/Log;

    iput-object v0, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    .line 37
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 37
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private match(Ljava/lang/String;Ljava/lang/String;II)Z
    .registers 13
    .param p1, "basePattern"    # Ljava/lang/String;
    .param p2, "regexPattern"    # Ljava/lang/String;
    .param p3, "baseAt"    # I
    .param p4, "regexAt"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 88
    iget-object v5, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v5

    if-eqz v5, :cond_6a

    .line 89
    iget-object v5, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Base: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 90
    iget-object v5, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Regex: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 91
    iget-object v5, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Base@"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 92
    iget-object v5, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Regex@"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 96
    :cond_6a
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    if-lt p4, v5, :cond_79

    .line 98
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-lt p3, v5, :cond_77

    .line 153
    :cond_76
    :goto_76
    return v3

    :cond_77
    move v3, v4

    .line 103
    goto :goto_76

    .line 106
    :cond_79
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-lt p3, v5, :cond_81

    move v3, v4

    .line 108
    goto :goto_76

    .line 113
    :cond_81
    invoke-virtual {p2, p4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 114
    .local v2, "regexCurrent":C
    sparse-switch v2, :sswitch_data_142

    .line 146
    iget-object v3, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v3

    if-eqz v3, :cond_b6

    .line 147
    iget-object v3, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Camparing "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1, p3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 149
    :cond_b6
    invoke-virtual {p1, p3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v2, v3, :cond_13f

    .line 151
    add-int/lit8 p3, p3, 0x1

    add-int/lit8 p4, p4, 0x1

    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/commons/digester/SimpleRegexMatcher;->match(Ljava/lang/String;Ljava/lang/String;II)Z

    move-result v3

    goto :goto_76

    .line 118
    :sswitch_c5
    add-int/lit8 p4, p4, 0x1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    if-ge p4, v5, :cond_76

    .line 124
    invoke-virtual {p2, p4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 125
    .local v1, "nextRegex":C
    iget-object v5, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v5

    if-eqz v5, :cond_f7

    .line 126
    iget-object v5, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Searching for next \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' char"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 128
    :cond_f7
    invoke-virtual {p1, v1, p3}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 129
    .local v0, "nextMatch":I
    :goto_fb
    const/4 v5, -0x1

    if-ne v0, v5, :cond_108

    .line 138
    iget-object v3, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "No matches found."

    invoke-interface {v3, v5}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    move v3, v4

    .line 139
    goto/16 :goto_76

    .line 130
    :cond_108
    iget-object v5, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v5

    if-eqz v5, :cond_128

    .line 131
    iget-object v5, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Trying \'*\' match@"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 133
    :cond_128
    invoke-direct {p0, p1, p2, v0, p4}, Lorg/apache/commons/digester/SimpleRegexMatcher;->match(Ljava/lang/String;Ljava/lang/String;II)Z

    move-result v5

    if-nez v5, :cond_76

    .line 136
    add-int/lit8 v5, v0, 0x1

    invoke-virtual {p1, v1, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    goto :goto_fb

    .line 143
    .end local v0    # "nextMatch":I
    .end local v1    # "nextRegex":C
    :sswitch_135
    add-int/lit8 p3, p3, 0x1

    add-int/lit8 p4, p4, 0x1

    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/commons/digester/SimpleRegexMatcher;->match(Ljava/lang/String;Ljava/lang/String;II)Z

    move-result v3

    goto/16 :goto_76

    :cond_13f
    move v3, v4

    .line 153
    goto/16 :goto_76

    .line 114
    :sswitch_data_142
    .sparse-switch
        0x2a -> :sswitch_c5
        0x3f -> :sswitch_135
    .end sparse-switch
.end method


# virtual methods
.method public getLog()Lorg/apache/commons/logging/Log;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    return-object v0
.end method

.method public match(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p1, "basePattern"    # Ljava/lang/String;
    .param p2, "regexPattern"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 75
    if-eqz p1, :cond_5

    if-nez p2, :cond_6

    .line 78
    :cond_5
    :goto_5
    return v0

    :cond_6
    invoke-direct {p0, p1, p2, v0, v0}, Lorg/apache/commons/digester/SimpleRegexMatcher;->match(Ljava/lang/String;Ljava/lang/String;II)Z

    move-result v0

    goto :goto_5
.end method

.method public setLog(Lorg/apache/commons/logging/Log;)V
    .registers 2
    .param p1, "log"    # Lorg/apache/commons/logging/Log;

    .prologue
    .line 60
    iput-object p1, p0, Lorg/apache/commons/digester/SimpleRegexMatcher;->log:Lorg/apache/commons/logging/Log;

    .line 61
    return-void
.end method
