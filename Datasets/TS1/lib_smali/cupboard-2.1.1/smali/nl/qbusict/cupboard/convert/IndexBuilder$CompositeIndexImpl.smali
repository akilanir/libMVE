.class Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;
.super Ljava/lang/Object;
.source "IndexBuilder.java"

# interfaces
.implements Lnl/qbusict/cupboard/annotation/CompositeIndex;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/convert/IndexBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CompositeIndexImpl"
.end annotation


# instance fields
.field private mAscending:Z

.field private final mName:Ljava/lang/String;

.field private mOrder:I

.field final synthetic this$0:Lnl/qbusict/cupboard/convert/IndexBuilder;


# direct methods
.method public constructor <init>(Lnl/qbusict/cupboard/convert/IndexBuilder;Ljava/lang/String;)V
    .registers 3
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 167
    iput-object p1, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;->this$0:Lnl/qbusict/cupboard/convert/IndexBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    iput-object p2, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;->mName:Ljava/lang/String;

    .line 169
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
    .line 196
    const-class v0, Lnl/qbusict/cupboard/annotation/CompositeIndex;

    return-object v0
.end method

.method public ascending()Z
    .registers 2

    .prologue
    .line 181
    iget-boolean v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;->mAscending:Z

    return v0
.end method

.method public indexName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 191
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public order()I
    .registers 2

    .prologue
    .line 186
    iget v0, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;->mOrder:I

    return v0
.end method

.method setAscending(Z)V
    .registers 2
    .param p1, "ascending"    # Z

    .prologue
    .line 172
    iput-boolean p1, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;->mAscending:Z

    .line 173
    return-void
.end method

.method setOrder(I)V
    .registers 2
    .param p1, "order"    # I

    .prologue
    .line 176
    iput p1, p0, Lnl/qbusict/cupboard/convert/IndexBuilder$CompositeIndexImpl;->mOrder:I

    .line 177
    return-void
.end method
