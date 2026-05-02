.class public Lorg/apache/commons/beanutils/expression/DefaultResolver;
.super Ljava/lang/Object;
.source "DefaultResolver.java"

# interfaces
.implements Lorg/apache/commons/beanutils/expression/Resolver;


# static fields
.field private static final INDEXED_END:C = ']'

.field private static final INDEXED_START:C = '['

.field private static final MAPPED_END:C = ')'

.field private static final MAPPED_START:C = '('

.field private static final NESTED:C = '.'


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    return-void
.end method


# virtual methods
.method public getIndex(Ljava/lang/String;)I
    .registers 11
    .param p1, "expression"    # Ljava/lang/String;

    .prologue
    const/4 v4, -0x1

    .line 80
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_a

    .line 106
    :cond_9
    :goto_9
    return v4

    .line 83
    :cond_a
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_b
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_9

    .line 84
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 85
    .local v0, "c":C
    const/16 v6, 0x2e

    if-eq v0, v6, :cond_9

    const/16 v6, 0x28

    if-eq v0, v6, :cond_9

    .line 87
    const/16 v6, 0x5b

    if-ne v0, v6, :cond_6d

    .line 88
    const/16 v6, 0x5d

    invoke-virtual {p1, v6, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 89
    .local v2, "end":I
    if-gez v2, :cond_31

    .line 90
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "Missing End Delimiter"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 92
    :cond_31
    add-int/lit8 v6, v3, 0x1

    invoke-virtual {p1, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 93
    .local v5, "value":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_45

    .line 94
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "No Index Value"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 96
    :cond_45
    const/4 v4, 0x0

    .line 98
    .local v4, "index":I
    const/16 v6, 0xa

    :try_start_48
    invoke-static {v5, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_4b} :catch_4d

    move-result v4

    goto :goto_9

    .line 99
    :catch_4d
    move-exception v1

    .line 100
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Invalid index value \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 83
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "end":I
    .end local v4    # "index":I
    .end local v5    # "value":Ljava/lang/String;
    :cond_6d
    add-int/lit8 v3, v3, 0x1

    goto :goto_b
.end method

.method public getKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "expression"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 117
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_a

    .line 132
    :cond_9
    :goto_9
    return-object v3

    .line 120
    :cond_a
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_9

    .line 121
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 122
    .local v0, "c":C
    const/16 v4, 0x2e

    if-eq v0, v4, :cond_9

    const/16 v4, 0x5b

    if-eq v0, v4, :cond_9

    .line 124
    const/16 v4, 0x28

    if-ne v0, v4, :cond_38

    .line 125
    const/16 v3, 0x29

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 126
    .local v1, "end":I
    if-gez v1, :cond_31

    .line 127
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Missing End Delimiter"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 129
    :cond_31
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_9

    .line 120
    .end local v1    # "end":I
    :cond_38
    add-int/lit8 v2, v2, 0x1

    goto :goto_b
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "expression"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 142
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_a

    .line 153
    .end local p1    # "expression":Ljava/lang/String;
    :cond_9
    :goto_9
    return-object p1

    .line 145
    .restart local p1    # "expression":Ljava/lang/String;
    :cond_a
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_9

    .line 146
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 147
    .local v0, "c":C
    const/16 v2, 0x2e

    if-ne v0, v2, :cond_1e

    .line 148
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_9

    .line 149
    :cond_1e
    const/16 v2, 0x28

    if-eq v0, v2, :cond_26

    const/16 v2, 0x5b

    if-ne v0, v2, :cond_2b

    .line 150
    :cond_26
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_9

    .line 145
    :cond_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_b
.end method

.method public hasNested(Ljava/lang/String;)Z
    .registers 4
    .param p1, "expression"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 164
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_a

    .line 167
    :cond_9
    :goto_9
    return v0

    :cond_a
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/expression/DefaultResolver;->remove(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_9

    const/4 v0, 0x1

    goto :goto_9
.end method

.method public isIndexed(Ljava/lang/String;)Z
    .registers 6
    .param p1, "expression"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 179
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_a

    .line 190
    :cond_9
    :goto_9
    return v2

    .line 182
    :cond_a
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_9

    .line 183
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 184
    .local v0, "c":C
    const/16 v3, 0x2e

    if-eq v0, v3, :cond_9

    const/16 v3, 0x28

    if-eq v0, v3, :cond_9

    .line 186
    const/16 v3, 0x5b

    if-ne v0, v3, :cond_23

    .line 187
    const/4 v2, 0x1

    goto :goto_9

    .line 182
    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_b
.end method

.method public isMapped(Ljava/lang/String;)Z
    .registers 6
    .param p1, "expression"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 201
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_a

    .line 212
    :cond_9
    :goto_9
    return v2

    .line 204
    :cond_a
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_9

    .line 205
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 206
    .local v0, "c":C
    const/16 v3, 0x2e

    if-eq v0, v3, :cond_9

    const/16 v3, 0x5b

    if-eq v0, v3, :cond_9

    .line 208
    const/16 v3, 0x28

    if-ne v0, v3, :cond_23

    .line 209
    const/4 v2, 0x1

    goto :goto_9

    .line 204
    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_b
.end method

.method public next(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "expression"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 223
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_b

    .line 224
    :cond_9
    const/4 p1, 0x0

    .line 248
    .end local p1    # "expression":Ljava/lang/String;
    :cond_a
    :goto_a
    return-object p1

    .line 226
    .restart local p1    # "expression":Ljava/lang/String;
    :cond_b
    const/4 v2, 0x0

    .line 227
    .local v2, "indexed":Z
    const/4 v3, 0x0

    .line 228
    .local v3, "mapped":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_a

    .line 229
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 230
    .local v0, "c":C
    if-eqz v2, :cond_25

    .line 231
    const/16 v4, 0x5d

    if-ne v0, v4, :cond_40

    .line 232
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_a

    .line 234
    :cond_25
    if-eqz v3, :cond_32

    .line 235
    const/16 v4, 0x29

    if-ne v0, v4, :cond_40

    .line 236
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_a

    .line 239
    :cond_32
    const/16 v4, 0x2e

    if-ne v0, v4, :cond_3b

    .line 240
    invoke-virtual {p1, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_a

    .line 241
    :cond_3b
    const/16 v4, 0x28

    if-ne v0, v4, :cond_43

    .line 242
    const/4 v3, 0x1

    .line 228
    :cond_40
    :goto_40
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 243
    :cond_43
    const/16 v4, 0x5b

    if-ne v0, v4, :cond_40

    .line 244
    const/4 v2, 0x1

    goto :goto_40
.end method

.method public remove(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "expression"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 260
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_a

    .line 271
    :cond_9
    :goto_9
    return-object v2

    .line 263
    :cond_a
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/expression/DefaultResolver;->next(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 264
    .local v0, "property":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-eq v3, v4, :cond_9

    .line 267
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 268
    .local v1, "start":I
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2e

    if-ne v2, v3, :cond_26

    .line 269
    add-int/lit8 v1, v1, 0x1

    .line 271
    :cond_26
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_9
.end method
