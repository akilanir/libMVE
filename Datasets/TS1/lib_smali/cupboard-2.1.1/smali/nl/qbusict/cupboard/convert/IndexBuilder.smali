.class public Lnl/qbusict/cupboard/convert/IndexBuilder;
.super Ljava/lang/Object;
.source "IndexBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/qbusict/cupboard/convert/IndexBuilder$1;,
        Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;,
        Lnl/qbusict/cupboard/convert/IndexBuilder$IndexImpl;,
        Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;
    }
.end annotation


# instance fields
.field private mCompositeIndexBuilder:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;

.field private mUnique:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;-><init>(Lnl/qbusict/cupboard/convert/IndexBuilder;Lnl/qbusict/cupboard/convert/IndexBuilder$1;)V

    iput-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder;->mCompositeIndexBuilder:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder;->mUnique:Z

    .line 161
    return-void
.end method


# virtual methods
.method public build()Lnl/qbusict/cupboard/annotation/Index;
    .registers 5

    .prologue
    .line 51
    new-instance v0, Lnl/qbusict/cupboard/convert/IndexBuilder$IndexImpl;

    iget-boolean v1, p0, Lnl/qbusict/cupboard/convert/IndexBuilder;->mUnique:Z

    iget-object v2, p0, Lnl/qbusict/cupboard/convert/IndexBuilder;->mCompositeIndexBuilder:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;

    # getter for: Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mIndices:Ljava/util/List;
    invoke-static {v2}, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->access$100(Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;)Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lnl/qbusict/cupboard/convert/IndexBuilder;->mCompositeIndexBuilder:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;

    # getter for: Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mUniqueIndices:Ljava/util/List;
    invoke-static {v3}, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->access$200(Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, p0, v1, v2, v3}, Lnl/qbusict/cupboard/convert/IndexBuilder$IndexImpl;-><init>(Lnl/qbusict/cupboard/convert/IndexBuilder;ZLjava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public named(Ljava/lang/String;)Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 28
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder;->mCompositeIndexBuilder:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;

    invoke-virtual {v0, p1}, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->named(Ljava/lang/String;)Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;

    .line 29
    iget-boolean v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder;->mUnique:Z

    if-eqz v0, :cond_e

    .line 30
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder;->mCompositeIndexBuilder:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;

    invoke-virtual {v0}, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->unique()Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;

    .line 32
    :cond_e
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder;->mCompositeIndexBuilder:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;

    return-object v0
.end method

.method public unique()Lnl/qbusict/cupboard/convert/IndexBuilder;
    .registers 2

    .prologue
    .line 41
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder;->mUnique:Z

    .line 42
    return-object p0
.end method
