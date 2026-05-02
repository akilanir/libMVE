.class public Lfreemarker/ext/beans/InvalidPropertyException;
.super Lfreemarker/template/TemplateModelException;
.source "InvalidPropertyException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    .line 15
    return-void
.end method
