.class Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;
.super Ljava/lang/Object;
.source "SequenceBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateSequenceModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins$reverseBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ReverseSequence"
.end annotation


# instance fields
.field private final seq:Lfreemarker/template/TemplateSequenceModel;


# direct methods
.method constructor <init>(Lfreemarker/template/TemplateSequenceModel;)V
    .registers 2
    .param p1, "seq"    # Lfreemarker/template/TemplateSequenceModel;

    .prologue
    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    iput-object p1, p0, Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;->seq:Lfreemarker/template/TemplateSequenceModel;

    .line 145
    return-void
.end method

.method static access$100(Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;)Lfreemarker/template/TemplateSequenceModel;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;

    .prologue
    .line 138
    iget-object v0, p0, Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;->seq:Lfreemarker/template/TemplateSequenceModel;

    return-object v0
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 154
    iget-object v0, p0, Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;->seq:Lfreemarker/template/TemplateSequenceModel;

    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;->seq:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v1}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    sub-int/2addr v1, p1

    invoke-interface {v0, v1}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 149
    iget-object v0, p0, Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;->seq:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v0

    return v0
.end method
