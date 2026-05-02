.class public Lorg/apache/commons/cli/BasicParser;
.super Lorg/apache/commons/cli/Parser;
.source "BasicParser.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/apache/commons/cli/Parser;-><init>()V

    return-void
.end method


# virtual methods
.method protected flatten(Lorg/apache/commons/cli/Options;[Ljava/lang/String;Z)[Ljava/lang/String;
    .registers 4
    .param p1, "options"    # Lorg/apache/commons/cli/Options;
    .param p2, "arguments"    # [Ljava/lang/String;
    .param p3, "stopAtNonOption"    # Z

    .prologue
    .line 45
    return-object p2
.end method
