.class Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;
.super Lfreemarker/core/BuiltIn;
.source "SequenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "seq_index_ofBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;
    }
.end annotation


# instance fields
.field private m_dir:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "dir"    # I

    .prologue
    .line 551
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    .line 552
    iput p1, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;->m_dir:I

    .line 553
    return-void
.end method

.method static access$1200(Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;)I
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;

    .prologue
    .line 547
    iget v0, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;->m_dir:I

    return v0
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 557
    new-instance v0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;-><init>(Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;Lfreemarker/core/Environment;Lfreemarker/core/SequenceBuiltins$1;)V

    return-object v0
.end method
