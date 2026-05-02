.class final Lorg/unbescape/xml/Xml11EscapeSymbolsInitializer$Xml11CodepointValidator;
.super Ljava/lang/Object;
.source "Xml11EscapeSymbolsInitializer.java"

# interfaces
.implements Lorg/unbescape/xml/XmlCodepointValidator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/unbescape/xml/Xml11EscapeSymbolsInitializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Xml11CodepointValidator"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isValid(I)Z
    .registers 5
    .param p1, "codepoint"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 143
    if-nez p1, :cond_5

    .line 158
    :cond_4
    :goto_4
    return v0

    .line 146
    :cond_5
    const v2, 0xd7ff

    if-gt p1, v2, :cond_c

    move v0, v1

    .line 147
    goto :goto_4

    .line 149
    :cond_c
    const v2, 0xe000

    if-lt p1, v2, :cond_4

    .line 152
    const v2, 0xfffd

    if-gt p1, v2, :cond_18

    move v0, v1

    .line 153
    goto :goto_4

    .line 155
    :cond_18
    const/high16 v2, 0x10000

    if-lt p1, v2, :cond_4

    move v0, v1

    .line 158
    goto :goto_4
.end method
