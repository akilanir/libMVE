.class public Lorg/apache/commons/validator/routines/RegexValidator;
.super Ljava/lang/Object;
.source "RegexValidator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x7a930609268c2adaL


# instance fields
.field private final patterns:[Ljava/util/regex/Pattern;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "regex"    # Ljava/lang/String;

    .prologue
    .line 71
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/validator/routines/RegexValidator;-><init>(Ljava/lang/String;Z)V

    .line 72
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "regex"    # Ljava/lang/String;
    .param p2, "caseSensitive"    # Z

    .prologue
    .line 84
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-direct {p0, v0, p2}, Lorg/apache/commons/validator/routines/RegexValidator;-><init>([Ljava/lang/String;Z)V

    .line 85
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 3
    .param p1, "regexs"    # [Ljava/lang/String;

    .prologue
    .line 95
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/validator/routines/RegexValidator;-><init>([Ljava/lang/String;Z)V

    .line 96
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Z)V
    .registers 8
    .param p1, "regexs"    # [Ljava/lang/String;
    .param p2, "caseSensitive"    # Z

    .prologue
    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    if-eqz p1, :cond_8

    array-length v2, p1

    if-nez v2, :cond_10

    .line 109
    :cond_8
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Regular expressions are missing"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 111
    :cond_10
    array-length v2, p1

    new-array v2, v2, [Ljava/util/regex/Pattern;

    iput-object v2, p0, Lorg/apache/commons/validator/routines/RegexValidator;->patterns:[Ljava/util/regex/Pattern;

    .line 112
    if-eqz p2, :cond_47

    const/4 v0, 0x0

    .line 113
    .local v0, "flags":I
    :goto_18
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    array-length v2, p1

    if-ge v1, v2, :cond_56

    .line 114
    aget-object v2, p1, v1

    if-eqz v2, :cond_28

    aget-object v2, p1, v1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_49

    .line 115
    :cond_28
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Regular expression["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "] is missing"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 112
    .end local v0    # "flags":I
    .end local v1    # "i":I
    :cond_47
    const/4 v0, 0x2

    goto :goto_18

    .line 117
    .restart local v0    # "flags":I
    .restart local v1    # "i":I
    :cond_49
    iget-object v2, p0, Lorg/apache/commons/validator/routines/RegexValidator;->patterns:[Ljava/util/regex/Pattern;

    aget-object v3, p1, v1

    invoke-static {v3, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v3

    aput-object v3, v2, v1

    .line 113
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 119
    :cond_56
    return-void
.end method


# virtual methods
.method public isValid(Ljava/lang/String;)Z
    .registers 5
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 129
    if-nez p1, :cond_4

    .line 137
    :cond_3
    :goto_3
    return v1

    .line 132
    :cond_4
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget-object v2, p0, Lorg/apache/commons/validator/routines/RegexValidator;->patterns:[Ljava/util/regex/Pattern;

    array-length v2, v2

    if-ge v0, v2, :cond_3

    .line 133
    iget-object v2, p0, Lorg/apache/commons/validator/routines/RegexValidator;->patterns:[Ljava/util/regex/Pattern;

    aget-object v2, v2, v0

    invoke-virtual {v2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 134
    const/4 v1, 0x1

    goto :goto_3

    .line 132
    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_5
.end method

.method public match(Ljava/lang/String;)[Ljava/lang/String;
    .registers 8
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 149
    if-nez p1, :cond_4

    .line 163
    :cond_3
    return-object v1

    .line 152
    :cond_4
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    iget-object v5, p0, Lorg/apache/commons/validator/routines/RegexValidator;->patterns:[Ljava/util/regex/Pattern;

    array-length v5, v5

    if-ge v2, v5, :cond_3

    .line 153
    iget-object v5, p0, Lorg/apache/commons/validator/routines/RegexValidator;->patterns:[Ljava/util/regex/Pattern;

    aget-object v5, v5, v2

    invoke-virtual {v5, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 154
    .local v4, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 155
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->groupCount()I

    move-result v0

    .line 156
    .local v0, "count":I
    new-array v1, v0, [Ljava/lang/String;

    .line 157
    .local v1, "groups":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1f
    if-ge v3, v0, :cond_3

    .line 158
    add-int/lit8 v5, v3, 0x1

    invoke-virtual {v4, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v3

    .line 157
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 152
    .end local v0    # "count":I
    .end local v1    # "groups":[Ljava/lang/String;
    .end local v3    # "j":I
    :cond_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_5
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 204
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 205
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const-string v2, "RegexValidator{"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 206
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    iget-object v2, p0, Lorg/apache/commons/validator/routines/RegexValidator;->patterns:[Ljava/util/regex/Pattern;

    array-length v2, v2

    if-ge v1, v2, :cond_25

    .line 207
    if-lez v1, :cond_17

    .line 208
    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 210
    :cond_17
    iget-object v2, p0, Lorg/apache/commons/validator/routines/RegexValidator;->patterns:[Ljava/util/regex/Pattern;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 206
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 212
    :cond_25
    const-string v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 213
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public validate(Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    const/4 v8, 0x1

    .line 176
    if-nez p1, :cond_5

    .line 196
    :cond_4
    :goto_4
    return-object v6

    .line 179
    :cond_5
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    iget-object v7, p0, Lorg/apache/commons/validator/routines/RegexValidator;->patterns:[Ljava/util/regex/Pattern;

    array-length v7, v7

    if-ge v3, v7, :cond_4

    .line 180
    iget-object v7, p0, Lorg/apache/commons/validator/routines/RegexValidator;->patterns:[Ljava/util/regex/Pattern;

    aget-object v7, v7, v3

    invoke-virtual {v7, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    .line 181
    .local v5, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->matches()Z

    move-result v7

    if-eqz v7, :cond_3f

    .line 182
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->groupCount()I

    move-result v2

    .line 183
    .local v2, "count":I
    if-ne v2, v8, :cond_24

    .line 184
    invoke-virtual {v5, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_4

    .line 186
    :cond_24
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 187
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_2a
    if-ge v4, v2, :cond_3a

    .line 188
    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 189
    .local v1, "component":Ljava/lang/String;
    if-eqz v1, :cond_37

    .line 190
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 187
    :cond_37
    add-int/lit8 v4, v4, 0x1

    goto :goto_2a

    .line 193
    .end local v1    # "component":Ljava/lang/String;
    :cond_3a
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_4

    .line 179
    .end local v0    # "buffer":Ljava/lang/StringBuffer;
    .end local v2    # "count":I
    .end local v4    # "j":I
    :cond_3f
    add-int/lit8 v3, v3, 0x1

    goto :goto_6
.end method
