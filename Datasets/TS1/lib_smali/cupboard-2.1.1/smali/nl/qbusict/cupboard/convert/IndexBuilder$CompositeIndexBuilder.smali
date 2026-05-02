.class public Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;
.super Ljava/lang/Object;
.source "IndexBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/convert/IndexBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CompositeIndexBuilder"
.end annotation


# instance fields
.field private mCurrentIndex:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;

.field private mIndices:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/annotation/CompositeIndex;",
            ">;"
        }
    .end annotation
.end field

.field private mUniqueIndices:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/annotation/CompositeIndex;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lnl/qbusict/cupboard/convert/IndexBuilder;


# direct methods
.method private constructor <init>(Lnl/qbusict/cupboard/convert/IndexBuilder;)V
    .registers 4

    .prologue
    const/16 v1, 0xa

    .line 60
    iput-object p1, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->this$0:Lnl/qbusict/cupboard/convert/IndexBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mIndices:Ljava/util/List;

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mUniqueIndices:Ljava/util/List;

    .line 61
    return-void
.end method

.method synthetic constructor <init>(Lnl/qbusict/cupboard/convert/IndexBuilder;Lnl/qbusict/cupboard/convert/IndexBuilder$1;)V
    .registers 3
    .param p1, "x0"    # Lnl/qbusict/cupboard/convert/IndexBuilder;
    .param p2, "x1"    # Lnl/qbusict/cupboard/convert/IndexBuilder$1;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;-><init>(Lnl/qbusict/cupboard/convert/IndexBuilder;)V

    return-void
.end method

.method static synthetic access$100(Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;

    .prologue
    .line 54
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mIndices:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;

    .prologue
    .line 54
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mUniqueIndices:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public ascending()Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;
    .registers 3

    .prologue
    .line 104
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mCurrentIndex:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;->setAscending(Z)V

    .line 105
    return-object p0
.end method

.method public build()Lnl/qbusict/cupboard/annotation/Index;
    .registers 6

    .prologue
    .line 124
    new-instance v0, Lnl/qbusict/cupboard/convert/IndexBuilder$IndexImpl;

    iget-object v1, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->this$0:Lnl/qbusict/cupboard/convert/IndexBuilder;

    const/4 v2, 0x0

    iget-object v3, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mIndices:Ljava/util/List;

    iget-object v4, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mUniqueIndices:Ljava/util/List;

    invoke-direct {v0, v1, v2, v3, v4}, Lnl/qbusict/cupboard/convert/IndexBuilder$IndexImpl;-><init>(Lnl/qbusict/cupboard/convert/IndexBuilder;ZLjava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public descending()Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;
    .registers 3

    .prologue
    .line 114
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mCurrentIndex:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;->setAscending(Z)V

    .line 115
    return-object p0
.end method

.method public named(Ljava/lang/String;)Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 70
    new-instance v0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;

    iget-object v1, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->this$0:Lnl/qbusict/cupboard/convert/IndexBuilder;

    invoke-direct {v0, v1, p1}, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;-><init>(Lnl/qbusict/cupboard/convert/IndexBuilder;Ljava/lang/String;)V

    iput-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mCurrentIndex:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;

    .line 71
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mIndices:Ljava/util/List;

    iget-object v1, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mCurrentIndex:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    return-object p0
.end method

.method public order(I)Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;
    .registers 3
    .param p1, "order"    # I

    .prologue
    .line 94
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mCurrentIndex:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;

    invoke-virtual {v0, p1}, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;->setOrder(I)V

    .line 95
    return-object p0
.end method

.method public unique()Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;
    .registers 3

    .prologue
    .line 81
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mIndices:Ljava/util/List;

    iget-object v1, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mCurrentIndex:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 82
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mUniqueIndices:Ljava/util/List;

    iget-object v1, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexBuilder;->mCurrentIndex:Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    :cond_11
    return-object p0
.end method
