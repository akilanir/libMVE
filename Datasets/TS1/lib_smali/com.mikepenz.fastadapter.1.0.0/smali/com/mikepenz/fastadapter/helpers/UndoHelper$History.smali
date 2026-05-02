.class Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;
.super Ljava/lang/Object;
.source "UndoHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/fastadapter/helpers/UndoHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "History"
.end annotation


# instance fields
.field public action:I

.field public items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo",
            "<TItem;>;>;"
        }
    .end annotation
.end field

.field public positions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/mikepenz/fastadapter/helpers/UndoHelper;


# direct methods
.method private constructor <init>(Lcom/mikepenz/fastadapter/helpers/UndoHelper;)V
    .registers 3

    .prologue
    .line 134
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;, "Lcom/mikepenz/fastadapter/helpers/UndoHelper<TItem;>.History;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->this$0:Lcom/mikepenz/fastadapter/helpers/UndoHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->items:Ljava/util/ArrayList;

    return-void
.end method

.method synthetic constructor <init>(Lcom/mikepenz/fastadapter/helpers/UndoHelper;Lcom/mikepenz/fastadapter/helpers/UndoHelper$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/mikepenz/fastadapter/helpers/UndoHelper;
    .param p2, "x1"    # Lcom/mikepenz/fastadapter/helpers/UndoHelper$1;

    .prologue
    .line 134
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;, "Lcom/mikepenz/fastadapter/helpers/UndoHelper<TItem;>.History;"
    invoke-direct {p0, p1}, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;-><init>(Lcom/mikepenz/fastadapter/helpers/UndoHelper;)V

    return-void
.end method
