.class public Lezvcard/io/text/VCardRawLine$Builder;
.super Ljava/lang/Object;
.source "VCardRawLine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/io/text/VCardRawLine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private group:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private parameters:Lezvcard/parameter/VCardParameters;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    new-instance v0, Lezvcard/parameter/VCardParameters;

    invoke-direct {v0}, Lezvcard/parameter/VCardParameters;-><init>()V

    iput-object v0, p0, Lezvcard/io/text/VCardRawLine$Builder;->parameters:Lezvcard/parameter/VCardParameters;

    return-void
.end method


# virtual methods
.method public build()Lezvcard/io/text/VCardRawLine;
    .registers 6

    .prologue
    .line 157
    iget-object v0, p0, Lezvcard/io/text/VCardRawLine$Builder;->name:Ljava/lang/String;

    if-nez v0, :cond_c

    .line 158
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Property name required."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 160
    :cond_c
    new-instance v0, Lezvcard/io/text/VCardRawLine;

    iget-object v1, p0, Lezvcard/io/text/VCardRawLine$Builder;->group:Ljava/lang/String;

    iget-object v2, p0, Lezvcard/io/text/VCardRawLine$Builder;->name:Ljava/lang/String;

    iget-object v3, p0, Lezvcard/io/text/VCardRawLine$Builder;->parameters:Lezvcard/parameter/VCardParameters;

    iget-object v4, p0, Lezvcard/io/text/VCardRawLine$Builder;->value:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lezvcard/io/text/VCardRawLine;-><init>(Ljava/lang/String;Ljava/lang/String;Lezvcard/parameter/VCardParameters;Ljava/lang/String;)V

    return-object v0
.end method

.method public group(Ljava/lang/String;)Lezvcard/io/text/VCardRawLine$Builder;
    .registers 2
    .param p1, "group"    # Ljava/lang/String;

    .prologue
    .line 137
    iput-object p1, p0, Lezvcard/io/text/VCardRawLine$Builder;->group:Ljava/lang/String;

    .line 138
    return-object p0
.end method

.method public name(Ljava/lang/String;)Lezvcard/io/text/VCardRawLine$Builder;
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 142
    iput-object p1, p0, Lezvcard/io/text/VCardRawLine$Builder;->name:Ljava/lang/String;

    .line 143
    return-object p0
.end method

.method public varargs param(Ljava/lang/String;[Ljava/lang/String;)Lezvcard/io/text/VCardRawLine$Builder;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "values"    # [Ljava/lang/String;

    .prologue
    .line 152
    iget-object v0, p0, Lezvcard/io/text/VCardRawLine$Builder;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lezvcard/parameter/VCardParameters;->putAll(Ljava/lang/Object;Ljava/util/Collection;)V

    .line 153
    return-object p0
.end method

.method public value(Ljava/lang/String;)Lezvcard/io/text/VCardRawLine$Builder;
    .registers 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 147
    iput-object p1, p0, Lezvcard/io/text/VCardRawLine$Builder;->value:Ljava/lang/String;

    .line 148
    return-object p0
.end method
