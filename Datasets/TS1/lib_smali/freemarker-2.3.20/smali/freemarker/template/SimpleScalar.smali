.class public final Lfreemarker/template/SimpleScalar;
.super Ljava/lang/Object;
.source "SimpleScalar.java"

# interfaces
.implements Lfreemarker/template/TemplateScalarModel;
.implements Ljava/io/Serializable;


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p1, p0, Lfreemarker/template/SimpleScalar;->value:Ljava/lang/String;

    .line 82
    return-void
.end method


# virtual methods
.method public getAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lfreemarker/template/SimpleScalar;->value:Ljava/lang/String;

    if-nez v0, :cond_7

    const-string v0, ""

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/template/SimpleScalar;->value:Ljava/lang/String;

    goto :goto_6
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lfreemarker/template/SimpleScalar;->value:Ljava/lang/String;

    return-object v0
.end method
