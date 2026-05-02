.class Lfreemarker/core/CollectionAndSequence$SequenceIterator;
.super Ljava/lang/Object;
.source "CollectionAndSequence.java"

# interfaces
.implements Lfreemarker/template/TemplateModelIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/CollectionAndSequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SequenceIterator"
.end annotation


# instance fields
.field private index:I

.field private final sequence:Lfreemarker/template/TemplateSequenceModel;

.field private final size:I


# direct methods
.method constructor <init>(Lfreemarker/template/TemplateSequenceModel;)V
    .registers 3
    .param p1, "sequence"    # Lfreemarker/template/TemplateSequenceModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    const/4 v0, 0x0

    iput v0, p0, Lfreemarker/core/CollectionAndSequence$SequenceIterator;->index:I

    .line 127
    iput-object p1, p0, Lfreemarker/core/CollectionAndSequence$SequenceIterator;->sequence:Lfreemarker/template/TemplateSequenceModel;

    .line 128
    invoke-interface {p1}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v0

    iput v0, p0, Lfreemarker/core/CollectionAndSequence$SequenceIterator;->size:I

    .line 130
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .prologue
    .line 136
    iget v0, p0, Lfreemarker/core/CollectionAndSequence$SequenceIterator;->index:I

    iget v1, p0, Lfreemarker/core/CollectionAndSequence$SequenceIterator;->size:I

    if-ge v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public next()Lfreemarker/template/TemplateModel;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 132
    iget-object v0, p0, Lfreemarker/core/CollectionAndSequence$SequenceIterator;->sequence:Lfreemarker/template/TemplateSequenceModel;

    iget v1, p0, Lfreemarker/core/CollectionAndSequence$SequenceIterator;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lfreemarker/core/CollectionAndSequence$SequenceIterator;->index:I

    invoke-interface {v0, v1}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method
