.class Lfreemarker/core/BuiltinVariable$VarsHash;
.super Ljava/lang/Object;
.source "BuiltinVariable.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/BuiltinVariable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "VarsHash"
.end annotation


# instance fields
.field env:Lfreemarker/core/Environment;


# direct methods
.method constructor <init>(Lfreemarker/core/Environment;)V
    .registers 2
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    iput-object p1, p0, Lfreemarker/core/BuiltinVariable$VarsHash;->env:Lfreemarker/core/Environment;

    .line 198
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 201
    iget-object v0, p0, Lfreemarker/core/BuiltinVariable$VarsHash;->env:Lfreemarker/core/Environment;

    invoke-virtual {v0, p1}, Lfreemarker/core/Environment;->getVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 205
    const/4 v0, 0x0

    return v0
.end method
