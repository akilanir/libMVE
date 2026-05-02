.class Lfreemarker/core/SequenceBuiltins$sort_byBI;
.super Lfreemarker/core/SequenceBuiltins$sortBI;
.source "SequenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "sort_byBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/SequenceBuiltins$sort_byBI$BIMethod;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 424
    invoke-direct {p0}, Lfreemarker/core/SequenceBuiltins$sortBI;-><init>()V

    .line 429
    return-void
.end method


# virtual methods
.method calculateResult(Lfreemarker/template/TemplateSequenceModel;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "seq"    # Lfreemarker/template/TemplateSequenceModel;

    .prologue
    .line 426
    new-instance v0, Lfreemarker/core/SequenceBuiltins$sort_byBI$BIMethod;

    invoke-direct {v0, p0, p1}, Lfreemarker/core/SequenceBuiltins$sort_byBI$BIMethod;-><init>(Lfreemarker/core/SequenceBuiltins$sort_byBI;Lfreemarker/template/TemplateSequenceModel;)V

    return-object v0
.end method
