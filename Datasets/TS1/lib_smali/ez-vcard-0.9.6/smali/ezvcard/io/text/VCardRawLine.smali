.class public Lezvcard/io/text/VCardRawLine;
.super Ljava/lang/Object;
.source "VCardRawLine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lezvcard/io/text/VCardRawLine$Builder;
    }
.end annotation


# instance fields
.field private final group:Ljava/lang/String;

.field private final name:Ljava/lang/String;

.field private final parameters:Lezvcard/parameter/VCardParameters;

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lezvcard/parameter/VCardParameters;Ljava/lang/String;)V
    .registers 5
    .param p1, "group"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "parameters"    # Lezvcard/parameter/VCardParameters;
    .param p4, "value"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lezvcard/io/text/VCardRawLine;->group:Ljava/lang/String;

    .line 52
    iput-object p2, p0, Lezvcard/io/text/VCardRawLine;->name:Ljava/lang/String;

    .line 53
    iput-object p4, p0, Lezvcard/io/text/VCardRawLine;->value:Ljava/lang/String;

    .line 54
    iput-object p3, p0, Lezvcard/io/text/VCardRawLine;->parameters:Lezvcard/parameter/VCardParameters;

    .line 55
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 102
    if-ne p0, p1, :cond_5

    .line 129
    :cond_4
    :goto_4
    return v1

    .line 104
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 105
    goto :goto_4

    .line 106
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 107
    goto :goto_4

    :cond_15
    move-object v0, p1

    .line 108
    check-cast v0, Lezvcard/io/text/VCardRawLine;

    .line 109
    .local v0, "other":Lezvcard/io/text/VCardRawLine;
    iget-object v3, p0, Lezvcard/io/text/VCardRawLine;->group:Ljava/lang/String;

    if-nez v3, :cond_22

    .line 110
    iget-object v3, v0, Lezvcard/io/text/VCardRawLine;->group:Ljava/lang/String;

    if-eqz v3, :cond_2e

    move v1, v2

    .line 111
    goto :goto_4

    .line 112
    :cond_22
    iget-object v3, p0, Lezvcard/io/text/VCardRawLine;->group:Ljava/lang/String;

    iget-object v4, v0, Lezvcard/io/text/VCardRawLine;->group:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2e

    move v1, v2

    .line 113
    goto :goto_4

    .line 114
    :cond_2e
    iget-object v3, p0, Lezvcard/io/text/VCardRawLine;->name:Ljava/lang/String;

    if-nez v3, :cond_38

    .line 115
    iget-object v3, v0, Lezvcard/io/text/VCardRawLine;->name:Ljava/lang/String;

    if-eqz v3, :cond_44

    move v1, v2

    .line 116
    goto :goto_4

    .line 117
    :cond_38
    iget-object v3, p0, Lezvcard/io/text/VCardRawLine;->name:Ljava/lang/String;

    iget-object v4, v0, Lezvcard/io/text/VCardRawLine;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_44

    move v1, v2

    .line 118
    goto :goto_4

    .line 119
    :cond_44
    iget-object v3, p0, Lezvcard/io/text/VCardRawLine;->parameters:Lezvcard/parameter/VCardParameters;

    if-nez v3, :cond_4e

    .line 120
    iget-object v3, v0, Lezvcard/io/text/VCardRawLine;->parameters:Lezvcard/parameter/VCardParameters;

    if-eqz v3, :cond_5a

    move v1, v2

    .line 121
    goto :goto_4

    .line 122
    :cond_4e
    iget-object v3, p0, Lezvcard/io/text/VCardRawLine;->parameters:Lezvcard/parameter/VCardParameters;

    iget-object v4, v0, Lezvcard/io/text/VCardRawLine;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v3, v4}, Lezvcard/parameter/VCardParameters;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5a

    move v1, v2

    .line 123
    goto :goto_4

    .line 124
    :cond_5a
    iget-object v3, p0, Lezvcard/io/text/VCardRawLine;->value:Ljava/lang/String;

    if-nez v3, :cond_64

    .line 125
    iget-object v3, v0, Lezvcard/io/text/VCardRawLine;->value:Ljava/lang/String;

    if-eqz v3, :cond_4

    move v1, v2

    .line 126
    goto :goto_4

    .line 127
    :cond_64
    iget-object v3, p0, Lezvcard/io/text/VCardRawLine;->value:Ljava/lang/String;

    iget-object v4, v0, Lezvcard/io/text/VCardRawLine;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 128
    goto :goto_4
.end method

.method public getGroup()Ljava/lang/String;
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lezvcard/io/text/VCardRawLine;->group:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lezvcard/io/text/VCardRawLine;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getParameters()Lezvcard/parameter/VCardParameters;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lezvcard/io/text/VCardRawLine;->parameters:Lezvcard/parameter/VCardParameters;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lezvcard/io/text/VCardRawLine;->value:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 91
    const/16 v0, 0x1f

    .line 92
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 93
    .local v1, "result":I
    iget-object v2, p0, Lezvcard/io/text/VCardRawLine;->group:Ljava/lang/String;

    if-nez v2, :cond_26

    move v2, v3

    :goto_9
    add-int/lit8 v1, v2, 0x1f

    .line 94
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lezvcard/io/text/VCardRawLine;->name:Ljava/lang/String;

    if-nez v2, :cond_2d

    move v2, v3

    :goto_12
    add-int v1, v4, v2

    .line 95
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lezvcard/io/text/VCardRawLine;->parameters:Lezvcard/parameter/VCardParameters;

    if-nez v2, :cond_34

    move v2, v3

    :goto_1b
    add-int v1, v4, v2

    .line 96
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lezvcard/io/text/VCardRawLine;->value:Ljava/lang/String;

    if-nez v4, :cond_3b

    :goto_23
    add-int v1, v2, v3

    .line 97
    return v1

    .line 93
    :cond_26
    iget-object v2, p0, Lezvcard/io/text/VCardRawLine;->group:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_9

    .line 94
    :cond_2d
    iget-object v2, p0, Lezvcard/io/text/VCardRawLine;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_12

    .line 95
    :cond_34
    iget-object v2, p0, Lezvcard/io/text/VCardRawLine;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v2}, Lezvcard/parameter/VCardParameters;->hashCode()I

    move-result v2

    goto :goto_1b

    .line 96
    :cond_3b
    iget-object v3, p0, Lezvcard/io/text/VCardRawLine;->value:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_23
.end method
