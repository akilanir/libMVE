.class final Lorg/unbescape/xml/Xml10EscapeSymbolsInitializer$Xml10CodepointValidator;
.super Ljava/lang/Object;
.source "Xml10EscapeSymbolsInitializer.java"

# interfaces
.implements Lorg/unbescape/xml/XmlCodepointValidator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/unbescape/xml/Xml10EscapeSymbolsInitializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Xml10CodepointValidator"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isValid(I)Z
    .registers 5
    .param p1, "codepoint"    # I

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 133
    const/16 v2, 0x20

    if-ge p1, v2, :cond_14

    .line 134
    const/16 v2, 0x9

    if-eq p1, v2, :cond_12

    const/16 v2, 0xa

    if-eq p1, v2, :cond_12

    const/16 v2, 0xd

    if-ne p1, v2, :cond_13

    :cond_12
    move v0, v1

    .line 148
    :cond_13
    :goto_13
    return v0

    .line 136
    :cond_14
    const v2, 0xd7ff

    if-gt p1, v2, :cond_1b

    move v0, v1

    .line 137
    goto :goto_13

    .line 139
    :cond_1b
    const v2, 0xe000

    if-lt p1, v2, :cond_13

    .line 142
    const v2, 0xfffd

    if-gt p1, v2, :cond_27

    move v0, v1

    .line 143
    goto :goto_13

    .line 145
    :cond_27
    const/high16 v2, 0x10000

    if-lt p1, v2, :cond_13

    move v0, v1

    .line 148
    goto :goto_13
.end method
