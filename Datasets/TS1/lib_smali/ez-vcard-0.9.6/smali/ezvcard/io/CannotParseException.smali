.class public Lezvcard/io/CannotParseException;
.super Ljava/lang/RuntimeException;
.source "CannotParseException.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 43
    return-void
.end method

.method public varargs constructor <init>(I[Ljava/lang/Object;)V
    .registers 4
    .param p1, "code"    # I
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 60
    sget-object v0, Lezvcard/Messages;->INSTANCE:Lezvcard/Messages;

    invoke-virtual {v0, p1, p2}, Lezvcard/Messages;->getParseMessage(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/io/CannotParseException;-><init>(Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 51
    return-void
.end method
