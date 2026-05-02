.class final Lfreemarker/core/ExistenceBuiltins$defaultBI$1;
.super Ljava/lang/Object;
.source "ExistenceBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 8
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 68
    .local v0, "argCnt":I
    if-nez v0, :cond_11

    const-string v3, "?default"

    const/4 v4, 0x1

    const v5, 0x7fffffff

    invoke-static {v3, v0, v4, v5}, Lfreemarker/core/MessageUtil;->newArgCntError(Ljava/lang/String;III)Lfreemarker/template/TemplateModelException;

    move-result-object v3

    throw v3

    .line 69
    :cond_11
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_12
    if-ge v1, v0, :cond_20

    .line 70
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/template/TemplateModel;

    .line 71
    .local v2, "result":Lfreemarker/template/TemplateModel;
    if-eqz v2, :cond_1d

    .line 73
    .end local v2    # "result":Lfreemarker/template/TemplateModel;
    :goto_1c
    return-object v2

    .line 69
    .restart local v2    # "result":Lfreemarker/template/TemplateModel;
    :cond_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 73
    .end local v2    # "result":Lfreemarker/template/TemplateModel;
    :cond_20
    const/4 v2, 0x0

    goto :goto_1c
.end method
