.class public Lfreemarker/template/TemplateModelListSequence;
.super Ljava/lang/Object;
.source "TemplateModelListSequence.java"

# interfaces
.implements Lfreemarker/template/TemplateSequenceModel;


# instance fields
.field private list:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .param p1, "list"    # Ljava/util/List;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lfreemarker/template/TemplateModelListSequence;->list:Ljava/util/List;

    .line 68
    return-void
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 71
    iget-object v0, p0, Lfreemarker/template/TemplateModelListSequence;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateModel;

    return-object v0
.end method

.method public getWrappedObject()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lfreemarker/template/TemplateModelListSequence;->list:Ljava/util/List;

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lfreemarker/template/TemplateModelListSequence;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
