.class Lcom/rey/material/drawable/CircleDrawable$1;
.super Ljava/lang/Object;
.source "CircleDrawable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/CircleDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/drawable/CircleDrawable;


# direct methods
.method constructor <init>(Lcom/rey/material/drawable/CircleDrawable;)V
    .registers 2

    .prologue
    .line 147
    iput-object p1, p0, Lcom/rey/material/drawable/CircleDrawable$1;->this$0:Lcom/rey/material/drawable/CircleDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lcom/rey/material/drawable/CircleDrawable$1;->this$0:Lcom/rey/material/drawable/CircleDrawable;

    # invokes: Lcom/rey/material/drawable/CircleDrawable;->update()V
    invoke-static {v0}, Lcom/rey/material/drawable/CircleDrawable;->access$000(Lcom/rey/material/drawable/CircleDrawable;)V

    .line 152
    return-void
.end method
