.class public Lorg/apache/harmony/beans/internal/nls/Messages;
.super Ljava/lang/Object;
.source "Messages.java"


# static fields
.field private static bundle:Ljava/util/ResourceBundle;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 49
    const/4 v0, 0x0

    sput-object v0, Lorg/apache/harmony/beans/internal/nls/Messages;->bundle:Ljava/util/ResourceBundle;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 10
    .param p0, "format"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const/16 v7, 0x7b

    .line 161
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    array-length v6, p1

    mul-int/lit8 v6, v6, 0x14

    add-int/2addr v5, v6

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 163
    .local v0, "answer":Ljava/lang/StringBuilder;
    array-length v5, p1

    new-array v1, v5, [Ljava/lang/String;

    .line 164
    .local v1, "argStrings":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_13
    array-length v5, p1

    if-ge v3, v5, :cond_2a

    .line 165
    aget-object v5, p1, v3

    if-nez v5, :cond_21

    .line 166
    const-string v5, "<null>"

    aput-object v5, v1, v3

    .line 164
    :goto_1e
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    .line 168
    :cond_21
    aget-object v5, p1, v3

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v3

    goto :goto_1e

    .line 170
    :cond_2a
    const/4 v4, 0x0

    .line 171
    .local v4, "lastI":I
    const/4 v5, 0x0

    invoke-virtual {p0, v7, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    :goto_30
    if-ltz v3, :cond_a9

    .line 173
    if-eqz v3, :cond_54

    add-int/lit8 v5, v3, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x5c

    if-ne v5, v6, :cond_54

    .line 175
    const/4 v5, 0x1

    if-eq v3, v5, :cond_4a

    .line 176
    add-int/lit8 v5, v3, -0x1

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    :cond_4a
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 178
    add-int/lit8 v4, v3, 0x1

    .line 171
    :goto_4f
    invoke-virtual {p0, v7, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    goto :goto_30

    .line 181
    :cond_54
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x3

    if-le v3, v5, :cond_6c

    .line 183
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    goto :goto_4f

    .line 186
    :cond_6c
    add-int/lit8 v5, v3, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0xa

    invoke-static {v5, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    int-to-byte v2, v5

    .line 188
    .local v2, "argnum":I
    if-ltz v2, :cond_85

    add-int/lit8 v5, v3, 0x2

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x7d

    if-eq v5, v6, :cond_91

    .line 190
    :cond_85
    add-int/lit8 v5, v3, 0x1

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    add-int/lit8 v4, v3, 0x1

    goto :goto_4f

    .line 194
    :cond_91
    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    array-length v5, v1

    if-lt v2, v5, :cond_a3

    .line 196
    const-string v5, "<missing argument>"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    :goto_a0
    add-int/lit8 v4, v3, 0x3

    goto :goto_4f

    .line 198
    :cond_a3
    aget-object v5, v1, v2

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a0

    .line 204
    .end local v2    # "argnum":I
    :cond_a9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_ba

    .line 205
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    :cond_ba
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static getString(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 59
    sget-object v1, Lorg/apache/harmony/beans/internal/nls/Messages;->bundle:Ljava/util/ResourceBundle;

    if-nez v1, :cond_5

    .line 64
    .end local p0    # "msg":Ljava/lang/String;
    .local v0, "e":Ljava/util/MissingResourceException;
    :goto_4
    return-object p0

    .line 62
    .end local v0    # "e":Ljava/util/MissingResourceException;
    .restart local p0    # "msg":Ljava/lang/String;
    :cond_5
    :try_start_5
    sget-object v1, Lorg/apache/harmony/beans/internal/nls/Messages;->bundle:Ljava/util/ResourceBundle;

    invoke-virtual {v1, p0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_a
    .catch Ljava/util/MissingResourceException; {:try_start_5 .. :try_end_a} :catch_c

    move-result-object p0

    goto :goto_4

    .line 63
    :catch_c
    move-exception v0

    .line 64
    .restart local v0    # "e":Ljava/util/MissingResourceException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Missing message: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_4
.end method

.method public static getString(Ljava/lang/String;C)Ljava/lang/String;
    .registers 5
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "arg"    # C

    .prologue
    .line 104
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {p0, v0}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getString(Ljava/lang/String;I)Ljava/lang/String;
    .registers 5
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "arg"    # I

    .prologue
    .line 91
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {p0, v0}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "arg"    # Ljava/lang/Object;

    .prologue
    .line 78
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {p0, v0}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getString(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .registers 5
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 119
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-static {p0, v0}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 132
    move-object v0, p0

    .line 134
    .local v0, "format":Ljava/lang/String;
    sget-object v1, Lorg/apache/harmony/beans/internal/nls/Messages;->bundle:Ljava/util/ResourceBundle;

    if-eqz v1, :cond_b

    .line 136
    :try_start_5
    sget-object v1, Lorg/apache/harmony/beans/internal/nls/Messages;->bundle:Ljava/util/ResourceBundle;

    invoke-virtual {v1, p0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_a
    .catch Ljava/util/MissingResourceException; {:try_start_5 .. :try_end_a} :catch_10

    move-result-object v0

    .line 141
    :cond_b
    :goto_b
    invoke-static {v0, p1}, Lorg/apache/harmony/beans/internal/nls/Messages;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 137
    :catch_10
    move-exception v1

    goto :goto_b
.end method
