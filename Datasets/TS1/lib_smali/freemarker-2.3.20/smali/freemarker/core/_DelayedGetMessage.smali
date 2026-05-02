.class public Lfreemarker/core/_DelayedGetMessage;
.super Lfreemarker/core/_DelayedConversionToString;
.source "_DelayedGetMessage.java"


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 7
    invoke-direct {p0, p1}, Lfreemarker/core/_DelayedConversionToString;-><init>(Ljava/lang/Object;)V

    .line 8
    return-void
.end method


# virtual methods
.method protected doConversion(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 11
    check-cast p1, Ljava/lang/Throwable;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
