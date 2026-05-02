.class public Lfreemarker/core/_DelayedGetMessageWithoutStackTop;
.super Lfreemarker/core/_DelayedConversionToString;
.source "_DelayedGetMessageWithoutStackTop.java"


# direct methods
.method public constructor <init>(Lfreemarker/template/TemplateException;)V
    .registers 2
    .param p1, "exception"    # Lfreemarker/template/TemplateException;

    .prologue
    .line 9
    invoke-direct {p0, p1}, Lfreemarker/core/_DelayedConversionToString;-><init>(Ljava/lang/Object;)V

    .line 10
    return-void
.end method


# virtual methods
.method protected doConversion(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 13
    check-cast p1, Lfreemarker/template/TemplateException;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Lfreemarker/template/TemplateException;->getMessageWithoutStackTop()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
