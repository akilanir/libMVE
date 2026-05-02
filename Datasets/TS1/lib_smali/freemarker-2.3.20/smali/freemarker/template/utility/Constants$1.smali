.class final Lfreemarker/template/utility/Constants$1;
.super Ljava/lang/Object;
.source "Constants.java"

# interfaces
.implements Lfreemarker/template/TemplateModelIterator;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 96
    const/4 v0, 0x0

    return v0
.end method

.method public next()Lfreemarker/template/TemplateModel;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "The collection has no more elements."

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
