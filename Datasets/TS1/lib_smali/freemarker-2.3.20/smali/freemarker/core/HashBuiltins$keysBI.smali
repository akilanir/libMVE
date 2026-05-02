.class Lfreemarker/core/HashBuiltins$keysBI;
.super Lfreemarker/core/HashBuiltins$HashExBuiltin;
.source "HashBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/HashBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "keysBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 48
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/HashBuiltins$HashExBuiltin;-><init>(Lfreemarker/core/HashBuiltins$1;)V

    return-void
.end method


# virtual methods
.method calculateResult(Lfreemarker/template/TemplateHashModelEx;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "hashExModel"    # Lfreemarker/template/TemplateHashModelEx;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Lfreemarker/core/InvalidReferenceException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-interface {p1}, Lfreemarker/template/TemplateHashModelEx;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v0

    .line 53
    .local v0, "keys":Lfreemarker/template/TemplateCollectionModel;
    if-nez v0, :cond_d

    const-string v1, "keys"

    invoke-virtual {p0, v1, p1, p2}, Lfreemarker/core/HashBuiltins$keysBI;->newNullPropertyException(Ljava/lang/String;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;

    move-result-object v1

    throw v1

    .line 54
    :cond_d
    instance-of v1, v0, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v1, :cond_12

    .end local v0    # "keys":Lfreemarker/template/TemplateCollectionModel;
    :goto_11
    return-object v0

    .restart local v0    # "keys":Lfreemarker/template/TemplateCollectionModel;
    :cond_12
    new-instance v1, Lfreemarker/core/CollectionAndSequence;

    invoke-direct {v1, v0}, Lfreemarker/core/CollectionAndSequence;-><init>(Lfreemarker/template/TemplateCollectionModel;)V

    move-object v0, v1

    goto :goto_11
.end method
