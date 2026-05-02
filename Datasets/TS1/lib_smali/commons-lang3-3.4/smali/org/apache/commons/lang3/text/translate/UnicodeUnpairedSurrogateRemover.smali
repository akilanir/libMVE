.class public Lorg/apache/commons/lang3/text/translate/UnicodeUnpairedSurrogateRemover;
.super Lorg/apache/commons/lang3/text/translate/CodePointTranslator;
.source "UnicodeUnpairedSurrogateRemover.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/apache/commons/lang3/text/translate/CodePointTranslator;-><init>()V

    return-void
.end method


# virtual methods
.method public translate(ILjava/io/Writer;)Z
    .registers 4
    .param p1, "codepoint"    # I
    .param p2, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    const v0, 0xd800

    if-lt p1, v0, :cond_c

    const v0, 0xdfff

    if-gt p1, v0, :cond_c

    .line 36
    const/4 v0, 0x1

    .line 39
    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method
