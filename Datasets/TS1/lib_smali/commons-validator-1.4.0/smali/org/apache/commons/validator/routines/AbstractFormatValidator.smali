.class public abstract Lorg/apache/commons/validator/routines/AbstractFormatValidator;
.super Ljava/lang/Object;
.source "AbstractFormatValidator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x4118ab7cfc1f2fc2L


# instance fields
.field private final strict:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 2
    .param p1, "strict"    # Z

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-boolean p1, p0, Lorg/apache/commons/validator/routines/AbstractFormatValidator;->strict:Z

    .line 47
    return-void
.end method


# virtual methods
.method public format(Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 120
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/validator/routines/AbstractFormatValidator;->format(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 132
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/AbstractFormatValidator;->format(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;
    .registers 6
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 157
    invoke-virtual {p0, p2, p3}, Lorg/apache/commons/validator/routines/AbstractFormatValidator;->getFormat(Ljava/lang/String;Ljava/util/Locale;)Ljava/text/Format;

    move-result-object v0

    .line 158
    .local v0, "formatter":Ljava/text/Format;
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/validator/routines/AbstractFormatValidator;->format(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected format(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/String;
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    .line 169
    invoke-virtual {p2, p1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/lang/Object;Ljava/util/Locale;)Ljava/lang/String;
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 144
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/validator/routines/AbstractFormatValidator;->format(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getFormat(Ljava/lang/String;Ljava/util/Locale;)Ljava/text/Format;
.end method

.method public isStrict()Z
    .registers 2

    .prologue
    .line 67
    iget-boolean v0, p0, Lorg/apache/commons/validator/routines/AbstractFormatValidator;->strict:Z

    return v0
.end method

.method public isValid(Ljava/lang/String;)Z
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 77
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/validator/routines/AbstractFormatValidator;->isValid(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Z

    move-result v0

    return v0
.end method

.method public isValid(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 88
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/AbstractFormatValidator;->isValid(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Z

    move-result v0

    return v0
.end method

.method public abstract isValid(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Z
.end method

.method public isValid(Ljava/lang/String;Ljava/util/Locale;)Z
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 99
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/validator/routines/AbstractFormatValidator;->isValid(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Z

    move-result v0

    return v0
.end method

.method protected parse(Ljava/lang/String;Ljava/text/Format;)Ljava/lang/Object;
    .registers 8
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    const/4 v2, 0x0

    .line 181
    new-instance v1, Ljava/text/ParsePosition;

    const/4 v3, 0x0

    invoke-direct {v1, v3}, Ljava/text/ParsePosition;-><init>(I)V

    .line 182
    .local v1, "pos":Ljava/text/ParsePosition;
    invoke-virtual {p2, p1, v1}, Ljava/text/Format;->parseObject(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/Object;

    move-result-object v0

    .line 183
    .local v0, "parsedValue":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/text/ParsePosition;->getErrorIndex()I

    move-result v3

    const/4 v4, -0x1

    if-le v3, v4, :cond_13

    .line 195
    :cond_12
    :goto_12
    return-object v2

    .line 187
    :cond_13
    invoke-virtual {p0}, Lorg/apache/commons/validator/routines/AbstractFormatValidator;->isStrict()Z

    move-result v3

    if-eqz v3, :cond_23

    invoke-virtual {v1}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v3, v4, :cond_12

    .line 191
    :cond_23
    if-eqz v0, :cond_29

    .line 192
    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/validator/routines/AbstractFormatValidator;->processParsedValue(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/Object;

    move-result-object v0

    :cond_29
    move-object v2, v0

    .line 195
    goto :goto_12
.end method

.method protected abstract processParsedValue(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/Object;
.end method
