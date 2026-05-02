.class Lnl/qbusict/cupboard/convert/IndexBuilder$IndexImpl;
.super Ljava/lang/Object;
.source "IndexBuilder.java"

# interfaces
.implements Lnl/qbusict/cupboard/annotation/Index;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/convert/IndexBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IndexImpl"
.end annotation


# instance fields
.field private final mNames:[Lnl/qbusict/cupboard/annotation/CompositeIndex;

.field private final mUnique:Z

.field private final mUniqueNames:[Lnl/qbusict/cupboard/annotation/CompositeIndex;

.field final synthetic this$0:Lnl/qbusict/cupboard/convert/IndexBuilder;


# direct methods
.method public constructor <init>(Lnl/qbusict/cupboard/convert/IndexBuilder;ZLjava/util/List;Ljava/util/List;)V
    .registers 6
    .param p2, "unique"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/annotation/CompositeIndex;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/annotation/CompositeIndex;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 134
    .local p3, "names":Ljava/util/List;, "Ljava/util/List<Lnl/qbusict/cupboard/annotation/CompositeIndex;>;"
    .local p4, "uniqueNames":Ljava/util/List;, "Ljava/util/List<Lnl/qbusict/cupboard/annotation/CompositeIndex;>;"
    iput-object p1, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$IndexImpl;->this$0:Lnl/qbusict/cupboard/convert/IndexBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    iput-boolean p2, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$IndexImpl;->mUnique:Z

    .line 136
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lnl/qbusict/cupboard/annotation/CompositeIndex;

    invoke-interface {p3, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnl/qbusict/cupboard/annotation/CompositeIndex;

    iput-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$IndexImpl;->mNames:[Lnl/qbusict/cupboard/annotation/CompositeIndex;

    .line 137
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lnl/qbusict/cupboard/annotation/CompositeIndex;

    invoke-interface {p4, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnl/qbusict/cupboard/annotation/CompositeIndex;

    iput-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$IndexImpl;->mUniqueNames:[Lnl/qbusict/cupboard/annotation/CompositeIndex;

    .line 138
    return-void
.end method


# virtual methods
.method public annotationType()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 157
    const-class v0, Lnl/qbusict/cupboard/annotation/Index;

    return-object v0
.end method

.method public indexNames()[Lnl/qbusict/cupboard/annotation/CompositeIndex;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$IndexImpl;->mNames:[Lnl/qbusict/cupboard/annotation/CompositeIndex;

    return-object v0
.end method

.method public unique()Z
    .registers 2

    .prologue
    .line 147
    iget-boolean v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$IndexImpl;->mUnique:Z

    return v0
.end method

.method public uniqueNames()[Lnl/qbusict/cupboard/annotation/CompositeIndex;
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$IndexImpl;->mUniqueNames:[Lnl/qbusict/cupboard/annotation/CompositeIndex;

    return-object v0
.end method
