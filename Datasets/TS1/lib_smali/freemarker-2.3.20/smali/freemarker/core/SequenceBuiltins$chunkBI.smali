.class Lfreemarker/core/SequenceBuiltins$chunkBI;
.super Lfreemarker/core/SequenceBuiltins$SequenceBuiltIn;
.source "SequenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "chunkBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;,
        Lfreemarker/core/SequenceBuiltins$chunkBI$BIMethod;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 707
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/SequenceBuiltins$SequenceBuiltIn;-><init>(Lfreemarker/core/SequenceBuiltins$1;)V

    .line 732
    return-void
.end method


# virtual methods
.method calculateResult(Lfreemarker/template/TemplateSequenceModel;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "tsm"    # Lfreemarker/template/TemplateSequenceModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 710
    new-instance v0, Lfreemarker/core/SequenceBuiltins$chunkBI$BIMethod;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lfreemarker/core/SequenceBuiltins$chunkBI$BIMethod;-><init>(Lfreemarker/core/SequenceBuiltins$chunkBI;Lfreemarker/template/TemplateSequenceModel;Lfreemarker/core/SequenceBuiltins$1;)V

    return-object v0
.end method
