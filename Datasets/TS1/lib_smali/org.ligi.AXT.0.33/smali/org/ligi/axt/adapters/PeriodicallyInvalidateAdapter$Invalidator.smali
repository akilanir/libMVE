.class Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter$Invalidator;
.super Ljava/lang/Object;
.source "PeriodicallyInvalidateAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Invalidator"
.end annotation


# instance fields
.field private adapter:Landroid/widget/BaseAdapter;

.field final synthetic this$0:Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter;


# direct methods
.method public constructor <init>(Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter;Landroid/widget/BaseAdapter;)V
    .registers 3
    .param p1, "this$0"    # Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter;
    .param p2, "adapter"    # Landroid/widget/BaseAdapter;

    .prologue
    .line 43
    iput-object p1, p0, Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter$Invalidator;->this$0:Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p2, p0, Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter$Invalidator;->adapter:Landroid/widget/BaseAdapter;

    .line 45
    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter$Invalidator;->adapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 49
    return-void
.end method
